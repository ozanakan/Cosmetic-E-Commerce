<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="HesabimSiparis.aspx.cs" Inherits="KUMSALKOZMETIK.UI.WEB.HesabimSiparis" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main_head" runat="server">
 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main_body" runat="server">
    <section>
        <div class="container">
            <div class="row" style="margin-top: 30px">
                <div class="col-md-3 rsidebar" style="height: 300px; font-size: 16px">
                    <div style="padding-top: 15px; border-bottom: 1px solid #c6c6c6;"><a href="Hesabim.aspx" style="color: black">Kişisel Bilgilerim</a></div>
                    <div style="padding-top: 15px; border-bottom: 1px solid #c6c6c6;"><a href="HesabimAdres.aspx" style="color: black">Adres Bilgilerim</a></div>
                    <div style="padding-top: 15px; border-bottom: 1px solid #c6c6c6;"><a href="HesabimSiparis.aspx" style="color: black">Siparişlerim</a></div>
                    <div style="padding-top: 15px; border-bottom: 1px solid #c6c6c6;">Yardım</div>
                    <div style="padding-top: 15px; border-bottom: 1px solid #c6c6c6;"><a href="HesabimSifre.aspx" style="color: black">Şifre Değiştirme</a></div>
                    <div style="padding-top: 15px; border-bottom: 1px solid #c6c6c6;">Çıkış</div>

                </div>
                <div class="col-md-9 product-model-sec">
                    <div class="col-sm-12">
                        <div class="signup-form">
                            <h2 class="title text-center">Sipariş Bilgilerim</h2>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <table id="TR_Siparis" class="table table-bordered" style="width: 100%;">
                            <thead style="background-color: #eeeeee;">
                                <tr> 
                                    <th class="tableheadcolumn" style="background-color: #eeeeee"><a><span style="color: #428bca; font-size: 10px"><b>Id</b></span></a></th>
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

                    <div class="col-sm-6">
                        <table id="TR_Maintable_Detay" class="table table-bordered" style="width: 100%;">
                            <thead style="background-color: #eeeeee;">
                                <tr> 
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
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main_footer" runat="server">
  
    <script src="js_custom/HesabimSiparis.js"></script>
</asp:Content>
