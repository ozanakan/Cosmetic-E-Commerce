<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Urunler.aspx.cs" Inherits="KUMSALKOZMETIK.UI.WEB.Urunler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main_head" runat="server">
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <link href="css/hummingbird-treeview.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main_body" runat="server">
    <section>
        <div class="container">
            <div class="row" style="margin-top: 50px">

                <div class="col-md-3 rsidebar" style="background-color: #ffffff; height: 820px;">
                    <div class="rsidebar-top" style="background-color: #ffffff; height: 820px; padding: 5px">

                        <div class="slider-left">
                            <h4>MARKALAR</h4>
                        </div>
                        <div id="area_markalar" class="hummingbird-treeview h-scroll-large" style="height: 200px; overflow-y: scroll">
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox" /><i></i> Rallis
                            </label>
                        </div>

                        <div class="sidebar-row">
                            <h4>KATEGORİLER </h4>
                        </div>

                        <div id="area_kategoriler" class="hummingbird-treeview h-scroll-large" style="height: 350px; overflow-y: scroll; overflow-x: hidden">
                            <!-- <div id="treeview_container" class="hummingbird-treeview"> -->
                        </div>

                        <div class="sidebar-row">
                            <h4>FIYAT ARALIĞI</h4>
                        </div>

                        <div id="area_fiyat" class="hummingbird-treeview h-scroll-large">
                            <div class="login-form">
                                <form action="#">
                                    <input id="txt_fiyat_min" type="text" style="height: 33px; float: left; width: 30%; border-radius: 2px;" placeholder="min" />
                                    <input id="txt_fiyat_max" style="height: 33px; float: left; margin-right: 3%; margin-left: 3px; width: 30%; border-radius: 2px;" placeholder="max" />
                                    <button type="button" id="btn_fiyat" style="width: 30%; color: white; height: 32px" class="btn btn-default"><strong>Ara</strong></button>
                                </form>
                            </div>
                        </div>



                    </div>
                </div>

                <div class="col-md-9 product-model-sec">
                    <div style="width: 100%; height: 30px; display: flex; border-bottom: 1px solid #dbdbdb; margin-bottom: 20px;">
                        <div class="shortlist filtre" shortcolon="UR_ID" shorttype="desc" style="padding-right: 20px;"><strong>EN YENİLER</strong> </div>
                        <div class="shortlist filtre" shortcolon="UR_FIYAT" shorttype="asc" style="padding-right: 20px;"><strong>EN DÜŞÜK FİYAT</strong></div>
                        <div class="shortlist filtre" shortcolon="UR_INDIRIM_YUZDE" shorttype="desc" style="padding-right: 20px;"><strong>İNDİRİMLİLER</strong></div>
                        <div class="shortlist filtre" shortcolon="UR_SATILAN_ADET" shorttype="desc"><strong>EN ÇOK SATANLAR</strong></div>
                    </div>
                    <div class="features_items" my_main_urunler style="min-height: 300px">
                        <!--features_items-->
                    </div>
                    <div id="page-selection" style="text-align: center"></div>
                    <!--features_items-->
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main_footer" runat="server">
    <!-- Required Javascript -->
    <script src="js/hummingbird-treeview.js"></script>

    <script src="js_custom/Urunler.js"></script>
</asp:Content>
