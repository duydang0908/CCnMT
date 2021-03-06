﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Project;

namespace Project.Controllers
{
    public class AdminController : Controller
    {
        QLThuVienEntities1 db = new QLThuVienEntities1();
        // GET: Admin
        //[HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult DoLogin(FormCollection collection, Admin ad)
        {
            var tendn = collection["username"];
            var matkhau = collection["password"];
            ad = db.Admins.SingleOrDefault(n => n.UserAdmin == tendn && n.PassAdmin == matkhau);
            if (ad != null)
            {
                FormsAuthentication.SetAuthCookie(ad.UserAdmin, false);
                return RedirectToAction("Index","DOCGIAs");
            }
            else
            {
                ModelState.AddModelError("CredentialError", "Invalid user or password");
                return View("Login");
            }
        }


        //[HttpPost]
        //public ActionResult Login(FormCollection collection)
        //{
        //    var tendn = collection["username"];
        //    var matkhau = collection["password"];
        //    if (String.IsNullOrEmpty(tendn))
        //    {
        //        ViewData["Loi1"] = "Phải nhập tên đăng nhập";
        //    }
        //    else if (String.IsNullOrEmpty(matkhau))
        //    {
        //        ViewData["Loi2"] = "Phải nhập mật khẩu";
        //    }
        //    else
        //    {
        //        Admin ad = db.Admins.SingleOrDefault(n => n.UserAdmin == tendn && n.PassAdmin == matkhau);
        //        if (ad != null)
        //        {
        //            Session["Taikhoanadmin"] = ad;
        //            return RedirectToAction("Index", "QLSach");
        //        }
        //        else
        //            ViewBag.ThongBao = "Tên đăng nhập hoặc mật khẩu không đúng";
        //    }
        //    return View();
        //}
        //Trang đăng xuất
        public ActionResult Logout()
        {
            //Session.Clear();
            //return RedirectToAction("Login", "Admin");

            FormsAuthentication.SignOut();
            return RedirectToAction("Login");

        }


    }
}