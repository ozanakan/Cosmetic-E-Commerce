function ShowLoading(element) {
    element.showLoading();
}

function HideLoading(element) {
    element.hideLoading();
}

$(document).ajaxStart(function () {
    ShowLoading($('body'));
});

$(document).ajaxSuccess(function () {
    HideLoading($('body'));
});

$(document).ajaxError(function () {
    HideLoading($('body'));
});
