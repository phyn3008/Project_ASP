<%@ Page Title="" Language="C#" MasterPageFile="~/PageNguoiDung.Master" AutoEventWireup="true" CodeBehind="DatBan.aspx.cs" Inherits="WebQLNhaHang.DatBan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="NoiDungDatBan" ContentPlaceHolderID="NoiDung" runat="server">
        <div class="container">

                <div class="bancha">
            <asp:DataList ID="dtXemBan" runat="server" DataSourceID="dsBan" DataKeyField="MaBan" RepeatColumns="3">
                <ItemTemplate>
                    TÌNH TRẠNG: <asp:Label ID="lbTinhtrang" runat="server" Text=""> <%# (Boolean)Eval("TinhTrang") ? "Hết bàn" : "Trống bàn"%></asp:Label>
                    <div class="bancon"> 
                        <a href='<%# Eval("MaBan","CTDatBan.aspx?MaBan={0}") %>'>
                            <div>
                                BÀN: <%# Eval("MaBan") %> <br /> 
                            </div>
                        </a>
                    </div> 
                </ItemTemplate>
            </asp:DataList>
         <asp:SqlDataSource ID="dsBan" runat="server" ConnectionString="<%$ ConnectionStrings:QLNH_ASPConnectionString %>" SelectCommand="SELECT * FROM [Ban]"></asp:SqlDataSource>
        
        
        
        </div>

        </div>
</asp:Content>
