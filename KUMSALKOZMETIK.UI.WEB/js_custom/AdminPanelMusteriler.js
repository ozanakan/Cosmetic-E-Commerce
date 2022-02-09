
var slcMusteri = {};
var isFirstMusteri = true;

$(document).ready(function () {
    if ($(window).width() < 770)
        $('[grafik]').hide();

    $('#btn_save').on('click', function (e) {
        slcMusteri.MU_ID = $('#txt_mus_id').val();
        if (slcMusteri.MU_ID == '')
            slcMusteri.MU_ID = null;

        slcMusteri.MU_AD_SOYAD = $('#txt_mus_ad_soyad').val();
        slcMusteri.MU_SIRKET = $('#txt_mus_sirket').val();
        slcMusteri.MU_KULLANICI_ADI = $('#txt_mus_kullanici_adi').val();
        slcMusteri.MU_ADRES = $('#txt_mus_adres').val();
        slcMusteri.MU_TELEFON = $('#txt_mus_telefon').val();
        slcMusteri.MU_EMAIL = $('#txt_mus_eposta').val();
        slcMusteri.MU_SIFRE = $('#txt_mus_sifre').val();
        slcMusteri.MU_MUSTERIM = $('#txt_mus_musterim').val();

        saveMusteri(slcMusteri);
    });
    $('#btn_delete').on('click', function (e) {
        var id = $('#txt_mus_id').val();
        if (id == '')
            toastr["error"]('Sileceğiniz kategoriyi seçiniz.');
        deleteMusteri(id);
    });
    $('#btn_clear').on('click', function (e) {
        clearMusteri();
    });

    getMusteri();
    PublicProcess();
});

function getMusteri() {
    $.ajax({
        type: "POST",
        url: "/AdminPanelMusteriler.aspx/getMusteri",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                if (d.data != null) {
                    BuildMusteri(d.data);
                }
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}
function BuildMusteri(data) {
    $('#TR_Musteri > tbody').empty();
    var strall = '';
    if (data.length > 0) {
        for (var i = 0; i < data.length ; i++) {
            var satir = data[i];
            strall = strall +
             '<tr>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.MU_ID == null ? '' : satir.MU_ID) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.MU_AD_SOYAD == null ? '' : satir.MU_AD_SOYAD) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.MU_SIRKET == null ? '' : satir.MU_SIRKET) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.MU_KULLANICI_ADI == null ? '' : satir.MU_KULLANICI_ADI) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.MU_TELEFON == null ? '' : satir.MU_TELEFON) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.MU_ADRES == null ? '' : satir.MU_ADRES) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.MU_EMAIL == null ? '' : satir.MU_EMAIL) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.MU_SIFRE == null ? '' : satir.MU_SIFRE) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.MU_MUSTERIM == null ? '' : satir.MU_MUSTERIM) + '</span></td>' +
            '</tr>';
        }
    } else {
        strall = strall + '<tr trType="nodata"><td class="tableheadcolumn" style="text-align: center" colspan="3">-Kayıt Yok-</td></tr>';
    }

    $('#TR_Musteri tbody').append(strall);

    if (isFirstMusteri) {
        $('.fht-table-wrapper').css('height', 'auto');
        $('#TR_Musteri').fixedHeaderTable({
            footer: true,
            altClass: 'odd',
            autoShow: true,
            height: (600)
        });

        if (data.length > 0) {
            isFirstMusteri = false;
        }
    }

    RowOnClickMusteri();
}
function RowOnClickMusteri() {
    var rows = $('#TR_Musteri > tbody').find('tr');
    rows.off('click').on('click', function () {

        var me = $(this);

        rows.css('background-color', 'white');
        me.css('background-color', '#F1F1F1');
 
        $('#txt_mus_id').val($($(me).find('td')[0]).text());
        $('#txt_mus_ad_soyad').val($($(me).find('td')[1]).text());
        $('#txt_mus_sirket').val($($(me).find('td')[2]).text());
        $('#txt_mus_kullanici_adi').val($($(me).find('td')[3]).text());
        $('#txt_mus_adres').val($($(me).find('td')[5]).text());
        $('#txt_mus_telefon').val($($(me).find('td')[4]).text());
        $('#txt_mus_eposta').val($($(me).find('td')[6]).text());
        $('#txt_mus_sifre').val($($(me).find('td')[7]).text());
        $('#txt_mus_musterim').val($($(me).find('td')[8]).text());
         
    });
}
function deleteMusteri(id) {
    var query = JSON.stringify({ id: id });

    $.ajax({
        type: "POST",
        url: "/AdminPanelMusteriler.aspx/deleteMusteri",
        contentType: "application/json; charset=utf-8",
        data: query,
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {

                getMusteri();

                toastr["success"]("Üst Kategori Silindi.");

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
        url: "/AdminPanelMusteriler.aspx/saveMusteri",
        contentType: "application/json; charset=utf-8",
        data: query,
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                getMusteri();
                toastr["success"]("Üst Kategori Eklendi.");
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}
function clearMusteri() {
    slcMusteri.MU_ID = null;
    slcMusteri.MU_AD_SOYAD = null;
    slcMusteri.MU_SIRKET = null;
    slcMusteri.MU_KULLANICI_ADInull;
    slcMusteri.MU_ADRES = null;
    slcMusteri.MU_TELEFON = null;
    slcMusteri.MU_EMAIL = null;
    slcMusteri.MU_SIFRE = null;

    $('#txt_mus_id').val('');
    $('#txt_mus_ad_soyad').val('');
    $('#txt_mus_sirket').val('');
    $('#txt_mus_kullanici_adi').val('');
    $('#txt_mus_adres').val('');
    $('#txt_mus_telefon').val('');
    $('#txt_mus_eposta').val('');
    $('#txt_mus_sifre').val('');

    $('#TR_Main > tbody').find('tr').css('background-color', 'white');
}

