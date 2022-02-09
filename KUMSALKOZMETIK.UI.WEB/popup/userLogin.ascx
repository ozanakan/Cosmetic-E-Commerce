<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="userLogin.ascx.cs" Inherits="KUMSALKOZMETIK.UI.WEB.popup.userLogin" %>

<div class="modal fade" id="myUserLogin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="width: 400px; margin-left: auto; height: 300px; margin-right: auto">
            <div class="modal-body" style="width: 100%">

                <div class="login-form">
                    <!--login form-->
                    <h2>Giriş yapın</h2>
                    <form action="#">
                        <input type="text" id="txt_popup_user" placeholder="Kullanıcı adı veya E-posta adresiniz" style="width: 60%" />
                        <input type="password" id="txt_popup_pass" placeholder="Şifreniz" style="width: 60%" />
                        <br />
                        <button type="button" class="btn btn-default" id="btn_popup_login" style="float: left">Giriş Yap</button>
                        <button type="button" class="btn btn-default" id="btn_popup_kayit" style="float: left; margin-left: 15px">Kayıt Ol</button>
                        <button type="button" class="btn btn-default" id="btn_popup_exit" style="float: left; margin-left: 15px" data-dismiss="modal">Çık</button>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>
