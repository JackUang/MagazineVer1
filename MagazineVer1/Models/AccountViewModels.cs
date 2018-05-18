using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace MagazineVer1.Models
{
    public class ExternalLoginConfirmationViewModel
    {
        [Required]
        [Display(Name = "電子郵件")]
        public string Email { get; set; }
    }

    public class ExternalLoginListViewModel
    {
        public string ReturnUrl { get; set; }
    }

    public class SendCodeViewModel
    {
        public string SelectedProvider { get; set; }
        public ICollection<System.Web.Mvc.SelectListItem> Providers { get; set; }
        public string ReturnUrl { get; set; }
        public bool RememberMe { get; set; }
    }

    public class VerifyCodeViewModel
    {
        [Required]
        public string Provider { get; set; }

        [Required]
        [Display(Name = "代碼")]
        public string Code { get; set; }
        public string ReturnUrl { get; set; }

        [Display(Name = "記住此瀏覽器?")]
        public bool RememberBrowser { get; set; }

        public bool RememberMe { get; set; }
    }

    public class ForgotViewModel
    {
        [Required]
        [Display(Name = "電子郵件")]
        public string Email { get; set; }
    }

    public class LoginViewModel
    {
        [Required]
        [Display(Name = "電子郵件")]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "手機或密碼")]
        public string Password { get; set; }

        [Display(Name = "記住我?")]
        public bool RememberMe { get; set; }
    }

    public class RegisterViewModel
    {
        [Required]
        [EmailAddress]
        [Display(Name = "電子郵件")]
        public string Email { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "{0} 的長度至少必須為 {2} 個字元。", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "密碼")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "確認密碼")]
        [Compare("Password", ErrorMessage = "密碼和確認密碼不相符。")]
        public string ConfirmPassword { get; set; }
    }

    public class ResetPasswordViewModel
    {
        [Required]
        [EmailAddress]
        [Display(Name = "電子郵件")]
        public string Email { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "{0} 的長度至少必須為 {2} 個字元。", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "密碼")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "確認密碼")]
        [Compare("Password", ErrorMessage = "密碼和確認密碼不相符。")]
        public string ConfirmPassword { get; set; }

        public string Code { get; set; }
    }

    public class ForgotPasswordViewModel
    {
        [Required]
        [EmailAddress]
        [Display(Name = "電子郵件")]
        public string Email { get; set; }
    }

    public class ResConfirmCreateDetailedAccountVerify
    {
        public bool exist { get; set; }
        public bool isError { get; set; }
        public string errorMsg { get; set; }
    }


    public class ReqConfirmCreateDetailedSave
    {
        [Required]
        public string userName { get; set; } // 姓名
        [Required]
        public string email { get; set; } // 電子信箱
        [Required]
        public string phone { get; set; }   // 手機號碼
        public bool accountExist { get; set; }  // 帳號是否存在
        public string orderNumber { get; set; } // 訂單編號
        public Unifiedinvoice unifiedInvoice { get; set; } // 統一發票
        public Sessionstoragedata[] sessionStorageData { get; set; }
    }

    public class Unifiedinvoice
    {
        public string isPublic { get; set; } // 是否開立發票
        public string type { get; set; } // 發票種類
        public string title { get; set; } // 發票抬頭
        public string number { get; set; } // 發票號碼
        public string address { get; set; } // 發票地址
    }

    public class Sessionstoragedata
    {
        public string cid { get; set; } // 新增資料Id
        public CategoryByReqConfirmCreateDetailedSave category { get; set; } // 類別
        public Prices prices { get; set; } // 價錢
        public string isPublic { get; set; } // 是否公開
        public string countyCity { get; set; } // 縣市
        public string townshipCity { get; set; } // 鄉鎮市區
        public string title { get; set; } // 標題
        public string contents { get; set; } // 內容
        public Fileliset[] fileLisets { get; set; } // 上傳圖片位址
        public string url { get; set; } // URL
        public string line { get; set; } // LINE URL
        public CheckbroadcastByReqConfirmCreateDetailedSave[] checkBroadcast { get; set; } // 播點資料
    }

    public class CategoryByReqConfirmCreateDetailedSave
    {
        public string id { get; set; }
        public string text { get; set; }
        public string value { get; set; }
    }

    public class Prices
    {
        public string id { get; set; }
        public string text { get; set; }
        public string value { get; set; }
        public string discount { get; set; }
    }

    public class Fileliset
    {
        public string id { get; set; }
        public string fileName { get; set; }
        public string path { get; set; }
    }

    public class CheckbroadcastByReqConfirmCreateDetailedSave
    {
        public int rowNumber { get; set; }
        public int quantity { get; set; }
        public string bpt_broadcastPoint { get; set; }
        public string bdf_name { get; set; }
        public string d_name { get; set; }
        public string d_location3 { get; set; }
        public string d_location4 { get; set; }
        public int bdf_price { get; set; }
    }

    public class ResConfirmCreateDetailedSave
    {
        public bool saveResult { get; set; }
    }

}
