using MagazineVer1.Models;
using PagedList;
using System.Collections.Generic;

namespace MagazineVer1.Services
{
    public class AdvertisingServices
    {
        /// <summary>
        /// 依條件搜尋在地分類廣告清單資料
        /// </summary>
        /// <param name="_advertisingServices">DBServices.AdvertisingServices物件實體</param>
        /// <param name="county">縣市資料</param>
        /// <param name="township">鄉鎮市區資料</param>
        /// <param name="category">類別資料</param>
        /// <param name="keywords">關鍵字資料</param>
        /// <param name="page">頁碼</param>
        /// <returns>在地分類廣告清單資料</returns>

        public IPagedList<uv_ClassifiedAdsSearch> ClassifiedAdsSearch(DBServices.AdvertisingServices _advertisingServices, string county, string township, int category, string keywords, int page = 1)
        {
            IPagedList<uv_ClassifiedAdsSearch> model = null;

            int intCategory = category;

            if (string.IsNullOrEmpty(county) && string.IsNullOrEmpty(township) && -1 == intCategory && !string.IsNullOrEmpty(keywords))
            {
                // 依 關鍵字 查詢
                model = _advertisingServices.ClassifiedAdsSearch(keywords, page);

            }
            else if (!string.IsNullOrEmpty(county) && !string.IsNullOrEmpty(township) && -1 < intCategory && !string.IsNullOrEmpty(keywords))
            {
                // 依 縣市, 鄉鎮市區, 類別, 關鍵字 查詢
                model = _advertisingServices.ClassifiedAdsSearch(county, township, intCategory, keywords, page);
            }
            else if (!string.IsNullOrEmpty(county) && !string.IsNullOrEmpty(township) && -1 < intCategory)
            {
                // 依 縣市, 鄉鎮市區, 類別 查詢
                model = _advertisingServices.ClassifiedAdsSearch(county, township, intCategory, page);
            }
            else if (!string.IsNullOrEmpty(county) && !string.IsNullOrEmpty(township) && -1 == intCategory && !string.IsNullOrEmpty(keywords))
            {
                // 依 縣市, 鄉鎮市區, 關鍵字 查詢
                model = _advertisingServices.ClassifiedAdsSearch(county, township, keywords, page);
            }
            else if (!string.IsNullOrEmpty(county) && !string.IsNullOrEmpty(township) && -1 == intCategory)
            {
                // 依 縣市, 鄉鎮市區 查詢
                model = _advertisingServices.ClassifiedAdsSearch(county, township, page);
            }
            else
            {
                // 查無資料
            }

            return model;
        }

        /// <summary>
        /// 依條件搜尋在地分類廣告清單資料
        /// </summary>
        /// <param name="_advertisingServices">DBServices.AdvertisingServices物件實體</param>
        /// <param name="county">縣市資料</param>
        /// <param name="township">鄉鎮市區資料</param>
        /// <param name="category">類別資料</param>
        /// <param name="keywords">關鍵字資料</param>
        /// <returns>在地分類廣告清單資料</returns>

        public List<uv_ClassifiedAdsSearch> ClassifiedAdsSearch(DBServices.AdvertisingServices _advertisingServices, string county, string township, int category, string keywords)
        {
            List<uv_ClassifiedAdsSearch> model = null;

            int intCategory = category;

            if (string.IsNullOrEmpty(county) && string.IsNullOrEmpty(township) && -1 == intCategory && !string.IsNullOrEmpty(keywords))
            {
                // 依 關鍵字 查詢
                model = _advertisingServices.ClassifiedAdsSearch(keywords);

            }
            else if (!string.IsNullOrEmpty(county) && !string.IsNullOrEmpty(township) && -1 < intCategory && !string.IsNullOrEmpty(keywords))
            {
                // 依 縣市, 鄉鎮市區, 類別, 關鍵字 查詢
                model = _advertisingServices.ClassifiedAdsSearch(county, township, intCategory, keywords);
            }
            else if (!string.IsNullOrEmpty(county) && !string.IsNullOrEmpty(township) && -1 < intCategory)
            {
                // 依 縣市, 鄉鎮市區, 類別 查詢
                model = _advertisingServices.ClassifiedAdsSearchByCategory(county, township, intCategory);
            }
            else if (!string.IsNullOrEmpty(county) && !string.IsNullOrEmpty(township) && -1 == intCategory && !string.IsNullOrEmpty(keywords))
            {
                // 依 縣市, 鄉鎮市區, 關鍵字 查詢
                model = _advertisingServices.ClassifiedAdsSearchByKeyword(county, township, keywords);
            }
            else if (!string.IsNullOrEmpty(county) && !string.IsNullOrEmpty(township) && -1 == intCategory)
            {
                // 依 縣市, 鄉鎮市區 查詢
                model = _advertisingServices.ClassifiedAdsSearch(county, township);
            }
            else
            {
                // 查無資料
            }

            return model;
        }
    }
}