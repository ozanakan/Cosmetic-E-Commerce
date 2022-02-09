<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="adminLogin.ascx.cs" Inherits="KUMSALKOZMETIK.UI.WEB.popup.adminLogin" %>

<div class="modal fade" id="myAdminLogin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="width: 400px; margin-left: auto; height: 300px; margin-right: auto">
            <div class="modal-body" style="width: 100%">

                <div class="login-form">
                    <!--login form-->
                    <h2>Yönetici Girişi</h2>
                    <form action="#">
                        <input id="txt_admin_user" type="text" placeholder="Kullanıcı adı" style="width: 60%" />
                        <input id="txt_admin_pass" type="password" placeholder="Şifreniz" style="width: 60%" />

                        <button type="button" class="btn btn-default" id="admingirisi" style="float: left">Admin Girişi</button>
                        <button type="button" class="btn btn-default" style="float: left; margin-left: 15px" data-dismiss="modal">Çık</button>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>