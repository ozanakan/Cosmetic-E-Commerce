var musteridata = {};

$(document).ready(function () {

    GetHesabim();


    $('#btn_kayit').on('click', function (e) {
       

        musteridata.MU_ADRES = $('#txt_adres').val();
  
        saveMusteri(musteridata);

    });

});


function GetHesabim() {
    $.ajax({
        type: "POST",
        url: "/HesabimAdres.aspx/GetAdres",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                musteridata = d.data;
                $('#txt_adres').val(d.data.MU_ADRES)
          
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
        url: "/HesabimAdres.aspx/saveAdres",
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
