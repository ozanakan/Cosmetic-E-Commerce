$(document).ready(function () {

    $('#btn_giris').on('click', function (e) {
        GirisYap();
    });

    $('#btn_kayit').on('click', function (e) {
        Kaydol();
    });
});

function GirisYap() {
    var user = $('#txt_lgn_kullanici_adi').val();
    var pass = $('#txt_lgn_sifre').val();
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
                window.open("/index.aspx","_self");
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}

function Kaydol() {
    var mst = {};

    mst.MU_AD_SOYAD = $('#txt_ad_soyad').val();
    mst.MU_SIRKET = $('#txt_sirket').val();
    mst.MU_KULLANICI_ADI = $('#txt_kullanici_adi').val();
    mst.MU_TELEFON = $('#txt_telefon').val();
    mst.MU_ADRES = $('#txt_adres').val();
    mst.MU_EMAIL = $('#txt_mail').val();
    mst.MU_SIFRE = $('#txt_sifre').val();
    mst.MU_MUSTERIM = 0;

    if (mst.MU_KULLANICI_ADI == '' || mst.MU_SIFRE == '') {
        toastr["success"]("Kullanıcı adı ve şifre alanları zorunludur.");
        return;
    }

    var query = JSON.stringify({ mst: mst });

    $.ajax({
        type: "POST",
        url: "/login.aspx/CreateMusteri",
        contentType: "application/json; charset=utf-8",
        data: query,
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                toastr["success"]("Sisteme başarıyla kayıt oldunuz.");
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}