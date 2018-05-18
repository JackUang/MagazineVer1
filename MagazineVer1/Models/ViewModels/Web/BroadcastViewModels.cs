using System;
using System.ComponentModel;

namespace MagazineVer1.Models.ViewModels.Web
{
    public class BroadcastViewModels
    {
        public long rowNumber { get; set; }
        public int quantity { get; set; }

        [DisplayName("播點種類")]
        public string bpt_broadcastPoint { get; set; }

        [DisplayName("等級")]
        public string bdf_name { get; set; }

        [DisplayName("播點名稱")]
        public string d_name { get; set; }

        [DisplayName("街道路")]
        public string d_location3 { get; set; }

        [DisplayName("巷弄段號")]
        public string d_location4 { get; set; }

        [DisplayName("元/年")]
        public Nullable<int> bdf_price { get; set; }
    }
}