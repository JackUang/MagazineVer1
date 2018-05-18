using MagazineVer1.Models;
using MagazineVer1.Models.ViewModels.WebAPI;
using MagazineVer1.Services.DBServices;
using MagazineVer1.Utility;
using PagedList;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Web.Http.Cors;

namespace MagazineVer1.Controllers.WebAPI
{
    [EnableCors("*", "*", "*")]
    public class AdvertisingController : ApiController
    {
        private AdvertisingServices _advertisingServices = new AdvertisingServices();

        private string[] _image = { "jpg", "png", "jpeg", "gif", "bmp" };
        private string _imagePath = "Uploads/temp/Image";

        /// <summary>
        /// 取得縣市與鄉鎮市區清單
        /// </summary>
        /// <returns>縣市與鄉鎮市區清單</returns>
        [HttpGet]
        public HttpResponseMessage CountyCity()
        {
            Dictionary<string, List<string>> dict = CountyTownshipCityList();
            if (null == dict)
            {
                // 204
                return Request.CreateResponse(HttpStatusCode.NoContent);
            }

            // 200
            return Request.CreateResponse(HttpStatusCode.OK, dict);
        }

        /// <summary>
        /// 依縣市與鄉鎮市區取得類別清單
        /// </summary>
        /// <param name="value">縣市與鄉鎮市區資料</param>
        /// <returns>類別清單</returns>
        [HttpPost]
        public HttpResponseMessage Category([FromBody]ReqCategoryViewModel value)
        {
            if (false == ModelState.IsValid)
            {
                // 404
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            // 依縣市與鄉鎮市區取得類別清單
            List<InfoGroupp> categoryList = _advertisingServices.GetCategory(value.countyCity, value.townshipCity);

            List<ResCategoryViewModel> modes = null;
            if (null != categoryList && 0 < categoryList.Count)
            {
                modes = new List<ResCategoryViewModel>();
                foreach (var item in categoryList)
                {
                    ResCategoryViewModel mode = new ResCategoryViewModel();
                    mode.id = item.ig_id;
                    mode.name = item.ig_name;

                    modes.Add(mode);
                }
            }
            else
            {
                // 204
                return Request.CreateResponse(HttpStatusCode.NoContent);
            }

            // 200
            return Request.CreateResponse(HttpStatusCode.OK, modes);
        }

        /// <summary>
        /// 取得所有類別、ICON清單與類別統計清單
        /// </summary>
        /// <returns>所有類別、ICON清單與類別統計清單</returns>
        [HttpGet]
        public HttpResponseMessage AdvertisingCategory()
        {
            // 取得所有類別與ICON清單
            List<InfoGroupp> categoryList = _advertisingServices.GetCategory();

            if (null == categoryList)
            {
                // 204
                return Request.CreateResponse(HttpStatusCode.NoContent);
            }

            // 取得分類廣告統計
            List<uv_AdvertisingCategoryCount> advertisingCategoryCountList = _advertisingServices.GetAdvertisingCategoryCount();

            List<ResAdvertisingCategoryViewModel> models = new List<ResAdvertisingCategoryViewModel>();
            foreach (InfoGroupp item in categoryList)
            {
                uv_AdvertisingCategoryCount item1 = advertisingCategoryCountList.Where(x => x.ig_id == item.ig_id).FirstOrDefault();

                ResAdvertisingCategoryViewModel advertisingCategory = new ResAdvertisingCategoryViewModel();
                advertisingCategory.count = item1 != null ? (item1.count.HasValue ? item1.count.Value : 0) : 0;
                advertisingCategory.displayOrder = item.DisplayOrder;
                advertisingCategory.ig_id = item.ig_id;
                advertisingCategory.ig_name = item.ig_name;
                advertisingCategory.ig_pic = item.ig_pic;

                models.Add(advertisingCategory);
            }

            // 200
            return Request.CreateResponse(HttpStatusCode.OK, models);
        }

        /// <summary>
        /// 依條件搜尋在地分類廣告
        /// </summary>
        /// <param name="value">
        /// 相關條件資料：
        /// county：縣市資料
        /// township：鄉鎮市區資料
        /// category：類別資料
        /// keywords：關鍵字資料
        /// page：頁碼
        /// </param>
        /// <returns></returns>
        [HttpPost]
        public HttpResponseMessage ClassifiedAdsSearch([FromBody]ReqClassifiedAdsSearch value)
        {
            if (false == ModelState.IsValid)
            {
                // 404
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            IPagedList<uv_ClassifiedAdsSearch> model = null;
            model = new Services.AdvertisingServices().ClassifiedAdsSearch(_advertisingServices, value.county, value.township, value.category, value.keywords, value.page);
            int page = (value.page == 0) ? 1 : value.page;

            if (null == model || 0 >= model.Count)
            {
                // 204
                return Request.CreateResponse(HttpStatusCode.NoContent);
            }

            ResClassifiedAdsSearch responseModel = new ResClassifiedAdsSearch();
            List<ClassifiedAdsSearch> ClassifiedAdsSearchs = new List<ClassifiedAdsSearch>();
            foreach (var item in model)
            {
                ClassifiedAdsSearch cas = new ClassifiedAdsSearch();

                cas.ig_pic = item.ig_pic;
                cas.i_pic1 = item.i_pic1;
                cas.i_expired_day = item.i_expired_day;
                cas.i_location1 = item.i_location1;
                cas.i_location2 = item.i_location2;
                cas.free_id = item.free_id.HasValue ? item.free_id.Value : 0;
                cas.i_id = item.i_id;
                cas.i_name = item.i_name;
                cas.i_content = item.i_content;
                cas.i_URL = item.i_URL;
                cas.i_LINE = item.i_LINE;

                ClassifiedAdsSearchs.Add(cas);
            }
            responseModel.classifiedAdsSearchs = ClassifiedAdsSearchs;
            responseModel.currentPages = page;
            responseModel.pageCount = model.PageCount;
            responseModel.totalItemCount = model.TotalItemCount;

            // 200
            return Request.CreateResponse(HttpStatusCode.OK, responseModel);
        }

        /// <summary>
        /// 依條件搜尋在地分類廣告
        /// </summary>
        /// <param name="value">
        /// 相關條件資料：
        /// county：縣市資料
        /// township：鄉鎮市區資料
        /// category：類別資料
        /// keywords：關鍵字資料
        /// </param>
        /// <returns></returns>
        [HttpPost]
        public HttpResponseMessage ClassifiedAdsSearchByAll([FromBody]ReqClassifiedAdsSearch value)
        {
            if (false == ModelState.IsValid)
            {
                // 404
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            List<uv_ClassifiedAdsSearch> model = null;
            model = new Services.AdvertisingServices().ClassifiedAdsSearch(_advertisingServices, value.county, value.township, value.category, value.keywords);
            int page = (value.page == 0) ? 1 : value.page;

            if (null == model || 0 >= model.Count)
            {
                // 204
                return Request.CreateResponse(HttpStatusCode.NoContent);
            }

            ResClassifiedAdsSearchByAll responseModel = new ResClassifiedAdsSearchByAll();
            List<ClassifiedAdsSearch> ClassifiedAdsSearchs = new List<ClassifiedAdsSearch>();
            foreach (var item in model)
            {
                ClassifiedAdsSearch cas = new ClassifiedAdsSearch();

                cas.ig_pic = item.ig_pic;
                cas.i_pic1 = item.i_pic1;
                cas.i_expired_day = item.i_expired_day;
                cas.i_location1 = item.i_location1;
                cas.i_location2 = item.i_location2;
                cas.free_id = item.free_id.HasValue ? item.free_id.Value : 0;
                cas.i_id = item.i_id;
                cas.i_name = item.i_name;
                cas.i_content = item.i_content;
                cas.i_URL = item.i_URL;
                cas.i_LINE = item.i_LINE;

                ClassifiedAdsSearchs.Add(cas);
            }
            responseModel.classifiedAdsSearchs = ClassifiedAdsSearchs;
            responseModel.totalItemCount = model.Count;

            // 200
            return Request.CreateResponse(HttpStatusCode.OK, responseModel);
        }

        /// <summary>
        /// 依類別搜尋在地分類廣告
        /// </summary>
        /// <param name="id">類別Id</param>
        /// <param name="page">頁碼</param>
        /// <returns></returns>
        [HttpGet]
        public HttpResponseMessage Category(int id, int page = 1)
        {
            IPagedList<uv_ClassifiedAdsSearch> model = null;

            int classifiedId = id;

            // 依類別搜尋在地分類廣告
            model = _advertisingServices.ClassifiedSearch(classifiedId, page);

            // 取得類別名稱
            string strCategory = _advertisingServices.GetCategoryByName(classifiedId);

            if (null == model && string.IsNullOrEmpty(strCategory))
            {
                // 404
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            if (null == model || 0 >= model.Count)
            {
                // 204
                return Request.CreateResponse(HttpStatusCode.NoContent);
            }

            ResClassifiedAdsSearch responseModel = new ResClassifiedAdsSearch();
            List<ClassifiedAdsSearch> ClassifiedAdsSearchs = new List<ClassifiedAdsSearch>();
            foreach (var item in model)
            {
                ClassifiedAdsSearch cas = new ClassifiedAdsSearch();

                cas.ig_pic = item.ig_pic;
                cas.i_pic1 = item.i_pic1;
                cas.i_expired_day = item.i_expired_day;
                cas.i_location1 = item.i_location1;
                cas.i_location2 = item.i_location2;
                cas.free_id = item.free_id.HasValue ? item.free_id.Value : 0;
                cas.i_id = item.i_id;
                cas.i_name = item.i_name;
                cas.i_content = item.i_content;
                cas.i_URL = item.i_URL;
                cas.i_LINE = item.i_LINE;

                ClassifiedAdsSearchs.Add(cas);
            }
            responseModel.classifiedAdsSearchs = ClassifiedAdsSearchs;
            responseModel.currentPages = page;
            responseModel.pageCount = model.PageCount;
            responseModel.totalItemCount = model.TotalItemCount;

            // 200
            return Request.CreateResponse(HttpStatusCode.OK, responseModel);
        }

        /// <summary>
        /// 依類別搜尋在地分類廣告
        /// </summary>
        /// <param name="id">類別Id</param>
        /// <param name="page">頁碼</param>
        /// <returns></returns>
        [HttpGet]
        public HttpResponseMessage CategoryByAll(int id)
        {
            List<uv_ClassifiedAdsSearch> model = null;

            int classifiedId = id;

            // 依類別搜尋在地分類廣告
            model = _advertisingServices.ClassifiedSearch(classifiedId);

            // 取得類別名稱
            string strCategory = _advertisingServices.GetCategoryByName(classifiedId);

            if (null == model && string.IsNullOrEmpty(strCategory))
            {
                // 404
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            if (null == model || 0 >= model.Count)
            {
                // 204
                return Request.CreateResponse(HttpStatusCode.NoContent);
            }

            ResClassifiedAdsSearchByAll responseModel = new ResClassifiedAdsSearchByAll();
            List<ClassifiedAdsSearch> ClassifiedAdsSearchs = new List<ClassifiedAdsSearch>();
            foreach (var item in model)
            {
                ClassifiedAdsSearch cas = new ClassifiedAdsSearch();

                cas.ig_pic = item.ig_pic;
                cas.i_pic1 = item.i_pic1;
                cas.i_expired_day = item.i_expired_day;
                cas.i_location1 = item.i_location1;
                cas.i_location2 = item.i_location2;
                cas.free_id = item.free_id.HasValue ? item.free_id.Value : 0;
                cas.i_id = item.i_id;
                cas.i_name = item.i_name;
                cas.i_content = item.i_content;
                cas.i_URL = item.i_URL;
                cas.i_LINE = item.i_LINE;

                ClassifiedAdsSearchs.Add(cas);
            }
            responseModel.classifiedAdsSearchs = ClassifiedAdsSearchs;
            responseModel.totalItemCount = model.Count;

            // 200
            return Request.CreateResponse(HttpStatusCode.OK, responseModel);
        }

        /// <summary>
        /// 分類廣告Id搜尋詳細結果
        /// </summary>
        /// <param name="id">分類廣告Id</param>
        /// <returns>分類廣告搜尋詳細資料</returns>
        [HttpGet]
        public HttpResponseMessage CategoryDetailed(int id)
        {
            if (0 > id)
            {
                // 204
                return Request.CreateResponse(HttpStatusCode.NoContent);
            }

            // 依 分類廣告Id 取得分類廣告詳細資料
            uv_ClassifiedAdsSearch model = _advertisingServices.CategoryDetailed(id);

            if (null == model)
            {
                // 204
                return Request.CreateResponse(HttpStatusCode.NoContent);
            }

            ResCategoryDetailed cd = new ResCategoryDetailed();
            cd.i_expired_day = model.i_expired_day;
            cd.i_name = model.i_name;
            cd.i_content = model.i_content;
            cd.i_URL = model.i_URL;
            cd.i_LINE = model.i_LINE;
            cd.i_location1 = model.i_location1;
            cd.i_location2 = model.i_location2;
            cd.ig_name = model.ig_name;
            cd.co_name = model.co_name;
            cd.ac_name = model.ac_name;
            cd.cl_name = model.cl_name;
            cd.i_pic1 = model.i_pic1;
            cd.i_pic2 = model.i_pic2;
            cd.i_pic3 = model.i_pic3;
            cd.i_pic4 = model.i_pic4;
            cd.i_pic5 = model.i_pic5;

            // 200
            return Request.CreateResponse(HttpStatusCode.OK, cd);
        }

        /// <summary>
        /// 取得新增廣告刊登初始資料
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public HttpResponseMessage CreateAdvertisingInitData()
        {
            // 取得所有類別與ICON清單
            List<InfoGroupp> categoryList = _advertisingServices.GetCategory();

            //將廣告分類的項目，社區(1)、社團(35)、社群(34)，從已完成 我要刊登 的流程抽離出來
            categoryList = categoryList.Where(o => o.ig_id != 1 && o.ig_id != 34 && o.ig_id != 35).ToList();

            List<Category> categorys = null;
            if (null != categoryList && 0 < categoryList.Count)
            {
                categorys = new List<Category>();
                foreach (var item in categoryList)
                {
                    Category category = new Category();
                    category.id = item.ig_id;
                    category.name = item.ig_name;
                    category.pic = item.ig_pic;
                    category.price = item.ig_price;

                    categorys.Add(category);
                }
            }

            // 取得刊登期(打折後、天數、折數)資料清單
            List<P_InfoPrice> infoPriceList = _advertisingServices.GetInfoPrice();

            List<InfoPrice> infoPrices = null;
            if (null != infoPriceList && 0 < infoPriceList.Count)
            {
                infoPrices = new List<InfoPrice>();
                foreach (var item in infoPriceList)
                {
                    InfoPrice infoPrice = new InfoPrice();
                    infoPrice.id = item.ip_id;
                    infoPrice.name = item.ip_name;
                    infoPrice.discount = item.ip_discount;
                    infoPrice.days = item.ip_days;

                    infoPrices.Add(infoPrice);
                }
            }

            // 取得縣市與鄉鎮市區資料
            Dictionary<string, List<string>> dictCountyTownshipCity = CountyTownshipCityList();

            ResCreateAdvertising modes = new ResCreateAdvertising();
            modes.categorys = categorys;
            modes.infoPrices = infoPrices;
            modes.countyTownshipCitys = dictCountyTownshipCity;

            // 200
            return Request.CreateResponse(HttpStatusCode.OK, modes);
        }

        /// <summary>
        /// 檔案上傳暫存
        /// </summary>
        /// <returns>檔案上傳暫存網址清單</returns>
        [HttpPost]
        public async Task<HttpResponseMessage> UploadImage()
        {
            Dictionary<string, string> imageFile = null;

            string folderPath = HttpContext.Current.Server.MapPath("~/" + _imagePath);

            await new DirectoryFileIO().DeleteFileAsync(folderPath);

            if (HttpContext.Current.Request.Files.AllKeys.Any())
            {
                imageFile = new Dictionary<string, string>();
                int fileCount = HttpContext.Current.Request.Files.Count;
                RandomGenerated rg = new RandomGenerated();

                for (int i = 0; i < fileCount; i++)
                {
                    // Get the uploaded image from the Files collection
                    var httpPostedFile = HttpContext.Current.Request.Files["file" + i];

                    if (httpPostedFile != null)
                    {
                        // 取得檔案副檔名
                        string fileType = httpPostedFile.FileName.Split('.')[1] ?? "";

                        // 上傳圖片的副檔名不符合略過
                        bool exists = ((System.Collections.IList)_image).Contains(fileType);
                        if (false == exists)
                        {
                            continue;
                        }

                        // 檔案名稱
                        string fileName = DateTime.Now.ToString("yyyyMMddHHmmssffff") + rg.RandomString(6) + "." + fileType;
                        if (0 < imageFile.Count)
                        {
                            while (imageFile.ContainsKey(fileName))
                            {
                                fileName = rg.RandomString(6) + "." + fileType;
                            }
                        }

                        if (false == Directory.Exists(folderPath))
                        {
                            //新增資料夾
                            Directory.CreateDirectory(folderPath);
                            new DirectoryFileIO().SetFileRole(folderPath);
                        }

                        // Validate the uploaded image(optional)
                        // Get the complete file path
                        var fileSavePath = Path.Combine(folderPath, fileName);

                        try
                        {
                            // Save the uploaded file to"UploadedFiles" folder
                            httpPostedFile.SaveAs(fileSavePath);
                        }
                        catch (Exception ex)
                        {
                            ReadWriteText.WriteText(ex.ToString());
                        }

                        // 檔案網址
                        string fileUrl = Request.RequestUri.Scheme + "://" + Request.RequestUri.Authority + "/" + _imagePath + "/" + fileName;

                        imageFile.Add(fileName, fileUrl);
                    }
                }
            }
            else
            {
                // HttpStatus 204
                return Request.CreateResponse(HttpStatusCode.NoContent, imageFile);
            }
            // HttpStatus 200
            return Request.CreateResponse(HttpStatusCode.OK, imageFile);
        }

        /// <summary>
        /// 刪除圖片暫存檔
        /// </summary>
        /// <param name="fileName">檔案名稱（含副檔名）</param>
        /// <returns></returns>
        [HttpDelete]
        public HttpResponseMessage UploadImage([FromUri]string fileName)
        {
            if (string.IsNullOrEmpty(fileName))
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            string folderPath = HttpContext.Current.Server.MapPath("~/" + _imagePath);

            // 判斷資料夾是否存在
            if (false == Directory.Exists(folderPath))
            {
                // HttpStatus 404
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            var filePath = Path.Combine(folderPath, fileName);

            // 判斷檔案是否存在
            if (false == File.Exists(filePath))
            {
                // HttpStatus 404
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            try
            {
                File.Delete(filePath);
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }
            // HttpStatus 200
            return Request.CreateResponse(HttpStatusCode.OK);
        }

        /// <summary>
        /// 組成縣市與鄉鎮市區JSON資料
        /// </summary>
        /// <returns></returns>
        private Dictionary<string, List<string>> CountyTownshipCityList()
        {
            Dictionary<string, List<string>> dict = null;

            // 取得縣市清單
            IEnumerable<string> countyCityList = _advertisingServices.GetCountyCityList();

            if (null == countyCityList)
            {
                return dict;
            }

            dict = new Dictionary<string, List<string>>();
            foreach (string item in countyCityList)
            {
                // 取得鄉鎮市區清單
                List<string> townshipCityList = _advertisingServices.GetTownshipCityList(item);
                dict.Add(item, townshipCityList);
            }

            return dict;
        }

        /// <summary>
        /// 計算轉帳總金額
        /// </summary>
        /// <param name="value">
        /// 新增廣告的相關參數(類別、刊登期、播點清單)
        /// </param>
        /// <returns></returns>
        [HttpPost]
        public HttpResponseMessage CalculateAmountRemittance([FromBody]List<CalculateAmountRemittance> value)
        {
            // 產生訂單編號
            DateTime myDate = DateTime.Now;
            TimeSpan mySpan = new TimeSpan(myDate.Day, myDate.Hour, myDate.Minute, myDate.Second, myDate.Millisecond);
            double seconds = mySpan.TotalSeconds;
            double orderNumber = Convert.ToDouble(seconds.ToString("0.000")) * 1000;

            ResCalculateAmountRemittance viewModel = new ResCalculateAmountRemittance(); ;

            if (null == value || 0 >= value.Count)
            {
                viewModel.orderNumber = orderNumber.ToString();
                viewModel.price = "0";

                return Request.CreateResponse(HttpStatusCode.OK, 0);
            }

            decimal total = 0;
            foreach (CalculateAmountRemittance item in value)
            {
                int categoryPrice = 0;
                int categoryP_InfoPricePrice = 0;
                int checkbroadcastPrice = 0;


                if (null != item.category)
                {
                    int id = item.category.id;
                    // 查詢刊登廣告類別價錢
                    categoryPrice = _advertisingServices.GetCategoryPrice(id, item.category.text);
                }

                if (null != item.prices)
                {
                    // 查詢刊登廣告刊登期價錢
                    categoryP_InfoPricePrice = _advertisingServices.GetP_InfoPricePrice(item.prices.id, item.prices.text, item.prices.value);
                }

                if (null != item.checkBroadcast && 0 < item.checkBroadcast.Count)
                {
                    var model = new BroadcastServices().GetBeaconDeviceStatistics();
                    //var model = new BroadcastServices().GetPushAdvertisingStatistics(true, "", "", "", "");
                    if (null != model && 0 < model.Count)
                    {
                        foreach (Checkbroadcast item1 in item.checkBroadcast)
                        {
                            int? broadcastPointPrice = model.Where(x => x.bpt_broadcastPoint.Equals(item1.bpt_broadcastPoint) && x.bdf_name.Equals(item1.bdf_name) &&
                                x.d_location3.Equals(item1.d_location3) && x.d_location4.Equals(item1.d_location4)).Select(x => x.bdf_price).FirstOrDefault();

                            int price = (broadcastPointPrice.HasValue) ? broadcastPointPrice.Value : 0;
                            checkbroadcastPrice += price;
                        }
                    }
                }

                total += (categoryPrice * categoryP_InfoPricePrice / 100);
                total += checkbroadcastPrice;
            }


            viewModel.orderNumber = orderNumber.ToString();
            viewModel.price = total.ToString();

            return Request.CreateResponse(HttpStatusCode.OK, viewModel);
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
            }
            base.Dispose(disposing);
        }
    }
}
