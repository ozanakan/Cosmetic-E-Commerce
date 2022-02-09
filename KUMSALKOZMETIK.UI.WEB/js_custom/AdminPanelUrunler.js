var isFirstMainTable = true;
var filtersMainTable = null;
var ordersMainTable = { SHORT_TYPE: '', SHORT_COLON: '' };
var dataDetailMainTable = [
    { TYPE: 'int', TEXT: 'Id', VALUE: 'UR_ID' },
    { TYPE: 'string', TEXT: 'Ad', VALUE: 'UR_AD' },
    { TYPE: 'string', TEXT: 'Ürün Detayı', VALUE: 'UR_URUN_DETAY' },
    { TYPE: 'int', TEXT: 'Marka', VALUE: 'UR_MARKA' },
    { TYPE: 'int', TEXT: 'Kategori', VALUE: 'UR_KATEGORI' },
    { TYPE: 'decimal', TEXT: 'Gramaj', VALUE: 'UR_GRAMAJ' },
    { TYPE: 'decimal', TEXT: 'Fiyat', VALUE: 'UR_FIYAT' },
    { TYPE: 'decimal', TEXT: 'İndirim', VALUE: 'UR_INDIRIM' },
    { TYPE: 'string', TEXT: 'Yeni', VALUE: 'UR_YENI' },
    { TYPE: 'int', TEXT: 'Stok', VALUE: 'UR_STOK' },
    { TYPE: 'string', TEXT: 'Resim-Url', VALUE: 'UR_RESIM_URL' },
    { TYPE: 'int', TEXT: 'İndirim', VALUE: 'UR_INDIRIM_YUZDE' },
    { TYPE: 'decimal', TEXT: 'İndirimli Fiyat', VALUE: 'UR_FIYAT_INDIRIMLI' }
];
var sayfano = 1;

var slcUrun = {};
var isFirstUrun = true;

$(document).ready(function () {
    if ($(window).width() < 770)
        $('[grafik]').hide();

    getMarka();
    getAltKategori();

    filterPopupMainTable.FilterBuilder('MainTable', 'TR_MainTaskTable', isFirstMainTable, dataDetailMainTable, filtersMainTable, ordersMainTable);


    getmaintable();


    $('#btn_save').on('click', function (e) {

        slcUrun.UR_ID = $('#txt_urun_id').val();
        if (slcUrun.UR_ID == '')
            slcUrun.UR_ID = null;

        slcUrun.UR_AD = $('#txt_urun_adi').val();
        if (slcUrun.UR_AD == '')
            slcUrun.UR_AD = null;

        slcUrun.UR_MARKA = $('#txt_urun_marka').val();
        if (slcUrun.UR_MARKA == '')
            slcUrun.UR_MARKA = null;

        slcUrun.UR_KATEGORI = $('#txt_urun_kategori').val();
        if (slcUrun.UR_KATEGORI == '')
            slcUrun.UR_KATEGORI = null;

        slcUrun.UR_FIYAT = $('#txt_urun_fiyat').val();
        if (slcUrun.UR_FIYAT == '')
            slcUrun.UR_FIYAT = null;

        slcUrun.UR_INDIRIM = $('#txt_urun_indirim').val();
        if (slcUrun.UR_INDIRIM == '')
            slcUrun.UR_INDIRIM = null;

        slcUrun.UR_YENI = $('#txt_urun_yeni').val();
        if (slcUrun.UR_YENI == '')
            slcUrun.UR_YENI = null;

        slcUrun.UR_STOK = $('#txt_urun_stok').val();
        if (slcUrun.UR_STOK == '')
            slcUrun.UR_STOK = null;

        slcUrun.UR_GRAMAJ = $('#txt_urun_gramaj').val();
        if (slcUrun.UR_GRAMAJ == '')
            slcUrun.UR_GRAMAJ = null;

        slcUrun.UR_RESIM_URL = $("#txt_dosya_adi").attr('filename');
        if (slcUrun.UR_RESIM_URL == '')
            slcUrun.UR_RESIM_URL = null;

        slcUrun.UR_INDIRIM_YUZDE = $('#txt_urun_indirim_yuzde').val();
        if (slcUrun.UR_INDIRIM_YUZDE == '')
            slcUrun.UR_INDIRIM_YUZDE = null;

        slcUrun.UR_URUN_DETAY = $('#txt_urun_detay').val();
        if (slcUrun.UR_INDIRIM_YUZDE == '')
            slcUrun.UR_INDIRIM_YUZDE = null;

        // slcUrun.UR_FIYAT_INDIRIMLI = $('#txt_urun_indirim_fiyat').val();
        // if (slcUrun.UR_FIYAT_INDIRIMLI == '')
        //     slcUrun.UR_FIYAT_INDIRIMLI = null;

        if (slcUrun.UR_INDIRIM_YUZDE != null)
            slcUrun.UR_FIYAT_INDIRIMLI = slcUrun.UR_FIYAT * (100 - slcUrun.UR_INDIRIM_YUZDE) / 100;

        else slcUrun.UR_FIYAT_INDIRIMLI = null;





        saveUrun(slcUrun);
    });
    $('#btn_delete').on('click', function (e) {
        var id = $('#txt_urun_id').val();
        if (id == '')
            toastr["error"]('Sileceğiniz kategoriyi seçiniz.');
        deleteUrun(id);
    });
    $('#btn_clear').on('click', function (e) {
        clearUrun();
    });

    $('#btn_dosya_sec').on('click', function (e) {
        $('#btn_File').trigger('click');
    });

    $('#btn_File').fileupload({
        dataType: 'json',
        url: 'DocumentUpload.ashx',
        type: 'POST',
        contentType: false,
        cache: false,
        processData: false,
        add: function (e, data) {
            var jqXHR = data.submit();
            $("#txt_dosya_adi").val(data.files[0].name);
        },
        complete: function (data) {
            var d = JSON.parse(data.responseText);
            if (d.status == 200) {
                toastr["success"](d.msg);
                $("#txt_dosya_adi").attr('filename', d.filename);
            } else if (d.status == 500) {
                toastr["error"](d.msg);
            }
        },
    });


    PublicProcess();
});

