$(document).ready(function() {
	var $modal = $("#modal-update-cmt");
    var $back = $("#modal-update-cmt .back")[0];
    var $close = $("#modal-update-cmt .close")[0];
    
    $back.onclick = function() {
        $modal.css("display", "none");
    };
    
    $close.onclick = function() {
        $modal.css("display", "none");
    };
});