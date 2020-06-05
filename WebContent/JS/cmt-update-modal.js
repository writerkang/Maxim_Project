$(document).ready(function() {
	var $modal = $("#cmt-update-modal");
    var $back = $("#cmt-update-modal .back")[0];
    var $close = $("#cmt-update-modal .close")[0];
    
    $back.onclick = function() {
        $modal.css("display", "none");
    };
    
    $close.onclick = function() {
        $modal.css("display", "none");
    };
});