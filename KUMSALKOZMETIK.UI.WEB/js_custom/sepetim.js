
$(document).ready(function () {
    $('#btnopenuserform').hide();
    getSepet();

    $('#btn_sepet_onayla').on('click', function (e) {
        sepetOnay();
    });
});

function getSepet() {
    $.ajax({
        type: "POST",
        url: "/sepetim.aspx/getSepet",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                if (d.data != null) {
                    BuildSepet(d.data.Sepet);
                }
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}

function BuildSepet(Sepet) {

    var slcitem = $('#my_sepet > tbody');
    $(slcitem).empty();
    if (Sepet == null)
        return;

    getTotalCost(Sepet);

    var strall = '';
    for (i = 0; i < Sepet.length; i++) {
        var str = Sepet[i];

        strall += '<tr  sepet_urun_id="' + str.UrunId + '">' +
                        '<td  class="cart_description" style="text-align:center;">' +
                            '<a style="color:black;">' + str.UrunAdi + '</a>' +
                        '</td>' +
                        '<td class="cart_product" style="text-alian:left;margin:0px;">' +
                            '<textarea urundetayid="' + str.UrunId + '" type="text" placeholder="Sipariş ettiğiniz ürünün detaylarını burada belirtebilirsiniz."></textarea>' +
                        '</td>' +

                        '<td class="cart_price">' + '<p>' + (str.UrunFiyat * str.UrunAdet) + ' TL</p>' +

                        '</td>' +

                        '<td class="cart_quantity" >' +
                                //'<a class="cart_quantity_up" href="">+ </a>' +
                                '<input class="cart_quantity_input" style="margin-left: 60px;;" type="text" name="quantity" value="' + str.UrunAdet + '" urunid="' + str.UrunId + '"  urunadi="' + str.UrunAdi + '"  urunfiyat="' + str.UrunFiyat + '"  autocomplete="off" size="3">' +
                                //'<a class="cart_quantity_down" href="">- </a>' +
                        '</td>' +
                        '<td class="cart_delete" style="text-align: center;">' +
                            '<a class="cart_quantity_delete" sepet_urun_delete="' + str.UrunId + '"><i class="fa fa-times"></i></a>' +
                        '</td>' +
                    '</tr>';

    }
    $(slcitem).append(strall);

    $('[sepet_urun_delete]').off('click').on('click', function (e) {
        var satirID = $(this).attr('sepet_urun_delete');
        $('[sepet_urun_id="' + satirID + '"]').remove();
        RemoveCost(satirID);
    });

    $('[name="quantity"]').off('keyup').on('keyup', function (e) {
        var urunid = parseInt($(this).attr('urunid'));
        var urunadi = $(this).attr('urunadi');
        var urunfiyat = parseFloat($(this).attr('urunfiyat'));
        var urunAdet = $(this).val();
        if (urunAdet == '')
            return;
        addCost(urunid, urunadi, urunAdet, urunfiyat);
    });
}

function addCost(UrunId, UrunAdi, Adet, UrunFiyat) {

    var query = JSON.stringify({ UrunId: UrunId, UrunAdi: UrunAdi, Adet: Adet, Fiyat: UrunFiyat });

    $.ajax({
        type: "POST",
        url: "/index.aspx/addCost",
        contentType: "application/json; charset=utf-8",
        data: query,
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                toastr["success"]("Sepetteki ürün sayısı güncellendi.");

                if (d.data != null) {
                    BuildSepet(d.data);
                }
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}

function getTotalCost(sepet) {
    $('#ara_toplam').text('0TL');
    $('#kargo_bedeli').text('0TL');
    $('#toplam').text('0TL');

    if (sepet != null) {
        var tmpr_total = 0;
        var kargo = 5;

        for (i = 0; i < sepet.length; i++) {
            var str = sepet[i];

            tmpr_total += (str.UrunFiyat * str.UrunAdet);
        }

        $('#ara_toplam').text(tmpr_total + 'TL');
        $('#kargo_bedeli').text(kargo + 'TL');
        $('#toplam').text((tmpr_total + kargo) + 'TL');
    }
}

function sepetOnay() {
    var detayInputs = $('[urundetayid]');
    var sepet = new Array();

    for (var i = 0; i < detayInputs.length; i++) {
        var SepetEntity = {};

        SepetEntity.UrunId = $(detayInputs[i]).attr('urundetayid');
        SepetEntity.UrunDetay = $(detayInputs[i]).val();

        sepet.push(SepetEntity);
    }



    var query = JSON.stringify({ sepet: sepet });

    $.ajax({
        type: "POST",
        url: "/sepetim.aspx/SepetOnay",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: query,
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                toastr["success"]("Siparişiniz bize ulaştı, en kısa sürede sizinle irtibata geçeceğiz.");
                $('#ara_toplam').text('0');
                $('#kargo_bedeli').text('0');
                $('#toplam').text('0');
                getSepet();
            }
            else if (d.status == 300) {
                window.open("login.aspx", "_self");
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}

function RemoveCost(UrunId) {

    var query = JSON.stringify({ UrunId: UrunId });

    $.ajax({
        type: "POST",
        url: "/sepetim.aspx/RemoveCost",
        contentType: "application/json; charset=utf-8",
        data: query,
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {

                getSepet();

                toastr["success"]("Ürününüz sepetten çıkarıldı.");

            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}

