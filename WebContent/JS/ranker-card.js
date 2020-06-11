$(document).ready(function(){

    if($(window).width() >= 768) {
        $(".ranker-info").css({
            "display" : "inline-block",
            "width" : "30%"
        });
    } else {
        $(".ranker2").insertAfter(".ranker1");
    }


    $(window).resize(function() {
        if($(window).width() >= 768) {
            $(".ranker-info").css({
                "display" : "inline-block",
                "width" : "30%"
            });
            $(".ranker1").insertAfter(".ranker2");
        } else {
            $(".ranker-info").css({
                "display" : "block",
                "width" : "100%"
            });
            $(".ranker2").insertAfter(".ranker1");
        }  
    });
    

});