<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="sepetim.aspx.cs" Inherits="KUMSALKOZMETIK.UI.WEB.sepetim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main_head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main_body" runat="server">
    <section id="cart_items">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 padding-left">


                    <div class="table-responsive cart_info" style="box-shadow: 3px 3px 9px -4px rgba(0,0,0,0.44);">
                        <table class="table table-condensed" id="my_sepet">
                            <thead>
                                <tr class="cart_menu">
                                    <td class="image" style="width: 30%; text-align: center">Malzeme</td>
                                    <td class="description" style="width: 40%; text-align: center; margin: 0px;">Ürün Detayı</td>
                                    <td class="cart_price" style="width: 20%; text-align: left;">Fiyat</td>
                                    <td class="quantity" style="width: 10%; text-align: right;">Adet</td>
                                    <td class="total" style="width: 10%; text-align: center;"></td>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-sm-4 padding-left">
                    <div>
                        <table style="width: 100%; border: 1px solid #666666; box-shadow: 3px 3px 9px -4px rgba(0,0,0,0.44);">
                            <tr style="background-color: #FE980F; font-size: 17px; height: 40px; text-align: center;">
                                <td colspan="2">SİPARİS ÖZETİ</td>
                            </tr>
                            <tr>
                                <td style="padding-top: 10px; padding-left: 10px;">Ara Toplam</td>
                                <td id="ara_toplam" style="text-align: right; padding-right: 10px; padding-top: 10px;">0</td>
                            </tr>
                            <tr>
                                <td style="padding-top: 10px; padding-left: 10px; color: #ff0000;">Kargo Bedeli</td>
                                <td id="kargo_bedeli" style="text-align: right; padding-right: 10px; padding-top: 10px; color: #ff0000;">0</td>
                            </tr>
                            <tr style="border-top: 1px solid #808080">
                                <td style="padding-top: 10px; padding-left: 10px;"><strong>TOPLAM</strong></td>
                                <td id="toplam" style="text-align: right; padding-right: 10px; padding-top: 10px;">0</td>
                            </tr>   
                            <tr style="border-top: 1px solid #808080">
                                <td style="padding-top: 10px; padding-left: 10px;"><strong>İNDİRİMLİ TOPLAM</strong></td>
                                <td id="toplam_indirimli" style="text-align: right; padding-right: 10px; padding-top: 10px;">0</td>
                            </tr>
                        </table>
                        <table style="width: 100%; border: 1px solid #666666; box-shadow: 3px 3px 9px -4px rgba(0,0,0,0.44);">
                            <tr style="border-top: 1px solid #808080">
                                <td style="padding-top: 10px; padding-left: 10px;">
                                    <input type="text" id="txt_ad_soyad" placeholder="İndirim Kodu" /></td>
                                <td style="text-align: right; padding-right: 10px; padding-top: 10px;">
                                    <button id="btn_indirim" style="width: 100px; height: 35px; background-color: #666666; border: 1px solid #333333; border-radius: 2px; color: #ffffff; font-size: 15px; margin-left: 20px; margin-top: 5px; margin-bottom: 8px;">Uygula</button></td>
                            </tr>
                        </table>

                        <div style="width: 100%;">
                            <button id="btn_sepet_onayla" style="width: 200px; height: 35px; background-color: #666666; border: 1px solid #333333; border-radius: 2px; color: #ffffff; font-size: 15px; margin-left: 80px; margin-top: 20px;">Alışverişi Tamamla</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main_footer" runat="server">
    <script src="js_custom/sepetim.js"></script>
</asp:Content>
