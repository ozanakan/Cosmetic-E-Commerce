var gosterilecek = 50;
var filter = null;
var slcmarka = [];
var slckategori = [];
var sayfa = 1;

$(document).ready(function () {

    getUrunler(slcmarka, slckategori, filter);
    getFirsat(slcmarka, slckategori, filter);

    $('#btnopenuserform').hide();

    $('#admingirisi').on('click', function (e) {
        var user = $('#txt_admin_user').val();
        var pass = $('#txt_admin_pass').val();
        LoginAdmin(user, pass);
    });

    $('#slc_gosterilecek').on('change', function (e) {
        gosterilecek = $(this).val();
        getUrunler(slcmarka, slckategori, filter);
    });

    $('#slc_gosterilecek').val('50');
});
function LoginAdmin(user, pass) {
    var query = JSON.stringify({ user: user, pass: pass });

    $.ajax({
        type: "POST",
        url: "/index.aspx/LoginAdmin",
        contentType: "application/json; charset=utf-8",
        data: query,
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                if (d.url != '') {
                    window.location.assign(d.url);
                }
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}


function getCategory() {

    $.ajax({
        type: "POST",
        url: "/index.aspx/getCategory",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                if (d.data != null) {
                    BuildCategory(d.data);
                }
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}
function BuildCategory(d) {

    var slcitemsol = $('[my_sol_kategori]');
    $(slcitemsol).empty();
    var strall2 = '';
    for (i = 0; i < d.length; i++) {
        var str = d[i];
        strall2 += '<div class="panel panel-default"><div class="panel-heading"><h4 class="panel-title"><a href="#" my_sol_kategori_id="' + str.KA_ID + '">' + str.KA_CODE + '</a></h4></div></div>';
    }
    $(slcitemsol).append(strall2);

    $("[my_sol_kategori_id]").click(function () {
        slckategori = $(this).attr('my_sol_kategori_id');
        slcmarka = null;
        sayfa = 1;
        getUrunler(slcmarka, slckategori, filter);
    });
}
function getMarka() {

    $.ajax({
        type: "POST",
        url: "/index.aspx/getMarka",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                if (d.data != null) {
                    BuildMarka(d.data);
                }
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}
function BuildMarka(d) {

    var slcitem = $('[my_sol_marka]');
    $(slcitem).empty();
    var strall = '';
    for (i = 0; i < d.length; i++) {
        var str = d[i];
        strall += ' <li><a href="#" my_sol_marka_id="' + str[0] + '"><span class="pull-right">(' + str[2] + ')</span>' + str[1] + '</a></li>';
    }
    $(slcitem).append(strall);
    $("[my_sol_marka_id]").click(function () {
        slcmarka = $(this).attr('my_sol_marka_id');
        slckategori = null;
        sayfa = 1;
        getUrunler(slcmarka, slckategori, filter);
    });


}


function getUrunler(filterMarka, filterkategori, filterall) {
    //filterall = $('[placeholder="Ara"]').val();

    filterall = null;

    var query = JSON.stringify({ filterMarka: filterMarka, filterkategori: filterkategori, filterall: filterall, gosterilecek: gosterilecek, sayfa: sayfa });

    $.ajax({
        type: "POST",
        url: "/index.aspx/getUrun",
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
                    BuildUrunler(d.data, d.total);
                }
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}
function BuildUrunler(d, total) {

    var slcitem = $('[my_main_urunler]');
    $(slcitem).empty();
    var strall = '';
    for (i = 0; i < d.length; i++) {
        var str = d[i];
        strall += ('<div class="col-sm-3 col-sm-3-maincontent">' +
                            '<div class="product-image-wrapper">' +
                                '<div class="single-products" style="min-height:400px;max-height:400px;height:400px">' +
                                    '<div class="productinfo text-center">' +
                                        '<img imgurunid="' + str.UR_ID + '" src="images/Urunler/' + str.UR_RESIM_URL + '"  alt="" style="min-height:255px;max-height:255px;"/>' +
                                       ' <p style="margin-top:10px;min-height:50px;max-height:50px;height:50px" >' + str.UR_AD +
                                      (str.UR_INDIRIM_YUZDE != null ? '<div style="display:flex;">' + '<div style="background-color: #ff0000;height:40px;width:40px;margin-bottom:5px;margin-left:20px;color:white;font-size:17px;padding-top:8px;font-weight:bold;">' + '%' + str.UR_INDIRIM_YUZDE + '</div>' + '<div style="text-decoration:line-through;color:#b1b1b1;padding-left:20px;padding-top:15px;font-size:15px;">' + str.UR_FIYAT + 'TL' + '</div>' + '<div style="font-size:20px;padding-left:20px;padding-top:10px;color:#FE980F;">' + str.UR_FIYAT_INDIRIMLI + 'TL' + '</div>' + '</div>' + '<a class="btn btn-default add-to-cart" UrunId="' + str.UR_ID + '"  UrunAdi="' + str.UR_AD + '" Urun_FIYAT="' + str.UR_FIYAT + '"  Urun_FIYAT_INDIRIMLI="' + str.UR_FIYAT_INDIRIMLI + '"  SepeteEkle=""><i class="fa fa-shopping-cart"></i>Sepete Ekle</a>' : '') +
                                      (str.UR_INDIRIM_YUZDE == null ? '<p style="margin-bottom:15px;margin-top:15px;min-height:15px;max-height:15px;height:15px;font-size:20px;color:#FE980F;" >' + str.UR_FIYAT + " TL" + '</p>' + '<a class="btn btn-default add-to-cart" UrunId="' + str.UR_ID + '"  UrunAdi="' + str.UR_AD + '" Urun_FIYAT="' + str.UR_FIYAT + '"  Urun_FIYAT_INDIRIMLI="' + str.UR_FIYAT_INDIRIMLI + '"   SepeteEkle=""><i class="fa fa-shopping-cart"></i>Sepete Ekle</a>' : '') +
                                       //<img src="images/home/product1.jpg" alt="" style="min-height:255px;max-height:255px;height:255px"/>' +
                                       // '<p style="margin-top:10px;min-height:60px;max-height:60px;height:40px" >' + str.UR_AD + '</p>' + '<p style="margin-bottom:10px;min-height:15px;max-height:15px;height:15px;font-size:16px;color:#FE980F;text-decoration:line-through;" >' + str.UR_FIYAT + " TL" + '</p>' + '<a class="btn btn-default add-to-cart" UrunId="' + str.UR_ID + '"  UrunAdi="' + str.UR_AD + '" Urun_FIYAT="' + str.UR_FIYAT + '"  SepeteEkle=""><i class="fa fa-shopping-cart"></i>Sepete Ekle</a>' +
                                    '</div>' +
                                    (str.UR_YENI == '+' ? '<img src="images/home/new.png" class="new" alt="" />' : '') +
                                    (str.UR_INDIRIM != null ? '<img  src="images/home/sale.png" class="new" alt="" />' : '') +
                                '</div>' +
                            '</div>' +
                        '</div>');
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

    var pagetotal = 1;
    if (total != 0 && total > gosterilecek) {
        pagetotal = total / gosterilecek;
    }

    $('#page-selection').bootpag({
        total: pagetotal,
        page: sayfa,
        maxVisible: 10
    }).off('page').on('page', function (event, num) {
        sayfa = num;
        getUrunler(slcmarka, slckategori, filter);
    });
}

function getFirsat(filterMarka, filterkategori, filterall) {

    var query = JSON.stringify({ filterMarka: filterMarka, filterkategori: filterkategori, filterall: filterall });

    $.ajax({
        type: "POST",
        url: "/index.aspx/getFirsatUrun",
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


    $('[imgurunid]').off('click').on('click', function (e) {
        var UrunId = $(this).attr('imgurunid');

        window.open("/detay.aspx?urunid=" + UrunId);
    });



}


var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }
    myIndex++;
    if (myIndex > x.length) { myIndex = 1 }
    x[myIndex - 1].style.display = "block";
    setTimeout(carousel, 4000); // Change image every 2 seconds
}