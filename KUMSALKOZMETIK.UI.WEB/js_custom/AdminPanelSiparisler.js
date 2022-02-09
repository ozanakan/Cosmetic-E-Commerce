var isFirstSiparis = true;
var isFirstSiparisDetay = true;

var slcrow = null;

$(document).ready(function () {
    if ($(window).width() < 770)
        $('[grafik]').hide();

    getSiparis();

    PublicProcess();
});

function getSiparis() {
    $.ajax({
        type: "POST",
        url: "/AdminPanelSiparisler.aspx/getSiparis",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                if (d.data != null) {
                    BuildSiparis(d.data);
                }
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}
function BuildSiparis(data) {
    $('#TR_Siparis > tbody').empty();
    var strall = '';
    if (data.length > 0) {
        for (var i = 0; i < data.length ; i++) {
            var satir = data[i];
            strall = strall +
             '<tr durumid="' + satir.SP_DURUM + '">' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;"><button type="button" siparissil="' + satir.SP_ID + '" class="btn btn-xs btn-danger">Sil</button></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.SP_ID == null ? '' : satir.SP_ID) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.MU_AD_SOYAD == null ? '' : satir.MU_AD_SOYAD) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.MU_SIRKET == null ? '' : satir.MU_SIRKET) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.SP_TOPLAM_URUN == null ? '' : satir.SP_TOPLAM_URUN) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.SP_TOPLAM_TUTAR == null ? '' : satir.SP_TOPLAM_TUTAR) + ' TL</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.SP_CREATED == null ? '' : moment(satir.SP_CREATED).format('DD.MM.YYYY HH:MM')) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.SP_DURUM == null ? '' : siparisdurum(satir.SP_DURUM)) + '</span></td>' +
            '</tr>';
        }
    } else {
        strall = strall + '<tr trType="nodata"><td class="tableheadcolumn" style="text-align: center" colspan="7">-Kayıt Yok-</td></tr>';
    }

    $('#TR_Siparis tbody').append(strall);

    if (isFirstSiparis) {
        $('.fht-table-wrapper').css('height', 'auto');
        $('#TR_Siparis').fixedHeaderTable({
            footer: true,
            altClass: 'odd',
            autoShow: true,
            height: (800)
        });

        if (data.length > 0) {
            isFirstSiparis = false;
        }
    }

    RowOnClickSiparis();
}
function RowOnClickSiparis() {
    var rows = $('#TR_Siparis > tbody').find('tr');
    rows.off('click').on('click', function () {
        clear();
        var me = $(this);

        rows.css('background-color', 'white');
        me.css('background-color', '#F1F1F1');

        var selc = $($(me).find('td')[1]).text();
        var durum = $(me).attr('durumid');
        $('#slc_durum').val(durum);
        slcrow = selc;
        getSiparisDetay(selc);
    });

    $('[siparissil]').off('click').on('click', function (e) {
        var id = $(this).attr('siparissil');
        deleteSiparis(id);
    });
}
function deleteSiparis(id) {
    var query = JSON.stringify({ id: id });

    $.ajax({
        type: "POST",
        url: "/AdminPanelSiparisler.aspx/deleteSiparis",
        contentType: "application/json; charset=utf-8",
        data: query,
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {

                getSiparis();

                toastr["success"]("Sipariş Silindi.");

            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}
function siparisdurum(id) {
    switch (id) {
        case '0':
            return 'İptal Edildi';
        case '1':
            return 'Sipariş Alındı';
        case '2':
            return 'Ürün Hazırlanıyor';
        case '3':
            return 'Ürün Temin Ediliyor';
        case '4':
            return 'Kargoya Verildi';
        case '5':
            return 'Tamamlandı';
    }
}

function changestatus(_id, _durum) {
    var query = JSON.stringify({ id: _id, durum: _durum });

    $.ajax({
        type: "POST",
        url: "/AdminPanelSiparisler.aspx/changestatus",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: query,
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) { 
                getSiparis(); 
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}


function getSiparisDetay(_id) {
    var query = JSON.stringify({ id: _id });

    $.ajax({
        type: "POST",
        url: "/AdminPanelSiparisler.aspx/getSiparisDetay",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: query,
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                if (d.data != null) {
                    BuildSiparisDetay(d.data);
                }
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}
function BuildSiparisDetay(data) {
    $('#TR_Maintable_Detay > tbody').empty();
    var strall = '';
    if (data.length > 0) {
        for (var i = 0; i < data.length ; i++) {
            var satir = data[i];
            strall = strall +
             '<tr>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.SPD_ID == null ? '' : satir.SPD_ID) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.UR_AD == null ? '' : satir.UR_AD) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.SPD_URUN_ADET == null ? '' : satir.SPD_URUN_ADET) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.SPD_URUN_FIYAT == null ? '' : satir.SPD_URUN_FIYAT) + ' TL</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.SPD_URUN_TOPLAM == null ? '' : satir.SPD_URUN_TOPLAM) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.SPD_URUN_NOT == null ? '' : satir.SPD_URUN_NOT) + '</span></td>' +
            '</tr>';
        }
    } else {
        strall = strall + '<tr trType="nodata"><td class="tableheadcolumn" style="text-align: center" colspan="6">-Kayıt Yok-</td></tr>';
    }

    $('#TR_Maintable_Detay tbody').append(strall);

    if (isFirstSiparisDetay) {
        $('.fht-table-wrapper').css('height', 'auto');
        $('#TR_Maintable_Detay').fixedHeaderTable({
            footer: true,
            altClass: 'odd',
            autoShow: true,
            height: (800)
        });

        if (data.length > 0) {
            isFirstSiparis = false;
        }
    }

    $('#slc_durum').change(function () {
        var d = $(this).val();
        if (d == '' || slcrow == null) {
            toastr["error"]('Değerler alınamadı.');
            return;
        }
        changestatus(slcrow, d);
    });
}
function clear() {
    slcrow = null;
    $('#slc_durum').val('0');
    $('#TR_Maintable_Detay > tbody').empty();
}
