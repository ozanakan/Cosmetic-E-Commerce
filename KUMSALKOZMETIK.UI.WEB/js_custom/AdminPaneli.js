function PublicProcess() {
    SetDefaultValues();
    getheaderinfo();
    GetScreenList();
    changebrowzoom();
}

function changebrowzoom() {

    var currFFZoom = 90;

    $('body').css('zoom', ' ' + currFFZoom + '%');

}

function SetDefaultValues() {
    toastr.options = {
        "closeButton": true,
        "debug": false,
        "newestOnTop": false,
        "progressBar": true,
        "positionClass": "toast-top-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut",
        "tapToDismiss": false
    }

    $('[datetime]').datetimepicker({
        format: "DD.MM.YYYY HH:mm"
    });

    $('[date]').datetimepicker({
        format: 'DD.MM.YYYY'
    });

    $('[time]').datetimepicker({
        format: 'HH:mm'
    });

    if ($(window).width() < 700)
        $('[grafik]').hide();
}

function getheaderinfo() {

    //$('.header_mail').text('mail adresi');

    $('.header_name_desc').text('Mehmet Ali');

}

function GetScreenList() {

    $('#mainmenucontain').empty();

    var all_str = '<li><a href="AdminPanelKategoriler.aspx"><i class="fa fa-dot-circle-o"></i>Kategori Ekle</a></li>';
    all_str += '<li><a href="AdminPanelUrunler.aspx"><i class="fa fa-dot-circle-o"></i>Urun Ekle</a></li>';
    all_str += '<li><a href="AdminPanelMusteriler.aspx"><i class="fa fa-dot-circle-o"></i>Müşteriler</a></li>';
    all_str += '<li><a href="AdminPanelSiparisler.aspx"><i class="fa fa-dot-circle-o"></i>Siparişler</a></li>';
    all_str += '<li><a href="AdminPanelIlerisim.aspx"><i class="fa fa-dot-circle-o"></i>İletişim</a></li>';

    $('#mainmenucontain').append(all_str);

    init_sidebar();
     
}

function CloseMenu() {
    $('body').removeClass('nav-md').addClass('nav-sm');
}

function BuildScreenItem() {
    // $(".selectpicker").selectpicker('refresh');
}

function RowOnClick(tableid) {

    var rows = $(tableid).find('tr');
    rows.on('click', function () {

        var me = $(this);

        //rows.css('background-color', 'white');

        rows.removeClass('selectedrow');
        me.addClass('selectedrow');

    });
}

function changeRowColor(data, screen) {
    if (data.OKN_PUAN > 50 && (data.OKN_DURUM_DESC != 'KACAK' || data.OKN_DURUM_DESC != 'EK TAHAKKUK'))
        return '#FBC4BF';

    if (data.OKN_SUPHELI == 1 && screen == 'KYPOKN')
        return '#FFFFBF';

    return 'white';
}

function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, '\\$&');
    var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, ' '));
}

var publicFunctions = (function () {
    var convertDate = function (_date) {
        if (_date == '' || _date == null)
            return '';
        var dateParts = _date.split(' ');

        var timeParts;
        if (dateParts[1] != null)
            timeParts = dateParts[1].split(':');
        else
            timeParts = '00:00'.split(':');
        var date;

        dateParts = dateParts[0].split('.');

        date = new Date(dateParts[2], parseInt(dateParts[1], 10) - 1, dateParts[0], timeParts[0], timeParts[1]);
        return date;
    };

    var dateFormat = function (_control) {
        $('input').on('mousewheel', function (event) {
            event.preventDefault();
            event.stopPropagation();
        });

        $(_control).datetimepicker({
            showTimepicker: false,
            dateFormat: "dd-mm-yy"
        });
    };

    var formatMoney = function (n, c, d, t) {
        var c = isNaN(c = Math.abs(c)) ? 2 : c,
          d = d == undefined ? "." : d,
          t = t == undefined ? "," : t,
          s = n < 0 ? "-" : "",
          i = String(parseInt(n = Math.abs(Number(n) || 0).toFixed(c))),
          j = (j = i.length) > 3 ? j % 3 : 0;

        return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "1 TL" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
    };

    return {
        dateFormat: dateFormat,
        convertDate: convertDate,
        formatMoney: formatMoney
    };
})();