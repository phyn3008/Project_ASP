<%@ Page Title="" Language="C#" MasterPageFile="~/PageQTV/PageQTV.Master" AutoEventWireup="true" CodeBehind="TinhTrang.aspx.cs" Inherits="DoAn_ASP.PageQTV.TinhTrang" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cphTinhTrang" runat="server">
    <asp:SqlDataSource ID="dsban" runat="server" ConnectionString="<%$ ConnectionStrings:QLNH_ASPConnectionString %>" DeleteCommand="DELETE FROM [Ban] WHERE [MaBan] = @MaBan" InsertCommand="INSERT INTO [Ban] ([MaBan], [TinhTrang], [MaDat]) VALUES (@MaBan, @TinhTrang, @MaDat)" SelectCommand="SELECT [MaBan], [TinhTrang], [MaDat] FROM [Ban]" UpdateCommand="UPDATE [Ban] SET [TinhTrang] = @TinhTrang, [MaDat] = @MaDat WHERE [MaBan] = @MaBan">
        <DeleteParameters>
            <asp:Parameter Name="MaBan" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MaBan" Type="String" />
            <asp:Parameter Name="TinhTrang" Type="Boolean" />
            <asp:Parameter Name="MaDat" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TinhTrang" Type="Boolean" />
            <asp:Parameter Name="MaDat" Type="String" />
            <asp:Parameter Name="MaBan" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="data_items" style="width: 80%">
        <asp:Repeater ID="rptBan" runat="server" DataSourceID="dsban">
            <ItemTemplate>
                <div class="item">
                    <div class="i">
                        <a href="#">
                            <img src="../img/caiban.jpg" />
                        </a>
                    </div>
                    <div class="t">
                        Bàn:
                            <asp:Label ID="lbltenhoa" runat="server" Text='<%# Eval("Maban") %>'></asp:Label>
                        <br />
                        Tình Trạng:
                            <asp:Label ID="lblgiaban" CssClass="vn" runat="server" Text='<%# Eval("Tinhtrang") %>'></asp:Label>
                        <br />
                        <a href="#" class="btn btn-success">Tính Tiền
                        </a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
