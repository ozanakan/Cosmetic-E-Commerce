$(document).ready(function () {
 
    $('#btn_hizli_Siparis').on('click', function (e) {
        sepetHizliOnay();
    });
});

function sepetHizliOnay() {
    var siparis = $('#txt_Siparis').val();
    if (siparis == '') {
        toastr["error"]('Lütfen sipariş alanını doldurunuz.');
        return;
    }

    var query = JSON.stringify({ Siparis: siparis });

    $.ajax({
        type: "POST",
        url: "/Fastsepet.aspx/FastCartAdd",
        contentType: "application/json; charset=utf-8",
        data: query,
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 300) {
                $('#btnopenuserform').trigger('click');
            }
            else if (d.status == 200) {
                toastr["success"]("Siparişiniz bize ulaştı, en kısa sürede sizinle irtibata geçeceğiz.");
                $('#txt_Siparis').val('');
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}
