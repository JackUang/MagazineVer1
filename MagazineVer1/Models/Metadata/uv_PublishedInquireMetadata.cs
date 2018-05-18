using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace MagazineVer1.Models
{
    [MetadataType(typeof(uv_PublishedInquireMetadata))]
    public partial class uv_PublishedInquire
    {
        public class uv_PublishedInquireMetadata
        {
            [DisplayName("標題")]
            public string i_name { get; set; }

            [DisplayName("到期日")]
            [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}")]
            public System.DateTime i_expired_day { get; set; }

            [DisplayName("圖片一")]
            public string i_pic1 { get; set; }

            [DisplayName("圖片二")]
            public string i_pic2 { get; set; }

            [DisplayName("圖片三")]
            public string i_pic3 { get; set; }

            [DisplayName("圖片四")]
            public string i_pic4 { get; set; }

            [DisplayName("圖片五")]
            public string i_pic5 { get; set; }

            [DisplayName("URL")]
            public string i_URL { get; set; }

            [DisplayName("類別")]
            public int ig_name { get; set; }

            [DisplayName("LINE")]
            public string i_LINE { get; set; }

            [DisplayName("付款狀態")]
            public bool or_payment_status { get; set; }
            public string or_number { get; set; }

            [DisplayName("發布日期")]
            public Nullable<System.DateTime> i_create_datetime { get; set; }
        }
    }
}