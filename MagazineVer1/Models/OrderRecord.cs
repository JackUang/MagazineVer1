//------------------------------------------------------------------------------
// <auto-generated>
//     這個程式碼是由範本產生。
//
//     對這個檔案進行手動變更可能導致您的應用程式產生未預期的行為。
//     如果重新產生程式碼，將會覆寫對這個檔案的手動變更。
// </auto-generated>
//------------------------------------------------------------------------------

namespace MagazineVer1.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class OrderRecord
    {
        public int or_id { get; set; }
        public string or_number { get; set; }
        public System.DateTime or_create_datetime { get; set; }
        public string or_invoice_title { get; set; }
        public string or_invoice_address { get; set; }
        public string or_invoice_code { get; set; }
        public string inv_type { get; set; }
        public bool or_invoice_public { get; set; }
        public string u_id { get; set; }
        public int bill { get; set; }
        public bool or_payment_status { get; set; }
        public bool or_payment_confirmed { get; set; }
        public string or_remitMoney_name { get; set; }
        public Nullable<System.DateTime> or_remitMoney_time { get; set; }
        public int or_remitMoney { get; set; }
    
        public virtual AspNetUsers AspNetUsers { get; set; }
    }
}
