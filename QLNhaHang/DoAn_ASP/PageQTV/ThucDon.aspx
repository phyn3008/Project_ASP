<%@ Page Title="" Language="C#" MasterPageFile="~/PageQTV/PageQTV.Master" AutoEventWireup="true" CodeBehind="ThucDon.aspx.cs" Inherits="DoAn_ASP.PageQTV.ThucDon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTinhTrang" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphThucDon" runat="server">
    <div class="data_items">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#xemthucdon">Xem Thực Đơn</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#themmonan">Thêm Món Ăn</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#datmonmangve">Khác</a>
            </li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div id="xemthucdon" class="container tab-pane active">
                <br>
                <asp:SqlDataSource ID="dsloai" runat="server" ConnectionString="<%$ ConnectionStrings:QLNH_ASPConnectionString %>" SelectCommand="SELECT * FROM [PhanLoai]"></asp:SqlDataSource>
                <div class="xemthucdon">
                    <hr />
                    <div class="form-horizontal">
                        <div class="form-inline">
                            <label class="control-label col-sm-2">Danh Mục Món Ăn:</label>
                            <div class="col-md-2">
                                <asp:DropDownList Width="200px" ID="ddlloaimonan" CssClass="form-control" runat="server" DataTextField="TenPL" DataValueField="MaPL" AutoPostBack="True" DataSourceID="dsloai"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <asp:SqlDataSource ID="dsthucdontheoloai" runat="server" ConnectionString="<%$ ConnectionStrings:QLNH_ASPConnectionString %>" DeleteCommand="DELETE FROM [Menu] WHERE [MaMA] = @MaMA" InsertCommand="INSERT INTO [Menu] ([MaMA], [MaPL], [TenMA], [DonGiaSP], [HinhAnh], [MieuTa], [CoSan]) VALUES (@MaMA, @MaPL, @TenMA, @DonGiaSP, @HinhAnh, @MieuTa, @CoSan)" SelectCommand="SELECT * FROM [Menu] WHERE ([MaPL] = @MaPL)" UpdateCommand="UPDATE [Menu] SET [MaPL] = @MaPL, [TenMA] = @TenMA, [DonGiaSP] = @DonGiaSP, [HinhAnh] = @HinhAnh, [MieuTa] = @MieuTa, [CoSan] = @CoSan WHERE [MaMA] = @MaMA">
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
                            <asp:ControlParameter ControlID="ddlloaimonan" DefaultValue="MaPL" Name="MaPL" PropertyName="SelectedValue" Type="String" />
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
                    <div class="data_items">
                        <asp:Repeater ID="rptxemthucdon" runat="server" DataSourceID="dsthucdontheoloai">
                            <ItemTemplate>
                                <div class="item">
                                    <div class="i">
                                        <a href="#">
                                            <img src='<%# Eval("HinhAnh","../Images/{0}") %>' />
                                        </a>
                                    </div>
                                    <div class="t">
                                        <asp:Label ID="lbltenma" runat="server" Text='<%# Eval("TenMA") %>'></asp:Label>
                                        <br />
                                        Giá:
                                        <asp:Label ID="lblgiaban" CssClass="vn" runat="server" Text='<%# Eval("DonGiaSP","{0: #,##0 VNĐ}") %>'></asp:Label>
                                        <br />
                                        <a href='<%# Eval("mama","ThayDoi.aspx?mama={0}") %>' class="btn btn-success">Thay Đổi
                                        </a>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                </div>

            </div>
            <div id="themmonan" class="container tab-pane fade">
                <div class="container py-3">
                    <div class="row py-3">
                        <asp:Label CssClass="col-3 text-right" ID="Label1" runat="server" Text="Mã Món Ăn: "></asp:Label>
                        <asp:TextBox CssClass="col-3" ID="txtMaMA" runat="server"></asp:TextBox>
                        <asp:Label CssClass="col-3 text-right" ID="Label2" runat="server" Text="Tên Món Ăn: "></asp:Label>
                        <asp:TextBox CssClass="col-3" ID="txttenMA" runat="server"></asp:TextBox>
                    </div>
                    <div class="row py-3">
                        <asp:Label CssClass="col-3 text-right" ID="Label3" runat="server" Text="Loại Món Ăn: "></asp:Label>
                        <asp:DropDownList CssClass="col-3" Width="200px" ID="ddlthemma" runat="server" DataTextField="TenPL" DataValueField="MaPL" DataSourceID="dsloai"></asp:DropDownList>
                        <asp:Label CssClass="col-3 text-right" ID="Label4" runat="server" Text="Đơn Giá: "></asp:Label>
                        <asp:TextBox CssClass="col-3" ID="txtdongia" runat="server"></asp:TextBox>
                    </div>
                    <div class="row py-3">
                        <asp:Label CssClass="col-3 text-right" ID="Label5" runat="server" Text="Hình Ảnh: "></asp:Label>
                        <asp:FileUpload CssClass="col-3 pr-0 pl-0" ID="fulhinhanh" runat="server" />              
                        <asp:Label CssClass="col-3 text-right" ID="Label6" runat="server" Text="Miêu Tả: "></asp:Label>
                        <asp:TextBox CssClass="col-3" ID="txtmieuta" runat="server"></asp:TextBox>                    </div>
                   
                    <div class="text-right mt-3">
                        <asp:Button ID="btnthemmonan" CssClass="btn btn-success" runat="server" Text="Thêm Món Ăn"  OnClick="btnthemmonan_Click"/>
                        <asp:Label ID="lblthongbao" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </div>
                </div>

            </div>
            <div id="datmonmangve" class="container tab-pane fade">
                <br>
                <h3>ĐẶT MÓN MANG VỀ</h3>
                <p>chuyển sang trang đặt món mang về</p>

            </div>
        </div>
    </div>
</asp:Content>
