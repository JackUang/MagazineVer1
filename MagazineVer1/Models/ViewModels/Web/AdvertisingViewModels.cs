using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace MagazineVer1.Models.ViewModels.Web
{
    public class UserDataViewModels
    {
        public string Email { get; set; }
        public string Phone { get; set; }
        public string UserName { get; set; }
    }

    public class ResOrderDetails
    {
        public string OrderNumber { get; set; }
        public string OrderDateTime { get; set; }
        public int OrderPrice { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string InvoiceTitle { get; set; }
        public string InvoiceAddress { get; set; }
        public string InvoiceCode { get; set; }

        public List<PayAdvertising> PayAdvertising { get; set; }
        public List<PayAdvertising> FreeAdvertising { get; set; }
    }

    public class PayAdvertising
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public int AdvertisingPrice { get; set; }
        public int BroadcastPrice { get; set; }
        public string Probation { get; set; }
        public string FormalPeriod { get; set; }
    }

    public class ResAdvertisingPublishedContent
    {
        public string ig_name { get; set; }
        public int ig_price { get; set; }
        public string ip_name { get; set; }
        public int ip_day { get; set; }
        public int ip_discount { get; set; }
        public bool i_open { get; set; }
        public string i_location1 { get; set; }
        public string i_location2 { get; set; }
        public string i_name { get; set; }
        public string i_content { get; set; }
        public DateTime i_expired_day { get; set; }
        public string i_pic1 { get; set; }
        public string i_pic2 { get; set; }
        public string i_pic3 { get; set; }
        public string i_pic4 { get; set; }
        public string i_pic5 { get; set; }
        public string i_URL { get; set; }
        public string i_LINE { get; set; }
        public List<BeaconDeviceViewModel> BeaconDevices { get; set; }
    }

    public class BeaconDeviceViewModel
    {
        public string d_name { get; set; }
    }

    public class ResPaymentNotice
    {
        public string OrderNumber { get; set; }
        public int Price { get; set; }
    }

    public class ReqPaymentNotice
    {
        [Required]
        public string on { get; set; }
        [Required]
        public string name { get; set; }
        [Required]
        public string price { get; set; }
    }

    public class ResPaymentNoticeResult
    {
        public bool status { get; set; }
        public string errorMsg { get; set; }
    }
}