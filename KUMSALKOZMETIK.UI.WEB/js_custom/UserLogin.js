$(document).ready(function () { 
    $('#btn_popup_login').on('click', function (e) {
        GirisYap();
    });
    $('#btn_popup_kayit').on('click', function (e) {
        $('href="login.aspx"').trigger('click');
    });
});

function GirisYap() {
    var user = $('#txt_popup_user').val();
    var pass = $('#txt_popup_pass').val();
    if (user == '' || pass == '') {
        toastr["error"]('Lüften kullanıcı adı ve şifre alanlarını doldurunuz.');
        return;
    }

    var query = JSON.stringify({ user: user, pass: pass });

    $.ajax({
        type: "POST",
        url: "/login.aspx/CheckUser",
        contentType: "application/json; charset=utf-8",
        data: query,
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                $('[mylogin]').hide();
                $('[my_kullanici]').show();
                $('#btn_popup_exit').trigger('click');
                $('[my_kullanici_text]').text((d.data.Musteri.MU_KULLANICI_ADI + '(Çıkış)'));
                toastr["success"]("Sisteme başarıyla giriş yaptınız.");
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}