function getAltKategori() {

    $.ajax({
        type: "POST",
        url: "/AdminPanelUrunler.aspx/getAltKategori",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                if (d.data != null) {
                    buildAltKategori(d.data);
                }
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}
function buildAltKategori(data) {
    $('#txt_urun_kategori').empty();

    var str = '<option value=""></option>';

    for (var i = 0; i < data.length; i++) {
        str += '<option value="' + data[i].AK_ID + '">' + data[i].AK_CODE + '</option>'
    }

    $('#txt_urun_kategori').append(str);
}

function getMarka() {

    $.ajax({
        type: "POST",
        url: "/AdminPanelUrunler.aspx/getMarka",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                if (d.data != null) {
                    buildMarka(d.data);
                }
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}
function buildMarka(data) {
    $('#txt_urun_marka').empty();

    var str = '<option value=""></option>';

    for (var i = 0; i < data.length; i++) {
        str += '<option value="' + data[i].MA_ID + '">' + data[i].MA_CODE + '</option>'
    }

    $('#txt_urun_marka').append(str);
}

function getmaintable() {
    filterPopupMainTable.createFilter();
    var query = JSON.stringify({ filterlst: filtersMainTable, shorttype: ordersMainTable.SHORT_TYPE, shortcolon: ordersMainTable.SHORT_COLON, pagenum: 1, isFirst: isFirstMainTable });
    $.ajax({
        type: "POST",
        url: "/AdminPanelUrunler.aspx/getmaintable",
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
                    BuildUrun(d.data);
                }
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}
function BuildUrun(data) {
    $('#TR_MainTaskTable > tbody').empty();
    var strall = '';
    if (data.length > 0) {
        for (var i = 0; i < data.length ; i++) {
            var satir = data[i];
            strall = strall +
             '<tr>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;"></span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.UR_ID == null ? '' : satir.UR_ID) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.UR_AD == null ? '' : satir.UR_AD) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.UR_URUN_DETAY == null ? '' : satir.UR_URUN_DETAY) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.UR_MARKA == null ? '' : satir.UR_MARKA) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.UR_KATEGORI == null ? '' : satir.UR_KATEGORI) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.UR_GRAMAJ == null ? '' : satir.UR_GRAMAJ) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.UR_FIYAT == null ? '' : satir.UR_FIYAT) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.UR_INDIRIM == null ? '' : satir.UR_INDIRIM) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.UR_YENI == null ? '' : satir.UR_YENI) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.UR_STOK == null ? '' : satir.UR_STOK) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.UR_RESIM_URL == null ? '' : satir.UR_RESIM_URL) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.UR_INDIRIM_YUZDE == null ? '' : satir.UR_INDIRIM_YUZDE) + '</span></td>' +
                '<td class="tablebodycolumn"><span style="font-size: 10px;">' + (satir.UR_FIYAT_INDIRIMLI == null ? '' : satir.UR_FIYAT_INDIRIMLI) + '</span></td>' +

           '</tr>';
        }
    } else {
        strall = strall + '<tr trType="nodata"><td class="tableheadcolumn" style="text-align: center" colspan="3">-Kayıt Yok-</td></tr>';
    }

    $('#TR_MainTaskTable tbody').append(strall);

    if (isFirstMainTable) {
        $('.fht-table-wrapper').css('height', 'auto');
        $('#TR_MainTaskTable').fixedHeaderTable({
            footer: true,
            altClass: 'odd',
            autoShow: true,
            height: ($(window).height())
        });
        filterPopupMainTable.event('MainTable', 'TR_MainTaskTable');

        if (data.length > 0) {
            isFirstMainTable = false;
        }
    }


    RowOnClickUrun();
}
function RowOnClickUrun() {
    var rows = $('#TR_MainTaskTable > tbody').find('tr');
    rows.off('click').on('click', function () {

        var me = $(this);

        rows.css('background-color', 'white');
        me.css('background-color', '#F1F1F1');

        $('#txt_urun_id').val($($(me).find('td')[1]).text());
        $('#txt_urun_adi').val($($(me).find('td')[2]).text());
        $('#txt_urun_detay').val($($(me).find('td')[3]).text());
        $('#txt_urun_marka').val($($(me).find('td')[4]).text());
        $('#txt_urun_kategori').val($($(me).find('td')[5]).text());
        $('#txt_urun_gramaj').val($($(me).find('td')[6]).text());
        $('#txt_urun_fiyat').val($($(me).find('td')[7]).text());
        $('#txt_urun_indirim').val($($(me).find('td')[8]).text());
        $('#txt_urun_yeni').val($($(me).find('td')[9]).text());
        $('#txt_urun_stok').val($($(me).find('td')[10]).text());

        var resim = $($(me).find('td')[11]).text()
        $('#txt_dosya_adi').attr('filename', resim);
        $('#txt_dosya_adi').val(resim);

        $('#txt_urun_indirim_yuzde').val($($(me).find('td')[12]).text());
        $('#txt_urun_indirim_fiyat').val($($(me).find('td')[13]).text());




    });
}
function deleteUrun(id) {
    var query = JSON.stringify({ id: id });

    $.ajax({
        type: "POST",
        url: "/AdminPanelUrunler.aspx/deleteUrun",
        contentType: "application/json; charset=utf-8",
        data: query,
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {

                getmaintable();

                toastr["success"]("Ürün Silindi.");

            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}
function saveUrun(_data) {

    var query = JSON.stringify({ data: _data });

    $.ajax({
        type: "POST",
        url: "/AdminPanelUrunler.aspx/saveUrun",
        contentType: "application/json; charset=utf-8",
        data: query,
        dataType: "json",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (d.status == 500) {
                toastr["error"](d.message);
            }
            else if (d.status == 200) {
                getmaintable();
                toastr["success"]("Üst Kategori Eklendi.");
            }
        },
        error: function (xhr, err) {
            toastr["error"](JSON.parse(xhr.responseText).Message);
        }
    });
}
function clearUrun() {

    $('#txt_urun_id').val('');
    $('#txt_urun_adi').val('');
    $('#txt_urun_detay').val('');
    $('#txt_urun_marka').val('');
    $('#txt_urun_kategori').val('');
    $('#txt_urun_gramaj').val('');
    $('#txt_urun_fiyat').val('');
    $('#txt_urun_indirim').val('');
    $('#txt_urun_yeni').val('');
    $('#txt_urun_stok').val('');
    $('#txt_urun_resim').val('');
    $('#txt_urun_indirim_yuzde').val('');
    $('#txt_urun_indirim_fiyat').val('');

    $("#txt_dosya_adi").attr('filename', '');
    $("#txt_dosya_adi").val('');

    slcUrun.UR_ID = null;
    slcUrun.UR_AD = null;
    slcUrun.UR_URUN_DETAY = null;
    slcUrun.UR_MARKA = null;
    slcUrun.UR_KATEGORI = null;
    slcUrun.UR_FIYAT = null;
    slcUrun.UR_INDIRIM = null;
    slcUrun.UR_YENI = null;
    slcUrun.UR_STOK = null;
    slcUrun.UR_GRAMAJ = null;
    slcUrun.UR_RESIM_URL = null;
    slcUrun.UR_INDIRIM_YUZDE = null;
    slcUrun.UR_FIYAT_INDIRIMLI = null;

    $('#TR_MainTaskTable > tbody').find('tr').css('background-color', 'white');
}


var filterPopupMainTable = (function () {
    var _popupname = null;
    var _tablename = null;
    var _isFirstMainTable = null;
    var _dataDetailMainTable = null;
    var _filtersMainTable = null;
    var _ordersMainTable = null;

    var FilterBuilder = function (popupname, tablename, isFirstMainTable, dataDetailMainTable, filtersMainTable, ordersMainTable) {
        //kullanılacak global değişkenleri hazırla
        _popupname = popupname;
        _tablename = tablename;
        _isFirstMainTable = isFirstMainTable;
        _dataDetailMainTable = dataDetailMainTable;
        _filtersMainTable = filtersMainTable;
        _ordersMainTable = ordersMainTable;

        //filitre detayını açan butonunu ekle
        AddFilterDetailButton();

    };
    var AddFilterDetailButton = function () {
        if ($('[filterdetailsbuton_' + _popupname + ']').length < 1) {
            var p_element = '<button type="button" class="btn btn-default btn-xs" filterdetailsbuton_' + _popupname + ' style="margin:0px">' +
                                 '<span class="glyphicon glyphicon-filter" aria-hidden="true"></span>' +
                            '</button>';
            $('#' + _tablename + ' thead tr').eq(0).find('th').eq(0).append(p_element);
            AddFilterInputs();
        }
    };
    var AddFilterInputs = function () {
        var p_element = '<tr filtermain_' + _popupname + ' id="filterInputs_' + _popupname + '" style="background-color: #f5f5f5;">' +
                        '     <th></th>';

        for (var i = 0; i < _dataDetailMainTable.length; i++) {
            if (_dataDetailMainTable[i].TYPE == 'string') {
                p_element += '<th style="padding-top:3px !important;padding-bottom:3px !important">' +
                              '    <input type="text" width="100%" kolon="' + _dataDetailMainTable[i].VALUE + '" kolon_type="' + (_dataDetailMainTable[i].TYPE) + '" style="min-width:100px; height: 20px" kolon_desc="' + _dataDetailMainTable[i].TEXT + '" class="form-control input-sm header_input_style_slim" />' +
                              '</th>';
            }
            else if (_dataDetailMainTable[i].TYPE == 'int' || _dataDetailMainTable[i].TYPE == 'number' || _dataDetailMainTable[i].TYPE == 'decimal') {
                p_element += '<th style="padding-top:3px !important;padding-bottom:3px !important">' +
                              '    <input type="number" width="100%" kolon="' + _dataDetailMainTable[i].VALUE + '" kolon_type="' + (_dataDetailMainTable[i].TYPE) + '" style="min-width:100px; height: 20px" kolon_desc="' + _dataDetailMainTable[i].TEXT + '" class="form-control input-sm header_input_style_slim" />' +
                              '</th>';
            }
            else if (_dataDetailMainTable[i].TYPE == 'time') {
                p_element += '<th style="padding-top:3px !important;padding-bottom:3px !important">' +
                              '    <input type="text" width="100%" kolon="' + _dataDetailMainTable[i].VALUE + '" kolon_type="' + (_dataDetailMainTable[i].TYPE) + '" style="min-width:100px; height: 20px" kolon_desc="' + _dataDetailMainTable[i].TEXT + '" class="form-control input-sm header_input_style_slim" />' +
                              '</th>';
            }
            else if (_dataDetailMainTable[i].TYPE == 'date') {
                p_element += '<th style="padding-top:3px !important;padding-bottom:3px !important">' +
                             '    <input type="text" width="100%" kolon="' + _dataDetailMainTable[i].VALUE + '" kolon_type="' + (_dataDetailMainTable[i].TYPE) + '" style="min-width:100px; height: 20px" kolon_desc="' + _dataDetailMainTable[i].TEXT + '" class="form-control input-sm header_input_style_slim" date=""/>' +
                             '</th>';
            }
        }
        p_element += '</tr>';

        $('#' + _tablename + ' thead').append(p_element);
        AddFilterDetailSelect();
    };

    var AddFilterDetailSelect = function () {
        var p_element = '<tr filterdetails_' + _popupname + '> style="display: none; background-color: #f5f5f5;">' +
                        '      <th style="padding:3px !important">' +
                        '          <button type="button" class="btn btn-default btn-xs" filterresetbuton_' + _popupname + ' style="margin-top:0px;margin-bottom:0px">' +
                        '              <span class="glyphicon glyphicon-repeat" aria-hidden="true"></span>' +
                        '          </button>' +
                        '      </th>';

        for (var i = 0; i < _dataDetailMainTable.length; i++) {
            if (_dataDetailMainTable[i].TYPE == 'string') {
                p_element += '<th style="padding-top:3px !important;padding-bottom:3px !important">' +
                             '     <select style="height: 20px;width: 100%" kolonslc_' + _popupname + '="' + _dataDetailMainTable[i].VALUE + '">' +
                             '         <option></option>' +
                             '         <option>Eşit</option>' +
                             '         <option>Eşit Değil</option>' +
                             '         <option>İçerir</option>' +
                             '         <option>İçermez</option>' +
                             '         <option>Boş</option>' +
                             '         <option>Boş Değil</option>' +
                             '         <option>Ile Başlayan</option>' +
                             '         <option>Ile Biten</option>' +
                             '     </select>' +
                             '</th>';
            }
            else {
                p_element += '<th style="padding-top:3px !important;padding-bottom:3px !important">' +
                              '     <select style="height: 20px;width: 100%" kolonslc_' + _popupname + '="' + _dataDetailMainTable[i].VALUE + '">' +
                              '         <option></option>' +
                              '         <option>Eşit</option>' +
                              '         <option>Eşit Değil</option>' +
                              '         <option>Küçük</option>' +
                              '         <option>Büyük</option>' +
                              '         <option>Küçük Eşit</option>' +
                              '         <option>Büyük Eşit</option>' +
                              '         <option>Boş</option>' +
                              '         <option>Boş Değil</option>' +
                              '     </select>' +
                              '</th>';
            }
        }
        p_element += '</tr>';

        $('#' + _tablename + ' thead').append(p_element);
        $('[filterdetails_' + _popupname + ']').css('text-align', 'center').css('background-color', '#f5f5f5').hide();

        AddFilterGlobalSearch()

    };
    var AddFilterGlobalSearch = function () {
        var p_element = '<div style="float: right; margin-right: 1.5%; margin-top: 0px;margin-bottom:10px">' +
                        '  <div style="float: left; margin-right: 5px;">' +
                        '      <select style="font-size: 12px; height: 20px; width: 120px;" id="cbSecondFilteringColumns_' + _popupname + '">' +
                        '      </select>' +
                        '  </div>' +
                        '  <div style="float: left; margin-right: 5px;">' +
                        '      <select style="font-size: 12px; height: 20px; width: 120px;" filter-by-column="WO" id="cbSecondFilteringTypes_' + _popupname + '">' +
                        '          <option></option>' +
                        '          <option>Eşit</option>' +
                        '          <option>Eşit Değil</option>' +
                        '          <option>İçerir</option>' +
                        '          <option>İçermez</option>' +
                        '          <option>Boş</option>' +
                        '          <option>Boş Değil</option>' +
                        '          <option>Ile Başlayan</option>' +
                        '          <option>Ile Biten</option>' +
                        '      </select>' +
                        '  </div>' +
                        '  <div style="float: left; margin-right: 5px;">' +
                        '      <input type="text" filter-data-type="date" class="form-control input-sm header_input_style_slim" filter-by="WO" style="height: 20px; width: 120px; font-size: 12px; display: none;" id="txtSecondDateFiltering_' + _popupname + '" datetime-view />' +
                        '      <input type="text" style="height: 20px; width: 120px; font-size: 12px;" filter-data-type="char" class="form-control input-sm header_input_style_slim" filter-by="WO" id="txtSecondCharFiltering_' + _popupname + '" />' +
                        '  </div>' +
                        '  <div style="float: left;" class="btn-group">' +
                        '      <input type="submit" style="height: 20px; font-size: 12px;" value="Run" id="btnSecondFiltering_' + _popupname + '" />' +
                        '  </div>' +
                        '</div>';
        $('#' + _tablename).parent().prepend(p_element);

        event(_popupname, _tablename);
    }


    var event = function (popupname, tablename) {
        getSecondFilteringColumns();

        $('.fht-table-wrapper').css('height', 'auto');

        $('[filterdetailsbuton_' + popupname + ']').off('click').click(function (event) {
            $('[filterdetails_' + popupname + ']').eq(0).toggle();
        });

        $('[filterResetbuton_' + popupname + ']').off('click').click(function (event) {
            $('[kolonslc_' + popupname + ']').val(1);
        });

        $('[filtermain_' + popupname + ']').eq(0).find('input').off('keyup').on('keyup', function (e) {
            if (e.keyCode == 13) {
                getmaintable(sayfano);
            }
        });

        $('#btnSecondFiltering_' + popupname + '').off('click').on('click', function () {
            getmaintable(sayfano);
        });

        $('#txtSecondDateFiltering_' + popupname + ', #txtSecondCharFiltering_' + popupname + '').off('keyup').on('keyup', function (e) {
            if (e.keyCode == 13) {
                $('#btnSecondFiltering_' + popupname + '').trigger('click');
            }
        });

        $('[short_' + popupname + ']').off('click').click(function (event) {

            var colonname = $(this).attr('short_' + popupname + '');
            var shorttype = $(this).attr('shorttype_' + popupname + '');

            $('[short_' + popupname + '] > [shorticon]').remove();

            if (shorttype == '') {
                shorttype = 'asc';
                $(this).append(' <span shorticon class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span>');

                ordersMainTable.SHORT_TYPE = 'asc';
                ordersMainTable.SHORT_COLON = colonname;

                getmaintable(sayfano);
            }
            else if (shorttype == 'asc') {
                shorttype = 'desc';
                $(this).append(' <span shorticon class="glyphicon glyphicon-arrow-up" aria-hidden="true"></span>');

                ordersMainTable.SHORT_TYPE = 'desc';
                ordersMainTable.SHORT_COLON = colonname;

                getmaintable(sayfano);
            }
            else if (shorttype == 'desc') {
                shorttype = '';
                $(this).find('[shorticon]').remove();

                ordersMainTable.SHORT_TYPE = '';
                ordersMainTable.SHORT_COLON = colonname;

                getmaintable(sayfano);
            }
            $(this).attr('shorttype_' + popupname + '', shorttype);
        });

    };
    var createFilter = function () {
        filtersMainTable = new Array();
        var secilenler = $('[filtermain_' + _popupname + ']').eq(0).find('input');
        for (var i = 0; i < secilenler.length; i++) {
            var satir = secilenler[i];
            var filtervartype = $(satir).attr('kolon_type');
            var fltrtype = '[kolonslc_' + _popupname + '="' + $(satir).attr('kolon') + '"]';
            var fltrtypevalue = $(fltrtype).eq(0).val();

            var val = $(satir).val();

            if (fltrtypevalue == 'Boş' || fltrtypevalue == 'Boş Değil' || fltrtypevalue == 'True' || fltrtypevalue == 'False')
                val = 'null';

            if (val != '') {
                var Filter = {};
                Filter.key = $(satir).attr('kolon');
                Filter.val = val;
                Filter.filtervartype = filtervartype;
                Filter.FilterTypes = fltrtypevalue;

                filtersMainTable.push(Filter);
            }
        }

        var secondFilterDataType = $('#cbSecondFilteringColumns_' + _popupname + ' :selected').attr('filter-data-type');
        var secondFilteringValue = '';
        if (secondFilterDataType == 'date') {
            secondFilteringValue = $('#txtSecondDateFiltering_' + _popupname + '').val();
        } else {
            secondFilteringValue = $('#txtSecondCharFiltering_' + _popupname + '').val();
        }

        if (secondFilteringValue) {
            var _taskFilter = {};
            _taskFilter.key = $('#cbSecondFilteringColumns_' + _popupname + ' :selected').attr('filterCode');
            _taskFilter.val = secondFilteringValue;
            _taskFilter.filtervartype = secondFilterDataType;
            _taskFilter.FilterTypes = $('#cbSecondFilteringTypes_' + _popupname + '').val();
            filtersMainTable.push(_taskFilter);
        }
    };
    var getSecondFilteringColumns = function () {
        var filterColumns = $.grep($('#filterInputs_' + _popupname).find('input'), function (n, i) {
            return n.attributes[5].value != '' && n.attributes[5].value != null;
        });
        if (filterColumns.length > 0) {
            var secondFilter = '';
            for (var i = 0; i < filterColumns.length; i++) {
                if (filterColumns[i].attributes[3].value == 'nvarchar' || filterColumns[i].attributes[3].value == 'string') {
                    secondFilter += '<option filterCode="' + filterColumns[i].attributes[2].value + '" filter-data-type="nvarchar">' + filterColumns[i].attributes[5].value + '</option>';
                } else if (filterColumns[i].attributes[3].value == 'number' || filterColumns[i].attributes[3].value == 'int') {
                    secondFilter += '<option filterCode="' + filterColumns[i].attributes[2].value + '" filter-data-type="number">' + filterColumns[i].attributes[5].value + '</option>';
                } else if (filterColumns[i].attributes[3].value == 'time') {
                    secondFilter += '<option filterCode="' + filterColumns[i].attributes[2].value + '" filter-data-type="time">' + filterColumns[i].attributes[5].value + '</option>';
                } else if (filterColumns[i].attributes[3].value == 'decimal') {
                    secondFilter += '<option filterCode="' + filterColumns[i].attributes[2].value + '" filter-data-type="decimal">' + filterColumns[i].attributes[5].value + '</option>';
                } else if (filterColumns[i].attributes[3].value == 'date') {
                    secondFilter += '<option filterCode="' + filterColumns[i].attributes[2].value + '" filter-data-type="date">' + filterColumns[i].attributes[5].value + '</option>';
                } else if (filterColumns[i].attributes[3].value == 'bool') {
                    secondFilter += '<option filterCode="' + filterColumns[i].attributes[2].value + '" filter-data-type="bool">' + filterColumns[i].attributes[5].value + '</option>';
                }
            }

            $('#cbSecondFilteringColumns_' + _popupname).removeAttr();
            $('#cbSecondFilteringColumns_' + _popupname).empty().append(secondFilter);

            $('#cbSecondFilteringColumns_' + _popupname).on('change', function () {
                var columnType = $(this).find("option:selected").attr('filter-data-type');
                var columnVal = $(this).find("option:selected").attr('filterCode');
                getSecondFilteringTypes(columnType, columnVal, '#txtSecondDateFiltering_' + _popupname, '#txtSecondCharFiltering_' + _popupname, '#cbSecondFilteringTypes_' + _popupname);
            });
        }
    };
    var getSecondFilteringTypes = function (columnType, columnVal, txtDateControl, txtStringControl, cbFilterControl) {
        var filterDetailsTR = '';
        $(txtDateControl).val('');
        $(txtStringControl).val('');
        if (columnType == 'nvarchar' || columnType == 'string') {
            filterDetailsTR += '<option></option>';
            filterDetailsTR += '<option>Eşit</option>';
            filterDetailsTR += '<option>Eşit Değil</option>';
            filterDetailsTR += '<option>İçerir</option>';
            filterDetailsTR += '<option>İçermez</option>';
            filterDetailsTR += '<option>Boş</option>';
            filterDetailsTR += '<option>Boş Değil</option>';
            filterDetailsTR += '<option>Ile Başlayan</option>';
            filterDetailsTR += '<option>Ile Biten</option>';
            $(txtDateControl).hide();
            $(txtStringControl).show();
            $(txtStringControl).attr('filter-by', columnVal);
        }
        else if (columnType == 'date') {
            filterDetailsTR += '<option></option>';
            filterDetailsTR += '<option>Eşit</option>';
            filterDetailsTR += '<option>Eşit Değil</option>';
            filterDetailsTR += '<option>Küçük</option>';
            filterDetailsTR += '<option>Büyük</option>';
            filterDetailsTR += '<option>Küçük Eşit</option>';
            filterDetailsTR += '<option>Büyük Eşit</option>';
            filterDetailsTR += '<option>Boş</option>';
            filterDetailsTR += '<option>Boş Değil</option>';
            $(txtStringControl).hide();
            $(txtDateControl).show();
            $(txtDateControl).attr('filter-by', columnVal);
        }
        else if (columnType == 'number' || columnType == 'decimal' || columnType == 'int') {
            filterDetailsTR += '<option></option>';
            filterDetailsTR += '<option>Eşit</option>';
            filterDetailsTR += '<option>Eşit Değil</option>';
            filterDetailsTR += '<option>Küçük</option>';
            filterDetailsTR += '<option>Büyük</option>';
            filterDetailsTR += '<option>Küçük Eşit</option>';
            filterDetailsTR += '<option>Büyük Eşit</option>';
            filterDetailsTR += '<option>Boş</option>';
            filterDetailsTR += '<option>Boş Değil</option>';
            $(txtDateControl).hide();
            $(txtStringControl).show();
            $(txtStringControl).attr('filter-by', columnVal);
        }
        else if (columnType == 'time') {
            filterDetailsTR += '<option></option>';
            filterDetailsTR += '<option>Eşit</option>';
            filterDetailsTR += '<option>Eşit Değil</option>';
            filterDetailsTR += '<option>Küçük</option>';
            filterDetailsTR += '<option>Büyük</option>';
            filterDetailsTR += '<option>Küçük Eşit</option>';
            filterDetailsTR += '<option>Büyük Eşit</option>';
            filterDetailsTR += '<option>Boş</option>';
            filterDetailsTR += '<option>Boş Değil</option>';
            $(txtDateControl).hide();
            $(txtStringControl).show();
            $(txtStringControl).attr('filter-by', columnVal);
        }
        $(cbFilterControl).empty();
        $(cbFilterControl).append(filterDetailsTR);

        publicFunctions.dateFormat(txtDateControl);
    };
    return {
        FilterBuilder: FilterBuilder,
        event: event,
        createFilter: createFilter,
        getSecondFilteringTypes: getSecondFilteringTypes,
        getSecondFilteringColumns: getSecondFilteringColumns
    }
})();
