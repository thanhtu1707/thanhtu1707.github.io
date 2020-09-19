using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DoAn.Models;
namespace DoAn.Models
{
    public class Item
    {
        QLDoAnDataContext db = new QLDoAnDataContext();
        public int masp { get; set; }
        public string tensp { get; set; }
        public string hinhanh { get; set; }
        public int slmua { get; set; }
        public int dongia { get; set; }
        public int thanhtien
        { get { return slmua * dongia; } }
        public string chitiet { get; set; }
        public Item(string msp)
        {
            int m = int.Parse(msp);
            SanPham sp = db.SanPhams.FirstOrDefault(t => t.MaSP == m);
            masp = m;
            tensp = sp.TenSP;
            hinhanh = sp.Hinh;
            chitiet = sp.MoTa;
            slmua = 1;
            dongia = (int)sp.Gia;

        }
    }
}