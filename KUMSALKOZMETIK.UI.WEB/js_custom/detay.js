var entityurun = {};

$(document).ready(function () {
    var id = getParameterByName('urunid');

    $('#btn_sepetekle').on('click', function (e) {
        var adet = parseInt($('#txt_sepet_adet').text());

        if (adet == 0) {
            toastr["error"]('Lütfen ürün adedini seçiniz.');
            return;
        }

        var fiyat = 0;

        if (entityurun.UR_FIYAT_INDIRIMLI != null)
            fiyat = entityurun.UR_FIYAT_INDIRIMLI;
        else
            fiyat = entityurun.UR_FIYAT;

        addCost(entityurun.UR_ID, entityurun.UR_AD, adet, fiyat);
    });

    $('#btn_sepet_arttir').on('click', function (e) {
        var tmpr = parseInt($('#txt_sepet_adet').text());
        tmpr = tmpr + 1;

        $('#txt_sepet_adet').text(tmpr)
    });

    $('#btn_sepet_azalt').on('click', function (e) {
        var tmpr = parseInt($('#txt_sepet_adet').text());
        tmpr = tmpr - 1;

        if (tmpr < 0)
            tmpr = 0;

        $('#txt_sepet_adet').text(tmpr)
    });


    UrunGetir(id);
    getFirsat();
});


