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
    
    public partial class InfoGroupp
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public InfoGroupp()
        {
            this.Infos = new HashSet<Infos>();
        }
    
        public int ig_id { get; set; }
        public string ig_name { get; set; }
        public string ig_pic { get; set; }
        public int ig_price { get; set; }
        public int DisplayOrder { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Infos> Infos { get; set; }
    }
}