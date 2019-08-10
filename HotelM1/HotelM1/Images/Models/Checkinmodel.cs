using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HotelM1.Models
{
    public class Checkinmodel
    {
       public int CheckinId { get; set; }
       public string GuestName {get; set;}
       public long contact{get;set;}
       public string address { get; set; }
       public string RoomType { get; set; }
       public int quantity { get; set; }
       public DateTime dt =  DateTime.Now;
       public int Total_days { get; set; }
       public int Price { get; set; }
       public string Status { get; set; } 
      
     
    }
}