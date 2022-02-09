<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel.Master" AutoEventWireup="true" CodeBehind="AdminPaneli.aspx.cs" Inherits="KUMSALKOZMETIK.UI.WEB.AdminPaneli" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/toastr.css" rel="stylesheet" />
</head>
<body>
    <div class="container" style="width: 100%;">
        <div class="alert alert-error" id="messageBox" style="min-height: 30px; height: auto; padding: 5px; display: none;">
            <button type="button" class="close" aria-hidden="true" id="closeMessageBtn">&times;</button>
            <div id="message"></div>
        </div>
        <br />
        <ul id="myTab" class="nav nav-tabs">
            <li><a href="#UrunEkle" data-toggle="tab">Ürün Ekle</a></li>
            <li><a href="#Musteriler" data-toggle="tab">Müşteriler</a></li>
            <li><a href="#Siparişler" data-toggle="tab">Siparişler</a></li>
            <li><a href="#Iletişim" data-toggle="tab">İletişim</a></li>
            <li><a href="#Kategori" data-toggle="tab">Kategoriler-Menüler</a></li>

        </ul>
        <div class="tab-content" style="height: auto; padding-top: 5px">
            <div class="tab-pane active" id="UrunEkle">
                <div style="width: 99%; margin-top: 15px; float: left; border: 1px solid #F7F7F0">
                    <div class="well" style="background: white; width: 98%; margin-left: auto; margin-right: auto; margin-top: 20px;">
                        <div style="width: 100%">
                            <table>
                                <tr>
                                    <td style="padding-bottom: 12px; text-align: right; width: 100px">
                                        <b>Ü.Adı:</b>
                                    </td>
                                    <td style="text-align: left; padding-left: 10px; width: 190px">
                                        <input type="text" id="txt_urun_adi" style="height: 30px; width: 190px" class="form-control" clrurun /><br />
                                    </td>
                                    <td style="padding-bottom: 12px; padding-left: 15px; text-align: right; width: 110px"></td>
                                    <td style="padding-bottom: 12px; text-align: right; width: 100px">
                                        <b>Marka:</b>
                                    </td>
                                    <td style="text-align: left; padding-left: 10px; width: 190px">
                                        <select id="txt_urun_marka" class="form-control" style="height: 31px; margin-top: -10px; width: 190px;" clrurun>
                                        </select>
                                    </td>
                                    <td style="padding-bottom: 12px; padding-left: 15px; text-align: right; width: 110px"></td>
                                    <td style="padding-bottom: 12px; text-align: right; width: 100px">
                                        <b>Kategori:</b>
                                    </td>
                                    <td style="text-align: left; padding-left: 10px; width: 190px">
                                        <select id="txt_urun_kategori" class="form-control" style="height: 31px; margin-top: -10px; width: 190px;" clrurun>
                                        </select>
                                    </td>
                                    <td style="padding-bottom: 12px; padding-left: 15px; text-align: right; width: 110px"></td>
                                    <td style="padding-bottom: 12px; text-align: right; width: 100px">
                                        <b>Gramaj:</b>
                                    </td>
                                    <td style="text-align: left; padding-left: 10px; width: 190px">
                                        <input type="text" id="txt_urun_gramaj" style="height: 30px; width: 190px" class="form-control" clrurun /><br />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-bottom: 12px; text-align: right; width: 100px">
                                        <b>Fiyat :</b>
                                    </td>
                                    <td style="text-align: left; padding-left: 10px; width: 190px">
                                        <input type="text" id="txt_urun_fiyat" style="height: 30px; width: 190px" class="form-control" clrurun /><br />
                                    </td>
                                    <td style="padding-bottom: 12px; padding-left: 15px; text-align: right; width: 110px"></td>
                                    <td style="padding-bottom: 12px; text-align: right; width: 100px">
                                        <b>İndirim :</b>
                                    </td>
                                    <td style="text-align: left; padding-left: 10px; width: 190px">
                                        <input type="text" id="txt_urun_indirim" style="height: 30px; width: 190px" class="form-control" clrurun /><br />
                                    </td>
                                    <td style="padding-bottom: 12px; padding-left: 15px; text-align: right; width: 110px"></td>
                                    <td style="text-align: right; width: 100px">
                                        <b>Yeni:</b>
                                    </td>
                                    <td style="text-align: left; padding-left: 10px; width: 190px">
                                        <input type="checkbox" id="txt_urun_yeni" style="margin-top: -10px" clrurun /><br />
                                    </td>
                                    <td style="padding-bottom: 12px; padding-left: 15px; text-align: right; width: 110px"></td>
                                    <td style="padding-bottom: 12px; text-align: right; width: 100px">
                                        <b>Stok:</b>
                                    </td>
                                    <td style="text-align: left; padding-left: 10px; width: 190px">
                                        <input type="text" id="txt_urun_stok" style="height: 30px; width: 190px" class="form-control" clrurun /><br />
                                    </td>

                                </tr>
                                <tr>
                                    <td style="padding-bottom: 12px; text-align: right; width: 100px">
                                        <b>Resim :</b>
                                    </td>
                                    <td style="text-align: left; padding-left: 10px; width: 190px">
                                        <div class="input-group input-group-sm">
                                            <input type="text" class="form-control" id="txt_urun_resim" clrurun />
                                            <span class="input-group-btn">
                                                <button class="btn btn-sm btn-info" type="button" data-toggle="modal" id="btn_rsm_upload">
                                                    <span class="glyphicon glyphicon-upload"></span>
                                                </button>
                                            </span>
                                        </div>

                                    </td>
                                    <td style="padding-bottom: 12px; padding-left: 15px; text-align: right; width: 110px"></td>
                                    <td style="padding-bottom: 12px; text-align: right; padding-left: 15px; width: 100px">
                                        <b>İndirim Yüzdesi:</b>
                                    </td>
                                    <td style="text-align: left; padding-left: 10px; width: 190px">
                                        <input type="text" id="txt_urun_indirim_yuzde" style="height: 30px; width: 190px" class="form-control" clrurun /><br />
                                    </td>
                                    <td style="padding-bottom: 12px; padding-left: 15px; text-align: right; width: 110px"></td>
                                    <td style="padding-bottom: 12px; text-align: right; padding-left: 15px; width: 100px">
                                        <b>İndirim Fiyat:</b>
                                    </td>
                                    <td style="text-align: left; padding-left: 10px; width: 190px">
                                        <input type="text" id="txt_urun_indirim_fiyat" style="height: 30px; width: 190px" class="form-control" clrurun /><br />
                                    </td>


                                    <td style="padding-bottom: 12px; padding-left: 15px; text-align: right; width: 110px"></td>
                                    <td style="padding-bottom: 12px; text-align: right; width: 100px"></td>
                                    <td style="text-align: left; padding-left: 10px; width: 190px"></td>
                                    <td style="padding-bottom: 12px; padding-left: 15px; text-align: right; width: 110px"></td>
                                    <td style="padding-bottom: 12px; text-align: right; width: 100px"></td>
                                    <td style="text-align: left; padding-left: 10px; width: 190px"></td>
                                    <td style="padding-bottom: 12px; padding-left: 15px; text-align: right; width: 110px"></td>
                                    <td style="padding-bottom: 12px; text-align: right; width: 100px"></td>
                                    <td style="text-align: left; padding-left: 10px; width: 190px"></td>

                                </tr>
                            </table>
                        </div>
                        <div>
                            <div class="row" style="margin-top: 15px; padding-left: 50px; text-align: right">
                                <div class="col-md-4" style="text-align: center;">
                                    <div class="btn-group">
                                        <button type="button" id="btn_save_urun" class="btn btn-primary btn-mini" name="Save" tabindex="10">
                                            <span class="glyphicon glyphicon-floppy-disk"></span>&nbsp;Urun Ekle
                                        </button>
                                        <button type="button" id="btn_delete_urun" class="btn btn-danger btn-mini" name="Delete" tabindex="11">
                                            <span class="glyphicon glyphicon-remove"></span>&nbsp;Urun Sil
                                        </button>
                                        <button type="button" id="btn_clear_urun" class="btn btn-warning btn-mini" name="Clear" tabindex="12">
                                            <span class="glyphicon glyphicon-trash"></span>&nbsp;Temizle
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div style="width: 100%; border: 1px solid #ddd; margin-top: 15px; max-height: 500px; overflow-y: scroll">
                            <table class="table table-bordered" id="tblUrun">
                                <thead>
                                    <tr style="background-color: #EBEBEC">
                                        <th>Id</th>
                                        <th>Urun Adı</th>
                                        <th>Marka</th>
                                        <th>Kategori</th>
                                        <th>Gramaj</th>
                                        <th>Fiyat</th>
                                        <th>İndirim</th>
                                        <th>Yeni</th>
                                        <th>Stok</th>
                                        <th>Resim</th>
                                        <th>İndirim Yüzdesi</th>
                                        <th>İndirimli Fiyatı</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td colspan="10" style="text-align: center">Girilmiş Ürün Yok</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="Musteriler">
                <div style="width: 99%; margin-top: 15px; float: left; border: 1px solid #F7F7F0">
                    <div class="well" style="background: white; width: 98%; margin-left: auto; margin-right: auto; margin-top: 20px;">
                        <div style="width: 100%">
                            <table>
                                <tr>
                                    <td style="padding-bottom: 12px; text-align: right; width: 100px">
                                        <b>ID:</b>
                                    </td>
                                    <td style="text-align: left; padding-left: 10px; width: 190px">
                                        <input type="text" id="txt_mus_id" style="height: 30px; width: 190px" disabled="disabled" class="form-control" clrkullanici /><br />
                                    </td>
                                    <td style="padding-bottom: 12px; padding-left: 15px; text-align: right; width: 110px"></td>
                                    <td style="padding-bottom: 12px; text-align: right; width: 100px">
                                        <b>Ad:</b>
                                    </td>
                                    <td style="text-align: left; padding-left: 10px; width: 190px">
                                        <input type="text" id="txt_mus_ad_soyad" style="height: 30px; width: 190px" class="form-control" clrkullanici /><br />
                                    </td>
                                    <td style="padding-bottom: 12px; padding-left: 15px; text-align: right; width: 110px"></td>
                                    <td style="padding-bottom: 12px; text-align: right; width: 100px">
                                        <b>Kull.Adı:</b>
                                    </td>
                                    <td style="text-align: left; padding-left: 10px; width: 190px">
                                        <input type="text" id="txt_mus_kullanici_adi" style="height: 30px; width: 190px" class="form-control" clrkullanici /><br />
                                    </td>
                                    <td style="padding-bottom: 12px; padding-left: 15px; text-align: right; width: 110px"></td>
                                    <td style="padding-bottom: 12px; text-align: right; width: 100px">
                                        <b>Telefon:</b>
                                    </td>
                                    <td style="text-align: left; padding-left: 10px; width: 190px">
                                        <input type="text" id="txt_mus_telefon" style="height: 30px; width: 190px" class="form-control" clrkullanici /><br />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-bottom: 12px; text-align: right; width: 100px">
                                        <b>Adres :</b>
                                    </td>
                                    <td style="text-align: left; padding-left: 10px; width: 190px">
                                        <input type="text" id="txt_mus_adres" style="height: 30px; width: 190px" class="form-control" clrkullanici /><br />
                                    </td>
                                    <td style="padding-bottom: 12px; padding-left: 15px; text-align: right; width: 110px"></td>
                                    <td style="padding-bottom: 12px; text-align: right; width: 100px">
                                        <b>E-Posta :</b>
                                    </td>
                                    <td style="text-align: left; padding-left: 10px; width: 190px">
                                        <input type="text" id="txt_mus_eposta" style="height: 30px; width: 190px" class="form-control" clrkullanici /><br />
                                    </td>
                                    <td style="padding-bottom: 12px; padding-left: 15px; text-align: right; width: 110px"></td>
                                    <td style="text-align: right; width: 100px">
                                        <b>şifre:</b>
                                    </td>
                                    <td style="text-align: left; padding-left: 10px; width: 190px">
                                        <input type="text" id="txt_mus_şifre" style="height: 30px; width: 190px" class="form-control" clrkullanici /><br />
                                    </td>
                                    <td style="padding-bottom: 12px; padding-left: 15px; text-align: right; width: 110px"></td>
                                    <td style="text-align: right; width: 100px">
                                        <b>Şirket:</b>
                                    </td>
                                    <td style="text-align: left; padding-left: 10px; width: 190px">
                                        <input type="text" id="txt_mus_sirket" style="height: 30px; width: 190px" class="form-control" clrkullanici /><br />
                                    </td>
                                </tr>

                            </table>
                        </div>
                        <div>
                            <div class="row" style="margin-top: 15px; padding-left: 50px; text-align: right">
                                <div class="col-md-4" style="text-align: center;">
                                    <div class="btn-group">
                                        <button type="button" id="btn_save_musteri" class="btn btn-primary btn-mini" name="Save" tabindex="10">
                                            <span class="glyphicon glyphicon-floppy-disk"></span>&nbsp;Urun Ekle
                                        </button>
                                        <button type="button" id="btn_delete_musteri" class="btn btn-danger btn-mini" name="Delete" tabindex="11">
                                            <span class="glyphicon glyphicon-remove"></span>&nbsp;Urun Sil
                                        </button>

                                        <button type="button" id="btn_clear_musteri" class="btn btn-warning btn-mini" name="Clear" tabindex="12">
                                            <span class="glyphicon glyphicon-trash"></span>&nbsp;Temizle
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div style="width: 100%; border: 1px solid #ddd; margin-top: 15px; max-height: 500px; overflow-y: scroll">
                            <table class="table table-bordered" id="tblMusteri">
                                <thead>
                                    <tr style="background-color: #EBEBEC">
                                        <th>Id</th>
                                        <th>Ad-Soyad</th>
                                        <th>Şirket</th>
                                        <th>Kullanıcı Adı</th>
                                        <th>Telefon</th>
                                        <th>Adres</th>
                                        <th>E-Posta</th>
                                        <th>Sifre</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td colspan="8" style="text-align: center">Kayıtlı Müşteri Yok</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="Siparişler">
                <div style="width: 39%; height: 500px; min-height: 500px; overflow-y: scroll; float: left; border: 1px solid #F7F7F0">
                    <table class="table table-bordered" id="tblSiparis">
                        <thead>
                            <tr style="background-color: #EBEBEC">
                                <th>Id</th>
                                <th>Musteri</th>
                                <th>Şirket</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="3" style="text-align: center">Kayıtlı Müşteri Yok</td>
                            </tr>
                        </tbody>
                    </table>
                    <div style="text-align: center;">
                        <div class="btn-group">
                            <button type="button" id="btn_delete_Siparis" class="btn btn-danger btn-mini" name="Delete" tabindex="11">
                                <span class="glyphicon glyphicon-remove"></span>&nbsp;Sil
                            </button>
                        </div>
                    </div>
                </div>
                <div style="width: 59%; height: 500px; min-height: 500px; margin-left: 1%; float: left; border: 1px solid #F7F7F0">
                    <textarea class="form-control" style="height: 100%" id="txt_siparis"></textarea>
                </div>
            </div>
            <div class="tab-pane" id="Iletişim">
                yapım aşamasında
            </div>
            <div class="tab-pane active" id="Kategori">
                <div style="width: 49%; float: left; border: 1px solid #F7F7F0">
                    <div style="width: 50%; min-height: 250px; float: left; max-height: 250px; overflow-y: scroll">
                        <table class="table table-bordered" id="tblKategori" style="width: 100%">
                            <thead>
                                <tr style="background-color: #EBEBEC">
                                    <th class="tableheadcolumn" style="text-align: center">Id</th>
                                    <th class="tableheadcolumn" style="text-align: center">KategoriAlt</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td colspan="8" style="text-align: center">Girilmiş Kategori Yok</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div style="width: 50%; min-height: 250px; float: left; padding: 8px">
                        <table>
                            <tr>
                                <td style="text-align: right;">
                                    <b>KategoriAlt:</b>
                                </td>
                                <td style="text-align: left; padding-left: 10px; padding-top: 20px;">
                                    <input type="text" id="txt_ins_Kategori" style="width: 100%" class="form-control" /><br />
                                </td>
                            </tr>
                        </table>

                        <div style="text-align: center;">
                            <div class="btn-group">
                                <button type="button" id="btn_save_kategori" class="btn btn-primary btn-mini" name="Save" tabindex="10">
                                    <span class="glyphicon glyphicon-floppy-disk"></span>&nbsp;Kaydet
                                </button>
                                <button type="button" id="btn_delete_kategori" class="btn btn-danger btn-mini" name="Delete" tabindex="11">
                                    <span class="glyphicon glyphicon-remove"></span>&nbsp;Sil
                                </button>
                                <button type="button" id="btn_clear_kategori" class="btn btn-warning btn-mini" name="Clear" tabindex="12">
                                    <span class="glyphicon glyphicon-trash"></span>&nbsp;Temizle
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="width: 49%; margin-left: 1%; float: left; border: 1px solid #F7F7F0">
                    <div style="width: 50%; min-height: 250px; float: left; max-height: 250px; overflow-y: scroll;">
                        <table class="table table-bordered" id="tblMarka" style="width: 100%">
                            <thead>
                                <tr style="background-color: #EBEBEC">
                                    <th class="tableheadcolumn" style="text-align: center">Id</th>
                                    <th class="tableheadcolumn" style="text-align: center">Marka</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td colspan="8" style="text-align: center">Girilmiş Marka yok</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div style="width: 50%; min-height: 250px; float: left; padding: 8px">
                        <table>
                            <tr>
                                <td style="text-align: right;">
                                    <b>Marka:</b>
                                </td>
                                <td style="text-align: left; padding-left: 10px; padding-top: 20px;">
                                    <input type="text" id="txt_marka" style="width: 100%" class="form-control" /><br />
                                </td>
                            </tr>
                        </table>

                        <div style="text-align: center;">
                            <div class="btn-group">
                                <button type="button" id="btn_save_marka" class="btn btn-primary btn-mini" name="Save" tabindex="10">
                                    <span class="glyphicon glyphicon-floppy-disk"></span>&nbsp;Kaydet
                                </button>
                                <button type="button" id="btn_delete_marka" class="btn btn-danger btn-mini" name="Delete" tabindex="11">
                                    <span class="glyphicon glyphicon-remove"></span>&nbsp;Sil
                                </button>
                                <button type="button" id="btn_clear_marka" class="btn btn-warning btn-mini" name="Clear" tabindex="12">
                                    <span class="glyphicon glyphicon-trash"></span>&nbsp;Temizle
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div style="width: 49%; margin-top: 2%; float: left; border: 1px solid #F7F7F0">
                    <div style="width: 50%; min-height: 250px; float: left; max-height: 250px; overflow-y: scroll">
                        <table class="table table-bordered" id="tblKategori" style="width: 100%">
                            <thead>
                                <tr style="background-color: #EBEBEC">
                                    <th class="tableheadcolumn" style="text-align: center">Id</th>
                                    <th class="tableheadcolumn" style="text-align: center">KategoriÜst</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td colspan="8" style="text-align: center">Girilmiş Kategori Yok</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div style="width: 50%; min-height: 250px; float: left; padding: 8px">
                        <table>
                            <tr>
                                <td style="text-align: right;">
                                    <b>KategoriÜst:</b>
                                </td>
                                <td style="text-align: left; padding-left: 10px; padding-top: 20px;">
                                    <input type="text" id="txt_ins_Kategori" style="width: 100%" class="form-control" /><br />
                                </td>
                            </tr>
                        </table>

                        <div style="text-align: center;">
                            <div class="btn-group">
                                <button type="button" id="btn_save_kategori" class="btn btn-primary btn-mini" name="Save" tabindex="10">
                                    <span class="glyphicon glyphicon-floppy-disk"></span>&nbsp;Kaydet
                                </button>
                                <button type="button" id="btn_delete_kategori" class="btn btn-danger btn-mini" name="Delete" tabindex="11">
                                    <span class="glyphicon glyphicon-remove"></span>&nbsp;Sil
                                </button>
                                <button type="button" id="btn_clear_kategori" class="btn btn-warning btn-mini" name="Clear" tabindex="12">
                                    <span class="glyphicon glyphicon-trash"></span>&nbsp;Temizle
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="width: 49%; margin-left: 1%; margin-top: 2%; float: left; border: 1px solid #F7F7F0">
                    <div style="width: 50%; min-height: 250px; float: left; max-height: 250px; overflow-y: scroll">
                        <table class="table table-bordered" id="tblKategori" style="width: 100%">
                            <thead>
                                <tr style="background-color: #EBEBEC">
                                    <th class="tableheadcolumn" style="text-align: center">Id</th>
                                    <th class="tableheadcolumn" style="text-align: center">Kategori</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td colspan="8" style="text-align: center">Girilmiş Kategori Yok</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div style="width: 50%; min-height: 250px; float: left; padding: 8px">
                        <table>
                            <tr>
                                <td style="text-align: right;">
                                    <b>Kategori:</b>
                                </td>
                                <td style="text-align: left; padding-left: 10px; padding-top: 20px;">
                                    <input type="text" id="txt_ins_Kategori" style="width: 100%" class="form-control" /><br />
                                </td>
                            </tr>
                        </table>

                        <div style="text-align: center;">
                            <div class="btn-group">
                                <button type="button" id="btn_save_kategori" class="btn btn-primary btn-mini" name="Save" tabindex="10">
                                    <span class="glyphicon glyphicon-floppy-disk"></span>&nbsp;Kaydet
                                </button>
                                <button type="button" id="btn_delete_kategori" class="btn btn-danger btn-mini" name="Delete" tabindex="11">
                                    <span class="glyphicon glyphicon-remove"></span>&nbsp;Sil
                                </button>
                                <button type="button" id="btn_clear_kategori" class="btn btn-warning btn-mini" name="Clear" tabindex="12">
                                    <span class="glyphicon glyphicon-trash"></span>&nbsp;Temizle
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
        </div>
    </div>

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/ajaxupdate3.6.js"></script>
    <script src="js/toastr.js"></script>
    <script src="js_custom/AdminPaneli.js"></script>
</body>
</html>

