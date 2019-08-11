using MvcApplication1.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcApplication1.Controllers
{
    public class CheckInController : Controller
    {
        //
        // GET: /CheckIn/

        public RoomEntities db = new RoomEntities();
        static List<CheckIn> Guestdetails = new List<CheckIn>();
        static  Room rm = new Room();
          //int quantity =  //Available Room
        // int CheckinId = 1000;
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

                CheckIn cm = new CheckIn();
                cm.Id = guestid++;
                cm.GusestName = form["GuestName"];
                cm.Contact = Convert.ToInt64(form["contact"]);
                cm.Address = form["address"];
                cm.Roomtype = roomtype;
                cm.Quantity = Convert.ToInt32(form["quantity"]);
                cm.Staydays = Convert.ToInt32(form["Total_days"]);
				cm.Date = DateTime.Now.Date;
                if (cm.Roomtype.Equals("Standard"))
                {
                    value = 1;                    
                }
                if (cm.Roomtype.Equals("Delux"))
                {
                    value = 3;
                }
                if (cm.Roomtype.Equals("Premium"))
                {
                    value = 2;
                }
                int roomquantity = Convert.ToInt32(form["quantity"]);
                switch(value)
                {
                    case 1: if (roomquantity <= stNum)
                        {

                            stNum = stNum - cm.Quantity;
                            cm.Price = cm.Quantity * cm.Staydays * 1000;
                            cm.Status = "Checkin";
							db.CheckIns.Add(cm);
                            Guestdetails.Add(cm);
							db.SaveChanges();
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

                            prNum = prNum - cm.Quantity;
                            cm.Price = cm.Quantity * cm.Staydays;
                            cm.Price = cm.Price * 2000;
                            cm.Status = "Checkin";
							db.CheckIns.Add(cm);
							Guestdetails.Add(cm);
							db.SaveChanges();
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
							 if (ModelState.IsValid)
                            {


                                try
                                {
                                    db.CheckIns.Add(cm);
                                    Guestdetails.Add(cm);
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




        public ActionResult Viewchekin(CheckIn cm, FormCollection form)
        {   
            try
			{
				RoomEntities roomEntities = new RoomEntities();
				Guestdetails = roomEntities.CheckIns.ToList();
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
			
			List<CheckIn> SearchList = new List<CheckIn>();
			
			SearchList = db.CheckIns.Where(room => room.GusestName == name).ToList();
            TempData["Search"] = SearchList;
            return View();
        }



        
        [Authorize]
        public ActionResult checkout(CheckIn cm)
        {
             if(cm.Roomtype.Equals("Standard"))
             {
				stNum = stNum + cm.Quantity;
             }
             if (cm.Roomtype.Equals("Premium"))
             {
                prNum= prNum + cm.Quantity;
             }
             if (cm.Roomtype.Equals("Delux"))
             {
                 deNum = deNum + cm.Quantity;
             }
             cm.Status = "Chekout";
             cm.Date = DateTime.Now.Date;
             Guestdetails.Remove(cm);
             return View();
           
        }
    }

    
}
