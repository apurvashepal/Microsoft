﻿using HotelManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HotelManagement.Controllers;
using System.Data.Entity.Validation;
using System.Data.Entity.Infrastructure;

namespace HotelManagement.Controllers
{
    public class CheckInController : Controller
    {
        //
        // GET: /CheckIn/
        public EmployeeEntities1 db = new EmployeeEntities1();
     
        public  RoomDetail rd = new RoomDetail();
      
       
        
        int Available_Rooms;
          
        

        public ActionResult Index()
        {
            return View();
        }



          [Authorize] 
       public ActionResult CheckIn(FormCollection form)
        {
            
            Checkin cm = new Checkin();
            EmployeeEntities1 EE = new EmployeeEntities1();
            List<Checkin> RList = EE.Checkins.ToList();
            Available_Rooms = RList.Count();
         
          
            cm.GuestName = form["Guestname"];
            cm.contact = Convert.ToInt32(form["contact"]);
            cm.address = form["address"];
            string RoomType = form["RoomType"];
            cm.quantity = Convert.ToInt32(form["quantity"]);
            cm.Total_days = Convert.ToInt32(form["Total_days"]);
    
       

            if (rd.RoomType == "Standard" && cm.quantity < Available_Rooms)
            {
               Available_Rooms  = Available_Rooms - cm.quantity;
               cm.bill = cm.quantity * 1000 * cm.Total_days;

            }
            else
                Response.AppendToLog("Rooms quantity not available");


            if (rd.RoomType == "Premium" && cm.quantity < Available_Rooms)
            {
                Available_Rooms = Available_Rooms - cm.quantity;
                cm.bill = cm.quantity * 2000 * cm.Total_days;
            }
            else
                Response.AppendToLog("Rooms quantity not available");

            if (rd.RoomType == "Delux" && cm.quantity < Available_Rooms)
            {
                Available_Rooms = Available_Rooms - cm.quantity;
                cm.bill= cm.quantity * 1000*cm.Total_days;
            }
            else
            {
                Response.AppendToLog("Rooms quantity not available");
                
            }
            if (ModelState.IsValid)
            {


                try
                {
                    db.Checkins.Add(cm);
                    db.SaveChanges();
                }
                catch (DbEntityValidationException ex)
                {
                    foreach (DbEntityValidationResult item in ex.EntityValidationErrors)
                    {
                        // Get entry

                        DbEntityEntry entry = item.Entry;
                        string entityTypeName = entry.Entity.GetType().Name;

                        // Display or log error messages

                        foreach (DbValidationError subItem in item.ValidationErrors)
                        {
                            string message = "Error";
                            Console.WriteLine(message);
                        }
                    }
                }

            }
            

            return View();
        }


        public ActionResult Viewchekin(Checkin cm)
        {
            EmployeeEntities1 EE = new EmployeeEntities1();
            List<Checkin> RList = EE.Checkins.ToList();
            


            return View(RList);
            
        }


        public ActionResult CheckOut(int Id)
        {


            Checkin cm = new Checkin();
          
             Checkin Rd = db.Checkins.Find(Id);
            db.Checkins.Remove(Rd);
            db.SaveChanges();

            RedirectToAction("ViewDetails");
            Available_Rooms = Available_Rooms + cm.quantity;
            TempData["bill"] = cm.bill;
            return View();

        }
      
        

    }
}
