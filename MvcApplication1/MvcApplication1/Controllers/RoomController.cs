using MvcApplication1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcApplication1.Controllers
{
    public class RoomController : Controller
    {
        //
        // GET: /Room/



        RoomEntities db = new RoomEntities();
      
      public static List<Room> Roomdetails = new List<Room>();
      public static int StNum = 0;
      public static int PrNum = 0;
      public static int DeNum = 0;
      public static int Numroom = 0;
      
            
      /* [HttpPost]
        public ActionResult Create()
        {
            try
            {
                RoomModel rm = new RoomModel();

                rm.RoomType = collection["RoomType"];

                rm.NumRooms = Convert.ToInt32(collection["NumRooms"]);
               
                rm.Quantity = Convert.ToInt32(collection["Quantity"]);
                rm.Price = rm.Quantity * 1000;
                Roomdetails.Add(rm);

                return View();
            }
            catch
            {
                return View();
            }
        }*/
            



        [Authorize]
        public ActionResult Create(FormCollection form)
      {
          
            try
            {   
                String RoomType = form["RoomType"];
                int numberofRooms= Convert.ToInt32(form["NumberofRooms"]);
                if (RoomType.Equals("Standard"))
                {
                    for(int count=0; count < numberofRooms; count++){
                    Room rm = new Room();
                    rm.Roomtype = RoomType;
                   
                    rm.Id = StNum + 100;
                    rm.Roomtype = "Standard";
                    StNum++;
                    Roomdetails.Add(rm);
                    db.Rooms.Add(rm);
                    db.SaveChanges();
                    }
                    
                }
                else   if (RoomType.Equals("Premium"))
                {
   
                    for (int count = 0; count < numberofRooms; count++)
                    {
                        Room rm = new Room();
                        rm.Roomtype = RoomType;
                    
                        rm.Id = PrNum + 500;
                        rm.Price = 3000;
                        PrNum++;
                        Roomdetails.Add(rm);
                        db.Rooms.Add(rm);
                        db.SaveChanges();
                    }
                    
                }
                else if (RoomType.Equals("Delux"))
                {
                   
                    for (int count = 0; count < numberofRooms; count++)
                    {
                        Room rm = new Room();
                        rm.Roomtype = RoomType;
                       
                        rm.Id = DeNum + 700;
                        rm.Price = 4000;
                        DeNum++;
                        Roomdetails.Add(rm);
                        db.Rooms.Add(rm);
                        db.SaveChanges();
                    }
                   
                }
                else
                {
                    for (int count = 0; count < numberofRooms; count++)
                    {
                        Room rm = new Room();
                        rm.Roomtype = RoomType;
    
                        rm.Id = Numroom + 1000;
                        rm.Price = 5000;
                        Numroom++;
                        Roomdetails.Add(rm);
                        db.Rooms.Add(rm);
                        db.SaveChanges();
                    }
                   
                }

               
            }
            catch (Exception e)
            {
                return View();    
            }
            return View();
        }

        
        public ActionResult Viewdetails(Room rm)
        {
           
            Roomdetails = db.Rooms.ToList();
           TempData["Roomdetails"] = Roomdetails;
            return View();
        }


        public ActionResult delete(int Id)
        {
            
            Room Rd = db.Rooms.FirstOrDefault(s => s.Id == Id);
            db.Rooms.Remove(Rd);
            db.SaveChanges();
           return View();
        }





  
        public ActionResult Edit(int Id)
        {
            return View();
        }
      
        [HttpPost]
        [Authorize]
        public ActionResult Edit(int Id, FormCollection form1)
        {
            try
            {
            Room rm1 = new Room();
            string roomtype = form1["RoomType"];
            
            Room Rd = db.Rooms.FirstOrDefault(s => s.Id == Id);
            
            Rd.Roomtype = form1["RoomType"];
           
            if (Rd.Roomtype.Equals("Standard"))
            {      
                Rd.Id = StNum + 100;
                Rd.Roomtype = "Standard";
                StNum++;
            }
            if (Rd.Roomtype.Equals ("Premium"))
            {
                Rd.Id = PrNum + 500;
                Rd.Roomtype = "Premium";
                PrNum++;
            }
            if (Rd.Roomtype.Equals("Delux"))
            {
                Rd.Id = DeNum + 700;
                Rd.Roomtype= "Delux";
                DeNum++;
            }
            db.SaveChanges();
                return RedirectToAction("Viewdetails");
            }
            catch
            {
                return View();
            }
        } 


    }

    
}
