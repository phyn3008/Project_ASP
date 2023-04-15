<%@ Page Title="" Language="C#" MasterPageFile="~/PageNguoiDung/PageNguoiDung.Master" AutoEventWireup="true" CodeBehind="DatBan.aspx.cs" Inherits="DoAn_ASP.PageNguoiDung.DatBan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoiDung" runat="server">
    <div class="container">
        <div class="bancha">
            <asp:DataList ID="dtXemBan" runat="server" DataSourceID="dsBan" DataKeyField="MaBan" RepeatColumns="3">
                <ItemTemplate>
                    TÌNH TRẠNG:
                    <asp:Label ID="lbTinhtrang" runat="server" Text=""> <%# (Boolean)Eval("TinhTrang") ? "Hết bàn" : "Trống bàn" %></asp:Label>
                    <div class="bancon">
<%--                        <a class="disabled" href='<%# Eval("MaBan","CTDatBan.aspx?MaBan={0}") %>'></a>--%>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="<%# (Boolean)Eval("TinhTrang")==true ? "#modal-banhet" : "#exampleModal"%>" data-whatever="@mdo">BÀN: <%# Eval("MaBan") %><br />
                        </button>
                        
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="dsBan" runat="server" ConnectionString="<%$ ConnectionStrings:QLNH_ASPConnectionString %>" SelectCommand="SELECT * FROM [Ban]"></asp:SqlDataSource>
        </div>
        <div class="modal" id="modal-banhet" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">THÔNG TIN</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>BÀN NÀY KHÔNG CÒN VUI LÒNG CHỌN BÀN KHÁC</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="modal-title" id="exampleModalLabel" style="font-weight: bold">THÔNG TIN ĐẶT BÀN</h2>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="form1" runat="server">
                            <div class="form-group">
                                <label class="col-form-label">Họ Và Tên</label>
                                <asp:TextBox ID="txtTenKH" class="form-controls" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvTenKH" runat="server" ErrorMessage="Vui Lòng Không Để Trống Tên Khách Hàng" ControlToValidate="txtTenKH" Text="(*)"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Số Điện Thoại</label>
                                <asp:TextBox ID="txtSDT" runat="server" class="form-controls" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvSDT" runat="server" ErrorMessage="Vui Lòng Không Để Trống Số Điện Thoại" ControlToValidate="txtSDT" Text="(*)" ></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revSDT" runat="server" ErrorMessage="Sai Định Dạng SĐT" ControlToValidate="txtSDT" ValidationExpression="0\d{9}" Text="(*)"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Giới Tính &nbsp</label>
                                <asp:RadioButton ID="rdNam" GroupName="gioiTinh" Text="Nam" Checked="true" runat="server" />
                                <asp:RadioButton ID="rdNu" GroupName="gioiTinh" Text="Nữ" runat="server" />

                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Ngày Muốn Đặt</label>
                                <asp:Calendar  ID="cldNgayDat" runat="server"></asp:Calendar>
                            </div>

                            <div class="form-group">
                                <label class="col-form-label">Ghi Chú</label>
                                <asp:TextBox ID="txtGhiChu" runat="server"></asp:TextBox>
                            </div>
                            <asp:Label ID="TongHopLoi" runat="server" Text="">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                            </asp:Label>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                
                                <asp:Button ID="btnDatBan" runat="server" Text="Đặt Bàn" CssClass="btn btn-primary" OnClick="btnDatBan_Click" />
                            </div>
                            </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="dsCTDatBan" runat="server" ConnectionString="<%$ ConnectionStrings:QLNH_ASPConnectionString %>" SelectCommand="SELECT * FROM [Ban] WHERE ([MaBan] = @MaBan)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="1" Name="MaBan" QueryStringField="MaBan" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
