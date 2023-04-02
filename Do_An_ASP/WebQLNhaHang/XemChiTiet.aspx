<%@ Page Title="" Language="C#" MasterPageFile="~/PageNguoiDung.Master" AutoEventWireup="true" CodeBehind="XemChiTiet.aspx.cs" Inherits="WebQLNhaHang.XemChiTiet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoiDung" runat="server">
    <form id="form1" runat="server">
        <div class="container-fluid">
        <asp:Repeater ID="rptChiTiet" runat="server" DataSourceID="dsChiTiet">
            <ItemTemplate>
                <div class="row">
                    <div class="col-4">
                        <div class="itemMA">
                            <a href="#">
                                <img src='<%# Eval("HinhAnh","Images/{0}") %>' />
                            </a>
                        </div>
                    </div>
                    <div class="col-8">
                        <div class="tenma" style="font-size:40px" >
                            <asp:Label ID="lbTen" runat="server" Text='<%# Eval("TenMA")%>'></asp:Label>
                        </div>
                        Miêu Tả: <br />
                        <div class="mieuta" style="font-size:20px">
                                <asp:Label ID="lbMieuta" runat="server" Text='<%# Eval("MieuTa")%>'></asp:Label>
                        </div>
                        Giá bán:
                        <div class="giama" style="font-size:20px">
                                <asp:Label ID="lbGia" runat="server" Text='<%# Eval("DonGiaSP","{0:#,##0} đồng")%>'></asp:Label>
                        </div>
                        <div class="giohang">
                            <asp:Button ID="btnThemVaoGio" CssClass="btn btn-success" runat="server" Text="Thêm vào giỏ" OnClick="btThemVaoGio_Click"/>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
            </div>
        <asp:SqlDataSource ID="dsChiTiet" runat="server" ConnectionString="<%$ ConnectionStrings:QLNH_ASPConnectionString %>" SelectCommand="SELECT * FROM [Menu] WHERE ([MaMA] = @MaMA)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="1" Name="MaMA" QueryStringField="MaMA" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>

