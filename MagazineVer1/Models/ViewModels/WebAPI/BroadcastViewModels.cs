namespace MagazineVer1.Models.ViewModels.WebAPI
{
    public class ResBroadcastTypeViewModel
    {
        public int bpt_id { get; set; }
        public string bpt_broadcastPoint { get; set; }
    }

    public class ReqSearchBroadcastResultViewModel
    {
        public string getDataType { get; set; }
        public string county { get; set; }
        public string township { get; set; }
        public string broadcastPointType { get; set; }
        public string keywords { get; set; }
    }
}