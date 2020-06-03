$(document).ready(function() {
    var $topRankers = $("#topRankers *");
    
    $topRankers.hover(function() {
        $topRankers.css("animation-play-state", "paused");
    }, function() {
        $topRankers.css("animation-play-state", "running");
    });
});