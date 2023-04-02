using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace DoAn_ASP.Models
{
    public class CartDAO
    {
        // Khai báo danh sách lưu lại dữ liệu thực đơn
        private List<CartItem> _Items;

        // Phương thức khỏi tạo giỏ hàng 
        public CartDAO()
        {
            _Items = new List<CartItem>();
        }

        // Trả về danh sách giỏ hàng 
        public List<CartItem> items { get { return _Items; } }

        // phương thức thêm sản phẩm vào giỏ 
        public void Add(string mama)
        {
            // Truy vấn CSDL để lấy thông tin cần thêm vào giỏ hàng
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLNH_ASPConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from Menu Where mama=@mama",conn);
            cmd.Parameters.AddWithValue("@mama", mama);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                // Tạo 1 đối tượng CartItem 
                CartItem c = new CartItem
                {
                    mama = mama,
                    tenma = dr["TenMa"].ToString(),
                    hinh = dr["HinhAnh"].ToString(),
                    dongia = int.Parse(dr["DonGiaSP"].ToString()),
                    soluong = 1
                };

                // Thêm Vào vỏ 
                //1. Trường hợp món ăn mới trùng với món ăn trong giỏ thì tăng số lượng lên
                // Idia: Quét trong vỏ hàng trên session nếu món ăn có mama trùng với mama mới thêm vào thì soluong++;
                //for (int i = 0; i < _Items.Count; i++)
                //{
                //    if(_Items[i].mama == mama)
                //    {
                //        _Items[i].soluong++;
                //        break;
                //    }
                //}

                //2. Món ăn mới chưa tồn tại trong giỏ thì thêm
                _Items.Add(c);
            }
            conn.Close();
        }

        // Xóa món ăn trong giỏ
        public void Delete(string mama)
        {
            // Duyệt qua những sản phầm trong giỏ hàng
        }
    }
}