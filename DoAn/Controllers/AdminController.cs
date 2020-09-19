using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAn.Models;
namespace DoAn.Controllers
{
    public class AdminController : Controller
    {
        //
        // GET: /Admin/
        QLDoAnDataContext db = new QLDoAnDataContext();
        public ActionResult Admin()
        {
            if (Session["Admin"] == null)
            {
                return RedirectToAction("DangNhap", "BanDoAn");
            }
            return View();
        }
        public ActionResult Index()
        {
            var All_sanpham = from tt in db.SanPhams select tt;
            return View(All_sanpham);
        }
        public ActionResult Create()//them
        {
            if (Session["Admin"] == null)
            {
                return RedirectToAction("DangNhap", "BanDoAn");
            }
            return View();
        }

        [HttpPost]
        public ActionResult Create(FormCollection collection, SanPham lsp)
        {
            var CB_tenSP = collection["TenSP"];
            var CB_gia = collection["Gia"];
            var CB_mota = collection["Mota"];
            if (string.IsNullOrEmpty(CB_tenSP))
            {
                ViewData["Loi1"] = "Product name must not be blank";
            }
            if (string.IsNullOrEmpty(CB_gia))
            {
                ViewData["Loi2"] = "Product price must not be blank";
            }
            if (string.IsNullOrEmpty(CB_mota))
            {
                ViewData["Loi3"] = "Description must not be blank";
            }
            else
            {
                lsp.TenSP = CB_tenSP;
                lsp.MoTa = CB_mota;
                db.SanPhams.InsertOnSubmit(lsp);
                db.SubmitChanges();
                return RedirectToAction("Index", "Admin");
            }
            return this.Create();
        }
        public ActionResult Delete(int ms)
        {
            var D_tin = db.SanPhams.First(m => m.MaSP == ms);
            return View(D_tin);
            
        }
        [HttpPost]
        public ActionResult Delete(int ms, FormCollection collection)
        {
            var D_tin = db.SanPhams.Where(m => m.MaSP == ms).First();
            db.SanPhams.DeleteOnSubmit(D_tin);
            db.SubmitChanges();
            return RedirectToAction("Index", "Admin");

        }


        public ActionResult Edit(int ms)
        {
            //if (Session["Admin"] == null)
            //{
            //    return RedirectToAction("DangNhap", "BanDoAn");
            //}

            var EB_tin = db.SanPhams.First(m => m.MaSP == ms);
            return View(EB_tin);
        }
        [HttpPost]
        public ActionResult Edit(int ms, FormCollection collection)
        {
            var Ltin = db.SanPhams.First(m => m.MaSP == ms);
            var tenSP = collection["TenSP"];
            var hinh = collection["Hinhanh"];
            var gia = collection["Gia"];
            var mota = collection["Mota"];
            Ltin.MaSP = ms;
            if (string.IsNullOrEmpty(tenSP))
            {
                ViewData["Loi1"] = "ten tin khong duoc de trong";
            }
            if (string.IsNullOrEmpty(hinh))
            {
                ViewData["Loi1"] = " tin khong duoc de trong";
            } if (string.IsNullOrEmpty(gia))
            {
                ViewData["Loi1"] = "tin khong duoc de trong";
            } if (string.IsNullOrEmpty(mota))
            {
                ViewData["Loi1"] = "tin khong duoc de trong";
            }
            else
            {
                Ltin.TenSP = tenSP;
                Ltin.Hinh = hinh;
                //Ltin.Gia = gia;
                Ltin.MoTa = mota;
                UpdateModel(Ltin);
                db.SubmitChanges();
                return RedirectToAction("Index");
            }
            return this.Edit(ms);
        }

        public ActionResult Logout()
        {
            Session["Admin"] = null;
            return RedirectToAction("Home","BanDoAn");
        }
    }


}
