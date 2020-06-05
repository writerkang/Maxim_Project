$(document).ready(function() {
    var $delete = $(".btn-delete")[0];
    var $modal = $("#delete-modal");
    var $back = $("#delete-modal .back")[0];
    var $close = $("#delete-modal .close")[0];
    
    $delete.onclick = function() {
        $modal.css("display", "block");
    };
    
    $back.onclick = function() {
        $modal.css("display", "none");
    };
    
    $close.onclick = function() {
        $modal.css("display", "none");
    };
});