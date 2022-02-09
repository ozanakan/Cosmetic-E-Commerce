<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="KUMSALKOZMETIK.UI.WEB.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main_head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_body" runat="server">
    <section id="form" style="margin-top: 0px !important">
        <!--form-->
        <div class="container">
            <div class="row">
                <div class="col-sm-4 col-sm-offset-1">
                    <div class="login-form">
                        <!--login form-->
                        <h2>Giriş yapın</h2>
                        <form action="#">
                            <input type="text" id="txt_lgn_kullanici_adi" placeholder="Kullanıcı adı veya E-posta adresiniz" />
                            <input type="password" id="txt_lgn_sifre" placeholder="Şifreniz" />

                            <button type="button" id="btn_giris" class="btn btn-default">Giriş Yap</button>
                        </form>
                    </div>
                    <!--/login form-->
                </div>
                <div class="col-sm-1">
                    <h2 class="or">Veya</h2>
                </div>
                <div class="col-sm-4">
                    <div class="signup-form">
                        <!--sign up form-->
                        <h2>Kayıt Ol!</h2>
                        <form action="#">
                            <input type="text" id="txt_ad_soyad" placeholder="Ad Soyad" />
                            <input type="text" id="txt_sirket" placeholder="Şirket İsmi" />
                            <input type="text" id="txt_kullanici_adi" placeholder="Kullanıcı adı" />
                            <input type="text" id="txt_telefon" placeholder="Telefon No" />
                            <input type="text" id="txt_adres" placeholder="Teslimat Yapılacak Adres" />
                            <input type="email" id="txt_mail" placeholder="E-Posta Adresiniz" />
                            <input type="password" id="txt_sifre" placeholder="Şifreniz" />
                            <button type="button" id="btn_kayit" class="btn btn-default">Kayıt Ol</button>
                        </form>
                    </div>
                    <!--/sign up form-->
                </div>
            </div>
        </div>
    </section>  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main_footer" runat="server"> 
    <script src="js_custom/login.js"></script>
</asp:Content>
