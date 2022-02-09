
var gosterilecek = 50;
var filter = null;
var slcmarka = [];
var slckategori = [];

var prmtmarka = null;
var prmtkategr = null;
var prmtaltkategr = null;
var prmtsearchkey = null;
var short_colon = null;
var short_type = null;

var sayfa = 1;

$(document).ready(function () {
    prmtmarka = getParameterByName('filtermarka');
    prmtkategr = getParameterByName('filterkategori');
    prmtaltkategr = getParameterByName('filteraltkategori');
    prmtsearchkey = getParameterByName('searchkey');

    getMarka();
    getCategory();


    $("#btn_fiyat").click(function () {
        getUrunler();
    });
     

    getUrunler();

    $('.shortlist').off('click').on('click', function (e) {
        short_colon = $(this).attr('shortcolon');
        short_type = $(this).attr('shorttype');

        getUrunler()
    });

});


function getCategory() {
    $.ajax({
        type: "POST",
        url: "/index.aspx/getAllCategory",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                BuildCategory(d.dataustkategori, d.datakategori, d.dataaltkategori);
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}
function BuildCategory(dataustkategori, datakategori, dataaltkategori) {
    var slcitem = $('#area_kategoriler');
    $(slcitem).empty();

    var tmprelmt = '<ul id="treeview" class="hummingbird-base">';

    for (i = 0; i < dataustkategori.length; i++) {
        var ustkategori = dataustkategori[i];

        tmprelmt += '<li><i class="fa fa-minus"></i>';
        tmprelmt += '<label>';
        tmprelmt += '<input id="node-' + i + '" style="margin-left:3px;margin-right:3px" my_sol_ust_kategori_id="' + ustkategori.UK_ID + '" type="checkbox"/>';
        tmprelmt += ustkategori.UK_CODE + '</label>';

        for (var x = 0; x < datakategori.length; x++) {
            var kategori = datakategori[x];

            if (kategori.UK_ID == ustkategori.UK_ID) {
                tmprelmt += '<ul id="treeview" style="margin-left:10px" class="hummingbird-base">';
                tmprelmt += '<li><i class="fa fa-minus"></i>';
                tmprelmt += '<label>';
                tmprelmt += '<input id="node-' + i + '_' + x + '"  style="margin-left:3px;margin-right:3px"  my_sol_kategori_id="' + kategori.KA_ID + '" type="checkbox"' + (prmtkategr == kategori.UK_ID ? ' checked ' : '') + '/>';
                tmprelmt += kategori.KA_CODE + '</label>';

                for (var y = 0; y < dataaltkategori.length; y++) {
                    var altkategori = dataaltkategori[y];

                    if (kategori.KA_ID == altkategori.KA_ID) {
                        tmprelmt += '<ul id="treeview" style="margin-left:20px" class="hummingbird-base">';
                        tmprelmt += '<li><i class="fa fa-minus"></i>';
                        tmprelmt += '<label>';
                        tmprelmt += '<input id="node-' + i + '_' + x + '_' + y + '"  style="margin-left:3px;margin-right:3px"  my_sol_alt_kategori_id="' + altkategori.AK_ID + '" type="checkbox" ' + (prmtaltkategr == altkategori.AK_ID ? ' checked ' : '') + '/>';
                        tmprelmt += altkategori.AK_CODE + '</label>';

                        tmprelmt += '</li>';
                        tmprelmt += '</ul>';
                    }
                }

                tmprelmt += '</li>';
                tmprelmt += '</ul>';
            }
        }

        tmprelmt += '</li>';
    }

    tmprelmt += '</ul>';

    $(slcitem).append(tmprelmt);

    $("#treeview").hummingbird();

    $("[my_sol_ust_kategori_id]").off('click').click(function () {
        sayfa = 1;
        getUrunler();
    });
    $("[my_sol_kategori_id]").off('click').click(function () {
        sayfa = 1;
        getUrunler();
    });
    $("[my_sol_alt_kategori_id]").off('click').click(function () {
        sayfa = 1;
        getUrunler();
    });
}


function getMarka() {
    $.ajax({
        type: "POST",
        url: "/index.aspx/getMarka",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
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

    var slcitem = $('#area_markalar');
    $(slcitem).empty();
    var strall = '<ul id="treeviewmarka" class="hummingbird-base">';

    for (i = 0; i < d.length; i++) {
        var str = d[i];

        strall += '<li> ';
        strall += '<label>';
        strall += '<input id="node-' + i + '" style="margin-left:20px" my_sol_marka_id="' + str.MA_ID + '" type="checkbox" ' + (str.MA_ID == prmtmarka ? ' checked ' : '') + '/>';
        strall += str.MA_CODE + '</label>';


        strall += '</li>';
    }

    strall += '</ul>';

    $(slcitem).append(strall);

    $("#treeviewmarka").hummingbird();

    $("[my_sol_marka_id]").off('click').click(function () {
        sayfa = 1;
        getUrunler();
    });
}


function GetCheckedMarkaList() {
    var items = $("[my_sol_marka_id]");

    slcmarka = [];

    for (var i = 0; i < items.length; i++) {
        if ($(items[i]).is(":checked") == true)
            slcmarka.push(parseInt($(items[i]).attr('my_sol_marka_id')));
    }

    return slcmarka;
}


function GetCheckedUstKategoriList() {
    var items = $("[my_sol_ust_kategori_id]");

    slckategori = [];

    for (var i = 0; i < items.length; i++) {
        if ($(items[i]).is(":checked") == true)
            slckategori.push(parseInt($(items[i]).attr('my_sol_ust_kategori_id')));
    }

    return slckategori;
}

function GetCheckedKategoriList() {
    var items = $("[my_sol_kategori_id]");

    slckategori = [];

    for (var i = 0; i < items.length; i++) {
        if ($(items[i]).is(":checked") == true)
            slckategori.push(parseInt($(items[i]).attr('my_sol_kategori_id')));
    }

    return slckategori;
}

function GetCheckedAltKategoriList() {
    var items = $("[my_sol_alt_kategori_id]");

    slckategori = [];

    for (var i = 0; i < items.length; i++) {
        if ($(items[i]).is(":checked") == true)
            slckategori.push(parseInt($(items[i]).attr('my_sol_alt_kategori_id')));
    }

    return slckategori;
}

function GetCheckedFiyatList() {
    var items = $("[my_sol_fiyat_id]");

    slckategori = [];

    for (var i = 0; i < items.length; i++) {
        if ($(items[i]).is(":checked") == true)
            slckategori.push(parseInt($(items[i]).attr('my_sol_kategori_id')));
    }

    return slckategori;
}


function getUrunler() {

    var minfiyat = $('#txt_fiyat_min').val();
    if (minfiyat != '')
        try {
            minfiyat = parseFloat(minfiyat);
        } catch (e) {
            maxfiyat = null;
        }
    else
        minfiyat = null;

    var maxfiyat = $('#txt_fiyat_max').val();
    if (maxfiyat != '')
        try {
            maxfiyat = parseFloat(maxfiyat);
        } catch (e) {
            maxfiyat = null;
        }

    else
        maxfiyat = null;
   
    var query = JSON.stringify({
        shortcolon: short_colon, shorttype: short_type,
        filterMarka: GetCheckedMarkaList(), filterustkategori: GetCheckedUstKategoriList(),
        filterkategori: GetCheckedKategoriList(), filteraltkategori: GetCheckedAltKategoriList(),
        filterall: prmtsearchkey, gosterilecek: gosterilecek, sayfa: sayfa,
        maxfiyat: maxfiyat,
        minfiyat:minfiyat
    });

    $.ajax({
        type: "POST",
        url: "/urunler.aspx/getUrun",
        contentType: "application/json; charset=utf-8",
        data: query,
        dataType: "json",
        async: false,
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
                                '<div class="single-products" style="min-height:350px;max-height:350px;height:350px">' +
                                    '<div class="productinfo text-center">' +
                                        '<img src="images/Urunler/' + str.UR_RESIM_URL + '" imgurunid="' + str.UR_ID + '" alt="" style="min-height:215px;max-height:215px;height:215px"/>' +
                                        //'<img src="images/home/product1.jpg" alt="" style="min-height:255px;max-height:255px;height:255px"/>' +
                                        ' <p style="margin-top:10px;min-height:50px;max-height:50px;height:50px;font-size:13px;" >' + str.UR_AD +
                                        (str.UR_INDIRIM_YUZDE != null ? '<div style="display:flex;">' + '<div style="background-color: #ff0000;height:30px;width:35px;margin-bottom:5px;margin-left:7px;color:white;font-size:16px;padding-top:4px;font-weight:bold;">' + '%' + str.UR_INDIRIM_YUZDE + '</div>' + '<div style="text-decoration:line-through;color:#b1b1b1;padding-left:7px;padding-top:12px;font-size:15px;">' + str.UR_FIYAT + 'TL' + '</div>' + '<div style="font-size:20px;padding-left:10px;padding-top:7px;color:#FE980F;">' + str.UR_FIYAT_INDIRIMLI + 'TL' + '</div>' + '</div>' + '<a class="btn btn-default add-to-cart" UrunId="' + str.UR_ID + '"  UrunAdi="' + str.UR_AD + '" Urun_FIYAT="' + str.UR_FIYAT + '"  SepeteEkle=""><i class="fa fa-shopping-cart"></i>Sepete Ekle</a>' : '') +
                                      (str.UR_INDIRIM_YUZDE == null ? '<p style="margin-bottom:15px;min-height:15px;max-height:15px;height:15px;font-size:20px;color:#FE980F;" >' + str.UR_FIYAT + " TL" + '</p>' + '<a class="btn btn-default add-to-cart" UrunId="' + str.UR_ID + '"  UrunAdi="' + str.UR_AD + '" Urun_FIYAT="' + str.UR_FIYAT + '"  SepeteEkle=""><i class="fa fa-shopping-cart"></i>Sepete Ekle</a>' : '') +

                                       // '<p style="margin-top:0px;min-height:60px;max-height:60px;height:40px;font-size:13px" >' + str.UR_AD + '</p>' + '<p style="margin-bottom:10px;min-height:15px;max-height:15px;height:15px;font-size:16px;color:#FE980F;" >' + str.UR_FIYAT + " TL" + '</p>' + '<a class="btn btn-default add-to-cart" UrunId="' + str.UR_ID + '"  UrunAdi="' + str.UR_AD + '" Urun_FIYAT="' + str.UR_FIYAT + '"  SepeteEkle=""><i class="fa fa-shopping-cart"></i>Sepete Ekle</a>' +
                                    '</div>' +
                                    (str.UR_YENI == '+' ? '<img src="images/home/new.png" class="new" alt="" />' : '') +
                                    //(str.UR_INDIRIM != null ? '<img src="images/home/sale.png" class="new" alt="" />' : '') +
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

        addCost(UrunId, UrunAdi, 1, UrunFIYAT);
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
        getUrunler();
    });
}

