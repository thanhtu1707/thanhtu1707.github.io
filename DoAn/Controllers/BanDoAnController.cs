using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAn.Models;
namespace DoAn.Controllers
{
    public class BanDoAnController : Controller
    {
        //
        // GET: /BanDoAn/
        QLDoAnDataContext db = new QLDoAnDataContext();
        public ActionResult Home()
        {
            List<Loai> lst = db.Loais.ToList();
            return View(lst);
        }
        public ActionResult PhanLoaiSP(string ml)
        {
            int maloai=int.Parse(ml);
            List<SanPham> lst = db.SanPhams.ToList();
            List<SanPham> lst2 = lst.Where(t => t.MaLoai == maloai).ToList();
            return View(lst2);
        }
        public ActionResult ChiTietSP(string msp)
        {
            int masp = int.Parse(msp);
            List<SanPham> lst = db.SanPhams.ToList();
            SanPham s = lst.FirstOrDefault(t => t.MaSP == masp);
            return View(s);
        }
        [HttpPost]
        public ActionResult TimKiem(FormCollection c)
        {
            List<SanPham> lst = db.SanPhams.ToList();
            var timkiem = c["txtSearch"];
            List<SanPham> lst2 = lst.Where(t => t.TenSP.Contains(timkiem) == true).ToList();
            return View(lst2);
        }
        public ActionResult Menu()
        {
            List<SanPham> lst = db.SanPhams.ToList();
            return View(lst);
        }
        public ActionResult MenuDung()
        {
            List<Loai> lst = db.Loais.ToList();
            return PartialView(lst);
        }
        public ActionResult DangKy()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangKy(FormCollection collection, KhachHang kh)
        {
            var hoten = collection["HoTen"];
            var tendn = collection["TenDN"];
            var matkhau = collection["MatKhau"];
            var mknhaplai = collection["MatKhauNhapLai"];
            var diachi = collection["DiaChi"];
            var email = collection["Email"];
            var dienthoai = collection["DienThoai"];
            var ngaysinh = string.Format("{0:MM/dd/yyyy}", collection["NgaySinh"]);
            if (string.IsNullOrEmpty(hoten))
            {
                ViewData["Loi1"] = "Họ tên khách hàng không được để trống";
            }
            else if (string.IsNullOrEmpty(tendn) || tendn.Length<5)
            {
                ViewData["Loi2"] = "Phải nhập tên đăng nhập và tên đăng nhập phải có 5 ký tự trở lên";
            }
            else if (string.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi3"] = "Phải nhập mật khẩu";
            }
            else if (string.IsNullOrEmpty(mknhaplai))
            {
                ViewData["Loi4"] = "Phải nhập lại mật khẩu";
            }
            if (string.IsNullOrEmpty(email))
            {
                ViewData["Loi5"] = "Email không được để trống";
            }
            if (string.IsNullOrEmpty(dienthoai) || dienthoai.Length<10 || dienthoai.Length>10 )
            {
                ViewData["Loi6"] = "Phải nhập lại điện thoại";
            }
            if (string.IsNullOrEmpty(ngaysinh))
            {
                ViewData["Loi7"] = "Phải nhập lại ngày sinh";
            }
            else
            {
                if (mknhaplai.Equals(matkhau) && tendn.Length>=5)
                {
                    kh.HoTen = hoten;
                    kh.TaiKhoan = tendn;
                    kh.MatKhau = matkhau;
                    kh.Email = email;
                    kh.DiaChiKH = diachi;
                    kh.DienThoaiKH = dienthoai;
                    kh.NgaySinh = DateTime.Parse(ngaysinh);
                    db.KhachHangs.InsertOnSubmit(kh);
                    db.SubmitChanges();
                    return RedirectToAction("DangNhap");
                }
            }
            return this.DangKy();
        }
        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection c)
        {
            var tendn = c["TenDN"];
            var matkhau = c["MatKhau"];
            if (string.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "Phải nhập tên đăng nhập";
            }
            else
            {
                if (string.IsNullOrEmpty(matkhau))
                {
                    ViewData["Loi2"] = "Phải nhập mật khẩu";
                }
                else
                {
                    KhachHang kh = db.KhachHangs.SingleOrDefault(n => n.TaiKhoan == tendn && n.MatKhau == matkhau);
                    Admin admin = db.Admins.SingleOrDefault(n => n.MaAdmin == tendn && n.Pass == matkhau);         
                    if (kh != null)
                    {
                        Session["TaiKhoan"] = kh;
                        return RedirectToAction("Home");
                    }
                    else if (admin != null)
                    {
                        Session["Admin"] = admin;
                        return RedirectToAction("Admin", "Admin");
                    }
                    else
                    {
                        ViewBag.ThongBao = "Tên đăng nhập hoặc mật khẩu không đúng";
                    }
                }
            }
            return View();
        }
        public ActionResult AboutUs()
        {
            return View();
        } 
       
    }
}
