$(document).ready(function() {
    var $cancel = $(".btn-cancel")[0];
    var $modal = $("#cancel-modal");
    var $back = $(".back")[0];
    var $close = $(".close")[0];
    
    $cancel.onclick = function() {
        $modal.css("display", "block");
    };
    
    $back.onclick = function() {
        $modal.css("display", "none");
    };
    $close.onclick = function() {
        $modal.css("display", "none");
    };
});