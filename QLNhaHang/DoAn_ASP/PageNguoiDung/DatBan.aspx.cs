using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using DoAn_ASP.Models;
using Newtonsoft.Json;

namespace DoAn_ASP.PageNguoiDung
{
    public partial class DatBan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnDatBan_Click(object sender, EventArgs e)
        {
            DatBanCT datban = null;
            datban = new DatBanCT();
            datban.HoTenKH = txtTenKH.Text;
            datban.SDT = txtSDT.Text;
            datban.GioiTinh = rdNam.Checked ? true : false;
            datban.NgayDat = cldNgayDat.SelectedDate;
            datban.GhiChu = txtGhiChu.Text;


            string chuoi_doc = JsonConvert.SerializeObject(datban);
            //2.Ghi chuỗi vào tập tin json 
            string Duong_dan_luuvaoJson = @"D:\Truong_CDGTVT\NAM2_HK2\ASP.NET\Du_An_ASP_QL_NhaHang\Project\Nhat\Project_ASP\QLNhaHang\DoAn_ASP\ThongTinTam.json";
            File.WriteAllText(Duong_dan_luuvaoJson, chuoi_doc);

            Response.Redirect("CTDatBan.aspx");
        }
    }
}