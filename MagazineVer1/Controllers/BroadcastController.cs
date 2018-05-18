using MagazineVer1.Models;
using MagazineVer1.Models.ViewModels.Web;
using MagazineVer1.Services.DBServices;
using MagazineVer1.Utility;
using PagedList;
using System.Collections.Generic;
using System.Web.Mvc;

namespace MagazineVer1.Controllers
{
    public class BroadcastController : Controller
    {
        private BroadcastServices _broadcastServices = new BroadcastServices();

        [HttpGet]
        public ActionResult SearchBroadcast()
        {
            // 取得縣市清單
            IEnumerable<string> countyCityList = _broadcastServices.GetCountyCityList();

            // 縣市下拉選單
            List<SelectListItem> ddlCountyCitylist = new DropDownListUtility().GetCountyCityListDDL(countyCityList);
            ViewBag.DDLCountyCityList = ddlCountyCitylist;

            // 取得BeaconDevice所有統計資料
            List<BroadcastViewModels> models = _broadcastServices.GetBeaconDeviceStatistics();

            return View(models);
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
            List<string> townshipCityList = _broadcastServices.GetTownshipCityList(ddlCountyCity);

            // 鄉鎮市區清單下拉選單
            List<SelectListItem> ddlTownshipCityList = new DropDownListUtility().GetTownshipCityListDDL(townshipCityList);

            ViewBag.DDLTownshipCityList = ddlTownshipCityList;
            ViewBag.County = ddlCountyCity;

            return PartialView("_DDLTownshipCityPartial");
        }

        /// <summary>
        /// 取得播點種類清單
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult GetBroadcastType()
        {
            // 取得播點種類清單
            List<BroadcastPointType> broadcastPointTypeList = _broadcastServices.GetBroadcastTypeList();

            // 播點種類清單下拉選單
            List<SelectListItem> broadcastTypeDDL = new DropDownListUtility().GetBroadcastTypeDDL(broadcastPointTypeList);
            ViewBag.DDLBroadcastPointTypeList = broadcastTypeDDL;

            return PartialView("_DDLBroadcastPointTypePartial");
        }

        /// <summary>
        /// 依使用者條件搜尋推播廣告
        /// </summary>
        /// <param name="county">使用者所選擇的縣市資料</param>
        /// <param name="township">使用者所選擇的鄉鎮市區資料</param>
        /// <param name="broadcastPointType">使用者所選擇的播點種類資料</param>
        /// <param name="keywords">使用者所輸入的關鍵字資料</param>
        /// <returns>推播廣告統計結果清單</returns>
        [HttpPost]
        public ActionResult SearchBroadcastResult(string getDataType, string county, string township, string broadcastPointType, string keywords)
        {
            if (string.IsNullOrEmpty(getDataType) && (string.IsNullOrEmpty(county) || string.IsNullOrEmpty(township) || string.IsNullOrEmpty(broadcastPointType)))
            {
                return RedirectToAction("SearchBroadcast");
            }

            bool dataType = false;
            bool.TryParse(getDataType, out dataType);

            // 依條件搜尋推播廣告統計清單
            List<BroadcastViewModels> models = _broadcastServices.GetBeaconDeviceStatistics(dataType, county, township, broadcastPointType, keywords);

            ViewBag.County = county;
            ViewBag.Township = township;
            ViewBag.BroadcastPointType = broadcastPointType;
            ViewBag.keywords = keywords;


            return PartialView("_SearchBroadcastResultPartial", models);
        }

        /// <summary>
        /// 依使用者所按下某播點的則數超連結，取得此播點的廣告清單
        /// </summary>
        /// <param name="bp">播點種類</param>
        /// <param name="bdf_name">等級</param>
        /// <param name="bd_name">播點名稱</param>
        /// <param name="bdl3">街道路</param>
        /// <param name="bdl4">巷弄段號</param>
        /// <param name="county">縣市資料</param>
        /// <param name="township">鄉鎮市區資料</param>
        /// <param name="bpt">播點種類資料</param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult ConditionalSearchPushAdvertising(string bp, string bdf_name, string bd_name,
            string bdl3, string bdl4, string county, string township, int page = 1)
        {
            if (string.IsNullOrEmpty(bp) || string.IsNullOrEmpty(bdf_name) || string.IsNullOrEmpty(bd_name) ||
               string.IsNullOrEmpty(bdl3) || string.IsNullOrEmpty(bdl4))
            {
                return RedirectToAction("SearchBroadcast");
            }

            ViewBag.BroadcastPoint = bp;
            ViewBag.BeaconDeviceName = bd_name;

            IPagedList<uv_ConditionalSearchPushAdvertisin> model = null;

            if (string.IsNullOrEmpty(county) && string.IsNullOrEmpty(township))
            {
                // 依播點的參數條件，取得此播點的廣告清單
                model = _broadcastServices.GetConditionalSearchPushAdvertising(bp, bdf_name, bd_name, bdl3, bdl4, page);
            }
            else
            {
                // 依播點的參數條件，取得此播點的廣告清單
                model = _broadcastServices.GetConditionalSearchPushAdvertising(bp, bdf_name, bd_name, bdl3, bdl4, county, township, page);
            }

            return View(model);
        }

        /// <summary>
        /// 依使用者所選取取得推播廣告搜尋詳細資料
        /// </summary>
        /// <param name="did">設備UID編號</param>
        /// <param name="iid">資訊編號</param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult PushAdvertisingDetailed(string did, string iid)
        {
            if (string.IsNullOrEmpty(did) || string.IsNullOrEmpty(iid))
            {
                return RedirectToAction("SearchBroadcast");
            }

            int i_id = 0;
            int.TryParse(iid, out i_id);

            // 取得推播廣告搜尋詳細資料
            var model = _broadcastServices.GetPushAdvertisingDetailed(did, i_id);

            return View(model);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
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