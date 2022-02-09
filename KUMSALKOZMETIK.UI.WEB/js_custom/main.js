
$(document).ready(function () {
    $('[mylogin]').hide();
    $('[my_kullanici]').show();
    kotrol();
    getMenuItem();

    $('[my_kullanici_text]').off('click').on('click', function (e) {
        sessionkill();
    });


    $('#search').on('keyup', function (e) {
        if (e.keyCode == 13) {
            var filter = $('#search').val();

            if (filter == '') {
                toastr["error"]('lüften aranacak bir anahtar kelime giriniz');
                return;
            }

            var url = "urunler.aspx?searchkey=" + filter + "&filtermarka=null&filterkategori=null&filteraltkategori=null";

            window.open(url, "_self");
        }
    });

    $('.fa-search').off('click').on('click', function (e) {
        var filter = $('#search').val();
        if (filter == '') {
            toastr["error"]('lüften aranacak bir anahtar kelime giriniz');
            return;
        }
        var url = "urunler.aspx?searchkey=" + filter + "&filtermarka=null&filterkategori=null&filteraltkategori=null";

        window.open(url, "_self");
    });
});

function getMenuItem() {
    $.ajax({
        type: "POST",
        url: "/index.aspx/getMenuItem",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                BuildMenuItem(d.dataktgri, d.dataktgrialt, d.dataktgriust, d.datamarka)
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}
function BuildMenuItem(kategori, altkategori, ustkategori, marka) {
    $('#bs-example-navbar-collapse-1').empty();

    var content = '<ul class="nav navbar-nav top-nav-info">';
    content += '<li><a href="index.aspx">Ana Sayfa</a></li>';
   


    //Bu kısımda markaları ekrana yerleştiriyoruz
    content += '<li class="dropdown grid">';
    content += '<a href="#" class="dropdown-toggle list1" data-toggle="dropdown">Markalar<b class="caret"></b></a>';
    content += '<ul class="dropdown-menu multi-column multi-column2">';
    content += '<div class="row">';

    content += BuildMenuItemMarka(marka);

    content += '</div>';
    content += '</ul>';
    content += '</li>';
    //////Marka ekleme burada tamamlandı////////////////

    /////////Ana Kategori ve alt kategoriler geliyor burada///////////////////

    for (var i = 0; i < ustkategori.length; i++) {
        content += '<li class="dropdown grid">';
        content += '<a href="/Urunler.aspx?searchkey=null&filtermarka=null&filterkategori=' + ustkategori[i].UK_ID + '&filteraltkategori=null" class="dropdown-toggle list1" data-toggle="dropdown">' + ustkategori[i].UK_CODE + '<b class="caret"></b></a>';
        content += '<ul class="dropdown-menu multi-column multi-column2">';
        content += '<div class="row">';

        content += BuildMenuItemAlt(ustkategori[i].UK_ID, kategori, altkategori);

        content += '</div>';
        content += '</ul>';
        content += '</li>';
    }



    /////////Ana Kategori ve alt kategoriler ekleme burada tamamlandı///////////////////

    //content += '<li><a href="about.aspx">İletişim</a></li>';
    content += '</ul>'
    content += '<div class="clearfix"></div>';

    $('#bs-example-navbar-collapse-1').append(content);
}

function BuildMenuItemMarka(marka) {
    var tmprmarka = '';

    for (var a = 1; a < 4 ; a++) {
        tmprmarka += '<div class="col-sm-3 menu-grids">';
        tmprmarka += '<ul class="multi-column-dropdown">';

        var baslangicdegeri = a * 8;
        var bitisdegeri = baslangicdegeri + 8;

        for (var i = baslangicdegeri ; i < bitisdegeri; i++) {
            if (i >= (marka.length))
                break;

            tmprmarka += '<li><a class="list" href="/Urunler.aspx?searchkey=null&filtermarka=' + marka[i].MA_ID + '&filterkategori=null&filteraltkategori=null">' + marka[i].MA_CODE + '</a></li>';

        }
        tmprmarka += '</ul>';
        tmprmarka += '</div>';
    }

    tmprmarka += '<div class="col-sm-3 menu-grids new-add2">'
    tmprmarka += '<img src="images/Markalar/marka1.png" alt="">'
    tmprmarka += '</div>';

    return tmprmarka;
}

function BuildMenuItemAlt(ustkategoriid, kategori, altkategori) {

    var tmprarry = new Array();
    var tmpraltkategori = '';

    for (var i = 0; i < kategori.length; i++) {
        if (kategori[i].UK_ID == ustkategoriid) {
            tmprarry.push({ kategori_id: kategori[i].KA_ID, kategori: kategori[i].KA_CODE, altkategori: null });
            for (var a = 0; a < altkategori.length; a++) {
                if (altkategori[a].KA_ID == kategori[i].KA_ID) {
                    tmprarry.push({ kategori: null, altkategori_id: altkategori[a].AK_ID, altkategori: altkategori[a].AK_CODE });
                }
            }
        }
    }

    for (var a = 0; a < 3 ; a++) {
        tmpraltkategori += '<div class="col-sm-3 menu-grids ">';
        tmpraltkategori += '<ul class="multi-column-dropdown ">';

        var baslangicdegeri = a * 5;
        var bitisdegeri = baslangicdegeri + 5;

        for (var i = baslangicdegeri ; i < bitisdegeri; i++) {

            if (i >= (tmprarry.length))
                break;

            if (tmprarry[i].kategori != null)
                tmpraltkategori += '<h4>' + tmprarry[i].kategori + '</h4>';
            else {
                tmpraltkategori += '<li><a class="list" href="/Urunler.aspx?searchkey=null&filtermarka=null&filterkategori=null&filteraltkategori=' + tmprarry[i].altkategori_id + '">' + tmprarry[i].altkategori + '</a></li>';
            }
        }
        tmpraltkategori += '</ul>';
        tmpraltkategori += '</div>';
    }

    tmpraltkategori += '<div class="col-sm-3 menu-grids new-add2">';
    tmpraltkategori += '<img src="images/Markalar/marka1.png" alt="">';
    tmpraltkategori += '</div>';
    tmpraltkategori += '<div class="clearfix"></div>';

    return tmpraltkategori;
}


function addCost(UrunId, UrunAdi, Adet, Fiyat) {

    var query = JSON.stringify({ UrunId: UrunId, UrunAdi: UrunAdi, Adet: Adet, Fiyat: Fiyat });

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

                toastr["success"]("Ürününüz sepete eklendi.");
                kotrol();

            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}

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
                if (d.data != null && d.data.Sepet != null && d.data.Sepet.length > 0) {
                    var fiyattoplam = 0;
                    var adettoplam = 0;
                    for (var i = 0; i < d.data.Sepet.length; i++) {
                        fiyattoplam = fiyattoplam + (d.data.Sepet[i].UrunFiyat * d.data.Sepet[i].UrunAdet);
                        adettoplam = adettoplam + d.data.Sepet[i].UrunAdet;
                    }

                    $('#simpleCart_quantity').text(adettoplam);
                    $('.simpleCart_total').text(formatMoney(fiyattoplam) + " TL");
                }
                else {
                    $('#simpleCart_quantity').text('0');
                    $('#simpleCart_total').text('0 TL');
                }

                if (d.data != null && d.data.Musteri) {
                    $('[mylogin]').hide();
                    $('[my_kullanici]').show();
                    $('[my_kullanici_text]').text((d.data.Musteri.MU_KULLANICI_ADI)).add('<a href="#"> (Çıkışş)</a>');
                    $('[my_kullanici_text]').add('<a href="#"> (Çıkış)</a>');
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

function formatMoney(n, c, d, t) {
    var c = isNaN(c = Math.abs(c)) ? 2 : c,
      d = d == undefined ? "." : d,
      t = t == undefined ? "," : t,
      s = n < 0 ? "-" : "",
      i = String(parseInt(n = Math.abs(Number(n) || 0).toFixed(c))),
      j = (j = i.length) > 3 ? j % 3 : 0;

    return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t);
};

function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, '\\$&');
    var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, ' '));
}