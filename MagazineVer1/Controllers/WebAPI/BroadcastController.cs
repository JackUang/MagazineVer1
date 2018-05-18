using MagazineVer1.Models;
using MagazineVer1.Models.ViewModels.Web;
using MagazineVer1.Models.ViewModels.WebAPI;
using MagazineVer1.Services.DBServices;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace MagazineVer1.Controllers.WebAPI
{
    [EnableCors("*", "*", "*")]
    public class BroadcastController : ApiController
    {
        private BroadcastServices _broadcastServices = new BroadcastServices();

        /// <summary>
        /// 取得播點種類清單
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public HttpResponseMessage BroadcastType()
        {
            // 取得播點種類清單
            List<BroadcastPointType> broadcastPointTypeList = _broadcastServices.GetBroadcastTypeList();

            List<ResBroadcastTypeViewModel> modes = null;
            if (null != broadcastPointTypeList && 0 < broadcastPointTypeList.Count)
            {
                modes = new List<ResBroadcastTypeViewModel>();
                foreach (BroadcastPointType item in broadcastPointTypeList)
                {
                    ResBroadcastTypeViewModel model = new ResBroadcastTypeViewModel();
                    model.bpt_id = item.bpt_id;
                    model.bpt_broadcastPoint = item.bpt_broadcastPoint;

                    modes.Add(model);
                }
            }

            return Request.CreateResponse(HttpStatusCode.OK, modes);
        }

        /// <summary>
        /// 取得推播廣告統計清單
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public HttpResponseMessage PushAdvertisingStatistics()
        {
            // 取得BeaconDevice所有統計資料
            List<BroadcastViewModels> models = _broadcastServices.GetBeaconDeviceStatistics();
            return Request.CreateResponse(HttpStatusCode.OK, models);
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
        public HttpResponseMessage SearchBroadcastResult([FromBody] ReqSearchBroadcastResultViewModel value)
        {
            if (string.IsNullOrEmpty(value.getDataType) && (string.IsNullOrEmpty(value.county) || string.IsNullOrEmpty(value.township) || string.IsNullOrEmpty(value.broadcastPointType)))
            {
                // 404
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            bool dataType = false;
            bool.TryParse(value.getDataType, out dataType);

            // 依條件搜尋推播廣告統計清單
            var model = _broadcastServices.GetBeaconDeviceStatistics(dataType, value.county, value.township, value.broadcastPointType, value.keywords);

            if (null == model || 0 >= model.Count)
            {
                // 204
                return Request.CreateResponse(HttpStatusCode.NoContent);
            }

            // 200
            return Request.CreateResponse(HttpStatusCode.OK, model);
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
