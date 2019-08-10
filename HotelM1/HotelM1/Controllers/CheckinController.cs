using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HotelM1.Models;
using System.Web.UI;

namespace HotelM1.Controllers
{
    public class CheckinController : Controller
    {
        //
        // GET: /Checkin/
        static List<Checkinmodel> Guestdetails = new List<Checkinmodel>();
        static  RoomModel rm = new RoomModel();
         int quantity = rm.Quantity;//Available Room
         int CheckinId = 1000;
         int stNum = RoomController.StNum;
         int prNum = RoomController.PrNum;
         int deNum = RoomController.DeNum;
         int numRoom = RoomController.Numroom;
         int value;
         static int guestid=0;
        public ActionResult Checkin(FormCollection form)
        {
            try
            {

                
                String roomtype = form["RoomType"];

                Checkinmodel cm = new Checkinmodel();
                cm.CheckinId = guestid++;
                cm.GuestName = form["GuestName"];
                cm.contact = Convert.ToInt64(form["contact"]);
                cm.address = form["address"];
                cm.RoomType = roomtype;
                cm.quantity = Convert.ToInt32(form["quantity"]);
                cm.Total_days = Convert.ToInt32(form["Total_days"]);
                if (cm.RoomType.Equals("Standard"))
                {
                    value = 1;                    
                }
                if (cm.RoomType.Equals("Delux"))
                {
                    value = 3;
                }
                if (cm.RoomType.Equals("Premium"))
                {
                    value = 2;
                }
                int roomquantity = Convert.ToInt32(form["quantity"]);
                switch(value)
                {
                    case 1: if (roomquantity <= stNum)
                        {

                            stNum = stNum - cm.quantity;
                            cm.Price = cm.quantity * cm.Total_days * 1000;
                            cm.Status = "Checkin";
                            Guestdetails.Add(cm);
                            goto found;
                        }
                        else
                        {
                            Response.Write("<script>alert('" + "Rooms quantity not available" + "')</script>");
                            goto found;
                        }
                        break;

                    case 2: if (roomquantity <= prNum)
                        {

                            prNum = prNum - cm.quantity;
                            cm.Price = cm.quantity * cm.Total_days;
                            cm.Price = cm.Price * 2000;
                            cm.Status = "Checkin";
                            Guestdetails.Add(cm);
                            goto found;
                        }
                        else
                        {
                            Response.Write("<script>alert('" + "Rooms quantity not available" + "')</script>");
                            goto found;
                        }
                        break;

                    case 3: if (roomquantity <= deNum)
                        {
                            deNum = deNum - roomquantity;
                            cm.Price = cm.Price * 3000;
                            cm.Status = "Checkin";
                            Guestdetails.Add(cm);
                        }
                        else
                        {
                            Response.Write("<script>alert('" + "Rooms quantity not available" + "')</script>");
                        }
                        break;

                    default: Response.Write("<script>alert('" + "RoomsType not available" + "')</script>");
                             break;
                }
             

            }
            catch (Exception e)
            {
                Response.Write("<script>alert('" + e + "')</script>");
            }

       found:    return View();
        }




        public ActionResult Viewchekin(Checkinmodel cm, FormCollection form)
        {   
            try
            {
                 
                  
                  
                  TempData["Guestdetails"] = Guestdetails;
                  
            }
            catch (Exception e)
            {
                return View();
            }
            return View();
        }

        public ActionResult Search(FormCollection form)
        {
            string name = form["search"];
            List<Checkinmodel> SearchList = new List<Checkinmodel>();
            SearchList = Guestdetails.FindAll(S => S.GuestName.Equals(name));
            TempData["Search"] = SearchList;
            return View();
        }



        
        [Authorize]
        public ActionResult checkout(Checkinmodel cm)
        {
             if(cm.RoomType.Equals("Standard"))
             {
                 quantity = stNum + cm.quantity;
             }
             if (cm.RoomType.Equals("Premium"))
             {
                 quantity = prNum + cm.quantity;
             }
             if (cm.RoomType.Equals("Delux"))
             {
                 quantity = deNum + cm.quantity;
             }
             cm.Status = "Chekout";
             cm.dt = DateTime.Now.Date;
             Guestdetails.Remove(cm);
             return View();
           
        }
    }

}
