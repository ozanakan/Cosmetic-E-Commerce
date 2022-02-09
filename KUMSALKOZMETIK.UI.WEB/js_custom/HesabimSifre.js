var musteridata = {};

$(document).ready(function () {

    GetSifre();


    $('#btn_kayit').on('click', function (e) {

        var sifre= $('#txt_sifre').val();
        if (musteridata.MU_SIFRE == sifre)
        {
                
            var yenisifre= $('#txt_yenisifre').val();
            var yenisifre2= $('#txt_yenisifre2').val();

            if (yenisifre == yenisifre2)
            {
                musteridata.MU_SIFRE = yenisifre;
                saveMusteri(musteridata);
            }

        }

    });

});


function GetSifre() {
    $.ajax({
        type: "POST",
        url: "/HesabimSifre.aspx/GetSifre",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                musteridata = d.data;

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
        url: "/HesabimSifre.aspx/saveSifre",
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