function UrunGetir(id) {
    var query = JSON.stringify({ id: id });
    $.ajax({
        type: "POST",
        url: "/detay.aspx/UrunGetir",
        contentType: "application/json; charset=utf-8",
        data: query,
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                entityurun = d.data;
                $('#txt_urun_kodu').text('Ürün Kodu: (' + d.data.UR_ID + ')');
                $('#txt_urun_marka').text(d.data.MA_CODE);
                $('#txt_urun_baslik').text(d.data.UR_AD);

                if (d.data.UR_FIYAT_INDIRIMLI != null) {
                    $('#area_normal').empty();

                    $('#txt_indirim_orani').text('%' + d.data.UR_INDIRIM_YUZDE);
                    $('#txt_fiyat_indirimsiz').text(d.data.UR_FIYAT + 'TL');
                    $('#txt_fiyat_indirimli').text(d.data.UR_FIYAT_INDIRIMLI + 'TL');
                }
                else {
                    $('#area_indirimli').empty();
                    $('#txt_urun_fiyat').text(d.data.UR_FIYAT + ' TL');
                }

                $('#txt_urun_ozellikleri').text((d.data.UR_URUN_DETAY == null ? '' : d.data.UR_URUN_DETAY));

                var tmpr_src = 'images/Urunler/' + d.data.UR_RESIM_URL;
                $('#img_main_pic').attr('src', tmpr_src);

            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}

function getFirsat(filterMarka, filterkategori, filterall) {

    var query = JSON.stringify({ filterMarka: filterMarka, filterkategori: filterkategori, filterall: filterall });

    $.ajax({
        type: "POST",
        url: "/detay.aspx/getFirsatUrun",
        contentType: "application/json; charset=utf-8",
        data: query,
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                if (d.data != null) {
                    BuildFirsat(d.data);
                }
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}
function BuildFirsat(d) {

    var slcitem = $('[my_firsat_urunleri]');
    $(slcitem).empty();
    var strall = '';
    for (i = 0; i < d.length; i++) {
        var str = d[i];

        if (i + 1 == 1)
            strall += '<div class="item active">';

        strall += ('<div class="col-sm-2">' +
                      '<div class="product-image-wrapper">' +
                          '<div class="single-products"  alt="" style="min-height:244px;max-height:254px;height:244px">' +
                              '<div class="productinfo text-center">' +
                              '<img src="images/Urunler/' + str.UR_RESIM_URL + '" imgurunid="' + str.UR_ID + '" alt=""  alt="" style="min-height:128px;max-height:128px;"/>' +
                               ' <p style="margin-top:5px;min-height:30px;max-height:30px;height:30px;font-size:12px;" >' + str.UR_AD +
                                     (str.UR_INDIRIM_YUZDE != null ? '<div style="display:flex;">' + '<div style="background-color: #ff0000;height:25px;width:30px;margin-left:5px;margin-top:17px;margin-left:5px;color:white;font-size:13px;padding-top:3px;font-weight:bold;">' + '%' + str.UR_INDIRIM_YUZDE + '</div>' + '<div style="text-decoration:line-through;color:#b1b1b1;padding-left:5px;padding-top:25px;font-size:12px;">' + str.UR_FIYAT + 'TL' + '</div>' + '<div style="font-size:15px;padding-left:10px;padding-top:20px;color:#FE980F;">' + str.UR_FIYAT_INDIRIMLI + 'TL' + '</div>' + '</div>' + '<a class="btn btn-default add-to-cart" UrunId="' + str.UR_ID + '"  UrunAdi="' + str.UR_AD + '" Urun_FIYAT="' + str.UR_FIYAT + '"  Urun_FIYAT_INDIRIMLI="' + str.UR_FIYAT_INDIRIMLI + '"  SepeteEkle=""><i class="fa fa-shopping-cart"></i>Sepete Ekle</a>' : '') +
                                     (str.UR_INDIRIM_YUZDE == null ? '<p style="margin-bottom:5px;margin-top:15px;min-height:15px;max-height:15px;height:15px;font-size:15px;color:#FE980F;" >' + str.UR_FIYAT + " TL" + '</p>' + '<a class="btn btn-default add-to-cart" UrunId="' + str.UR_ID + '"  UrunAdi="' + str.UR_AD + '" Urun_FIYAT="' + str.UR_FIYAT + '" Urun_FIYAT_INDIRIMLI="' + str.UR_FIYAT_INDIRIMLI + '"  SepeteEkle=""><i class="fa fa-shopping-cart"></i>Sepete Ekle</a>' : '') +

                                 //'<img src="images/Urunler_min/' + str.UR_RESIM_URL + '" alt=""  alt="" style="min-height:128px;max-height:128px;height:128px"/>' +
                                 //  '<p style="min-height:40px;max-height:40px;height:40px" >' + str.UR_AD + '</p>' + '<p style="margin-bottom:17px;min-height:15px;max-height:15px;height:15px;font-size:16px;color:#FE980F;">' + str.UR_FIYAT + " TL" + '</p>' + '<a class="btn btn-default add-to-cart" UrunId="' + str.UR_ID + '" UrunAdi="' + str.UR_AD + '" SepeteEkle=""><i class="fa fa-shopping-cart"></i>Sepete Ekle</a>' +
                            '</div>' +
                          '</div>' +
                      '</div>' +
                 '</div>');

        if (i + 1 == d.length)
            strall += '</div>';
        else if (((i + 1) % 6) == 0)
            strall += '</div><div class="item">';
    }
    $(slcitem).append(strall);

    $('[imgurunid]').off('click').on('click', function (e) {
        var UrunId = $(this).attr('imgurunid');

        window.open("/detay.aspx?urunid=" + UrunId);
    });


    $('[SepeteEkle]').off('click').on('click', function (e) {
        var UrunId = $(this).attr('UrunId');
        var UrunAdi = $(this).attr('UrunAdi');
        var UrunFIYAT = parseFloat($(this).attr('Urun_FIYAT'));
        var UrunINDIRIMLI_FIYAT = $(this).attr('Urun_FIYAT_INDIRIMLI');
        if (UrunINDIRIMLI_FIYAT != 'null')
            UrunINDIRIMLI_FIYAT = parseFloat(UrunINDIRIMLI_FIYAT);

        if (UrunINDIRIMLI_FIYAT == 'null') {
            addCost(UrunId, UrunAdi, 1, UrunFIYAT);
        }
        else {
            addCost(UrunId, UrunAdi, 1, UrunINDIRIMLI_FIYAT);
        } 
    });
}


