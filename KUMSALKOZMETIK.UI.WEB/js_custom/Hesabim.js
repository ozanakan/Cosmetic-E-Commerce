var musteridata = {};

$(document).ready(function () {

    GetHesabim();


    $('#btn_kayit').on('click', function (e) {
          
        musteridata.MU_AD_SOYAD = $('#txt_ad_soyad').val();
        musteridata.MU_SIRKET = $('#txt_sirket').val();
        musteridata.MU_KULLANICI_ADI = $('#txt_kullanici_adi').val();
        musteridata.MU_TELEFON = $('#txt_telefon').val();
        musteridata.MU_EMAIL = $('#txt_mail').val();

        saveMusteri(musteridata);

    });

});


function GetHesabim() {
    $.ajax({
        type: "POST",
        url: "/Hesabim.aspx/GetUser",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                musteridata = d.data;
                $('#txt_ad_soyad').val(d.data.MU_AD_SOYAD)
                $('#txt_sirket').val(d.data.MU_SIRKET)
                $('#txt_kullanici_adi').val(d.data.MU_KULLANICI_ADI)
                $('#txt_telefon').val(d.data.MU_TELEFON)
                $('#txt_mail').val(d.data.MU_EMAIL)
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });

}

function saveMusteri(_data) {

    var query = JSON.stringify({ data: _data });

    $.ajax({
        type: "POST",
        url: "/Hesabim.aspx/saveMusteri",
        contentType: "application/json; charset=utf-8",
        data: query,
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
               
                toastr["success"]("Bilgiler Güncellendi");
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}
