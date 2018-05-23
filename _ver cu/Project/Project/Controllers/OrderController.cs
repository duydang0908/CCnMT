using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Project.Controllers
{
    public class OrderController : Controller
    {
        QLThuVienEntities data = new QLThuVienEntities();

        public List<Order> Layorder()
        {
            List<Order> lstOrder = Session["Order"] as List<Order>;
            if (lstOrder == null)
            {
                lstOrder = new List<Order>();
                Session["Order"] = lstOrder;
            }
            return lstOrder;
        }

        // GET: Order
        public ActionResult Index()
        {
            return View();
        }

        private int tongSoLuong()
        {
            int itongSL = 0;
            List<Order> lstOrder = Session["Order"] as List<Order>;
            if (lstOrder != null)
                itongSL = lstOrder.Sum(n => n.iSL);
            return itongSL;
        }

        public ActionResult ThemGioHang(int iMasach, string strURL)
        {
            List<Order> lstOrder = Layorder();
            Order sp = lstOrder.Find(n => n.iMasach == iMasach);
            if (sp == null)
            {
                sp = new Order(iMasach);
                lstOrder.Add(sp);
                return Redirect(strURL);
            }
            else
            {
                sp.iSL++;
                return Redirect(strURL);
            }
        }

        public ActionResult GioHang()
        {
            List<Order> lstOrder = Layorder();
            if (lstOrder.Count == 0)
                return RedirectToAction("Index", "Library");
            ViewBag.Tongsoluong = tongSoLuong();
            return View(lstOrder);
        }

        public ActionResult GiohangPartial()
        {
            ViewBag.Tongsoluong = tongSoLuong();
            return PartialView();
        }

        public ActionResult XoaGioHang(int iMaSP)
        {
            List<Order> lstOrder = Layorder();
            Order sp = lstOrder.SingleOrDefault(n => n.iMasach == iMaSP);
            if (sp != null)
            {
                lstOrder.RemoveAll(n => n.iMasach == iMaSP);
                return RedirectToAction("GioHang");
            }
            if (lstOrder.Count == 0)
                return RedirectToAction("Index", "Library");
            return RedirectToAction("GioHang");
        }

        public ActionResult CapnhatGiohang(int iMaSP, FormCollection f)
        {
            List<Order> lstOrder = Layorder();
            Order sp = lstOrder.SingleOrDefault(n => n.iMasach == iMaSP);
            if (sp != null)
                sp.iSL = int.Parse(f["txtSoluong"].ToString());
            return RedirectToAction("GioHang");
        }

        public ActionResult XoaTatcaGiohang()
        {
            List<Order> lstOrder = Layorder();
            lstOrder.Clear();
            return RedirectToAction("Index", "Library");
        }

        [HttpGet]
        public ActionResult DatHang()
        {
            if (Session["Taikhoan"] == null || Session["Taikhoan"].ToString() == "")
                return RedirectToAction("Login", "Library");
            if (Session["Order"] == null)
                return RedirectToAction("Index", "Library");
            List<Order> lstOrder = Layorder();
            ViewBag.Tongsoluong = tongSoLuong();
            return View(lstOrder);
        }

        [HttpPost]
        public ActionResult DatHang(FormCollection collection)
        {
            PhieuMuonSach pms = new PhieuMuonSach();
            DOCGIA dg = (DOCGIA)Session["Taikhoan"];
            List<Order> gh = Layorder();
            pms.MaDG = dg.MaDG;
            pms.NgayMuon = DateTime.Now;
            data.PhieuMuonSaches.Add(pms);
            data.SaveChanges();
            foreach(var item in gh)
            {
                CT_PhieuMuonSach ctpms = new CT_PhieuMuonSach();
                ctpms.MaPhieuMuon = pms.MaPhieuMuon;
                ctpms.Masach = item.iMasach;
                ctpms.SoLuong = item.iSL;
                data.CT_PhieuMuonSach.Add(ctpms);
                data.SaveChanges();
            }
            data.SaveChanges();
            Session["Order"] = null;
            return RedirectToAction("Xacnhandonhang", "Order");
        }

        public ActionResult Xacnhandonhang()
        {
            return View();
        }
    }
}