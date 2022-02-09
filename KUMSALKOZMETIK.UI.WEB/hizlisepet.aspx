<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="hizlisepet.aspx.cs" Inherits="KUMSALKOZMETIK.UI.WEB.hizlisepet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main_head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_body" runat="server">
        <div id="contact-page" class="container">
        <div class="bg">
            <div class="row">
                <div class="col-sm-12">
                    <h2 class="title text-center">Hızlı Sipariş</h2>
                </div>
            </div>
            <div class="row"> 
                <form id="main-contact-form" class="contact-form row" name="contact-form" method="post">
                    <div class="form-group col-md-12">
                        <textarea name="message" id="txt_Siparis" required="required" class="form-control" rows="8" style="min-height: 250px" placeholder="Siparişinizi buraya girebilirsiniz"></textarea>
                    </div>
                    <div class="form-group col-md-12">
                        <input type="button" id="btn_hizli_Siparis" name="submit" class="btn btn-primary center-block" value="Siparişi Gönder">
                    </div>
                </form>   
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main_footer" runat="server">
    <script src="js_custom/hizlisepet.js"></script>
</asp:Content>
