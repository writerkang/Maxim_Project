$(document).ready(function(){

    if($(window).width() >= 768) {
        $(".ranker-info").css({
            "display" : "inline-block",
            "width" : "30%"
        });     
    }


    $(window).resize(function() {
        if($(window).width() >= 768) {
            $(".ranker-info").css({
                "display" : "inline-block",
                "width" : "30%"
            });  
        } else {
            $(".ranker-info").css({
                "display" : "block",
                "width" : "100%"
            });
        }  
    })
});