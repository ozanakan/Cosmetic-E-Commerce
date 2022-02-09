<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="HesabimSifre.aspx.cs" Inherits="KUMSALKOZMETIK.UI.WEB.HesabimSifre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main_head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main_body" runat="server">
    <section> 
         <div class="container">
              <div class="row" style="margin-top: 30px">
                 <div class="col-md-3 rsidebar" style=" height: 300px;font-size:16px">
                 <div style="padding-top:15px;border-bottom:1px solid #c6c6c6;"><a href="Hesabim.aspx"style="color:black">Kişisel Bilgilerim</a></div>
                 <div style="padding-top:15px;border-bottom:1px solid #c6c6c6;"><a href="HesabimAdres.aspx"style="color:black">Adres Bilgilerim</a></div>
                 <div style="padding-top:15px;border-bottom:1px solid #c6c6c6;"><a href="HesabimSiparis.aspx"style="color:black">Siparişlerim</a></div>
                 <div style="padding-top:15px;border-bottom:1px solid #c6c6c6;">Yardım</div>
                 <div style="padding-top:15px;border-bottom:1px solid #c6c6c6;"><a href="HesabimSifre.aspx"style="color:black">Şifre Değiştirme</a></div>
                 <div style="padding-top:15px;border-bottom:1px solid #c6c6c6;">Çıkış</div>

                 </div>
                 <div class="col-md-9 product-model-sec">
                       <div class="col-sm-12">
                      <div class="signup-form">
                        <h2 class="title text-center">Adres Bilgilerim</h2>
                          </div>
                           </div>
               
                      <div class="col-sm-6">
                      <div class="signup-form">
                                               

                     
                      <form action="#">
                        
                            *Mevcut Şifreniz
                            <input style="margin-top:5px;" type="text" id="txt_sifre"/>
                            *Yeni Şifreniz
                            <input style="margin-top:5px;" type="text" id="txt_yenisifre"/>
                            *Yeni Şifreniz
                            <input style="margin-top:5px;margin-bottom:10px;"  type="text" id="txt_yenisifre2"/>
                            
                            
                            <button type="button" id="btn_kayit" class="btn btn-default" style="margin-top:10px;">Şifre Güncelle</button>

                        </form>
                           </div>
                          </div>
                 </div>         
              </div>
         </div>



    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main_footer" runat="server"> 
    <script src="js_custom/HesabimSifre.js"></script>
</asp:Content>