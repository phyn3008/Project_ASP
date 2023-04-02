<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CTDatBan.aspx.cs" Inherits="WebQLNhaHang.CTDatBan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="dsCTDatBan" runat="server" ConnectionString="<%$ ConnectionStrings:QLNH_ASPConnectionString %>" SelectCommand="SELECT * FROM [Ban] WHERE ([MaBan] = @MaBan)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="1" Name="MaBan" QueryStringField="MaBan" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
       <div style="width: 50%; margin: 0 auto; margin-top: 100px">
            <div class="panel panel-info"><h2 style="font-weight:bold">THÔNG TIN ĐẶT BÀN</h2></div>
                <div class="panel-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="email">
                                Bàn Số:</label>
                            <div class="col-sm-9">
                                <asp:Repeater ID="rpBan" DataSourceID="dsCTDatBan" runat="server">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMaBan" runat="server" Text='<%# Eval("MaBan")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:Repeater> 
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="email">
                                Tên Khách Hàng:</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtTenKH" runat="server"
                                    CssClass="form-control" ></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvTenKH" runat="server" ErrorMessage="Vui Lòng Không Để Trống Tên Khách Hàng" ControlToValidate="txtTenKH" Text="(*)"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="pwd">
                               Giới Tính</label>
                            <div class="col-sm-9" font-bold="True">
                                <asp:RadioButton ID="rdNam" GroupName="gioiTinh" Text="Nam" Checked="true" runat="server" />
                                <asp:RadioButton ID="rdNu" GroupName="gioiTinh" Text="Nữ" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="pwd">
                                Số Điện Thoại:</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtSDT" runat="server"
                                    CssClass="form-control"></asp:TextBox>
                            </div>
                        <asp:RequiredFieldValidator ID="rfvSDT" runat="server" ErrorMessage="Vui Lòng Không Để Trống Số Điện Thoại" ControlToValidate="txtSDT" Text="(*)" ></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="revSDT" runat="server" ErrorMessage="Sai Định Dạng SĐT" ControlToValidate="txtSDT" ValidationExpression="0\d{9}" Text="(*)"></asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="pwd">
                                Ngày Đặt:</label>
                            <div class="col-sm-9">
                                <asp:Calendar ID="cldNgayDat" runat="server"></asp:Calendar>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="pwd">
                                Số Lượng Bàn:</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtSoLuong" runat="server" Text="1" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <asp:Button ID="btDatBan" runat="server" Text="Đặt Bàn" CssClass="btn btn-success" OnClick="btDatBan_Click" />   
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <asp:Label ID="lbThongBao" runat="server" Text=""
                                    ForeColor="#cc3300">
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                                </asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

    </form>
</body>
</html>
