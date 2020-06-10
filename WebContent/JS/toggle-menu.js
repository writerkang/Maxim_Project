$(document).ready(function() {
    var $btn = $("#btn-toggle-menu");
    var $content = $("#toggle-menu-content");

    $btn.click(function() {
        $content.toggle();
    })

});