<%@ Page Title="" Language="C#" MasterPageFile="~/PageNguoiDung/PageNguoiDung.Master" AutoEventWireup="true" CodeBehind="DatMonChoBan.aspx.cs" Inherits="DoAn_ASP.PageNguoiDung.DatMonChoBan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoiDung" runat="server">
    <form id="form1" runat="server">
        <div class="container">
            <asp:GridView ID="gvmonanchoban" runat="server" Width="100%" DataSourceID="dsMonAn" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="MaMA" AllowPaging="True" PageSize="4">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="TenMA" HeaderText="Tên Món Ăn" SortExpression="TenMA" ControlStyle-Width="100px" />

                    <asp:BoundField DataField="DonGiaSP" HeaderText="Đơn Giá" SortExpression="DonGiaSP" DataFormatString="{0:#,##0 Đ}" ControlStyle-Width="100px" />
                    <asp:TemplateField HeaderText="Hình Ảnh">
                        <ItemTemplate>
                            <img style="width: 200px; height: 200px" src='<%# Eval("HinhAnh","../Images/{0}") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Có Sẵn">
                        <ItemTemplate>
                            <asp:Label ID="lblCoSan" runat="server" Text='<%# (bool)Eval("CoSan") == true? "Có Sẵn" : "Không Có" %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Chọn tác vụ">
                        <ItemTemplate>
                            <asp:Button ID="btnThem" runat="server" Text="Thêm" CommandArgument='<%# Eval("MaMA") %>' OnClick="btnThem_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>
            <asp:SqlDataSource ID="dsMonAn" runat="server" ConnectionString="<%$ ConnectionStrings:QLNH_ASPConnectionString %>" SelectCommand="SELECT * FROM [Menu]"></asp:SqlDataSource>
            <div style="text-align:right;margin-top:10px">            
            <a  class="btn btn-info" style="width:100px" href="CTDatBan.aspx">Xong</a>
            </div>
        </div>
    </form>
</asp:Content>
