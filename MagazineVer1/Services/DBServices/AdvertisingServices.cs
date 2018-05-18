using MagazineVer1.Models;
using MagazineVer1.Utility;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;

namespace MagazineVer1.Services.DBServices
{
    public class AdvertisingServices
    {
        private bool _disposed;
        private POPEntities _db = new POPEntities();

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
                var county = from c in _db.town
                             orderby c.c_id ascending
                             select c.c_county;

                countyCityList = county.ToList().Distinct();
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
                var townshipCity = from p in _db.town
                                   where p.c_county == countyCity
                                   select p.c_town;
                townshipCityList = townshipCity.ToList();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return townshipCityList;

        }

        /// <summary>
        /// 依 類別Id 取得 類別名稱
        /// </summary>
        /// <param name="Id">類別Id</param>
        /// <returns>類別名稱</returns>
        public string GetCategoryByName(int Id)
        {
            string name = string.Empty;

            try
            {
                name = _db.InfoGroupp.Where(x => x.ig_id == Id).Select(x => x.ig_name).FirstOrDefault();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return name;
        }

        /// <summary>
        /// 取得所有類別與ICON清單
        /// </summary>
        /// <returns>類別與ICON清單</returns>
        public List<InfoGroupp> GetCategory()
        {
            List<InfoGroupp> categoryList = null;

            try
            {
                categoryList = _db.InfoGroupp.OrderBy(x => x.DisplayOrder).ToList();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return categoryList;
        }

        /// <summary>
        /// 依縣市與鄉鎮市區取得類別清單
        /// </summary>
        /// <param name="countyCity">縣市資料</param>
        /// <param name="ddlTownshipCity">鄉鎮市區資料</param>
        /// <returns>類別清單</returns>
        public List<InfoGroupp> GetCategory(string countyCity, string ddlTownshipCity)
        {
            IEnumerable<int> infosByIdList = null;
            List<InfoGroupp> categoryList = null;

            DateTime currentDate = DateTime.Now;
            try
            {
                var category = from p in _db.Infos
                               where (p.i_location1.Equals(countyCity) && p.i_location2.Equals(ddlTownshipCity) &&
                                currentDate <= p.i_expired_day && p.i_open == true)
                               select p.ig_id;

                infosByIdList = category.ToList().Distinct();

                if (null == infosByIdList)
                {
                    return categoryList;
                }

                categoryList = _db.InfoGroupp.Where(x => infosByIdList.Contains(x.ig_id)).ToList();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return categoryList;
        }

        /// <summary>
        /// 取得分類廣告統計
        /// </summary>
        /// <returns>廣告分類統計清單</returns>
        public List<uv_AdvertisingCategoryCount> GetAdvertisingCategoryCount()
        {
            List<uv_AdvertisingCategoryCount> advertisingCategoryCounts = null;
            try
            {
                advertisingCategoryCounts = _db.uv_AdvertisingCategoryCount.ToList();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return advertisingCategoryCounts;
        }

        /// <summary>
        /// 依 縣市, 鄉鎮市區 條件查詢分類廣告
        /// 依刊登起始日期降冪排序
        /// </summary>
        /// <param name="county">縣市</param>
        /// <param name="township">鄉鎮市區</param>
        /// <returns>分類廣告清單</returns>
        public IPagedList<uv_ClassifiedAdsSearch> ClassifiedAdsSearch(string county, string township, int page)
        {
            IPagedList<uv_ClassifiedAdsSearch> data = null;
            int currentPage = page < 1 ? 1 : page;

            try
            {
                data = _db.uv_ClassifiedAdsSearch.Where(x => x.i_location1.Equals(county) && x.i_location2.Equals(township) && x.i_open == true && x.i_expired_day >= _nowDateTime).OrderByDescending(x => x.i_initial_day).ToPagedList(currentPage, _pageSize);
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return data;
        }

        /// <summary>
        /// 依 縣市, 鄉鎮市區 條件查詢分類廣告
        /// 依刊登起始日期降冪排序
        /// </summary>
        /// <param name="county">縣市</param>
        /// <param name="township">鄉鎮市區</param>
        /// <returns>分類廣告清單</returns>
        public List<uv_ClassifiedAdsSearch> ClassifiedAdsSearch(string county, string township)
        {
            List<uv_ClassifiedAdsSearch> data = null;

            try
            {
                data = _db.uv_ClassifiedAdsSearch.Where(x => x.i_location1.Equals(county) && x.i_location2.Equals(township) && x.i_open == true && x.i_expired_day >= _nowDateTime).OrderByDescending(x => x.i_initial_day).ToList();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return data;
        }

        /// <summary>
        /// 依 縣市, 鄉鎮市區, 關鍵字 條件查詢分類廣告
        /// 依刊登起始日期降冪排序
        /// </summary>
        /// <param name="county">縣市</param>
        /// <param name="township">鄉鎮市區</param>
        /// <param name="keywords">關鍵字</param>
        /// <param name="page">頁碼</param>
        /// <returns>分類廣告清單</returns>
        public IPagedList<uv_ClassifiedAdsSearch> ClassifiedAdsSearch(string county, string township, string keywords, int page)
        {
            IPagedList<uv_ClassifiedAdsSearch> data = null;
            int currentPage = page < 1 ? 1 : page;

            try
            {
                data = _db.uv_ClassifiedAdsSearch.Where(x => x.i_location1.Equals(county) && x.i_location2.Equals(township) &&
                    (x.i_name.Contains(keywords) || x.i_content.Contains(keywords)) && x.i_open == true && x.i_expired_day >= _nowDateTime).OrderByDescending(x => x.i_initial_day).ToPagedList(currentPage, _pageSize);
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return data;
        }

        /// <summary>
        /// 依 縣市, 鄉鎮市區, 關鍵字 條件查詢分類廣告
        /// 依刊登起始日期降冪排序
        /// </summary>
        /// <param name="county">縣市</param>
        /// <param name="township">鄉鎮市區</param>
        /// <param name="keywords">關鍵字</param>
        /// <returns>分類廣告清單</returns>
        public List<uv_ClassifiedAdsSearch> ClassifiedAdsSearchByKeyword(string county, string township, string keywords)
        {
            List<uv_ClassifiedAdsSearch> data = null;

            try
            {
                data = _db.uv_ClassifiedAdsSearch.Where(x => x.i_location1.Equals(county) && x.i_location2.Equals(township) &&
                        (x.i_name.Contains(keywords) || x.i_content.Contains(keywords)) && x.i_open == true && x.i_expired_day >= _nowDateTime).OrderByDescending(x => x.i_initial_day).ToList();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return data;
        }

        /// <summary>
        /// 依 縣市, 鄉鎮市區, 類別 條件查詢分類廣告
        /// 依刊登起始日期降冪排序
        /// </summary>
        /// <param name="county">縣市</param>
        /// <param name="township">鄉鎮市區</param>
        /// <param name="category">類別</param>
        /// <param name="page">頁碼</param>
        /// <returns>分類廣告清單</returns>
        public IPagedList<uv_ClassifiedAdsSearch> ClassifiedAdsSearch(string county, string township, int category, int page)
        {
            IPagedList<uv_ClassifiedAdsSearch> data = null;
            int currentPage = page < 1 ? 1 : page;

            try
            {
                data = _db.uv_ClassifiedAdsSearch.Where(x => x.i_location1.Equals(county) && x.i_location2.Equals(township) &&
                    x.ig_id == category && x.i_open == true && x.i_expired_day >= _nowDateTime).OrderByDescending(x => x.i_initial_day).ToPagedList(currentPage, _pageSize);
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return data;
        }

        /// <summary>
        /// 依 縣市, 鄉鎮市區, 類別 條件查詢分類廣告
        /// 依刊登起始日期降冪排序
        /// </summary>
        /// <param name="county">縣市</param>
        /// <param name="township">鄉鎮市區</param>
        /// <param name="category">類別</param>
        /// <returns>分類廣告清單</returns>
        public List<uv_ClassifiedAdsSearch> ClassifiedAdsSearchByCategory(string county, string township, int category)
        {
            List<uv_ClassifiedAdsSearch> data = null;

            try
            {
                data = _db.uv_ClassifiedAdsSearch.Where(x => x.i_location1.Equals(county) && x.i_location2.Equals(township) &&
                        x.ig_id == category && x.i_open == true && x.i_expired_day >= _nowDateTime).OrderByDescending(x => x.i_initial_day).ToList();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return data;
        }

        /// <summary>
        /// 依 縣市, 鄉鎮市區, 類別, 關鍵字 條件查詢分類廣告
        /// 依刊登起始日期降冪排序
        /// </summary>
        /// <param name="county">縣市</param>
        /// <param name="township">鄉鎮市區</param>
        /// <param name="category">類別</param>
        /// <param name="keywords">關鍵字</param>
        /// <param name="page">頁碼</param>
        /// <returns>分類廣告清單</returns>
        public IPagedList<uv_ClassifiedAdsSearch> ClassifiedAdsSearch(string county, string township, int category, string keywords, int page)
        {
            IPagedList<uv_ClassifiedAdsSearch> data = null;
            int currentPage = page < 1 ? 1 : page;

            try
            {
                data = _db.uv_ClassifiedAdsSearch.Where(x => x.i_location1.Equals(county) && x.i_location2.Equals(township) &&
                    x.ig_id == category && (x.i_name.Contains(keywords) ||
                    x.i_content.Contains(keywords)) && x.i_open == true && x.i_expired_day >= _nowDateTime).OrderByDescending(x => x.i_initial_day).ToPagedList(currentPage, _pageSize);
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return data;
        }

        /// <summary>
        /// 依 縣市, 鄉鎮市區, 類別, 關鍵字 條件查詢分類廣告
        /// 依刊登起始日期降冪排序
        /// </summary>
        /// <param name="county">縣市</param>
        /// <param name="township">鄉鎮市區</param>
        /// <param name="category">類別</param>
        /// <param name="keywords">關鍵字</param>
        /// <returns>分類廣告清單</returns>
        public List<uv_ClassifiedAdsSearch> ClassifiedAdsSearch(string county, string township, int category, string keywords)
        {
            List<uv_ClassifiedAdsSearch> data = null;

            try
            {
                data = _db.uv_ClassifiedAdsSearch.Where(x => x.i_location1.Equals(county) && x.i_location2.Equals(township) &&
                        x.ig_id == category && (x.i_name.Contains(keywords) ||
                        x.i_content.Contains(keywords)) && x.i_open == true && x.i_expired_day >= _nowDateTime).OrderByDescending(x => x.i_initial_day).ToList();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return data;
        }

        /// <summary>
        /// 依 關鍵字 條件查詢分類廣告
        /// 依刊登起始日期降冪排序
        /// </summary>
        /// <param name="keywords">關鍵字</param>
        /// <param name="page">頁碼</param>
        /// <returns>分類廣告清單</returns>
        public IPagedList<uv_ClassifiedAdsSearch> ClassifiedAdsSearch(string keywords, int page)
        {
            IPagedList<uv_ClassifiedAdsSearch> data = null;
            int currentPage = page < 1 ? 1 : page;

            try
            {
                data = _db.uv_ClassifiedAdsSearch.Where(x => (x.i_content.Contains(keywords) || x.i_name.Contains(keywords)) && x.i_open == true && x.i_expired_day >= _nowDateTime).OrderByDescending(x => x.i_initial_day).ToPagedList(currentPage, _pageSize);
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return data;
        }

        /// <summary>
        /// 依 關鍵字 條件查詢分類廣告
        /// 依刊登起始日期降冪排序
        /// </summary>
        /// <param name="keywords">關鍵字</param>
        /// <returns>分類廣告清單</returns>
        public List<uv_ClassifiedAdsSearch> ClassifiedAdsSearch(string keywords)
        {
            List<uv_ClassifiedAdsSearch> data = null;

            try
            {
                data = _db.uv_ClassifiedAdsSearch.Where(x => (x.i_content.Contains(keywords) || x.i_name.Contains(keywords)) && x.i_open == true && x.i_expired_day >= _nowDateTime).OrderByDescending(x => x.i_initial_day).ToList();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return data;
        }

        /// <summary>
        /// 依 類別 搜尋在地分類廣告
        /// 排序依據為：類別＞地區>刊登起始日期
        /// </summary>
        /// <param name="classifiedId">類別Id</param>
        /// <param name="page">頁碼</param>
        /// <returns>分類廣告清單</returns>
        public IPagedList<uv_ClassifiedAdsSearch> ClassifiedSearch(int classifiedId, int page)
        {
            IPagedList<uv_ClassifiedAdsSearch> data = null;
            int currentPage = page < 1 ? 1 : page;

            try
            {
                data = _db.uv_ClassifiedAdsSearch.Where(x => x.ig_id == classifiedId && x.i_open == true && x.i_expired_day >= _nowDateTime)
                    .OrderByDescending(x => x.ig_id).ThenByDescending(x => x.i_location1).ThenByDescending(x => x.i_location2)
                    .ThenByDescending(x => x.i_initial_day).ToPagedList(currentPage, _pageSize);
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return data;
        }

        /// <summary>
        /// 依 類別 搜尋在地分類廣告
        /// 排序依據為：類別＞地區>刊登起始日期
        /// </summary>
        /// <param name="classifiedId">類別Id</param>
        /// <returns>分類廣告清單</returns>
        public List<uv_ClassifiedAdsSearch> ClassifiedSearch(int classifiedId)
        {
            List<uv_ClassifiedAdsSearch> data = null;

            _db.Database.Log = (log) => System.Diagnostics.Debug.WriteLine(log);
            try
            {
                data = _db.uv_ClassifiedAdsSearch.Where(x => x.ig_id == classifiedId && x.i_open == true && x.i_expired_day >= _nowDateTime)
                        .OrderByDescending(x => x.ig_id).ThenByDescending(x => x.i_location1).ThenByDescending(x => x.i_location2)
                        .ThenByDescending(x => x.i_initial_day).ToList();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return data;
        }

        /// <summary>
        /// 依 分類廣告Id 取得分類廣告詳細資料
        /// </summary>
        /// <param name="id">分類廣告Id</param>
        /// <returns>分類廣告詳細資料</returns>
        public uv_ClassifiedAdsSearch CategoryDetailed(int id)
        {
            uv_ClassifiedAdsSearch data = null;
            try
            {
                data = _db.uv_ClassifiedAdsSearch.Where(x => x.i_id == id && x.i_open == true && x.i_expired_day >= _nowDateTime).FirstOrDefault();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return data;
        }

        /// <summary>
        /// 取得刊登期(打折後、天數、折數)資料清單
        /// </summary>
        /// <returns>刊登期(打折後、天數、折數)資料清單</returns>
        public List<P_InfoPrice> GetInfoPrice()
        {
            List<P_InfoPrice> data = null;
            try
            {
                data = _db.P_InfoPrice.ToList();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return data;
        }

        /// <summary>
        /// 查詢刊登廣告類別價錢
        /// </summary>
        /// <param name="id">類別ID</param>
        /// <param name="name">類別名稱</param>
        /// <returns>廣告類別價錢</returns>
        public int GetCategoryPrice(int id, string name)
        {
            InfoGroupp data = null;
            try
            {
                data = _db.InfoGroupp.Where(x => x.ig_id == id && x.ig_name.Equals(name)).FirstOrDefault();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            int price = (null != data) ? data.ig_price : 0;

            return price;
        }

        /// <summary>
        /// 查詢刊登廣告刊登期價錢
        /// </summary>
        /// <param name="id">刊登期ID</param>
        /// <param name="name">刊登期名稱</param>
        /// <param name="days">刊登期天數</param>
        /// <returns></returns>
        public int GetP_InfoPricePrice(int id, string name, int days)
        {
            P_InfoPrice data = null;
            try
            {
                data = _db.P_InfoPrice.Where(x => x.ip_id == id && x.ip_name.Equals(name) && x.ip_days == days).FirstOrDefault();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            int discount = (null != data) ? data.ip_discount : 0;

            return discount;
        }

        /// <summary>
        /// 依類別Id與類別名稱的條件取得該類別相關資料
        /// </summary>
        /// <param name="id">類別Id</param>
        /// <param name="name">類別名稱</param>
        /// <returns>類別相關資料</returns>
        public InfoGroupp isInfoGrouppExist(string id, string name)
        {
            InfoGroupp result = null;
            int infoGrouppId = -1;
            Int32.TryParse(id, out infoGrouppId);

            try
            {
                result = _db.InfoGroupp.Where(x => x.ig_id == infoGrouppId && x.ig_name.Equals(name)).FirstOrDefault();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }
            return result;
        }

        /// <summary>
        /// 依相關條件取得刊登期相關資料
        /// </summary>
        /// <param name="id">刊登期Id</param>
        /// <param name="name">刊登期名稱</param>
        /// <param name="discount">刊登期折數</param>
        /// <param name="days">刊登期天數</param>
        /// <returns>刊登期相關資料</returns>
        public P_InfoPrice isP_InfoPriceExist(string id, string name, string discount, string days)
        {
            P_InfoPrice result = null;

            int pid = -1;
            Int32.TryParse(id, out pid);

            int pdiscount = -1;
            Int32.TryParse(discount, out pdiscount);

            int pdays = -1;
            Int32.TryParse(days, out pdays);

            try
            {
                result = _db.P_InfoPrice.Where(x => x.ip_id == pid && x.ip_name.Equals(name) && x.ip_discount == pdiscount && x.ip_days == pdays).FirstOrDefault();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }
            return result;
        }

        /// <summary>
        /// 依確認明細相關資料儲存新增廣告相關資訊寫入資料庫
        /// </summary>
        /// <param name="model">確認明細相關</param>
        /// <param name="folderPath">圖片儲存在Server的資料夾位置路徑</param>
        /// <param name="imagePath">圖片儲存在Server的位置路徑</param>
        /// <param name="fileUrl">圖片URL</param>
        /// <param name="userId">User Id</param>
        /// <returns>true表儲存成功，false表儲存失敗</returns>
        public bool SetInfos(ReqConfirmCreateDetailedSave model, string folderPath, string imagePath, string fileUrl, string userId)
        {
            try
            {
                DateTime createDateTime = DateTime.Now;
                decimal totalPrice = 0; // 訂單總價格
                int limitCount = 50; // 一次最多存入廣告則數
                if (null != model && null != model.sessionStorageData && 0 < model.sessionStorageData.Count())
                {
                    int currentCount = 0;
                    foreach (Sessionstoragedata item in model.sessionStorageData)
                    {
                        decimal advertisementPrice = 0; // 廣告價格
                        decimal beaconDevicePrice = 0; // 播點價格

                        Infos infos = new Infos();
                        infos.i_name = item.title;
                        infos.i_content = item.contents;
                        infos.i_initial_day = DateTime.Now;
                        infos.i_expired_day = DateTime.Now.AddDays(3);

                        infos.i_location1 = item.countyCity;
                        infos.i_location2 = item.townshipCity;

                        // 圖片
                        if (null != item.fileLisets && 0 < item.fileLisets.Length)
                        {
                            int limitImageCount = 5; // 每一則廣告最多儲存圖片數量
                            int currentImageCount = 0;
                            if (false == Directory.Exists(folderPath))
                            {
                                //新增資料夾
                                Directory.CreateDirectory(folderPath);
                            }

                            // 儲存圖片
                            WebClient wc = new WebClient();
                            int count = 0;
                            foreach (Fileliset fileItem in item.fileLisets)
                            {
                                string imageUrl = "";
                                try
                                {
                                    string fileName = fileItem.path.Substring(fileItem.path.LastIndexOf('/') + 1);
                                    if (System.IO.File.Exists(Path.Combine(folderPath, fileName)))
                                    {
                                        string[] fileNames = fileName.Split('.');
                                        fileNames[0] = fileNames[0] + new RandomGenerated().RandomString(4);
                                        fileName = string.Join(".", fileNames);
                                    }
                                    wc.DownloadFile(fileItem.path, Path.Combine(folderPath, fileName));
                                    imageUrl = fileUrl + imagePath + "/" + fileName;
                                    ++count;
                                }
                                catch (Exception ex1)
                                {
                                    ReadWriteText.WriteText(ex1.ToString());
                                    continue;
                                }

                                switch (count)
                                {
                                    case 1:
                                        infos.i_pic1 = imageUrl;
                                        break;
                                    case 2:
                                        infos.i_pic2 = imageUrl;
                                        break;
                                    case 3:
                                        infos.i_pic3 = imageUrl;
                                        break;
                                    case 4:
                                        infos.i_pic4 = imageUrl;
                                        break;
                                    case 5:
                                        infos.i_pic5 = imageUrl;
                                        break;
                                }

                                ++currentImageCount;
                                if (currentImageCount >= limitImageCount)
                                {
                                    break;
                                }
                            }
                        }

                        infos.i_URL = item.url;

                        InfoGroupp category = isInfoGrouppExist(item.category.id, item.category.text);

                        if (null == category)
                        {
                            return false;
                        }

                        infos.ig_id = category.ig_id;
                        infos.u_id = userId;
                        infos.i_unconfirm = true;

                        P_InfoPrice p_InfoPrice = isP_InfoPriceExist(item.prices.id, item.prices.text, item.prices.discount, item.prices.value);
                        if (null == p_InfoPrice)
                        {
                            return false;
                        }

                        int ipDiscount = 0;
                        Int32.TryParse(item.prices.discount, out ipDiscount);

                        infos.ip_discount = ipDiscount;

                        int ipDay = 0;
                        Int32.TryParse(item.prices.value, out ipDay);
                        infos.ip_days = ipDay;

                        // 試用期
                        infos.i_probation = DateTime.Now.ToString("yyyy/MM/dd") + " - " + DateTime.Now.AddDays(3).ToString("yyyy/MM/dd");

                        // 正式期
                        infos.i_formal_period = DateTime.Now.AddDays(4).ToString("yyyy/MM/dd") + " - " + DateTime.Now.AddDays(ipDay).ToString("yyyy/MM/dd");

                        infos.i_LINE = item.line;

                        //bool iopen = false;
                        //Boolean.TryParse(item.isPublic, out iopen);
                        bool iopen = "y".Equals(item.isPublic.ToLower()) ? true : false;

                        infos.i_open = iopen;

                        infos.or_number = model.orderNumber;

                        infos.i_create_datetime = createDateTime;

                        // 廣告價格
                        advertisementPrice = (category.ig_price * p_InfoPrice.ip_discount / 100);

                        if (null != item.checkBroadcast && 0 < item.checkBroadcast.Count())
                        {
                            foreach (CheckbroadcastByReqConfirmCreateDetailedSave item1 in item.checkBroadcast)
                            {


                                int dbfId = _db.BeaconDeviceFlow.Where(x => x.bdf_name.Equals(item1.bdf_name) && x.bdf_price == item1.bdf_price).Select(x => x.bdf_id).FirstOrDefault();
                                int bptId = _db.BroadcastPointType.Where(x => x.bpt_broadcastPoint.Equals(item1.bpt_broadcastPoint)).Select(x => x.bpt_id).FirstOrDefault();
                                BeaconDevice beaconDevice = _db.BeaconDevice.Where(x => x.bpt_id == bptId && x.bdf_id == dbfId && x.d_name.Equals(item1.d_name) &&
                                                        x.d_location3.Equals(item1.d_location3) && x.d_location4.Equals(item1.d_location4)).FirstOrDefault();

                                if (null == beaconDevice)
                                {
                                    continue;
                                }
                                else
                                {
                                    uv_AllBroadcast uv_AllBroadcastData = _db.uv_AllBroadcast.Where(x => x.d_id == beaconDevice.d_id).FirstOrDefault();
                                    int value = uv_AllBroadcastData.bdf_price.HasValue ? uv_AllBroadcastData.bdf_price.Value : 0;
                                    beaconDevicePrice += value;
                                    infos.BeaconDevice.Add(beaconDevice);
                                }
                            }
                        }

                        // 訂單總價格
                        totalPrice += (advertisementPrice + beaconDevicePrice);
                        _db.Infos.Add(infos);

                        ++currentCount;
                        if (currentCount >= limitCount)
                        {
                            break;
                        }
                    }
                }

                OrderRecord orderRecord = new OrderRecord();

                orderRecord.bill = Decimal.ToInt32(totalPrice); // 帳單總金額

                var user = _db.AspNetUsers.Where(x => x.Id.Equals(userId)).FirstOrDefault();
                if (null == user)
                {
                    return false;
                }
                orderRecord.u_id = userId;

                orderRecord.or_number = model.orderNumber; // 訂單編號
                orderRecord.or_create_datetime = createDateTime; // 訂單新建時間

                if (null != model && null != model.unifiedInvoice)
                {
                    // 是否開立發票
                    if ("y".Equals(model.unifiedInvoice.isPublic.ToLower()))
                    {
                        orderRecord.or_invoice_code = model.unifiedInvoice.number; // 統一編號
                        orderRecord.or_invoice_title = model.unifiedInvoice.title; // 發票抬頭
                        orderRecord.or_invoice_address = model.unifiedInvoice.address; // 發票地址

                        if (false == string.IsNullOrEmpty(model.unifiedInvoice.type))
                        {
                            InvoiceType invoiceType = _db.InvoiceType.Where(x => x.inv_type.Equals(model.unifiedInvoice.type)).FirstOrDefault();
                            if (null != invoiceType)
                            {
                                orderRecord.inv_type = model.unifiedInvoice.type; // 發票類型
                            }
                        }

                        orderRecord.or_invoice_public = true; // 開立發票
                    }
                    else
                    {
                        orderRecord.or_invoice_public = false; // 不開立發票
                    }
                }
                else
                {
                    orderRecord.or_invoice_public = false; // 不開立發票
                }

                _db.OrderRecord.Add(orderRecord);

                _db.SaveChanges();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
                return false;
            }

            return true;
        }

        /// <summary>
        /// 依使用者Id取得未付款的廣告清單
        /// </summary>
        /// <param name="userId">User Id</param>
        /// <returns>未付款的廣告清單</returns>
        public List<uv_PublishedInquire> GetUnpaidByUserId(string userId)
        {
            List<uv_PublishedInquire> result = null;
            try
            {
                result = _db.uv_PublishedInquire.Where(x => x.u_id.Equals(userId)).ToList();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return result;
        }

        /// <summary>
        /// 依使用者Id取得刊登中的廣告清單
        /// </summary>
        /// <param name="userId">User Id</param>
        /// <returns>刊登中的廣告清單</returns>
        public List<uv_PublishedInquire> GetPublishedByUserId(string userId)
        {
            List<uv_PublishedInquire> result = null;
            DateTime currentDateTime = DateTime.Now;
            try
            {
                result = _db.uv_PublishedInquire.Where(x => (x.or_payment_status == false || x.or_payment_status == true) &&
                            x.i_expired_day >= currentDateTime && x.u_id.Equals(userId)).ToList();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return result;
        }

        /// <summary>
        /// 依使用者Id取得已下架的廣告清單
        /// </summary>
        /// <param name="userId">User Id</param>
        /// <returns>已下架的廣告清單</returns>
        public List<uv_PublishedInquire> GetOffTheShelfByUserId(string userId)
        {
            List<uv_PublishedInquire> result = null;
            DateTime currentDateTime = DateTime.Now;
            try
            {
                result = _db.uv_PublishedInquire.Where(x => (x.or_payment_status == false || x.or_payment_status == true) &&
                            x.i_expired_day < currentDateTime && x.u_id.Equals(userId)).ToList();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return result;
        }

        /// <summary>
        /// 依使用者Id取得全部廣告清單
        /// </summary>
        /// <param name="userId">User Id</param>
        /// <returns>全部廣告清單</returns>
        public List<uv_PublishedInquire> GetPublishedAllByUserId(string userId)
        {
            List<uv_PublishedInquire> result = null;
            DateTime currentDateTime = DateTime.Now;
            try
            {
                result = _db.uv_PublishedInquire.Where(x => x.u_id.Equals(userId)).ToList();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }

            return result;
        }

        /// <summary>
        /// 依使用者Id與訂單編號取得訂單資料
        /// </summary>
        /// <param name="userId">User Id</param>
        /// <param name="orderNumber">訂單編號</param>
        /// <returns>訂單資料</returns>
        public OrderRecord GetOrderRecord(string userId, string orderNumber)
        {
            OrderRecord result = null;
            try
            {
                result = _db.OrderRecord.Where(x => x.u_id.Equals(userId) && x.or_number.Equals(orderNumber)).FirstOrDefault();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }
            return result;
        }

        /// <summary>
        /// 依使用者Id與訂單編號取得訂單詳細資料
        /// </summary>
        /// <param name="userId">User Id</param>
        /// <param name="orderNumber">訂單編號</param>
        /// <returns>訂單詳細資料</returns>
        public List<uv_PublishedInquire> GetOrderDetails(string userId, string orderNumber)
        {
            List<uv_PublishedInquire> publishedInquire = null;
            try
            {
                publishedInquire = _db.uv_PublishedInquire.Where(x => x.u_id.Equals(userId) && x.or_number.Equals(orderNumber)).ToList();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }
            return publishedInquire;
        }

        /// <summary>
        /// 依條件取得單筆廣告資料
        /// </summary>
        /// <param name="userId">User Id</param>
        /// <param name="orderNumber">訂單編號</param>
        /// <param name="infosId">廣告Id</param>
        /// <returns>單筆廣告資料</returns>
        public uv_ClassifiedAdsSearch GetInfos(string userId, string orderNumber, int infosId)
        {
            uv_ClassifiedAdsSearch result = null;
            try
            {
                result = _db.uv_ClassifiedAdsSearch.Where(x => x.u_id.Equals(userId) && x.or_number.Equals(orderNumber) && x.i_id == infosId).FirstOrDefault();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }
            return result;
        }

        /// <summary>
        /// 依刊登期天數取得刊登期資料
        /// </summary>
        /// <param name="ip_days">刊登期天數</param>
        /// <returns>刊登期資料</returns>
        public P_InfoPrice GetP_InfoPrice(int ip_days)
        {
            P_InfoPrice result = null;
            try
            {
                result = _db.P_InfoPrice.Where(x => x.ip_days == ip_days).FirstOrDefault();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }
            return result;
        }

        /// <summary>
        /// 依廣告Id取得單筆廣告資料
        /// </summary>
        /// <param name="info_id">廣告Id</param>
        /// <returns>單筆廣告資料</returns>
        public Infos GetInfo(int info_id)
        {
            Infos result = null;
            try
            {
                result = _db.Infos.Where(x => x.i_id == info_id).FirstOrDefault();
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }
            return result;
        }

        /// <summary>
        /// 儲存訂單資料
        /// </summary>
        /// <param name="orderNumber">訂單標號</param>
        /// <param name="amountOfMoney">付款金額</param>
        /// <param name="userName">匯款人姓名</param>
        /// <returns>true表儲存成功，false表儲存失敗</returns>
        public bool SetOrderRecord(string orderNumber, string amountOfMoney, string userName)
        {
            bool result = false;
            try
            {
                OrderRecord orderRecord = _db.OrderRecord.Where(x => x.or_number.Equals(orderNumber)).FirstOrDefault();
                if (null == orderRecord)
                {
                    return false;
                }

                int price = 0;
                Int32.TryParse(amountOfMoney, out price);
                if (orderRecord.bill != price)
                {
                    return false;
                }

                orderRecord.or_payment_status = true; //付款狀態
                orderRecord.or_remitMoney_name = userName; // 匯款人姓名
                orderRecord.or_remitMoney_time = DateTime.Now; // 通知匯款時間
                orderRecord.or_remitMoney = price;

                _db.Entry(orderRecord).State = EntityState.Modified;
                _db.SaveChanges();
                result = true;
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
                return false;
            }

            return result;
        }

        /// <summary>
        /// 依使用者Id向資料庫取得之前儲存過圖片記錄
        /// </summary>
        /// <param name="userId">User Id</param>
        /// <returns>廣告清單</returns>
        public List<Infos> GetImageByUser(string userId)
        {
            List<Infos> result = null;
            try
            {
                result = _db.Infos.Where(x => x.u_id.Equals(userId) &&
                               (x.i_pic1 != null && x.i_pic1 != string.Empty ||
                               x.i_pic2 != null && x.i_pic2 != string.Empty ||
                               x.i_pic3 != null && x.i_pic3 != string.Empty ||
                               x.i_pic4 != null && x.i_pic4 != string.Empty ||
                               x.i_pic5 != null && x.i_pic5 != string.Empty)).ToList();
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
                    _db.Dispose();
                    _db = null;
                }
            }
            _disposed = true;
        }
    }
}