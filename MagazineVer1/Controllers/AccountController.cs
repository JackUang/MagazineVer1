using MagazineVer1.Models;
using MagazineVer1.Models.ViewModels.Web;
using MagazineVer1.Services.DBServices;
using MagazineVer1.Utility;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using System;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace MagazineVer1.Controllers
{
    [Authorize]
    public class AccountController : Controller
    {
        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;

        private UserServices _userServices = new UserServices();
        private AdvertisingServices _advertisingServices = new AdvertisingServices();

        //照老師Mail做
        private POPEntities dc = new POPEntities();

        public AccountController()
        {
        }

        public AccountController(ApplicationUserManager userManager, ApplicationSignInManager signInManager)
        {
            UserManager = userManager;
            SignInManager = signInManager;
        }

        public ApplicationSignInManager SignInManager
        {
            get
            {
                return _signInManager ?? HttpContext.GetOwinContext().Get<ApplicationSignInManager>();
            }
            private set
            {
                _signInManager = value;
            }
        }

        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }

        //
        // GET: /Account/Login
        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }

        //
        // POST: /Account/Login
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Login(LoginViewModel model, string returnUrl)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            // 這不會計算為帳戶鎖定的登入失敗
            // 若要啟用密碼失敗來觸發帳戶鎖定，請變更為 shouldLockout: true
            var result = await SignInManager.PasswordSignInAsync(model.Email, model.Password, model.RememberMe, shouldLockout: false);
            switch (result)
            {
                case SignInStatus.Success:
                    return RedirectToLocal(returnUrl);
                case SignInStatus.LockedOut:
                    return View("Lockout");
                case SignInStatus.RequiresVerification:
                    return RedirectToAction("SendCode", new { ReturnUrl = returnUrl, RememberMe = model.RememberMe });
                case SignInStatus.Failure:
                default:
                    ModelState.AddModelError("", "登入嘗試失試。");
                    return View(model);
            }
        }

        //
        // GET: /Account/VerifyCode
        [AllowAnonymous]
        public async Task<ActionResult> VerifyCode(string provider, string returnUrl, bool rememberMe)
        {
            // 需要使用者已透過使用者名稱/密碼或外部登入進行登入
            if (!await SignInManager.HasBeenVerifiedAsync())
            {
                return View("Error");
            }
            return View(new VerifyCodeViewModel { Provider = provider, ReturnUrl = returnUrl, RememberMe = rememberMe });
        }

        //
        // POST: /Account/VerifyCode
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> VerifyCode(VerifyCodeViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            // 下列程式碼保護兩個因素碼不受暴力密碼破解攻擊。 
            // 如果使用者輸入不正確的代碼來表示一段指定的時間，則使用者帳戶 
            // 會有一段指定的時間遭到鎖定。 
            // 您可以在 IdentityConfig 中設定帳戶鎖定設定
            var result = await SignInManager.TwoFactorSignInAsync(model.Provider, model.Code, isPersistent: model.RememberMe, rememberBrowser: model.RememberBrowser);
            switch (result)
            {
                case SignInStatus.Success:
                    return RedirectToLocal(model.ReturnUrl);
                case SignInStatus.LockedOut:
                    return View("Lockout");
                case SignInStatus.Failure:
                default:
                    ModelState.AddModelError("", "代碼無效。");
                    return View(model);
            }
        }

        //
        // GET: /Account/Register
        [AllowAnonymous]
        public ActionResult Register()
        {
            return View();
        }

        //
        // POST: /Account/Register
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Register(RegisterViewModel model)
        {
            if (ModelState.IsValid)
            {
                var user = new ApplicationUser { UserName = model.Email, Email = model.Email ,PhoneNumber=model.Password};
                var result = await UserManager.CreateAsync(user, model.Password);
                if (result.Succeeded)
                {
                    await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);

                    string userId = UserManager.Users.Where(x => x.Email == model.Email).Select(x => x.Id).FirstOrDefault();

                    SetUser2(userId, string.Empty, model.Email, "000");

                    // 如需如何啟用帳戶確認和密碼重設的詳細資訊，請造訪 http://go.microsoft.com/fwlink/?LinkID=320771
                    // 傳送包含此連結的電子郵件
                    // string code = await UserManager.GenerateEmailConfirmationTokenAsync(user.Id);
                    // var callbackUrl = Url.Action("ConfirmEmail", "Account", new { userId = user.Id, code = code }, protocol: Request.Url.Scheme);
                    // await UserManager.SendEmailAsync(user.Id, "確認您的帳戶", "請按一下此連結確認您的帳戶 <a href=\"" + callbackUrl + "\">這裏</a>");

                    return RedirectToAction("Index", "Home");
                }
                AddErrors(result);
            }

            // 如果執行到這裡，發生某項失敗，則重新顯示表單
            return View(model);
        }

        //
        // GET: /Account/ConfirmEmail
        [AllowAnonymous]
        public async Task<ActionResult> ConfirmEmail(string userId, string code)
        {
            if (userId == null || code == null)
            {
                return View("Error");
            }
            var result = await UserManager.ConfirmEmailAsync(userId, code);
            return View(result.Succeeded ? "ConfirmEmail" : "Error");
        }

        //
        // GET: /Account/ForgotPassword
        [AllowAnonymous]
        public ActionResult ForgotPassword()
        {
            return View();
        }

        //
        // POST: /Account/ForgotPassword
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ForgotPassword(ForgotPasswordViewModel model)
        {
            if (ModelState.IsValid)
            {
                var user = await UserManager.FindByNameAsync(model.Email);
                if (user == null || !(await UserManager.IsEmailConfirmedAsync(user.Id)))
                {
                    // 不顯示使用者不存在或未受確認
                    return View("ForgotPasswordConfirmation");
                }

                // 如需如何啟用帳戶確認和密碼重設的詳細資訊，請造訪 http://go.microsoft.com/fwlink/?LinkID=320771
                // 傳送包含此連結的電子郵件
                // string code = await UserManager.GeneratePasswordResetTokenAsync(user.Id);
                // var callbackUrl = Url.Action("ResetPassword", "Account", new { userId = user.Id, code = code }, protocol: Request.Url.Scheme);		
                // await UserManager.SendEmailAsync(user.Id, "重設密碼", "請按 <a href=\"" + callbackUrl + "\">這裏</a> 重設密碼");
                // return RedirectToAction("ForgotPasswordConfirmation", "Account");
            }

            // 如果執行到這裡，發生某項失敗，則重新顯示表單
            return View(model);
        }

        //
        // GET: /Account/ForgotPasswordConfirmation
        [AllowAnonymous]
        public ActionResult ForgotPasswordConfirmation()
        {
            return View();
        }

        //
        // GET: /Account/ResetPassword
        [AllowAnonymous]
        public ActionResult ResetPassword(string code)
        {
            return code == null ? View("Error") : View();
        }

        //
        // POST: /Account/ResetPassword
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ResetPassword(ResetPasswordViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            var user = await UserManager.FindByNameAsync(model.Email);
            if (user == null)
            {
                // 不顯示使用者不存在
                return RedirectToAction("ResetPasswordConfirmation", "Account");
            }
            var result = await UserManager.ResetPasswordAsync(user.Id, model.Code, model.Password);
            if (result.Succeeded)
            {
                return RedirectToAction("ResetPasswordConfirmation", "Account");
            }
            AddErrors(result);
            return View();
        }

        //
        // GET: /Account/ResetPasswordConfirmation
        [AllowAnonymous]
        public ActionResult ResetPasswordConfirmation()
        {
            return View();
        }

        //
        // POST: /Account/ExternalLogin
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult ExternalLogin(string provider, string returnUrl)
        {
            // 要求重新導向至外部登入提供者
            return new ChallengeResult(provider, Url.Action("ExternalLoginCallback", "Account", new { ReturnUrl = returnUrl }));
        }

        //
        // GET: /Account/SendCode
        [AllowAnonymous]
        public async Task<ActionResult> SendCode(string returnUrl, bool rememberMe)
        {
            var userId = await SignInManager.GetVerifiedUserIdAsync();
            if (userId == null)
            {
                return View("Error");
            }
            var userFactors = await UserManager.GetValidTwoFactorProvidersAsync(userId);
            var factorOptions = userFactors.Select(purpose => new SelectListItem { Text = purpose, Value = purpose }).ToList();
            return View(new SendCodeViewModel { Providers = factorOptions, ReturnUrl = returnUrl, RememberMe = rememberMe });
        }

        //
        // POST: /Account/SendCode
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> SendCode(SendCodeViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            // 產生並傳送 Token
            if (!await SignInManager.SendTwoFactorCodeAsync(model.SelectedProvider))
            {
                return View("Error");
            }
            return RedirectToAction("VerifyCode", new { Provider = model.SelectedProvider, ReturnUrl = model.ReturnUrl, RememberMe = model.RememberMe });
        }

        //
        // GET: /Account/ExternalLoginCallback
        [AllowAnonymous]
        public async Task<ActionResult> ExternalLoginCallback(string returnUrl)
        {
            var loginInfo = await AuthenticationManager.GetExternalLoginInfoAsync();
            if (loginInfo == null)
            {
                return RedirectToAction("Login");
            }

            // 若使用者已經有登入資料，請使用此外部登入提供者登入使用者
            var result = await SignInManager.ExternalSignInAsync(loginInfo, isPersistent: false);
            switch (result)
            {
                case SignInStatus.Success:
                    return RedirectToLocal(returnUrl);
                case SignInStatus.LockedOut:
                    return View("Lockout");
                case SignInStatus.RequiresVerification:
                    return RedirectToAction("SendCode", new { ReturnUrl = returnUrl, RememberMe = false });
                case SignInStatus.Failure:
                default:
                    // 若使用者沒有帳戶，請提示使用者建立帳戶
                    ViewBag.ReturnUrl = returnUrl;
                    ViewBag.LoginProvider = loginInfo.Login.LoginProvider;
                    return View("ExternalLoginConfirmation", new ExternalLoginConfirmationViewModel { Email = loginInfo.Email });
            }
        }

        //
        // POST: /Account/ExternalLoginConfirmation
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ExternalLoginConfirmation(ExternalLoginConfirmationViewModel model, string returnUrl)
        {
            if (User.Identity.IsAuthenticated)
            {
                return RedirectToAction("Index", "Manage");
            }

            if (ModelState.IsValid)
            {
                // 從外部登入提供者處取得使用者資訊
                var info = await AuthenticationManager.GetExternalLoginInfoAsync();
                if (info == null)
                {
                    return View("ExternalLoginFailure");
                }
                var user = new ApplicationUser { UserName = model.Email, Email = model.Email };
                var result = await UserManager.CreateAsync(user);
                if (result.Succeeded)
                {
                    result = await UserManager.AddLoginAsync(user.Id, info.Login);
                    if (result.Succeeded)
                    {
                        await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
                        return RedirectToLocal(returnUrl);
                    }
                }
                AddErrors(result);
            }

            ViewBag.ReturnUrl = returnUrl;
            return View(model);
        }

        //
        // POST: /Account/LogOff
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LogOff()
        {
            AuthenticationManager.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            return RedirectToAction("SearchCategories", "Advertising");
        }

        //
        // GET: /Account/ExternalLoginFailure
        [AllowAnonymous]
        public ActionResult ExternalLoginFailure()
        {
            return View();
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                if (_userManager != null)
                {
                    _userManager.Dispose();
                    _userManager = null;
                }

                if (_signInManager != null)
                {
                    _signInManager.Dispose();
                    _signInManager = null;
                }
            }

            base.Dispose(disposing);
        }

        /// <summary>
        /// 確認刊登明細
        /// </summary>
        /// <returns></returns>
        [AllowAnonymous]
        public ActionResult ConfirmCreateDetailed()
        {
            UserDataViewModels model = null;
            string userid = User.Identity.GetUserId();
            if (false == string.IsNullOrEmpty(userid))
            {
                // 依User Id取得Email,Phone,UserName資料
                model = new UserServices().GetUserDataById(userid);
            }
            return View(model);
        }

        /// <summary>
        /// 確認帳號是否存在與帳密是否正確
        /// </summary>
        /// <param name="email">電子郵件</param>
        /// <param name="phone">手機號碼</param>
        /// <returns></returns>
        [HttpPost]
        [AllowAnonymous]
        public ActionResult ConfirmCreateDetailedAccountVerify(string email, string phone)
        {
            ResConfirmCreateDetailedAccountVerify mode = new ResConfirmCreateDetailedAccountVerify();

            // 判斷Email是否已經存在
            if (false == _userServices.ConfirmEmailExist(email))
            {
                mode.exist = false;
                mode.isError = false;
                return Json(mode);
            }

            var user = UserManager.Find(email, phone);
            if (null == user)
            {
                mode.exist = true;
                mode.isError = true;
                mode.errorMsg = "Account longin error.";
            }
            else
            {
                mode.exist = true;
                mode.isError = false;
            }

            return Json(mode);
        }

        /// <summary>
        /// 匯款帳號資訊頁面
        /// </summary>
        /// <returns></returns>
        [AllowAnonymous]
        public ActionResult RemittanceAccountInformation()
        {
            return View();
        }

        /// <summary>
        /// 匯款資料儲存
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        [AllowAnonymous]
        public async Task<ActionResult> ConfirmCreateDetailedSave(ReqConfirmCreateDetailedSave model)
        {
            ResConfirmCreateDetailedSave result = new ResConfirmCreateDetailedSave();

            if (false == ModelState.IsValid)
            {
                result.saveResult = false;
                return Json(result);
            }

            string imagePath = "Uploads/User/" + model.email + "/Image";
            string folderPath = Server.MapPath("~/" + imagePath);

            // 檔案網址
            string fileUrl = Request.Url.Scheme + "://" + Request.Url.Authority + "/";

            if (true == model.accountExist)
            {
                try
                {
                    var user = UserManager.Find(model.email, model.phone);
                    if (null == user)
                    {
                        result.saveResult = false;
                        return Json(result);
                    }

                    string userId = user.Id;

                    bool saveResult = _advertisingServices.SetInfos(model, folderPath, imagePath, fileUrl, userId);

                    if (true == saveResult)
                    {
                        var loginResult = await SignInManager.PasswordSignInAsync(model.email, model.phone, false, shouldLockout: false);
                        switch (loginResult)
                        {
                            case SignInStatus.Success:
                                // TODO: URL未填
                                result.saveResult = true;
                                return Json(result);
                            default:
                                //ModelState.AddModelError("", "登入嘗試失試。");
                                // TODO: model未填
                                result.saveResult = false;
                                return Json(result);
                        }
                    }

                    result.saveResult = saveResult;

                }
                catch (Exception ex)
                {
                    ReadWriteText.WriteText(ex.ToString());
                    result.saveResult = false;
                    return Json(result);
                }
            }
            else
            {
                var user = new ApplicationUser();
                user.UserName = model.email;
                user.Email = model.email;
                user.PhoneNumber = model.phone;

                var createResult = await UserManager.CreateAsync(user, model.phone);
                if (createResult.Succeeded)
                {
                    await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);

                    string userId = UserManager.Users.Where(x => x.Email == model.email).Select(x => x.Id).FirstOrDefault();

                    try
                    {
                        SetUser2(userId, model.userName, model.email, model.phone);
                        bool saveResult = _advertisingServices.SetInfos(model, folderPath, imagePath, fileUrl, userId);

                        if (false == saveResult)
                        {
                            DeleteUserById(userId);
                        }
                        else
                        {
                            result.saveResult = true;
                        }
                    }
                    catch (Exception ex)
                    {
                        ReadWriteText.WriteText(ex.ToString());
                        result.saveResult = false;
                        return Json(result);
                    }
                }
                else
                {
                    result.saveResult = false;
                }
            }

            // 刪除超過時間的上傳圖片暫存檔
            await new DirectoryFileIO().DeleteFileAsync(folderPath);

            return Json(result);
        }

        [NonAction]
        public void SetUser2(string userId, string userName, string email, string phone)
        {
            User2 user2 = new User2();
            user2.Id = userId;
            user2.u_name = string.IsNullOrEmpty(userName) ? email : userName;
            DateTime birthDate = DateTime.MinValue;
            DateTime.TryParse("1911-01-01", out birthDate);
            user2.BirthDate = birthDate;
            user2.Gender = "0";

            DateTime hireDate = DateTime.MinValue;
            DateTime.TryParse("1911-01-01", out hireDate);
            user2.HireDate = hireDate;

            user2.CurrentFlag = true;

            user2.rowguid = Guid.NewGuid();

            DateTime modifiedDate = DateTime.MinValue;
            DateTime.TryParse("1911-01-01", out modifiedDate);
            user2.ModifiedDate = modifiedDate;

            user2.p_fee = 0;

            DateTime P_lastFeeDate = DateTime.MinValue;
            DateTime.TryParse("1911-01-01", out P_lastFeeDate);
            user2.p_lastFeeDate = P_lastFeeDate;

            user2.PhoneNumber1 = phone;
            user2.PhoneNumber2 = "000";

            user2.RoleId = "nnn";
            user2.u_active = true;
            user2.belongto = "nnn";
            user2.PostalCode = "nnn";
            user2.applyupgrade = 0;

            dc.User2.Add(user2);

            try
            {
                dc.SaveChanges();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
                throw ex;
            }
        }

        [NonAction]
        public void DeleteUserById(string userId)
        {
            try
            {
                var user2 = dc.User2.Where(x => x.Id.Equals(userId)).FirstOrDefault();
                if (null != user2)
                {
                    dc.User2.Remove(user2);
                }

                var aspNetUser = dc.AspNetUsers.Where(x => x.Id.Equals(userId)).FirstOrDefault();
                if (null != aspNetUser)
                {
                    dc.AspNetUsers.Remove(aspNetUser);
                }
                dc.SaveChanges();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }
        }

        #region Helper
        // 新增外部登入時用來當做 XSRF 保護
        private const string XsrfKey = "XsrfId";

        private IAuthenticationManager AuthenticationManager
        {
            get
            {
                return HttpContext.GetOwinContext().Authentication;
            }
        }

        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        private ActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            return RedirectToAction("SearchCategories", "Advertising");
        }

        internal class ChallengeResult : HttpUnauthorizedResult
        {
            public ChallengeResult(string provider, string redirectUri)
                : this(provider, redirectUri, null)
            {
            }

            public ChallengeResult(string provider, string redirectUri, string userId)
            {
                LoginProvider = provider;
                RedirectUri = redirectUri;
                UserId = userId;
            }

            public string LoginProvider { get; set; }
            public string RedirectUri { get; set; }
            public string UserId { get; set; }

            public override void ExecuteResult(ControllerContext context)
            {
                var properties = new AuthenticationProperties { RedirectUri = RedirectUri };
                if (UserId != null)
                {
                    properties.Dictionary[XsrfKey] = UserId;
                }
                context.HttpContext.GetOwinContext().Authentication.Challenge(properties, LoginProvider);
            }
        }
        #endregion
    }
}