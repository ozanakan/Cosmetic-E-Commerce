
var slcKategoriUst = null;
var slcKategori = null;
var slcKategoriAlt = null;

var isFirstUstKategori = true;
var isFirstKategori = true;
var isFirstAltKategori = true;

var slcMarka = null;
var isFirstMarka = true;


$(document).ready(function () {
    if ($(window).width() < 770)
        $('[grafik]').hide();

    getKategori_ust();
    getKategori();
    getMarka();
    getKategori_alt();

    $('#btn_save_ust').on('click', function (e) {
        var _UK_ID = $('#txt_id_ust').val();
        var _UK_CODE = $('#txt_kategori_ust').val();

        if (_UK_CODE == '')
            toastr["error"]('Üst Kategori alanını doldurunuz.');
        saveKategoriUst(_UK_ID, _UK_CODE);

    });
    $('#btn_delete_ust').on('click', function (e) {
        var _UK_ID = $('#txt_id_ust').val();

        if (_UK_ID == '')
            toastr["error"]('Sileceğiniz kategoriyi seçiniz.');
        deleteKategoriUst(_UK_ID);
    });
    $('#btn_clear_ust').on('click', function (e) {
        slcKategoriUst = null;
        $('#txt_id_ust').val('');
        $('#txt_kategori_ust').val('');
        $('#tblKategori > tbody').find('tr').css('background-color', 'white');
    });



   

    $('#btn_save_marka').on('click', function (e) {
        var _MA_ID = $('#txt_id_marka').val();
        var _MA_CODE = $('#txt_marka').val();

        if (_MA_CODE == '')
            toastr["error"]('Marka alanını doldurunuz.');
        saveMarka(_MA_ID, _MA_CODE);
    });
    $('#btn_delete_marka').on('click', function (e) {
        var _MA_ID = $('#txt_id_marka').val();

        if (_MA_ID == '')
            toastr["error"]('Sileceğiniz Marka seçiniz.');
        deleteMarka(_MA_ID);
    });
    $('#btn_clear_marka').on('click', function (e) {
        slcMarka = null;
        $('#txt_id_marka').val('');
        $('#txt_marka').val('');
        $('#tblMarka > tbody').find('tr').css('background-color', 'white');
    });



    $('#btn_save_kategori').on('click', function (e) {
        var _KA_ID = $('#txt_id_kategori').val();
        var _UK_ID = $('#txt_ust_kategori_id').val();
        var _KA_CODE = $('#txt_kategori').val();

        if (_UK_ID == '')
            toastr["error"]('Üst Kategori alanını doldurunuz.');
        if (_KA_CODE == '')
            toastr["error"]('Kategori adı alanını doldurunuz.');

        saveKategori(_KA_ID, _UK_ID, _KA_CODE);
    });
    $('#btn_delete_kategori').on('click', function (e) {
        if (slcKategori == '')
            toastr["error"]('Sileceğiniz kategoriyi seçiniz.');
        deleteKategori(slcKategori);
    });
    $('#btn_clear_kategori').on('click', function (e) {
        slcKategori = null;
        $('#txt_id_kategori').val('');
        $('#txt_ust_kategori_id').val('');
        $('#txt_kategori').val('');
        $('#TR_Main > tbody').find('tr').css('background-color', 'white');
    });


    $('#btn_save_alt').on('click', function (e) {
        var _AK_ID = $('#txt_id_alt_kategori').val();
        var _KA_ID = $('#txt_ust_alt_kategori_id').val();
        var _AK_CODE = $('#txt_alt_kategori').val();


        if (_KA_ID == '')
            toastr["error"]('Kategori alanını doldurunuz.');
        if (_AK_CODE == '')
            toastr["error"]('Alt Kategori Adı alanını doldurunuz.');

        saveKategoriAlt(_AK_ID, _KA_ID, _AK_CODE);
    });
    $('#btn_delete_alt').on('click', function (e) {
        if (slcKategoriAlt == '')
            toastr["error"]('Sileceğiniz kategoriyi seçiniz.');
        deleteKategoriAlt(slcKategoriAlt);
    });
    $('#btn_clear_alt').on('click', function (e) {
        slcKategoriAlt = null;
        $('#txt_id_alt_kategori').val('');
        $('#txt_ust_alt_kategori_id').val('');
        $('#txt_alt_kategori').val('');
        $('#TR_Main_Alt > tbody').find('tr').css('background-color', 'white');
    });


    PublicProcess();
});



