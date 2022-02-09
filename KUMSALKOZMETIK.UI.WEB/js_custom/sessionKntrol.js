$(document).ready(function () {
    $('[mylogin]').hide();
    $('[my_kullanici]').show();
    kotrol();

    $('[my_kullanici_text]').on('click', function (e) {
        sessionkill();
    });
});

function kotrol() {
    $.ajax({
        type: "POST",
        url: "/login.aspx/kontrol",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                if (d.data != null && d.data.Musteri) {
                    $('[mylogin]').hide();
                    $('[my_kullanici]').show();
                    $('[my_kullanici_text]').text((d.data.Musteri.MU_KULLANICI_ADI + '(Çıkış)'));
                } else {
                    $('[mylogin]').show();
                    $('[my_kullanici]').hide();
                    $('[my_kullanici_text]').text('');
                }
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}

function sessionkill() {
    $.ajax({
        type: "POST",
        url: "/login.aspx/sessionkill",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                toastr["success"]('Oturumunuz sonlandırıldı.');
                kotrol();
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}