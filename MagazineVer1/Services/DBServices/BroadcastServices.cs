using MagazineVer1.Models;
using MagazineVer1.Models.ViewModels.Web;
using MagazineVer1.Utility;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MagazineVer1.Services.DBServices
{
    public class BroadcastServices
    {
        private bool _disposed;
        private POPEntities _db = new POPEntities();
        private AdvertisingServices _advertisingServices = new AdvertisingServices();

        // 單頁可容納之資料筆數
        private int _pageSize = 10;

        // 取得 Server 目前日期時間
        DateTime _nowDateTime = DateTime.Now;

        /// <summary>
        /// 取得縣市清單
        /// </summary>
        /// <returns>縣市清單</returns>
        public IEnumerable<string> GetCountyCityList()
        {
            IEnumerable<string> countyCityList = null;
            try
            {
                countyCityList = _advertisingServices.GetCountyCityList();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return countyCityList;
        }

        /// <summary>
        /// 依縣市取得鄉鎮市區清單
        /// </summary>
        /// <param name="countyCity">縣市資料</param>
        /// <returns>鄉鎮市區清單</returns>
        public List<string> GetTownshipCityList(string countyCity)
        {
            List<string> townshipCityList = null;
            try
            {
                townshipCityList = _advertisingServices.GetTownshipCityList(countyCity);
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return townshipCityList;

        }

        /// <summary>
        /// 取得播點種類清單
        /// </summary>
        /// <returns>播點種類清單</returns>
        public List<BroadcastPointType> GetBroadcastTypeList()
        {
            List<BroadcastPointType> broadcastPointTypeList = null;
            try
            {
                broadcastPointTypeList = _db.BroadcastPointType.ToList();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return broadcastPointTypeList;
        }

        /// <summary>
        /// 依條件搜尋推播廣告統計清單
        /// </summary>
        /// <param name="getDataType">
        /// true表示取得全國的所有播點清單資料，並且其他參數（countyCity、townshipCity、bdfName、bName）不會進行比對。
        /// false表示依條件搜尋推播廣告統計清單
        /// </param>
        /// <param name="countyCity">縣市資料</param>
        /// <param name="townshipCity">鄉鎮市區資料</param>
        /// <param name="bdfName">播點種類資料</param>
        /// <param name="bName">關鍵字資料</param>
        /// <returns>推播廣告統計清單</returns>
        public List<usp_PushAdvertisingStatistics_Result> GetPushAdvertisingStatistics(bool getDataType, string countyCity, string townshipCity, string bdfBroadcastPoint, string dName)
        {
            List<usp_PushAdvertisingStatistics_Result> result = null;
            try
            {
                result = _db.usp_PushAdvertisingStatistics(getDataType, countyCity, townshipCity, bdfBroadcastPoint, dName, _nowDateTime).ToList();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }
            return result;
        }

        /// <summary>
        /// 取得BeaconDevice所有統計資料
        /// </summary>
        /// <returns></returns>
        public List<BroadcastViewModels> GetBeaconDeviceStatistics()
        {
            // 依條件搜尋推播廣告統計清單
            List<usp_PushAdvertisingStatistics_Result> statisticData = GetPushAdvertisingStatistics(true, "", "", "", "");

            // 取得BeaconDevice所有資料
            List<uv_AllBroadcast> beaconDeviceList = GetBeaconDevice();

            List<BroadcastViewModels> models = null;

            int rowNumber = 0;
            if (null != beaconDeviceList && 0 < beaconDeviceList.Count)
            {
                models = new List<BroadcastViewModels>();
                foreach (uv_AllBroadcast item in beaconDeviceList)
                {
                    BroadcastViewModels model = new BroadcastViewModels();

                    model.rowNumber = ++rowNumber;

                    if (null != statisticData && 0 < statisticData.Count)
                    {
                        int? quantity = statisticData.Where(x => x.bpt_broadcastPoint.Equals(item.bpt_broadcastPoint) &&
                        x.bdf_name.Equals(item.bdf_name) && x.d_name.Equals(item.d_name) &&
                        x.d_location3.Equals(item.d_location3) && x.d_location4.Equals(item.d_location4) &&
                        x.bdf_price == item.bdf_price).Select(x => x.quantity).FirstOrDefault();

                        model.quantity = (quantity.HasValue) ? quantity.Value : 0;
                    }
                    else
                    {
                        model.quantity = 0;
                    }

                    model.bpt_broadcastPoint = item.bpt_broadcastPoint;
                    model.bdf_name = item.bdf_name;
                    model.d_name = item.d_name;
                    model.d_location3 = item.d_location3;
                    model.d_location4 = item.d_location4;
                    model.bdf_price = item.bdf_price;

                    models.Add(model);
                }
            }

            return models;
        }

        /// <summary>
        /// 依條件搜尋推播廣告統計清單
        /// </summary>
        /// <param name="getDataType">
        /// true表示取得全國的所有播點清單資料，並且其他參數（countyCity、townshipCity、bdfName、bName）不會進行比對。
        /// false表示依條件搜尋推播廣告統計清單
        /// </param>
        /// <param name="countyCity">縣市資料</param>
        /// <param name="townshipCity">鄉鎮市區資料</param>
        /// <param name="bdfName">播點種類資料</param>
        /// <param name="bName">關鍵字資料</param>
        /// <returns>推播廣告統計清單</returns>
        public List<BroadcastViewModels> GetBeaconDeviceStatistics(bool dataType, string county, string township, string broadcastPointType, string keywords)
        {
            // 依條件搜尋推播廣告統計清單
            List<usp_PushAdvertisingStatistics_Result> statisticData = GetPushAdvertisingStatistics(dataType, county, township, broadcastPointType, keywords);

            // 依條件搜尋取得BeaconDevice資料
            List<uv_AllBroadcast> beaconDeviceList = GetBeaconDevice(county, township, broadcastPointType, keywords);

            List<BroadcastViewModels> models = null;

            int rowNumber = 0;
            if (null != beaconDeviceList && 0 < beaconDeviceList.Count)
            {
                models = new List<BroadcastViewModels>();
                foreach (uv_AllBroadcast item in beaconDeviceList)
                {
                    BroadcastViewModels model = new BroadcastViewModels();

                    model.rowNumber = ++rowNumber;

                    if (null != statisticData && 0 < statisticData.Count)
                    {
                        int? quantity = statisticData.Where(x => x.bpt_broadcastPoint.Equals(item.bpt_broadcastPoint) &&
                                        x.bdf_name.Equals(item.bdf_name) && x.d_name.Equals(item.d_name) &&
                                        x.d_location3.Equals(item.d_location3) && x.d_location4.Equals(item.d_location4) &&
                                        x.bdf_price == item.bdf_price).Select(x => x.quantity).FirstOrDefault();

                        model.quantity = (quantity.HasValue) ? quantity.Value : 0;
                    }
                    else
                    {
                        model.quantity = 0;
                    }

                    model.bpt_broadcastPoint = item.bpt_broadcastPoint;
                    model.bdf_name = item.bdf_name;
                    model.d_name = item.d_name;
                    model.d_location3 = item.d_location3;
                    model.d_location4 = item.d_location4;
                    model.bdf_price = item.bdf_price;

                    models.Add(model);
                }
            }
            return models;
        }

        /// <summary>
        /// 取得BeaconDevice所有資料
        /// </summary>
        public List<uv_AllBroadcast> GetBeaconDevice()
        {
            List<uv_AllBroadcast> result = null;
            try
            {
                result = _db.uv_AllBroadcast.ToList();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return result;
        }

        /// <summary>
        /// 依條件搜尋取得BeaconDevice資料
        /// </summary>
        /// <param name="countyCity">縣市</param>
        /// <param name="townshipCity">鄉鎮市區</param>
        /// <param name="bdfBroadcastPoint">播點種類</param>
        /// <param name="dName">播點名稱</param>
        /// <returns></returns>
        public List<uv_AllBroadcast> GetBeaconDevice(string countyCity, string townshipCity, string bdfBroadcastPoint, string dName)
        {
            List<uv_AllBroadcast> result = null;
            try
            {
                if (string.IsNullOrEmpty(countyCity) && string.IsNullOrEmpty(townshipCity) && string.IsNullOrEmpty(bdfBroadcastPoint) && string.IsNullOrEmpty(dName))
                {
                    result = GetBeaconDevice();
                }
                else if (string.IsNullOrEmpty(countyCity) && string.IsNullOrEmpty(townshipCity) && string.IsNullOrEmpty(bdfBroadcastPoint) && !string.IsNullOrEmpty(dName))
                {
                    result = _db.uv_AllBroadcast.Where(x => x.d_name.Contains(dName)).ToList();
                }
                else if ("all".Equals(bdfBroadcastPoint) && string.IsNullOrEmpty(dName))
                {
                    result = _db.uv_AllBroadcast.Where(x => x.d_location1.Equals(countyCity) && x.d_location2.Equals(townshipCity)).ToList();
                }
                else if ("all".Equals(bdfBroadcastPoint))
                {
                    result = _db.uv_AllBroadcast.Where(x => x.d_location1.Equals(countyCity) && x.d_location2.Equals(townshipCity) &&
                        x.d_name.Contains(dName)).ToList();
                }
                else if (string.IsNullOrEmpty(dName))
                {
                    result = _db.uv_AllBroadcast.Where(x => x.d_location1.Equals(countyCity) && x.d_location2.Equals(townshipCity) &&
                        x.bpt_broadcastPoint.Equals(bdfBroadcastPoint)).ToList();
                }
                else
                {
                    result = _db.uv_AllBroadcast.Where(x => x.d_location1.Equals(countyCity) && x.d_location2.Equals(townshipCity) &&
                        x.bpt_broadcastPoint.Equals(bdfBroadcastPoint) && x.d_name.Contains(dName)).ToList();
                }
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return result;
        }

        /// <summary>
        /// 依播點的參數條件，取得此播點的廣告清單
        /// </summary>
        /// <param name="broadcastPoint">播點種類</param>
        /// <param name="beaconDeviceFlowName">等級</param>
        /// <param name="beaconDeviceName">播點名稱</param>
        /// <param name="beaconDeviceLocation3">街道路</param>
        /// <param name="beaconDeviceLocation4">巷弄段號</param>
        /// <param name="county">縣市資料</param>
        /// <param name="township">鄉鎮市區資料</param>
        /// <param name="broadcastPointType">播點種類資料</param>
        /// <returns>播點的廣告清單</returns>
        public IPagedList<uv_ConditionalSearchPushAdvertisin> GetConditionalSearchPushAdvertising(string broadcastPoint, string beaconDeviceFlowName,
            string beaconDeviceName, string beaconDeviceLocation3, string beaconDeviceLocation4,
            string county, string township, int page)
        {
            IPagedList<uv_ConditionalSearchPushAdvertisin> result = null;
            int currentPage = page < 1 ? 1 : page;

            try
            {
                result = _db.uv_ConditionalSearchPushAdvertisin.Where(
                    x => x.bpt_broadcastPoint.Equals(broadcastPoint) && x.bdf_name.Equals(beaconDeviceFlowName) &&
                    x.d_name.Equals(beaconDeviceName) && x.d_location3.Equals(beaconDeviceLocation3) &&
                    x.d_location4.Equals(beaconDeviceLocation4) && x.d_location1.Equals(county) && x.d_location2.Equals(township) &&
                    x.i_open == true && x.i_expired_day >= _nowDateTime).OrderByDescending(x => x.i_initial_day).ToPagedList(currentPage, _pageSize);
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return result;
        }

        /// <summary>
        /// 依播點的參數條件，取得此播點的廣告清單
        /// </summary>
        /// <param name="broadcastPoint">播點種類</param>
        /// <param name="beaconDeviceFlowName">等級</param>
        /// <param name="beaconDeviceName">播點名稱</param>
        /// <param name="beaconDeviceLocation3">街道路</param>
        /// <param name="beaconDeviceLocation4">巷弄段號</param>
        /// <param name="broadcastPointType">播點種類資料</param>
        /// <returns>播點的廣告清單</returns>
        public IPagedList<uv_ConditionalSearchPushAdvertisin> GetConditionalSearchPushAdvertising(string broadcastPoint, string beaconDeviceFlowName,
            string beaconDeviceName, string beaconDeviceLocation3, string beaconDeviceLocation4,
            int page)
        {
            IPagedList<uv_ConditionalSearchPushAdvertisin> result = null;
            int currentPage = page < 1 ? 1 : page;

            try
            {
                result = _db.uv_ConditionalSearchPushAdvertisin.Where(
                    x => x.bpt_broadcastPoint.Equals(broadcastPoint) && x.bdf_name.Equals(beaconDeviceFlowName) &&
                    x.d_name.Equals(beaconDeviceName) && x.d_location3.Equals(beaconDeviceLocation3) &&
                    x.d_location4.Equals(beaconDeviceLocation4) &&
                    x.i_open == true && x.i_expired_day >= _nowDateTime).OrderByDescending(x => x.i_initial_day).ToPagedList(currentPage, _pageSize);
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return result;
        }

        /// <summary>
        /// 取得推播廣告搜尋詳細資料
        /// </summary>
        /// <param name="did">設備UID編號</param>
        /// <param name="iid">資訊編號</param>
        /// <returns></returns>
        public uv_ConditionalSearchPushAdvertisin GetPushAdvertisingDetailed(string did, int iid)
        {
            uv_ConditionalSearchPushAdvertisin result = null;
            try
            {
                result = _db.uv_ConditionalSearchPushAdvertisin.Where(
                    x => x.d_id == did && x.i_id == iid && x.i_open == true && x.i_expired_day >= _nowDateTime).FirstOrDefault();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return result;
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
                    if (null != _db)
                    {
                        _db.Dispose();
                        _db = null;
                    }

                    if (null != _advertisingServices)
                    {
                        _advertisingServices.Dispose();
                        _advertisingServices = null;
                    }
                }
            }
            _disposed = true;
        }
    }
}