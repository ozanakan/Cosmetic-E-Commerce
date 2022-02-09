<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel.Master" AutoEventWireup="true" CodeBehind="AdminPanelMusteriler.aspx.cs" Inherits="KUMSALKOZMETIK.UI.WEB.AdminPanelMusteriler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title" style="padding-top: 0px; padding-bottom: 0px; margin-top: -8px; margin-bottom: 7px;">
                <h2>Üst Kategori</h2>
                <ul class="nav navbar-right panel_toolbox" style="min-width: 0px !important;">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_content">
                        <div class="row">
                            <form class="form-horizontal form-label-left col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label small  col-md-4 col-sm-4 col-xs-12">Id:</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input type="text" id="txt_mus_id" class="form-control input-sm" disabled="disabled" placeholder="" />
                                    </div>
                                </div>
                            </form>
                            <form class="form-horizontal form-label-left col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label small  col-md-4 col-sm-4 col-xs-12">Ad:</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input type="text" id="txt_mus_ad_soyad" class="form-control input-sm" placeholder="" />
                                    </div>
                                </div>
                            </form>

                            <form class="form-horizontal form-label-left col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label small  col-md-4 col-sm-4 col-xs-12">Kullanıcı Adı:</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input type="text" id="txt_mus_kullanici_adi" class="form-control input-sm" placeholder="" />
                                    </div>
                                </div>
                            </form>

                            <form class="form-horizontal form-label-left col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label small  col-md-4 col-sm-4 col-xs-12">Telefon No:</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input type="text" id="txt_mus_telefon" class="form-control input-sm" placeholder="" />
                                    </div>
                                </div>
                            </form>

                            <form class="form-horizontal form-label-left col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label small  col-md-4 col-sm-4 col-xs-12">Adres:</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input type="text" id="txt_mus_adres" class="form-control input-sm" placeholder="" />
                                    </div>
                                </div>
                            </form>

                            <form class="form-horizontal form-label-left col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label small  col-md-4 col-sm-4 col-xs-12">Şirket:</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input type="text" id="txt_mus_sirket" class="form-control input-sm" placeholder="" />
                                    </div>
                                </div>
                            </form>

                            <form class="form-horizontal form-label-left col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label small  col-md-4 col-sm-4 col-xs-12">Eposta:</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input type="text" id="txt_mus_eposta" class="form-control input-sm" placeholder="" />
                                    </div>
                                </div>
                            </form>


                            <form class="form-horizontal form-label-left col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label small  col-md-4 col-sm-4 col-xs-12">Şifre:</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input type="text" id="txt_mus_sifre" class="form-control input-sm" placeholder="" />
                                    </div>
                                </div>
                            </form>

                            <form class="form-horizontal form-label-left col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label small  col-md-4 col-sm-4 col-xs-12">Müşterim:</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">

                                        <select id="txt_mus_musterim" class="form-control input-sm">
                                            <option value="0">Müşterim Değil</option>
                                            <option value="1">Müşterim</option>
                                        </select>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <br />
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-10 col-sm-12 col-xs-12" style="padding-left: 75px;">
                                    <button id="btn_save" type="button" class="btn-sm btn-primary" style="height: 30px">
                                        <span class="glyphicon glyphicon-floppy-save"></span>&nbsp;Kaydet/Guncelle
                                    </button>
                                    <button id="btn_delete" type="button" class="btn-sm btn-danger" style="height: 30px">
                                        <span class="glyphicon glyphicon-trash"></span>&nbsp;Sil
                                    </button>
                                    <button id="btn_clear" type="button" class="btn-sm btn-default" style="height: 30px">
                                        <span class="glyphicon glyphicon-remove"></span>&nbsp;Temizle
                                    </button>
                                </div>
                            </div>
                        </div>

                        <div class="row col-md-12 col-sm-6 col-xs-12">
                            <table id="TR_Musteri" class="table table-bordered" style="width: 100%;">
                                <thead style="background-color: #eeeeee;">
                                    <tr>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b>Id</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b>Ad-Soyad</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b>Şirket</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b>Kullanıcı</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b>Telefon</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b>Adres</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b>Eposta</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b>Sifre</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b>Musterim</b></span></a></th>

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
    <script src="js_custom/AdminPanelMusteriler.js"></script>
</asp:Content>
