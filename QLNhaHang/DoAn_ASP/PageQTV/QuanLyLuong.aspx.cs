using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DoAn_ASP.Models;
using System.Configuration;
using System.Data.SqlClient;

namespace DoAn_ASP.PageQTV
{
    public partial class QuanLyLuong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {      
            
        }

        protected void gvchamcong_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string manv = DataBinder.Eval(e.Row.DataItem, "MaNV").ToString();
                bool isadmin = Convert.ToBoolean(DataBinder.Eval(e.Row.DataItem, "IsAdmin"));
                int socong = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "Socong"));

                float tinhluong = 0;
                if (isadmin)
                {
                    tinhluong = socong * 500000;
                }
                else
                {
                    tinhluong = socong * 300000;
                }

                TextBox txtLuong = e.Row.FindControl("txtLuong") as TextBox;
                if (txtLuong != null)
                {
                    txtLuong.Text = tinhluong.ToString();
                }
            }

        }

        protected void gvchamcong_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btntinhluong_Click(object sender, EventArgs e)
        {
            TextBox sc = (TextBox)gvchamcong.FindControl("txtsocong");
            int socong = int.Parse(sc.Text);
            //1 . tạo kết nối
            SqlConnection conn = new
            SqlConnection(ConfigurationManager.ConnectionStrings["QLNH_ASPConnectionString"].ConnectionString);
            conn.Open();
            //2. Tạo truy vấn
            SqlCommand cmd = new SqlCommand("Update Menu set Socong = @Socong", conn);
            cmd.Parameters.AddWithValue("@SoCong", socong);

            SqlDataReader dr = cmd.ExecuteReader();

            
            conn.Close();
        }
    }
}