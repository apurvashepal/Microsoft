using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HotelM1.Models;


namespace HotelM1.Models
{
    public class RoomController : Controller
    {
        //
        // GET: /Room/
      public static List<RoomModel> Roomdetails = new List<RoomModel>();
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
                int numberofRooms= Convert.ToInt32(form["numberofRooms"]);
                if (RoomType.Equals("Standard"))
                {
                    for(int count=0; count < numberofRooms; count++){
                    RoomModel rm = new RoomModel();
                    rm.RoomType = RoomType;
                    rm.Quantity = rm.Quantity + 1;
                    rm.R_id = StNum + 100;
                    rm.RoomType = "Standard";
                    StNum++;
                    Roomdetails.Add(rm);
                    }
                    
                }
                else   if (RoomType.Equals("Premium"))
                {
   
                    for (int count = 0; count < numberofRooms; count++)
                    {
                        RoomModel rm = new RoomModel();
                        rm.RoomType = RoomType;
                        rm.Quantity = rm.Quantity + 1;
                        rm.R_id = PrNum + 500;
                        rm.Price = 3000;
                        PrNum++;
                        Roomdetails.Add(rm);
                    }
                    
                }
                else if (RoomType.Equals("Delux"))
                {
                   
                    for (int count = 0; count < numberofRooms; count++)
                    {
                        RoomModel rm = new RoomModel();
                        rm.RoomType = RoomType;
                        rm.Quantity = rm.Quantity + 1;
                        rm.R_id = DeNum + 700;
                        rm.Price = 4000;
                        DeNum++;
                        Roomdetails.Add(rm);
                    }
                   
                }
                else
                {
                    for (int count = 0; count < numberofRooms; count++)
                    {
                        RoomModel rm = new RoomModel();
                        rm.RoomType = RoomType;
                        rm.Quantity = rm.Quantity + 1;
                        rm.R_id = Numroom + 1000;
                        rm.Price = 5000;
                        Numroom++;
                        Roomdetails.Add(rm);
                    }
                   
                }

               
            }
            catch (Exception e)
            {
                return View();    
            }
            return View();
        }

        
        public ActionResult Viewdetails(RoomModel rm)
        {
           TempData["Roomdetails"] = Roomdetails;
            return View();
        }


        public ActionResult delete(int Id)
        {
            RoomModel Rd = Roomdetails.FirstOrDefault(s => s.R_id == Id);
            Roomdetails.Remove(Rd);
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
            RoomModel rm1 = new RoomModel();
            string roomtype = form1["RoomType"];
            RoomModel Rd = Roomdetails.Single(s => s.R_id == Id);
            Rd.RoomType = form1["RoomType"];
           
            if (Rd.RoomType.Equals("Standard"))
            {      
                Rd.R_id = StNum + 100;
                Rd.RoomType = "Standard";
                StNum++;
            }
            if (Rd.RoomType.Equals ("Premium"))
            {
                Rd.R_id = PrNum + 500;
                Rd.RoomType = "Premium";
                PrNum++;
            }
            if (Rd.RoomType.Equals("Delux"))
            {
                Rd.R_id = DeNum + 700;
                Rd.RoomType = "Delux";
                DeNum++;
            }
                return RedirectToAction("Viewdetails");
            }
            catch
            {
                return View();
            }
        }  










    }
}
