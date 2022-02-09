<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Hesabim.aspx.cs" Inherits="KUMSALKOZMETIK.UI.WEB.Hesabim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main_head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main_body" runat="server">
    <section>

         <div class="container">
              <div class="row" style="margin-top: 30px">
                 <div class="col-md-3 rsidebar" style=" height: 300px;font-size:16px">
                 <div style="padding-top:15px;border-bottom:1px solid #c6c6c6;"><a href="Hesabim.aspx" style="color:black">Kişisel Bilgilerim</a></div>
                 <div style="padding-top:15px;border-bottom:1px solid #c6c6c6;"><a href="HesabimAdres.aspx"style="color:black">Adres Bilgilerim</a></div>
                 <div style="padding-top:15px;border-bottom:1px solid #c6c6c6;"><a href="HesabimSiparis.aspx"style="color:black">Siparişlerim</a></div>
                 <div style="padding-top:15px;border-bottom:1px solid #c6c6c6;">Yardım</div>
                 <div style="padding-top:15px;border-bottom:1px solid #c6c6c6;"><a href="HesabimSifre.aspx"style="color:black">Şifre Değiştirme</a></div>
                 <div style="padding-top:15px;border-bottom:1px solid #c6c6c6;">Çıkış</div>

                 </div>
                 <div class="col-md-9 product-model-sec">
                       <div class="col-sm-12">
                      <div class="signup-form">
                    <h2 class="title text-center">Kişisel Bilgilerim</h2>
                          </div>
                           </div>
               
                      <div class="col-sm-6">
                      <div class="signup-form">
                                               

                      <form action="#">
                            *Ad Soyad
                            <input style="margin-top:5px;" type="text" id="txt_ad_soyad"/>
                            Şirket İsmi
                            <input style="margin-top:5px;" type="text" id="txt_sirket"/>
                            *Kullanıcı adı
                            <input style="margin-top:5px;"  type="text" id="txt_kullanici_adi"/>
                            *Telefon No
                            <input style="margin-top:5px;" type="text" id="txt_telefon"/>
                            *E-Posta Adresi
                            <input style="margin-top:5px;" type="email" id="txt_mail"/>
                                
                            <label class="checkbox">
                            <input type="checkbox" name="checkbox" /><i></i>Kampanyalar ile ilgili eposta mesajları almak istiyorum.
                            </label>
                            <label class="checkbox">
                            <input type="checkbox" name="checkbox" /><i></i>Sms ile özel indirimlerden haberdar olmak istiyorum.
                            </label>
                            <button type="button" id="btn_kayit" class="btn btn-default">Bilgilerimi Güncelle</button>
                        </form>
                           </div>
                          </div>
                 </div>         
              </div>
         </div>



    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main_footer" runat="server"> 
    <script src="js_custom/Hesabim.js"></script>
</asp:Content>
