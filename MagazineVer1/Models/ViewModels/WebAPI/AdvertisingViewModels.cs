using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace MagazineVer1.Models.ViewModels.WebAPI
{
    public class ReqCategoryViewModel
    {
        [Required]
        public string countyCity { get; set; }  // 縣市資料
        [Required]
        public string townshipCity { get; set; } // 鄉鎮市區資料
    }

    public class ResCategoryViewModel
    {
        public int id { get; set; }
        public string name { get; set; }
    }

    public class ResAdvertisingCategoryViewModel
    {
        public int ig_id { get; set; }
        public string ig_name { get; set; }
        public string ig_pic { get; set; }
        public int displayOrder { get; set; }
        public int count { get; set; }
    }

    public class ResCreateAdvertising
    {
        public List<Category> categorys { get; set; }
        public List<InfoPrice> infoPrices { get; set; }

        public Dictionary<string, List<string>> countyTownshipCitys { get; set; }
    }

    public class Category
    {
        public int id { get; set; }
        public string name { get; set; }
        public string pic { get; set; }
        public int price { get; set; }
    }

    public partial class InfoPrice
    {
        public int id { get; set; }
        public string name { get; set; }
        public int discount { get; set; }
        public int days { get; set; }
    }

    public class ResCalculateAmountRemittance
    {
        public string orderNumber { get; set; }
        public string price { get; set; }
    }

    public class ReqClassifiedAdsSearch
    {
        public string county { get; set; }  // 使用者所選擇的縣市資料
        public string township { get; set; }    // 使用者所選擇的鄉鎮市區資料
        public int category { get; set; }   // 使用者所選擇的類別資料
        public string keywords { get; set; }    //使用者所輸入的關鍵字資料
        public int page { get; set; }   // 目前顯示頁碼
    }

    public class ResClassifiedAdsSearchByAll
    {
        public List<ClassifiedAdsSearch> classifiedAdsSearchs { get; set; }
        public int totalItemCount { get; set; }
    }

    public class ResClassifiedAdsSearch
    {
        public List<ClassifiedAdsSearch> classifiedAdsSearchs { get; set; }
        public int currentPages { get; set; }
        public int pageCount { get; set; }
        public int totalItemCount { get; set; }
    }

    public class ClassifiedAdsSearch
    {
        public string ig_pic { get; set; }
        public string i_pic1 { get; set; }
        public DateTime i_expired_day { get; set; }
        public string i_location1 { get; set; }
        public string i_location2 { get; set; }
        public int free_id { get; set; }
        public int i_id { get; set; }
        public string i_name { get; set; }
        public string i_content { get; set; }
        public string i_URL { get; set; }
        public string i_LINE { get; set; }
    }

    public class ResCategoryDetailed
    {
        public DateTime i_expired_day { get; set; }
        public string i_name { get; set; }
        public string i_content { get; set; }
        public string i_URL { get; set; }
        public string i_LINE { get; set; }
        public string i_location1 { get; set; }
        public string i_location2 { get; set; }
        public string ig_name { get; set; }
        public string co_name { get; set; }
        public string ac_name { get; set; }
        public string cl_name { get; set; }
        public string i_pic1 { get; set; }
        public string i_pic2 { get; set; }
        public string i_pic3 { get; set; }
        public string i_pic4 { get; set; }
        public string i_pic5 { get; set; }
    }

    public class CalculateAmountRemittance
    {
        public CategoryByCalculateAmountRemittance category { get; set; }
        public Prices prices { get; set; }
        public List<Checkbroadcast> checkBroadcast { get; set; }
    }

    public class CategoryByCalculateAmountRemittance
    {
        public int id { get; set; }
        public string text { get; set; }
        public string value { get; set; }
    }

    public class Prices
    {
        public int id { get; set; }
        public string text { get; set; }
        public int value { get; set; }
        public string discount { get; set; }
    }

    public class Checkbroadcast
    {
        public string bdf_name { get; set; }
        public int bdf_price { get; set; }
        public string bpt_broadcastPoint { get; set; }
        public string d_location3 { get; set; }
        public string d_location4 { get; set; }
        public string d_name { get; set; }
        public int quantity { get; set; }
        public int rowNumber { get; set; }
    }


}