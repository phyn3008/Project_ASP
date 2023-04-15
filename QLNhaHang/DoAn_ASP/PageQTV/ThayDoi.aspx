<%@ Page Title="" Language="C#" MasterPageFile="~/PageQTV/PageQTV.Master" AutoEventWireup="true" CodeBehind="ThayDoi.aspx.cs" Inherits="DoAn_ASP.PageQTV.ThayDoi" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cphThucDon" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QLNH_ASPConnectionString %>" DeleteCommand="DELETE FROM [Menu] WHERE [MaMA] = @MaMA" InsertCommand="INSERT INTO [Menu] ([MaMA], [MaPL], [TenMA], [DonGiaSP], [HinhAnh], [MieuTa], [CoSan]) VALUES (@MaMA, @MaPL, @TenMA, @DonGiaSP, @HinhAnh, @MieuTa, @CoSan)" SelectCommand="SELECT * FROM [Menu] WHERE ([MaMA] = @MaMA)" UpdateCommand="UPDATE [Menu] SET [MaPL] = @MaPL, [TenMA] = @TenMA, [DonGiaSP] = @DonGiaSP, [HinhAnh] = @HinhAnh, [MieuTa] = @MieuTa, [CoSan] = @CoSan WHERE [MaMA] = @MaMA">
        <DeleteParameters>
            <asp:Parameter Name="MaMA" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MaMA" Type="String" />
            <asp:Parameter Name="MaPL" Type="String" />
            <asp:Parameter Name="TenMA" Type="String" />
            <asp:Parameter Name="DonGiaSP" Type="Int32" />
            <asp:Parameter Name="HinhAnh" Type="String" />
            <asp:Parameter Name="MieuTa" Type="String" />
            <asp:Parameter Name="CoSan" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="A10" Name="MaMA" QueryStringField="mama" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="MaPL" Type="String" />
            <asp:Parameter Name="TenMA" Type="String" />
            <asp:Parameter Name="DonGiaSP" Type="Int32" />
            <asp:Parameter Name="HinhAnh" Type="String" />
            <asp:Parameter Name="MieuTa" Type="String" />
            <asp:Parameter Name="CoSan" Type="Boolean" />
            <asp:Parameter Name="MaMA" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div style="width: 80%; margin: 0 auto;">
        <h2>Thay Đổi Thông Tin Món Ăn</h2>
        <br />

        <div id="hinhanh" style="width: 45%; float: left;">
            <asp:Image ID="hinh" runat="server" Width="100%" />
        </div>
        <div id="thongtin" style="width: 50%; float: right">
            <div class="pb-3" style="width: 100%">
                <asp:Label ID="Label1" runat="server" Text="Tên Món Ăn:"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txttenma" runat="server"></asp:TextBox>
            </div>
            <div class="pb-3">
                <asp:Label ID="Label2" runat="server" Text="Đơn Giá:"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtdongia" runat="server"></asp:TextBox>
            </div>
            <div class="pb-3">
                <asp:Label ID="Label3" runat="server" Text="Comment: "></asp:Label>
                <br />
                <asp:TextBox Width="100%" Height="150px" ID="txtmieuta" runat="server"></asp:TextBox>
            </div>
            <div class="pb-3" style="text-align: center">
                <asp:Button CssClass="btn btn-success" ID="btnthaydoi" runat="server" Text="Thay Đổi" OnClick="btnthaydoi_Click" Style="width: 100px" />
                <asp:Button CssClass="btn btn-danger" ID="btnXoa" runat="server" Text="Xóa" OnClick="btnXoa_Click" Style="width: 100px" />
            </div>

        </div>

    </div>

</asp:Content>
