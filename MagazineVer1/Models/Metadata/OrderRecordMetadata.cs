using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace MagazineVer1.Models
{
    [MetadataType(typeof(OrderRecordMetadata))]
    public partial class OrderRecord
    {
        public partial class OrderRecordMetadata
        {
            [DisplayName("訂單編號")]
            public string or_number { get; set; }

            [DisplayName("金額")]
            public int bill { get; set; }
        }
    }
}