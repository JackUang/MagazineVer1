using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace MagazineVer1.Models
{
    [MetadataType(typeof(uv_ConditionalSearchPushAdvertisinMetadata))]
    public partial class uv_ConditionalSearchPushAdvertisin
    {
        public class uv_ConditionalSearchPushAdvertisinMetadata
        {
            [DisplayName("類別圖示")]
            public string ig_pic { get; set; }

            [DisplayName("廣告圖片")]
            public string i_pic1 { get; set; }

            [DisplayName("到期日")]
            public Nullable<System.DateTime> i_expired_day { get; set; }

            [DisplayName("播點種類")]
            public string bpt_broadcastPoint { get; set; }

            [DisplayName("等級")]
            public string bdf_name { get; set; }

            [DisplayName("地區")]
            public string d_location1 { get; set; }

            [DisplayName("地區")]
            public string d_location2 { get; set; }

            [DisplayName("類別")]
            public string ig_name { get; set; }

            [DisplayName("公益組織名稱")]
            public Nullable<int> free_id { get; set; }

            [DisplayName("廣告標題")]
            public string i_name { get; set; }

            [DisplayName("廣告內容")]
            public string i_content { get; set; }

            [DisplayName("地球圖示")]
            public string i_URL { get; set; }

            [DisplayName("LINE圖示")]
            public string i_LINE { get; set; }
        }
    }
}