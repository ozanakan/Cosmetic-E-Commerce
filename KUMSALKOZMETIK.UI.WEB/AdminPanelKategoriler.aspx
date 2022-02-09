<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel.Master" AutoEventWireup="true" CodeBehind="AdminPanelKategoriler.aspx.cs" Inherits="KUMSALKOZMETIK.UI.WEB.AdminPanelKategoriler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title" style="padding-top: 0px; padding-bottom: 0px; margin-top: -8px; margin-bottom: 7px;">
                <h2>Marka</h2>
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
                                    <label class="control-label small  col-md-4 col-sm-4 col-xs-12">Id</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input type="text" id="txt_id_marka" class="form-control input-sm" disabled="disabled" placeholder="" />
                                    </div>
                                </div>
                            </form>
                            <form class="form-horizontal form-label-left col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label small  col-md-4 col-sm-4 col-xs-12">Marka</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input type="text" id="txt_marka" class="form-control input-sm" placeholder="" />
                                    </div>
                                </div>
                            </form>
                        </div>
                        <br />
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-10 col-sm-12 col-xs-12" style="padding-left: 75px;">
                                    <button id="btn_save_marka" type="button" class="btn-sm btn-primary" style="height: 30px">
                                        <span class="glyphicon glyphicon-floppy-save"></span>&nbsp;Kaydet/Guncelle
                                    </button>
                                    <button id="btn_delete_marka" type="button" class="btn-sm btn-danger" style="height: 30px">
                                        <span class="glyphicon glyphicon-trash"></span>&nbsp;Sil
                                    </button>
                                    <button id="btn_clear_marka" type="button" class="btn-sm btn-default" style="height: 30px">
                                        <span class="glyphicon glyphicon-remove"></span>&nbsp;Temizle
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="row col-md-6 col-sm-6 col-xs-12">
                            <table id="tblMarka" class="table table-bordered" style="width: 100%;">
                                <thead style="background-color: #eeeeee;">
                                    <tr>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b>Id</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b>Marka</b></span></a></th>
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
                                    <label class="control-label small  col-md-4 col-sm-4 col-xs-12">Id</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input type="text" id="txt_id_ust" class="form-control input-sm" disabled="disabled" placeholder="" />
                                    </div>
                                </div>
                            </form>
                            <form class="form-horizontal form-label-left col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label small  col-md-4 col-sm-4 col-xs-12">Üst Kategori</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input type="text" id="txt_kategori_ust" class="form-control input-sm" placeholder="" />
                                    </div>
                                </div>
                            </form>
                        </div>
                        <br />
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-10 col-sm-12 col-xs-12" style="padding-left: 75px;">
                                    <button id="btn_save_ust" type="button" class="btn-sm btn-primary" style="height: 30px">
                                        <span class="glyphicon glyphicon-floppy-save"></span>&nbsp;Kaydet/Guncelle
                                    </button>
                                    <button id="btn_delete_ust" type="button" class="btn-sm btn-danger" style="height: 30px">
                                        <span class="glyphicon glyphicon-trash"></span>&nbsp;Sil
                                    </button>
                                    <button id="btn_clear_ust" type="button" class="btn-sm btn-default" style="height: 30px">
                                        <span class="glyphicon glyphicon-remove"></span>&nbsp;Temizle
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="row col-md-6 col-sm-6 col-xs-12">
                            <table id="TR_Main_Ust" class="table table-bordered" style="width: 100%;">
                                <thead style="background-color: #eeeeee;">
                                    <tr>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b>Id</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b>Üst Kategori</b></span></a></th>
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
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title" style="padding-top: 0px; padding-bottom: 0px; margin-top: -8px; margin-bottom: 7px;">
                <h2>Kategori</h2>
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
                                    <label class="control-label small  col-md-4 col-sm-4 col-xs-12">Id</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input type="text" id="txt_id_kategori" class="form-control input-sm" disabled="disabled" placeholder="" />
                                    </div>
                                </div>
                            </form>
                            <form class="form-horizontal form-label-left col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label small  col-md-4 col-sm-4 col-xs-12">Üst Kategori</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input type="text" id="txt_ust_kategori_id" class="form-control input-sm" placeholder="" />
                                    </div>
                                </div>
                            </form>
                            <form class="form-horizontal form-label-left col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label small  col-md-4 col-sm-4 col-xs-12">Kategori</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input type="text" id="txt_kategori" class="form-control input-sm" placeholder="" />
                                    </div>
                                </div>
                            </form>
                        </div>
                        <br />
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-10 col-sm-12 col-xs-12" style="padding-left: 75px;">
                                    <button id="btn_save_kategori" type="button" class="btn-sm btn-primary" style="height: 30px">
                                        <span class="glyphicon glyphicon-floppy-save"></span>&nbsp;Kaydet/Guncelle
                                    </button>
                                    <button id="btn_delete_kategori" type="button" class="btn-sm btn-danger" style="height: 30px">
                                        <span class="glyphicon glyphicon-trash"></span>&nbsp;Sil
                                    </button>
                                    <button id="btn_clear_kategori" type="button" class="btn-sm btn-default" style="height: 30px">
                                        <span class="glyphicon glyphicon-remove"></span>&nbsp;Temizle
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="row col-md-6 col-sm-6 col-xs-12">
                            <table id="TR_Main" class="table table-bordered" style="width: 100%;">
                                <thead style="background-color: #eeeeee;">
                                    <tr>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><span style="color: #428bca; font-size: 10px"><b>Id</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><span style="color: #428bca; font-size: 10px"><b>Üst Kategori</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><span style="color: #428bca; font-size: 10px"><b>Kategori</b></span></a></th>
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
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title" style="padding-top: 0px; padding-bottom: 0px; margin-top: -8px; margin-bottom: 7px;">
                <h2>Alt Kategori</h2>
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
                                    <label class="control-label small  col-md-4 col-sm-4 col-xs-12">Id</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input type="text" id="txt_id_alt_kategori" class="form-control input-sm" disabled="disabled" placeholder="" />
                                    </div>
                                </div>
                            </form>
                            <form class="form-horizontal form-label-left col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label small  col-md-4 col-sm-4 col-xs-12">Kategori</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input type="text" id="txt_ust_alt_kategori_id" class="form-control input-sm" placeholder="" />
                                    </div>
                                </div>
                            </form>
                            <form class="form-horizontal form-label-left col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label small  col-md-4 col-sm-4 col-xs-12">Alt Kategori</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input type="text" id="txt_alt_kategori" class="form-control input-sm" placeholder="" />
                                    </div>
                                </div>
                            </form>
                        </div>
                        <br />
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-10 col-sm-12 col-xs-12" style="padding-left: 75px;">
                                    <button id="btn_save_alt" type="button" class="btn-sm btn-primary" style="height: 30px">
                                        <span class="glyphicon glyphicon-floppy-save"></span>&nbsp;Kaydet/Guncelle
                                    </button>
                                    <button id="btn_delete_alt" type="button" class="btn-sm btn-danger" style="height: 30px">
                                        <span class="glyphicon glyphicon-trash"></span>&nbsp;Sil
                                    </button>
                                    <button id="btn_clear_alt" type="button" class="btn-sm btn-default" style="height: 30px">
                                        <span class="glyphicon glyphicon-remove"></span>&nbsp;Temizle
                                    </button>

                                </div>
                            </div>
                        </div>
                        <div class="row col-md-6 col-sm-6 col-xs-12">
                            <table id="TR_Main_Alt" class="table table-bordered" style="width: 100%;">
                                <thead style="background-color: #eeeeee;">
                                    <tr>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b>Id</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b>Kategori</b></span></a></th>
                                        <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b>Alt Kategori</b></span></a></th>
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
    <script src="js_custom/AdminPanelKategoriler.js"></script>
</asp:Content>
