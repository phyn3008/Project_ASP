using System;
using System.Configuration;
using System.Data.SqlClient;

namespace WebQLNhaHang
{
    public partial class CTDatBan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btDatBan_Click(object sender, EventArgs e)
        {
            SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLNH_ASPConnectionString"].ConnectionString);
            cnn.Open();
            SqlCommand cmdKH = new SqlCommand("insert into KhachHang(TenKH, LaNam, SDT, TraTruoc) values (@TenKH,@LaNam,@SDT,@TraTruoc)", cnn);

            //Thêm Khách Hàng
            cmdKH.Parameters.AddWithValue("@TenKH", txtTenKH.Text);
            Boolean gtinh = rdNam.Checked ? true : false;
            cmdKH.Parameters.AddWithValue("@LaNam", gtinh);
            cmdKH.Parameters.AddWithValue("@SDT", txtSDT.Text);
            cmdKH.Parameters.AddWithValue("@TraTruoc", 0);
            //if (cmdKH.ExecuteNonQuery() > 0)
            //{
            //    Console.WriteLine("Thêm thành công Khách Hàng");
            //}
            //else
            //{
            //    Console.WriteLine("Thêm thất bại Khách Hàng");
            //}

            //Lấy Mã KH
            SqlCommand cmdLayMa = new SqlCommand("select MaKH from KhachHang where TenKH=N'" + txtTenKH.Text + "'", cnn);
            string MaKH="";
            SqlDataReader rdLayMa = cmdLayMa.ExecuteReader();
                while (rdLayMa.Read())
                {
                    MaKH = rdLayMa["MaKH"].ToString();
                }
            //lbThongBao.Text = MaKH;
            rdLayMa.Close();
            



            //Đặt Bàn
            SqlCommand cmdDatBan = new SqlCommand("insert into DatBan(MaKH,SoLuongBanDat,NgayDat,NgayHetHan) values (@MaKH,@SoLuongBanDat,@NgayDat,@NgayHetHan)", cnn);
            cmdDatBan.Parameters.AddWithValue("@MaKH",MaKH);
            cmdDatBan.Parameters.AddWithValue("@SoLuongBanDat", int.Parse(txtSoLuong.Text));
            cmdDatBan.Parameters.AddWithValue("@NgayDat", DateTime.Today);
            cmdDatBan.Parameters.AddWithValue("@NgayHetHan", cldNgayDat.SelectedDate);

            if (cmdDatBan.ExecuteNonQuery() > 0)
            {
                lbThongBao.Text = "Đặt bàn thành công";
            }
            else
            {
                lbThongBao.Text = "Đặt bàn thất bại";
            }
        }

        
    }
}