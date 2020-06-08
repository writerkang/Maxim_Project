
function goBack() {
  window.history.back();
}

$(document).ready(function(){

    $("#email_site").change(function(){
        $("#email_adress").val($("#email_site option:selected").val());
    });
    

});