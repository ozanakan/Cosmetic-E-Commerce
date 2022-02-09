<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel.Master" AutoEventWireup="true" CodeBehind="AdminPanelUrunler.aspx.cs" Inherits="KUMSALKOZMETIK.UI.WEB.AdminPanelUrunler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title" style="padding-top: 0px; padding-bottom: 0px; margin-top: -8px; margin-bottom: 7px;">
                <h2>URUNLER</h2>
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
                                        <input type="text" id="txt_urun_id" class="form-control input-sm" disabled="disabled" placeholder="" />
                                    </div>
                                </div>
                            </form>

                            <form class="form-horizontal form-label-left col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label small  col-md-4 col-sm-4 col-xs-12">Ad:</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input type="text" id="txt_urun_adi" class="form-control input-sm" placeholder="" />
                                    </div>
                                </div>
                            </form>



                            <form class="form-horizontal form-label-left col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label small  col-md-4 col-sm-4 col-xs-12">Marka:</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <select id="txt_urun_marka" class="form-control input-sm">
                                        </select>
                                    </div>
                                </div>
                            </form>

                            <form class="form-horizontal form-label-left col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label small  col-md-4 col-sm-4 col-xs-12">Kategori:</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <select id="txt_urun_kategori" class="form-control input-sm">
                                        </select>
                                    </div>
                                </div>
                            </form>

                            <form class="form-horizontal form-label-left col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label small  col-md-4 col-sm-4 col-xs-12">Gramaj:</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input type="text" id="txt_urun_gramaj" class="form-control input-sm" placeholder="" />
                                    </div>
                                </div>
                            </form>

                            <form class="form-horizontal form-label-left col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label small  col-md-4 col-sm-4 col-xs-12">Fiyat:</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input type="text" id="txt_urun_fiyat" class="form-control input-sm" placeholder="" />
                                    </div>
                                </div>
                            </form>

                            <form class="form-horizontal form-label-left col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label small  col-md-4 col-sm-4 col-xs-12">İndirim:</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input type="text" id="txt_urun_indirim" class="form-control input-sm" placeholder="" />
                                    </div>
                                </div>
                            </form>


                            <form class="form-horizontal form-label-left col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label small  col-md-4 col-sm-4 col-xs-12">Yeni:</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input type="text" id="txt_urun_yeni" class="form-control input-sm" placeholder="" />
                                    </div>
                                </div>
                            </form>

                            <form class="form-horizontal form-label-left col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label small  col-md-4 col-sm-4 col-xs-12">Stok:</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input type="text" id="txt_urun_stok" class="form-control input-sm" placeholder="" />
                                    </div>
                                </div>
                            </form>



                            <form class="form-horizontal form-label-left col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label small  col-md-4 col-sm-4 col-xs-12">İndirim Yüzdesi:</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input type="text" id="txt_urun_indirim_yuzde" class="form-control input-sm" placeholder="" />
                                    </div>
                                </div>
                            </form>

                            <form class="form-horizontal form-label-left col-md-4 col-sm-12 col-xs-12">
                                <label class="control-label small  col-md-4 col-sm-4 col-xs-12">Resim:</label>
                                <div class="col-md-8 col-sm-8 col-xs-12">
                                    <div class="input-group">
                                        <input type="text" id="txt_dosya_adi" filename="" class="form-control input-sm" style="height: 25px" disabled="disabled" placeholder="Dosya Adı..." />
                                        <span class="input-group-btn">
                                            <button id="btn_dosya_sec" class="btn btn-success btn-sm" style="height: 25px; padding-top: 3px;" type="button">Dosya Seç</button>
                                        </span>
                                    </div>
                                </div>
                            </form>

                            <input id="btn_File" type="file" name="file" style="display: none;" />

                            <form class="form-horizontal form-label-left col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label small  col-md-4 col-sm-4 col-xs-12">Indirimli Fiyat:</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input type="text" id="txt_urun_indirim_fiyat" class="form-control input-sm" placeholder="" />
                                    </div>
                                </div>
                            </form>

                            <form class="form-horizontal form-label-left col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label small  col-md-4 col-sm-4 col-xs-12">Ürün Detayı:</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input type="text" id="txt_urun_detay" class="form-control input-sm" placeholder="" />
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
                            <table id="TR_MainTaskTable" class="table table-bordered" style="width: 100%;">
                                <thead style="background-color: #eeeeee;">
                                    <tr>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a shorttype_maintable="" short_maintable="UR_ID"><span style="color: #428bca; font-size: 10px"><b>Id</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a shorttype_maintable="" short_maintable="UR_AD"><span style="color: #428bca; font-size: 10px"><b>Ad</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a shorttype_maintable="" short_maintable="UR_URUN_DETAYI"><span style="color: #428bca; font-size: 10px"><b>Ürün Detayı</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a shorttype_maintable="" short_maintable="UR_MARKA"><span style="color: #428bca; font-size: 10px"><b>Marka</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a shorttype_maintable="" short_maintable="UR_KATEGORI"><span style="color: #428bca; font-size: 10px"><b>Kategori</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a shorttype_maintable="" short_maintable="UR_GRAMAJ"><span style="color: #428bca; font-size: 10px"><b>Gramaj</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a shorttype_maintable="" short_maintable="UR_FIYAT"><span style="color: #428bca; font-size: 10px"><b>Fiyat</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a shorttype_maintable="" short_maintable="UR_INDIRIM"><span style="color: #428bca; font-size: 10px"><b>İndirim</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a shorttype_maintable="" short_maintable="UR_YENI"><span style="color: #428bca; font-size: 10px"><b>Yeni</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a shorttype_maintable="" short_maintable="UR_STOK"><span style="color: #428bca; font-size: 10px"><b>Stok</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a shorttype_maintable="" short_maintable="UR_RESIM_URL"><span style="color: #428bca; font-size: 10px"><b>Resim-Url</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a shorttype_maintable="" short_maintable="UR_INDIRIM_YUZDE"><span style="color: #428bca; font-size: 10px"><b>İndirim Yüzdesi</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a shorttype_maintable="" short_maintable="UR_FIYAT_INDIRIMLI"><span style="color: #428bca; font-size: 10px"><b>İndirimli Fiyat</b></span></a></th>
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
    <script src="js_custom/AdminPanelUrunler.js"></script>
</asp:Content>
