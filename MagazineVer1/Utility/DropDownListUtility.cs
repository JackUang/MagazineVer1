using MagazineVer1.Models;
using System.Collections.Generic;
using System.Web.Mvc;

namespace MagazineVer1.Utility
{
    public class DropDownListUtility
    {
        /// <summary>
        /// 取得縣市清單的下拉選單
        /// </summary>
        /// <param name="countyCityList">縣市清單</param>
        /// <returns>下拉選單的縣市清單</returns>
        public List<SelectListItem> GetCountyCityListDDL(IEnumerable<string> countyCityList)
        {
            // 縣市下拉選單
            List<SelectListItem> ddlCountyCitylist = new List<SelectListItem>();

            ddlCountyCitylist.Add(new SelectListItem { Text = "請選擇縣市", Value = "" });
            if (null != countyCityList)
            {
                foreach (string item in countyCityList)
                {
                    ddlCountyCitylist.Add(new SelectListItem { Text = item, Value = item });
                }
            }

            return ddlCountyCitylist;
        }

        /// <summary>
        /// 取得鄉鎮市區清單的下拉選單
        /// </summary>
        /// <param name="townshipCityList">鄉鎮市區清單</param>
        /// <returns>下拉選單的鄉鎮市區清單</returns>
        public List<SelectListItem> GetTownshipCityListDDL(IEnumerable<string> townshipCityList)
        {
            // 鄉鎮市區清單下拉選單
            List<SelectListItem> ddlTownshipCityList = new List<SelectListItem>();
            if (null != townshipCityList)
            {
                foreach (string item in townshipCityList)
                {
                    ddlTownshipCityList.Add(new SelectListItem { Text = item, Value = item });
                }
            }

            return ddlTownshipCityList;
        }

        /// <summary>
        /// 取得類別清單的下拉選單
        /// </summary>
        /// <param name="categoryList">類別清單</param>
        /// <returns>下拉選單的類別清單</returns>
        public List<SelectListItem> GetCategoryListDDL(IEnumerable<InfoGroupp> categoryList)
        {
            // 類別清單下拉選單
            List<SelectListItem> ddlCategoryList = new List<SelectListItem>();
            if (null != categoryList)
            {
                foreach (InfoGroupp item in categoryList)
                {
                    ddlCategoryList.Add(new SelectListItem { Text = item.ig_name, Value = item.ig_id.ToString() });
                }
            }

            return ddlCategoryList;
        }

        /// <summary>
        /// 取得播點種類清單下拉選單
        /// </summary>
        /// <param name="broadcastPointTypeList">播點種類清單</param>
        public List<SelectListItem> GetBroadcastTypeDDL(List<BroadcastPointType> broadcastPointTypeList)
        {
            List<SelectListItem> ddlCountyCitylist = new List<SelectListItem>();

            ddlCountyCitylist.Add(new SelectListItem { Text = "所有播點", Value = "all" });
            if (null != broadcastPointTypeList)
            {
                foreach (BroadcastPointType item in broadcastPointTypeList)
                {
                    ddlCountyCitylist.Add(new SelectListItem { Text = item.bpt_broadcastPoint, Value = item.bpt_broadcastPoint });
                }
            }

            return ddlCountyCitylist;
        }
    }
}