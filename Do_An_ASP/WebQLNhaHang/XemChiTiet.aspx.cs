using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebQLNhaHang
{
    public partial class XemChiTiet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void btThemVaoGio_Click(object sender, EventArgs e)
        {
            //1. Xử lý thêm sản phẩm vào giỏ hàng
            //2. Điều hướng ngừi dùng đến trang giỏ hàng
            Response.Redirect("GioHang.aspx");
        }
    }
}