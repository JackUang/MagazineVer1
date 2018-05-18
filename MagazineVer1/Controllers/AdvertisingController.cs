using MagazineVer1.Models;
using MagazineVer1.Models.ViewModels.Web;
using MagazineVer1.Services.DBServices;
using MagazineVer1.Utility;
using Microsoft.AspNet.Identity;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace MagazineVer1.Controllers
{
    public class AdvertisingController : Controller
    {
        private AdvertisingServices _advertisingServices = new AdvertisingServices();
        private BroadcastServices _broadcastServices = new BroadcastServices();

        /// <summary>
        /// 搜尋在地分類廣告頁面
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult SearchCategories()
        {
            // 取得縣市清單
            IEnumerable<string> countyCityList = _advertisingServices.GetCountyCityList();

            // 縣市下拉選單
            List<SelectListItem> ddlCountyCitylist = new DropDownListUtility().GetCountyCityListDDL(countyCityList);

            ViewBag.DDLCountyCityList = ddlCountyCitylist;

            // 取得分類廣告統計(Badge顯示)
            List<uv_AdvertisingCategoryCount> advertisingCategoryCountList = _advertisingServices.GetAdvertisingCategoryCount();
            Dictionary<int, int> dicAdvertisingCategoryCount = new Dictionary<int, int>();
            if (null != advertisingCategoryCountList)
            {
                foreach (var item in advertisingCategoryCountList)
                {
                    int count = item.count.HasValue ? item.count.Value : 0;
                    dicAdvertisingCategoryCount.Add(item.ig_id, count);
                }
            }
            ViewBag.AdvertisingCategoryCount = dicAdvertisingCategoryCount;

            // 取得所有類別與ICON清單
            List<InfoGroupp> categoryList = _advertisingServices.GetCategory();

            //將廣告分類的項目，社區(1)、社團(35)、社群(34)，從已完成 我要刊登 的流程抽離出來
            return View(categoryList.Where(o=> o.ig_id != 1 && o.ig_id != 34 && o.ig_id != 35));
        }

        /// <summary>
        /// 依使用者所選擇的縣市取得鄉鎮市區清單
        /// </summary>
        /// <param name="countyCity"></param>
        /// <returns></returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult GetTownshipCityList(string ddlCountyCity)
        {
            // 依縣市取得鄉鎮市區清單
            List<string> townshipCityList = _advertisingServices.GetTownshipCityList(ddlCountyCity);

            // 鄉鎮市區清單下拉選單
            List<SelectListItem> ddlTownshipCityList = new DropDownListUtility().GetTownshipCityListDDL(townshipCityList);

            ViewBag.DDLTownshipCityList = ddlTownshipCityList;
            ViewBag.County = ddlCountyCity;

            return PartialView("_DDLTownshipCityPartial");
        }

        /// <summary>
        /// 依使用者所選擇的縣市與鄉鎮市區取得類別清單
        /// </summary>
        /// <param name="countyCity">使用者所選擇的縣市資料</param>
        /// <param name="ddlTownshipCity">使用者所選擇的鄉鎮市區資料</param>
        /// <returns></returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult GetCategory(string countyCity, string ddlTownshipCity)
        {
            // 依縣市與鄉鎮市區取得類別清單
            List<InfoGroupp> categoryList = _advertisingServices.GetCategory(countyCity, ddlTownshipCity);

            // 類別清單下拉選單
            List<SelectListItem> ddlCategoryList = new DropDownListUtility().GetCategoryListDDL(categoryList);

            ViewBag.County = countyCity;
            ViewBag.Category = ddlCategoryList;

            return PartialView("_DDLCategoryPartial");
        }

        /// <summary>
        /// 依使用者輸入的條件搜尋在地分類廣告
        /// </summary>
        /// <param name="county">>使用者所選擇的縣市資料</param>
        /// <param name="township">使用者所選擇的鄉鎮市區資料</param>
        /// <param name="category">使用者所選擇的類別資料</param>
        /// <param name="keywords">使用者所輸入的關鍵字資料</param>
        /// <param name="page">目前顯示頁碼/param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult ClassifiedAdsSearch(string county, string township, string category, string keywords, int page = 1)
        {
            //if (string.IsNullOrEmpty(county) || string.IsNullOrEmpty(township) || string.IsNullOrEmpty(category))
            //{
            //    return RedirectToAction("SearchCategories");
            //}
            IPagedList<uv_ClassifiedAdsSearch> model = null;

            int intCategory = -1;
            int.TryParse(category, out intCategory);

            model = new Services.AdvertisingServices().ClassifiedAdsSearch(_advertisingServices, county, township, intCategory, keywords, page);

            // 取得類別名稱
            string strCategory = _advertisingServices.GetCategoryByName(intCategory);

            ViewBag.County = county;
            ViewBag.Township = township;
            ViewBag.Category = strCategory;

            return View(model);
        }

        /// <summary>
        /// 依使用者所點選的類別搜尋在地分類廣告
        /// </summary>
        /// <param name="id">類別Id</param>
        /// <param name="page">頁碼</param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Category(string id, int page = 1)
        {
            IPagedList<uv_ClassifiedAdsSearch> model = null;
            if (string.IsNullOrEmpty(id))
            {
                return View(model);
            }

            int classifiedId = 0;
            int.TryParse(id, out classifiedId);

            // 依類別搜尋在地分類廣告
            model = _advertisingServices.ClassifiedSearch(classifiedId, page);

            // 取得類別名稱
            string strCategory = _advertisingServices.GetCategoryByName(classifiedId);
            ViewBag.Category = strCategory;


            return View(model);
        }

        /// <summary>
        /// 分類廣告搜尋詳細結果
        /// </summary>
        /// <param name="id">使用者所選擇的分類廣告Id</param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult CategoryDetailed(int id)
        {
            if (0 > id)
            {
                return RedirectToAction("SearchCategories");
            }

            // 依 分類廣告Id 取得分類廣告詳細資料
            uv_ClassifiedAdsSearch model = _advertisingServices.CategoryDetailed(id);

            if (null == model)
            {
                return RedirectToAction("SearchCategories");
            }
            return View(model);
        }

        /// <summary>
        /// 新增廣告刊登頁面
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }


        /// <summary>
        /// 向資料庫取得當前登入的使用者之前上傳過的圖片URL清單
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult ImageByUser()
        {
            string userId = System.Web.HttpContext.Current.User.Identity.GetUserId();
            if (string.IsNullOrEmpty(userId))
            {
                return Content("");
            }

            List<Infos> result = _advertisingServices.GetImageByUser(userId);
            if (null == result && 0 < result.Count)
            {
                return Content("");
            }

            return PartialView("_InfosImageByUser", result);
        }

        /// <summary>
        /// 是否繼續刊登
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult ConfirmCreate()
        {
            return View();
        }

        /// <summary>
        /// 加值播點頁面
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult BonusBroadcast()
        {
            return View();
        }

        /// <summary>
        /// 匯款帳號資訊頁面
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult RemittanceAccountInformation()
        {
            return View();
        }

        /// <summary>
        /// 刊登查詢頁面
        /// </summary>
        /// <returns></returns>
        [Authorize]
        [HttpGet]
        public ActionResult PublishedInquire()
        {
            string userId = System.Web.HttpContext.Current.User.Identity.GetUserId();
            if (string.IsNullOrEmpty(userId))
            {
                return RedirectToAction("SearchCategories");
            }
            return View();
        }

        /// <summary>
        /// 刊登查詢 - 未付款頁面
        /// </summary>
        /// <returns></returns>
        [Authorize]
        [HttpGet]
        public ActionResult PublishedUnpaid()
        {
            string userId = System.Web.HttpContext.Current.User.Identity.GetUserId();
            if (string.IsNullOrEmpty(userId))
            {
                return RedirectToAction("SearchCategories");
            }

            List<uv_PublishedInquire> infosList = _advertisingServices.GetUnpaidByUserId(userId);
            return PartialView("_PublishedUnpaid", infosList);
        }

        /// <summary>
        /// 刊登查詢 - 刊登中頁面
        /// </summary>
        /// <returns></returns>
        [Authorize]
        [HttpGet]
        public ActionResult Published()
        {
            string userId = System.Web.HttpContext.Current.User.Identity.GetUserId();
            if (string.IsNullOrEmpty(userId))
            {
                return RedirectToAction("SearchCategories");
            }

            List<uv_PublishedInquire> infosList = _advertisingServices.GetPublishedByUserId(userId);

            return PartialView("_PublishedInfos", infosList);
        }

        /// <summary>
        /// 刊登查詢 - 已下架頁面
        /// </summary>
        /// <returns></returns>
        [Authorize]
        [HttpGet]
        public ActionResult PublishedOffTheShelf()
        {
            string userId = System.Web.HttpContext.Current.User.Identity.GetUserId();
            if (string.IsNullOrEmpty(userId))
            {
                return RedirectToAction("SearchCategories");
            }

            List<uv_PublishedInquire> infosList = _advertisingServices.GetOffTheShelfByUserId(userId);

            return PartialView("_PublishedInfos", infosList);
        }

        /// <summary>
        /// 刊登查詢 - 顯示全部頁面
        /// </summary>
        /// <returns></returns>
        [Authorize]
        [HttpGet]
        public ActionResult PublishedAll()
        {
            string userId = System.Web.HttpContext.Current.User.Identity.GetUserId();
            if (string.IsNullOrEmpty(userId))
            {
                return RedirectToAction("SearchCategories");
            }

            List<uv_PublishedInquire> infosList = _advertisingServices.GetPublishedAllByUserId(userId);

            return PartialView("_PublishedInfos", infosList);
        }

        /// <summary>
        /// 通知付款
        /// </summary>
        /// <param name="orderNumber"></param>
        /// <returns></returns>
        [Authorize]
        [HttpGet]
        public ActionResult NoticeCheckBill(string on)
        {
            string orderNumber = on;
            string userId = System.Web.HttpContext.Current.User.Identity.GetUserId();
            if (string.IsNullOrEmpty(orderNumber) || string.IsNullOrEmpty(userId))
            {
                RedirectToAction("PublishedInquire");
            }

            OrderRecord result = _advertisingServices.GetOrderRecord(userId, orderNumber);

            return View(result);
        }

        /// <summary>
        /// 訂單明細
        /// </summary>
        /// <param name="orderNumber"></param>
        /// <returns></returns>
        [Authorize]
        [HttpGet]
        public ActionResult OrderDetails(string on)
        {
            string orderNumber = on;
            string userId = System.Web.HttpContext.Current.User.Identity.GetUserId();
            if (string.IsNullOrEmpty(orderNumber) || string.IsNullOrEmpty(userId))
            {
                RedirectToAction("PublishedInquire");
            }

            UserDataViewModels user = new UserServices().GetUserDataById(userId);

            OrderRecord orderRecord = _advertisingServices.GetOrderRecord(userId, orderNumber);

            List<uv_PublishedInquire> orderDetails = null;
            if (null != orderRecord)
            {
                orderDetails = _advertisingServices.GetOrderDetails(userId, orderNumber);
            }


            ResOrderDetails model = new ResOrderDetails();
            model.OrderNumber = orderNumber;
            model.OrderDateTime = orderRecord.or_create_datetime.ToString("yyyy/MM/dd");
            model.OrderPrice = orderRecord.bill;
            model.UserName = user.UserName;
            model.Email = user.Email;
            model.Phone = user.Phone;
            model.InvoiceTitle = orderRecord.or_invoice_title;
            model.InvoiceAddress = orderRecord.or_invoice_address;
            model.InvoiceCode = orderRecord.or_invoice_code;

            List<PayAdvertising> payAdvertisingList = null;
            List<PayAdvertising> freeAdvertisingList = null;

            if (null != orderDetails && 0 < orderDetails.Count)
            {
                payAdvertisingList = new List<PayAdvertising>();
                freeAdvertisingList = new List<PayAdvertising>();

                foreach (uv_PublishedInquire item in orderDetails)
                {
                    PayAdvertising payAdvertising = new PayAdvertising();

                    //原價
                    int ig_price = item.ig_price.HasValue ? item.ig_price.Value : 0;

                    // 折數
                    int ip_discount = item.ip_discount;

                    // 分類小計
                    decimal price = ig_price * ip_discount / 100;

                    payAdvertising.Id = item.i_id;
                    payAdvertising.Title = item.i_name;
                    payAdvertising.AdvertisingPrice = Decimal.ToInt32(price);

                    int paybroadcastTotalPrice = 0;
                    Infos infos = _advertisingServices.GetInfo(item.i_id);
                    if (null != infos && null != infos.BeaconDevice && 0 < infos.BeaconDevice.Count)
                    {
                        List<uv_AllBroadcast> allBroadcastList = _broadcastServices.GetBeaconDevice();
                        foreach (BeaconDevice item1 in infos.BeaconDevice)
                        {
                            uv_AllBroadcast allBroadcast = allBroadcastList.Where(x => x.d_id.Equals(item1.d_id)).FirstOrDefault();

                            // 播點價錢
                            int broadcastPrice = allBroadcast.bdf_price.HasValue ? allBroadcast.bdf_price.Value : 0;

                            if (0 < broadcastPrice)
                            {
                                paybroadcastTotalPrice += broadcastPrice;
                            }
                        }
                    }

                    payAdvertising.BroadcastPrice = paybroadcastTotalPrice;
                    payAdvertising.Probation = infos.i_probation;
                    payAdvertising.FormalPeriod = infos.i_formal_period;

                    if (0 == Decimal.ToInt32(price) && 0 == paybroadcastTotalPrice)
                    {
                        freeAdvertisingList.Add(payAdvertising);
                    }
                    else
                    {
                        payAdvertisingList.Add(payAdvertising);
                    }
                }

                if (0 <= freeAdvertisingList.Count)
                {
                    freeAdvertisingList = null;
                }
            }

            model.PayAdvertising = payAdvertisingList;
            model.FreeAdvertising = freeAdvertisingList;

            return View(model);
        }

        /// <summary>
        /// 訂單明細中廣告刊登內容
        /// </summary>
        /// <param name="on"></param>
        /// <returns></returns>
        [Authorize]
        [HttpGet]
        public ActionResult AdvertisingPublishedContent(string on, string infId)
        {
            string orderNumber = on;
            int infosId = 0;
            Int32.TryParse(infId, out infosId);
            string userId = System.Web.HttpContext.Current.User.Identity.GetUserId();
            if (string.IsNullOrEmpty(on) || string.IsNullOrEmpty(infId) || string.IsNullOrEmpty(userId))
            {
                RedirectToAction("PublishedInquire");
            }

            ResAdvertisingPublishedContent model = null;
            uv_ClassifiedAdsSearch uv_ClassifiedAdsSearchList = _advertisingServices.GetInfos(userId, orderNumber, infosId);
            if (null != uv_ClassifiedAdsSearchList)
            {
                P_InfoPrice infoPrice = _advertisingServices.GetP_InfoPrice(uv_ClassifiedAdsSearchList.ip_days);
                Infos infos = _advertisingServices.GetInfo(uv_ClassifiedAdsSearchList.i_id);

                model = new ResAdvertisingPublishedContent();

                model.ig_name = uv_ClassifiedAdsSearchList.ig_name;
                model.ig_price = (uv_ClassifiedAdsSearchList.ig_price.HasValue) ? uv_ClassifiedAdsSearchList.ig_price.Value : 0;
                model.ip_name = infoPrice.ip_name;
                model.ip_day = uv_ClassifiedAdsSearchList.ip_days;
                model.ip_discount = uv_ClassifiedAdsSearchList.ip_discount;
                model.i_open = uv_ClassifiedAdsSearchList.i_open;
                model.i_location1 = uv_ClassifiedAdsSearchList.i_location1;
                model.i_location2 = uv_ClassifiedAdsSearchList.i_location2;
                model.i_name = uv_ClassifiedAdsSearchList.i_name;
                model.i_content = uv_ClassifiedAdsSearchList.i_content;
                model.i_expired_day = uv_ClassifiedAdsSearchList.i_expired_day;
                model.i_pic1 = uv_ClassifiedAdsSearchList.i_pic1;
                model.i_pic2 = uv_ClassifiedAdsSearchList.i_pic2;
                model.i_pic3 = uv_ClassifiedAdsSearchList.i_pic3;
                model.i_pic4 = uv_ClassifiedAdsSearchList.i_pic4;
                model.i_pic5 = uv_ClassifiedAdsSearchList.i_pic5;
                model.i_URL = uv_ClassifiedAdsSearchList.i_URL;
                model.i_LINE = uv_ClassifiedAdsSearchList.i_LINE;

                List<BeaconDeviceViewModel> beaconDevices = null;
                if (null != infos)
                {
                    if (null != infos.BeaconDevice && 0 < infos.BeaconDevice.Count)
                    {
                        beaconDevices = new List<BeaconDeviceViewModel>();
                        foreach (BeaconDevice item in infos.BeaconDevice)
                        {
                            BeaconDeviceViewModel dbModel = dbModel = new BeaconDeviceViewModel();
                            dbModel.d_name = item.d_name;

                            beaconDevices.Add(dbModel);
                        }
                    }
                }

                model.BeaconDevices = beaconDevices;
            }

            return View(model);
        }

        /// <summary>
        /// 通知付款
        /// </summary>
        /// <param name="on"></param>
        /// <returns></returns>
        [Authorize]
        [HttpGet]
        public ActionResult PaymentNotice(string on)
        {
            string orderNumber = on;
            string userId = System.Web.HttpContext.Current.User.Identity.GetUserId();
            if (string.IsNullOrEmpty(on) && string.IsNullOrEmpty(userId))
            {
                RedirectToAction("PublishedInquire");
            }

            OrderRecord orderRecord = _advertisingServices.GetOrderRecord(userId, orderNumber);
            if (null == orderRecord)
            {
                RedirectToAction("PublishedInquire");
            }

            ResPaymentNotice model = new ResPaymentNotice();
            model.OrderNumber = orderRecord.or_number;
            model.Price = orderRecord.bill;

            return View(model);
        }

        /// <summary>
        /// 提供末5碼對帳
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult PaymentNotice(ReqPaymentNotice model)
        {
            ResPaymentNoticeResult result = new ResPaymentNoticeResult();
            if (false == ModelState.IsValid)
            {
                result.status = false;
            }

            bool saveResult = _advertisingServices.SetOrderRecord(model.on, model.price, model.name);

            if (saveResult)
            {
                result.status = true;
            }
            else
            {
                result.status = false;
            }

            return Json(result);
        }

        /// <summary>
        /// 完成繳款
        /// </summary>
        /// <returns></returns>
        [Authorize]
        [HttpGet]
        public ActionResult AccomplishNotice()
        {
            return View();
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                if (null != _advertisingServices)
                {
                    _advertisingServices.Dispose();
                    _advertisingServices = null;
                }
                if (null != _broadcastServices)
                {
                    _broadcastServices.Dispose();
                    _broadcastServices = null;
                }
            }
            base.Dispose(disposing);
        }
    }
}