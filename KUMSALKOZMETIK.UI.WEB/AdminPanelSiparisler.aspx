<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel.Master" AutoEventWireup="true" CodeBehind="AdminPanelSiparisler.aspx.cs" Inherits="KUMSALKOZMETIK.UI.WEB.AdminPanelSiparisler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="col-md-5 col-sm-5 col-xs-12">
        <div class="x_panel">
            <div class="x_title" style="padding-top: 0px; padding-bottom: 0px; margin-top: -8px; margin-bottom: 7px;">
                <h2>Siparişler</h2>
                <ul class="nav navbar-right panel_toolbox" style="min-width: 0px !important;">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_content">
                        <div class="row col-md-12 col-sm-6 col-xs-12">
                            <table id="TR_Siparis" class="table table-bordered" style="width: 100%;">
                                <thead style="background-color: #eeeeee;">
                                    <tr>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b></b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b>Id</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b>Ad Soyad</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b>Şirket</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b>Toplam Urun</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b>Tutar</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b>Sipariş Tarihi</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b>Durum</b></span></a></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="tableheadcolumn" colspan="6" style="text-align: center">-Kayıt Yok-</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-7 col-sm-7 col-xs-12">
        <div class="x_panel">
            <div class="x_title" style="padding-top: 0px; padding-bottom: 0px; margin-top: -8px; margin-bottom: 7px;">
                <h2>Sipariş Detayı</h2>
                <ul class="nav navbar-right panel_toolbox" style="min-width: 0px !important;">
                    <li>
                        <select id="slc_durum" style="margin-top: 7px; margin-right: 11px;">
                            <option value="0">İptal Edildi</option>
                            <option value="1">Sipariş Alındı</option>
                            <option value="2">Ürün Hazırlanıyor</option>
                            <option value="3">Ürün Temin Ediliyor</option>
                            <option value="4">Kargoya Verildi</option>
                            <option value="5">Tamamlandı</option>
                        </select>
                    </li>
                    <li>
                        <a class="collapse-link"><i class="fa fa-chevron-up"></i></a> 
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_content">
                        <div class="row col-md-12 col-sm-6 col-xs-12">
                            <table id="TR_Maintable_Detay" class="table table-bordered" style="width: 100%;">
                                <thead style="background-color: #eeeeee;">
                                    <tr>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b>Id</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b>Urun</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b>Adet</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b>Fiyat</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b>Toplam</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b>Not</b></span></a></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="tableheadcolumn" colspan="6" style="text-align: center">-Kayıt Yok-</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    <script src="js_custom/AdminPanelSiparisler.js"></script>
</asp:Content>

