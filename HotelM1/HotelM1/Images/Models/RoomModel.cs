﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HotelM1.Models
{
    public class RoomModel
    {
        public int R_id { get; set; }

      
        public int Price
        {
            get;
            set;
        }
        public int Quantity
        {
            get;
            set;
        }
        public string RoomType { get; set; }

        public int numberofRooms { get; set; }
    }
}