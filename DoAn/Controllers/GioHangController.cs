using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAn.Models;
namespace DoAn.Controllers
{
    public class GioHangController : Controller
    {
        //
        // GET: /GioHang/
        QLDoAnDataContext db = new QLDoAnDataContext();
        public List<Item> LayGioHang(string masp)
        {
            List<Item> lstGH = Session["gh"] as List<Item>;
            if (lstGH == null)
            {
                lstGH = new List<Item>();
                Session["gh"] = lstGH;
            }
            return lstGH;
        }
        //Thêm sản phẩm vào giỏ hàng
        public ActionResult ThemGioHang(string masp, string strUrl)
        {
            int m = int.Parse(masp);
            //lấy giỏ hàng
            List<Item> GH = LayGioHang(masp);
            //thêm 1 sp vào giỏ hàng
            //tìm xem sản phẩm i có tồn tại trong giỏ hàng chưa
            Item i = GH.FirstOrDefault(t => t.masp == m);
            if (i == null)
            {
                //thêm mới
                Item newitem = new Item(masp);
                GH.Add(newitem);
            }
            else
            {
                i.slmua++;
            }
            return Redirect(strUrl);
        }
        //Tính tổng số lượng
        public int tinhTongSL()
        {
            int tongsl = 0;
            List<Item> lst = Session["gh"] as List<Item>;
            if (lst != null)
            {
                tongsl = lst.Sum(t => t.slmua);
            }
            return tongsl;
        }
        //Tính tổng tiền giỏ hàng
        public int tinhTongTien()
        {
            int thanhtien = 0;
            List<Item> lst = Session["gh"] as List<Item>;
            if (lst != null)
            {
                thanhtien = lst.Sum(t => t.thanhtien);
            }
            return thanhtien;
        }
        //Xem Giỏ Hàng
        public ActionResult XemGioHang()
        {
            List<Item> lst = Session["gh"] as List<Item>;
            ViewBag.tsl = tinhTongSL();
            ViewBag.ttt = tinhTongTien();
            return View(lst);
        }
        //Xem chi tiết từng sản phẩm trong giỏ hàng
        public ActionResult XemChiTiet(string mi)
        {
            int m = int.Parse(mi);
            List<Item> lst = Session["gh"] as List<Item>;
            Item item = lst.FirstOrDefault(t => t.masp == m);
            return View(item);
        }
        public ActionResult PartialGioHang()
        {
            ViewBag.tsl = tinhTongSL();
            return PartialView();
        }
        //Xóa giỏ hàng
        public ActionResult XoaItem(string masp)
        {
            int m = int.Parse(masp);
            List<Item> lst = LayGioHang(masp);
            Item item = lst.FirstOrDefault(t => t.masp == m);
            if (item != null)
            {
                lst.RemoveAll(t => t.masp == m);
                return RedirectToAction("XemGioHang", "GioHang");
            }
            if (lst.Count == 0)
            {
                return RedirectToAction("TrangChu", "BanDoAn");
            }
            return RedirectToAction("XemGioHang", "GioHang");
        }
        //Đặt hàng
        public ActionResult DatHang()
        {
            if (Session["TaiKhoan"] == null)
                return RedirectToAction("DangNhap", "BanDoAn");
            KhachHang a = Session["TaiKhoan"] as KhachHang;
            return View(a);
        }
        [HttpPost]
        public ActionResult DatHang(FormCollection c)
        {
            DonDatHang ddh = new DonDatHang();
            KhachHang kh = Session["TaiKhoan"] as KhachHang;
            List<Item> lst = Session["gh"] as List<Item>;
            if (lst == null)
            {
                return RedirectToAction("TrangChu", "BanDoAn");
            }
            ddh.MaKH = kh.MaKH;
            ddh.NgayDat = DateTime.Now;
            ddh.TinhTrangGiaoHang = false;
            ddh.DaThanhToan = false;
            db.DonDatHangs.InsertOnSubmit(ddh);
            db.SubmitChanges();
            foreach (var s in lst)
            {
                ChiTietDonDatHang ctdh = new ChiTietDonDatHang();
                ctdh.MaDatHang = ddh.MaDonHang;
                ctdh.MaSP = s.masp;
                ctdh.SoLuong = s.slmua;
                ctdh.DonGia = (int)s.dongia;
                db.ChiTietDonDatHangs.InsertOnSubmit(ctdh);
            }
            db.SubmitChanges();
            Session["gh"] = null;
            return RedirectToAction("XacNhanThongTin", "GioHang");
        }
        public ActionResult XacNhanThongTin()
        {
            return View();
        }
        //Cập nhật giỏ hàng
        public ActionResult CapNhatGioHang(string masp, FormCollection c)
        {
            int m = int.Parse(masp);
            //Lấy giỏ hàng
            List<Item> GH = LayGioHang(masp);
            Item i = GH.FirstOrDefault(t => t.masp == m);
            if (i != null)
            {
                i.slmua = int.Parse(c["txtSoLuong"].ToString());
            }
            return RedirectToAction("XemGioHang", "GioHang");
        }
       
    }
}