function getMarka() {
    $.ajax({
        type: "POST",
        url: "/AdminPanelKategoriler.aspx/getMarka",
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
function BuildMarka(data) {
    $('#tblMarka > tbody').empty();
    var strall = '';
    if (data.length > 0) {
        for (var i = 0; i < data.length ; i++) {
            var satir = data[i];
            strall = strall +
             '<tr MA_ID="' + satir.MA_ID + '" MA_CODE="' + satir.MA_CODE + '">' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.MA_ID == null ? '' : satir.MA_ID) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.MA_CODE == null ? '' : satir.MA_CODE) + '</span></td>' +

            '</tr>';
        }
    } else {
        strall = strall + '<tr trType="nodata"><td class="tableheadcolumn" style="text-align: center" colspan="2">-Kayıt Yok-</td></tr>';
    }

    $('#tblMarka tbody').append(strall);

    if (isFirstMarka) {
        $('.fht-table-wrapper').css('height', 'auto');
        $('#tblMarka').fixedHeaderTable({
            footer: true,
            altClass: 'odd',
            autoShow: true,
            height: (200)
        });

        if (data.length > 0) {
            isFirstMarka = false;
        }
    }

    RowOnClickMarka();

}
function RowOnClickMarka() {
    var rows = $('#tblMarka > tbody').find('tr');
    rows.off('click').on('click', function () {

        var me = $(this);

        rows.css('background-color', 'white');
        me.css('background-color', '#F1F1F1');

        slcMarka = $($(me).find('td')[0]).text();
        $('#txt_id_marka').val($($(me).find('td')[0]).text());
        $('#txt_marka').val($($(me).find('td')[1]).text());

    });
}
function deleteMarka(id) {
    var query = JSON.stringify({ id: id });

    $.ajax({
        type: "POST",
        url: "/AdminPanelKategoriler.aspx/deleteMarka",
        contentType: "application/json; charset=utf-8",
        data: query,
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {

                getMarka();
                slcMarka = null;
                $('#txt_id_marka').val('');
                $('#txt_marka').val('');
                toastr["success"]("Marka Silindi.");

            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}
function saveMarka(_MA_ID, _MA_CODE) {

    var query = JSON.stringify({ _MA_ID: (_MA_ID == '' ? null : _MA_ID), _MA_CODE: _MA_CODE });

    $.ajax({
        type: "POST",
        url: "/AdminPanelKategoriler.aspx/saveMarka",
        contentType: "application/json; charset=utf-8",
        data: query,
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                getMarka();
                toastr["success"]("Marka Eklendi.");
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}





function getKategori_ust() {
    $.ajax({
        type: "POST",
        url: "/AdminPanelKategoriler.aspx/getUstKategori",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                if (d.data != null) {
                    BuildKategoriUst(d.data);
                }
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}
function BuildKategoriUst(data) {
    $('#TR_Main_Ust > tbody').empty();
    var strall = '';
    if (data.length > 0) {
        for (var i = 0; i < data.length ; i++) {
            var satir = data[i];
            strall = strall +
             '<tr UK_ID="' + satir.UK_ID + '" UK_CODE="' + satir.UK_CODE + '">' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.UK_ID == null ? '' : satir.UK_ID) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.UK_CODE == null ? '' : satir.UK_CODE) + '</span></td>' +

            '</tr>';
        }
    } else {
        strall = strall + '<tr trType="nodata"><td class="tableheadcolumn" style="text-align: center" colspan="2">-Kayıt Yok-</td></tr>';
    }

    $('#TR_Main_Ust tbody').append(strall);

    if (isFirstUstKategori) {
        $('.fht-table-wrapper').css('height', 'auto');
        $('#TR_Main_Ust').fixedHeaderTable({
            footer: true,
            altClass: 'odd',
            autoShow: true,
            height: (200)
        });

        if (data.length > 0) {
            isFirstUstKategori = false;
        }
    }

    RowOnClickUstKategori();

}
function RowOnClickUstKategori() {
    var rows = $('#TR_Main_Ust > tbody').find('tr');
    rows.off('click').on('click', function () {

        var me = $(this);

        rows.css('background-color', 'white');
        me.css('background-color', '#F1F1F1');

        slcKategori = $($(me).find('td')[0]).text();
        $('#txt_id_ust').val($($(me).find('td')[0]).text());
        $('#txt_kategori_ust').val($($(me).find('td')[1]).text());

    });
}
function deleteKategoriUst(id) {
    var query = JSON.stringify({ id: id });

    $.ajax({
        type: "POST",
        url: "/AdminPanelKategoriler.aspx/deleteKategoriUst",
        contentType: "application/json; charset=utf-8",
        data: query,
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {

                getKategori_ust();
                slcKategoriUst = null;
                $('#txt_id_ust').val('');
                $('#txt_kategori_ust').val('');
                toastr["success"]("Üst Kategori Silindi.");

            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}
function saveKategoriUst(_UK_ID, _UK_CODE) {

    var query = JSON.stringify({ _UK_ID: (_UK_ID == '' ? null : _UK_ID), _UK_CODE: _UK_CODE });

    $.ajax({
        type: "POST",
        url: "/AdminPanelKategoriler.aspx/saveKategoriUst",
        contentType: "application/json; charset=utf-8",
        data: query,
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                getKategori_ust();
                toastr["success"]("Üst Kategori Eklendi.");
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}




function getKategori() {
    $.ajax({
        type: "POST",
        url: "/AdminPanelKategoriler.aspx/getKategori",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                if (d.data != null) {
                    BuildKategori(d.data);
                }
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}
function BuildKategori(data) {
    $('#TR_Main > tbody').empty();
    var strall = '';
    if (data.length > 0) {
        for (var i = 0; i < data.length ; i++) {
            var satir = data[i];
            strall = strall +
             '<tr KA_ID="' + satir.KA_ID + '" UK_ID="' + satir.UK_ID + '" UK_CODE="' + satir.KA_CODE + '">' + '">' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.KA_ID == null ? '' : satir.KA_ID) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.UK_ID == null ? '' : satir.UK_ID) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.KA_CODE == null ? '' : satir.KA_CODE) + '</span></td>' +
            '</tr>';
        }
    } else {
        strall = strall + '<tr trType="nodata"><td class="tableheadcolumn" style="text-align: center" colspan="3">-Kayıt Yok-</td></tr>';
    }

    $('#TR_Main tbody').append(strall);

    if (isFirstKategori) {
        $('.fht-table-wrapper').css('height', 'auto');
        $('#TR_Main').fixedHeaderTable({
            footer: true,
            altClass: 'odd',
            autoShow: true,
            height: (200)
        });

        if (data.length > 0) {
            isFirstKategori = false;
        }
    }

    RowOnClickKategori();
}
function RowOnClickKategori() {
    var rows = $('#TR_Main > tbody').find('tr');
    rows.off('click').on('click', function () {

        var me = $(this);

        rows.css('background-color', 'white');
        me.css('background-color', '#F1F1F1');

        slcKategori = $($(me).find('td')[0]).text();
        $('#txt_id_kategori').val($($(me).find('td')[0]).text());
        $('#txt_ust_kategori_id').val($($(me).find('td')[1]).text());
        $('#txt_kategori').val($($(me).find('td')[2]).text());

    });
}
function deleteKategori(id) {
    var query = JSON.stringify({ id: id });

    $.ajax({
        type: "POST",
        url: "/AdminPanelKategoriler.aspx/deleteKategori",
        contentType: "application/json; charset=utf-8",
        data: query,
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {

                getKategori();
                slcKategori = null;
                $('#txt_id_kategori').val('');
                $('#txt_ust_kategori_id').val('');
                $('#txt_kategori').val('');
                toastr["success"]("Kategori Silindi.");

            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}
function saveKategori(_KA_ID, _UK_ID, _KA_CODE) {

    var query = JSON.stringify({ _KA_ID: (_KA_ID == '' ? null : _KA_ID), _UK_ID: (_UK_ID == '' ? null : _UK_ID), _KA_CODE: _KA_CODE });

    $.ajax({
        type: "POST",
        url: "/AdminPanelKategoriler.aspx/saveKategori",
        contentType: "application/json; charset=utf-8",
        data: query,
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                getKategori();
                toastr["success"]("Kategori Eklendi.");
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}





function getKategori_alt() {
    $.ajax({
        type: "POST",
        url: "/AdminPanelKategoriler.aspx/getAltKategori",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                if (d.data != null) {
                    BuildKategori_alt(d.data);
                }
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}
function BuildKategori_alt(data) {
    $('#TR_Main_Alt > tbody').empty();
    var strall = '';
    if (data.length > 0) {
        for (var i = 0; i < data.length ; i++) {
            var satir = data[i];
            strall = strall +
             '<tr AK_ID="' + satir.AK_ID + '" KA_ID="' + satir.KA_ID + '" AK_CODE="' + satir.AK_CODE + '">' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.AK_ID == null ? '' : satir.AK_ID) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.KA_ID == null ? '' : satir.KA_ID) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.AK_CODE == null ? '' : satir.AK_CODE) + '</span></td>' +
            '</tr>';
        }
    } else {
        strall = strall + '<tr trType="nodata"><td class="tableheadcolumn" style="text-align: center" colspan="3">-Kayıt Yok-</td></tr>';
    }

    $('#TR_Main_Alt tbody').append(strall);

    if (isFirstAltKategori) {
        $('.fht-table-wrapper').css('height', 'auto');
        $('#TR_Main_Alt').fixedHeaderTable({
            footer: true,
            altClass: 'odd',
            autoShow: true,
            height: (200)
        });

        if (data.length > 0) {
            isFirstAltKategori = false;
        }
    }

    RowOnClickAltKategori();
}
function RowOnClickAltKategori() {
    var rows = $('#TR_Main_Alt > tbody').find('tr');
    rows.off('click').on('click', function () {

        var me = $(this);

        rows.css('background-color', 'white');
        me.css('background-color', '#F1F1F1');

        slcKategoriAlt = $($(me).find('td')[0]).text();
        $('#txt_id_alt_kategori').val($($(me).find('td')[0]).text());
        $('#txt_ust_alt_kategori_id').val($($(me).find('td')[1]).text());
        $('#txt_alt_kategori').val($($(me).find('td')[2]).text());

    });
}
function deleteKategoriAlt(id) {
    var query = JSON.stringify({ id: id });

    $.ajax({
        type: "POST",
        url: "/AdminPanelKategoriler.aspx/deleteKategoriAlt",
        contentType: "application/json; charset=utf-8",
        data: query,
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {

                getKategori_alt();
                slcKategoriAlt = null;
                $('#txt_id_alt_kategori').val('');
                $('#txt_ust_alt_kategori_id').val('');
                $('#txt_alt_kategori').val('');
                toastr["success"]("Alt Kategori Silindi.");

            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}
function saveKategoriAlt(_AK_ID, _KA_ID, _AK_CODE) {

    var query = JSON.stringify({ _AK_ID: (_AK_ID == '' ? null : _AK_ID), _KA_ID: (_KA_ID == '' ? null : _KA_ID), _AK_CODE: _AK_CODE });

    $.ajax({
        type: "POST",
        url: "/AdminPanelKategoriler.aspx/saveKategoriAlt",
        contentType: "application/json; charset=utf-8",
        data: query,
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                getKategori_alt();
                toastr["success"]("Alt Kategori Eklendi.");
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}