using MagazineVer1.Models;
using MagazineVer1.Models.ViewModels.Web;
using MagazineVer1.Utility;
using System;
using System.Linq;

namespace MagazineVer1.Services.DBServices
{
    public class UserServices
    {
        private bool _disposed;
        private POPEntities _db = new POPEntities();

        /// <summary>
        /// 依User Id取得Email,Phone,UserName資料
        /// </summary>
        /// <param name="userId">User Id</param>
        /// <returns>Email,Phone,UserName資料</returns>
        public UserDataViewModels GetUserDataById(string userId)
        {
            UserDataViewModels user = null;
            try
            {
                var userData = (from x in _db.AspNetUsers
                                where x.Id.Equals(userId)
                                select x).FirstOrDefault();

                var user2 = (from x in _db.User2
                             where x.Id.Equals(userId)
                             select x).FirstOrDefault();

                if (null != userData)
                {
                    user = new UserDataViewModels();
                    user.Email = userData.Email;
                    user.Phone = userData.PhoneNumber;
                    user.UserName = user2.u_name;
                }
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }
            return user;
        }

        /// <summary>
        /// 確認Email是否存在
        /// </summary>
        /// <param name="email">電子郵件</param>
        /// <returns>true表示存在，false表示不存在</returns>
        public bool ConfirmEmailExist(string email)
        {
            bool result = false;
            try
            {
                result = _db.AspNetUsers.Where(x => x.Email.Equals(email) || x.UserName.Equals(email)).Any();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return result;
        }

        public void ConfirmAccountVerify(string email, string phone)
        {
            //var result = await SignInManager.PasswordSignInAsync(email, phone, false, false);
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        public virtual void Dispose(bool disposing)
        {
            if (!_disposed)
            {
                if (disposing)
                {
                    _db.Dispose();
                    _db = null;
                }
            }
            _disposed = true;
        }
    }
}