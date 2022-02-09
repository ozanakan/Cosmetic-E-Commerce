<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="KUMSALKOZMETIK.UI.WEB.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main_head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main_body" runat="server"> 
    <section>
           <div class="recommended_items col-sm-12 padding-right" style="background-color: #f5f5f5; height: 25px; padding-top: 4px;">
            <h2 style="font-size: 16px" class="title text-center">350TL ÜZERİ ALIŞVERİŞLERDE KARGO ÜCRETSİZ</h2>
           </div>
         <div class="container">

        <div class="w3-content w3-section" style="width:100%;height:350px;">
          <img class="mySlides" src="images/Urunler/img_chicago.png" style="width:100%;height:350px">
          <img class="mySlides" src="images/Urunler/img_la.png" style="width:100%;height:350px">
        </div>


            <div class="row">
              
                <div class="recommended_items col-sm-12 padding-right" style="margin-top:30px">
                    <!--recommended_items-->
                    <h2 class="title text-center">Fırsat Ürünleri</h2>

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


                <div class="col-sm-12 padding-right" style="margin-top:20px">
                    <h2 class="title text-center">ÜRÜNLER</h2>
                    <div class="features_items" my_main_urunler style="min-height: 300px">
                        <!--features_items-->

                    </div>
                    <div id="page-selection" style="text-align: center"></div>
                    <!--features_items-->

                    <!--/category-tab-->


                    <!--/recommended_items-->

                </div>

            
            </div>
        </div>
    </section> 
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="main_footer" runat="server">
    <script src="js_custom/index.js"></script>
</asp:Content>
