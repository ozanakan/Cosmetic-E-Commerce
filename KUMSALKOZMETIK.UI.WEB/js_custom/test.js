

$(document).ready(function () {



    try {
        fetch(new Request("https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js", { method: 'HEAD', mode: 'no-cors' })).then(function (response) {
            return true;
        }).catch(function (e) {
            var carbonScript = document.createElement("script");
            carbonScript.src = "//cdn.carbonads.com/carbon.js?serve=CE7DC2JW&placement=wwwcssscriptcom";
            carbonScript.id = "_carbonads_js";
            document.getElementById("carbon-block").appendChild(carbonScript);
        });
    } catch (error) {
        console.log(error);
    }


    $("#treeview").hummingbird();
    $("#checkAll").click(function () {
        $("#treeview").hummingbird("checkAll");
    });
    $("#uncheckAll").click(function () {
        $("#treeview").hummingbird("uncheckAll");
    });
    $("#collapseAll").click(function () {
        $("#treeview").hummingbird("collapseAll");
    });
    $("#checkNode").click(function () {
        $("#treeview").hummingbird("checkNode", { attr: "id", name: "node-0-2-2", expandParents: false });
    });
});



