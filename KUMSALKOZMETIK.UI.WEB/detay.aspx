<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="detay.aspx.cs" Inherits="KUMSALKOZMETIK.UI.WEB.detay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main_head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_body" runat="server">
    <section style="background-color: #e9e9e9; padding-top: 20px; padding-bottom: 20px; padding-left: 30px;">
        <div class="container">
            <div class="row" style="box-shadow: -17px 10px 20px -15px rgba(0,0,0,0.47);">
                <div class="col-sm-5 padding-left" style="background-color: #ffffff; width: 483px; height: 483px;">
                    <div class="pImages" style="text-align: center;">
                        <img id="img_main_pic" style="max-width: 463px; max-height: 463px;" src="images/home/" />
                    </div>
                </div>
                <div class="col-sm-7 padding-right">
                    <div style="width: 100%; height: auto; padding-top: 10px; background-color: #f2f2f2; min-height: 483px; border-radius: 0px 10px 10px 0px;">
                        <div style="width: 100%; height: 20px; padding-left: 20px;"><strong id="txt_urun_marka"></strong></div>
                        <div style="font-size: 23px; padding-left: 20px;" id="txt_urun_baslik"></div>
                        <div style="display: flex; padding-left: 20px; margin-top: 20px;">

                            <div id="area_indirimli" style="display: flex;">
                                <div id="txt_indirim_orani" style="background-color: #ff0000; height: 40px; width: 40px; margin-bottom: 5px; margin-left: 20px; color: white; font-size: 17px; padding-top: 8px; font-weight: bold;"></div>
                                <div id="txt_fiyat_indirimsiz" style="text-decoration: line-through; color: #b1b1b1; padding-left: 20px; padding-top: 15px; font-size: 15px;"></div>
                                <div id="txt_fiyat_indirimli" style="font-size: 20px; padding-left: 20px; padding-top: 10px; color: #FE980F;"></div>
                            </div>

                            <div id="area_normal" style="font-size: 18px; padding-left: 10px;">
                                <h4 id="txt_urun_fiyat"></h4>
                            </div>

                            <div id="txt_urun_kodu" style="margin-left: 120px; margin-top: 10px; font-size: 12px;"></div>
                        </div>
                        <div style="border-top-style: solid; border-color: #cacaca; border-width: 1px; padding-left: -20px; margin-top: 7px;"></div>

                        <div style="margin-top: 10px; padding-left: 30px; display: flex; width: 100%; height: 40px;">
                            <button id="btn_sepet_azalt" style="width: 28px; border: 0px; background-color: #808080; border-radius: 10px 0px 0px 10px; color: #ffffff;">-</button>
                            <div id="txt_sepet_adet" style="background-color: #ffffff; width: 30px; height: 40px; font-size: 20px; padding-top: 5px; text-align: center;">1</div>
                            <button id="btn_sepet_arttir" style="width: 28px; border: 0px; background-color: #808080; border-radius: 0px 10px 10px 0px; color: #ffffff;">+</button>

                            <button id="btn_sepetekle" class="sepetekle" style="margin-left: 20px; border: 0px; border-radius: 20px; color: #ffffff; width: 170px; height: 40px; font-size: 15px;"><strong>SEPETE EKLE</strong></button>
                        </div>
                        <div style="border-top-style: solid; border-color: #cacaca; border-width: 1px; padding-left: -20px; margin-top: 7px;"></div>

                        <div style="display: flex; padding-left: 15px; padding-top: 7px;">
                            <div>
                                <img src="images/product-details/teslimat.png" />
                            </div>
                            <div style="padding-top: 10px; margin-left: 5px;">Teslimat:</div>
                            <div style="color: #37bb5e; padding-top: 10px; padding-left: 3px;"><strong>3 İş Günü İçinde Kargoya Teslim Edilir</strong></div>
                        </div>

                        <div style="border-top-style: solid; border-color: #cacaca; border-width: 1px; padding-left: -20px; margin-top: 7px;"></div>

                        <div style="width: 90%; height: auto; margin-top: 30px; margin-left: auto; margin-right: auto; border: 2px; border-style: solid; border-color: #cacaca; border-radius: 10px; background-color: #ffffff; box-shadow: 4px 5px 9px -5px rgba(0,0,0,0.47);">
                            <div style="width: auto; height: 40px; border-radius: 8px 8px 0px 0px; background-color: #FE980F; color: #ffffff; padding-left: 3px; padding-top: 10px; font-size: 14px;"><strong>ÜRÜNÜN ÖZELLİKLERİ</strong></div>


                            <div id="txt_urun_ozellikleri" style="padding-top: 10px; padding-left: 4px;">
                            </div>
                            <div style="height: 30px;"></div>
                        </div>
                        <div style="height: 18px;"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <br />
    <section>
        <div class="container">
            <div class="row">
                <div class="recommended_items col-sm-12 padding-right">
                    <!--recommended_items-->
                    <h2 class="title text-center">Bunlarada Bakın</h2>

                    <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner" my_firsat_urunleri>
                        </div>
                        <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
                            <i class="fa fa-angle-left"></i>
                        </a>
                        <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main_footer" runat="server">
    <script src="js_custom/detay.js"></script>
</asp:Content>
