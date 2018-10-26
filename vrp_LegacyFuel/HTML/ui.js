$(document).ready(function(){
    window.addEventListener( 'message', function( event ) {
        let item = event.data;
        $(".container-fluid").css("display",item.hide? "none":"block");
        if (item.fuel < 100) {
            $("#fuel").css("width",item.fuel + "%")
        }else{
            $("#fuel").css("width",100 + "%")
        }
        if (item.fuel < 0) {
            $("#text").text(0 + "%")
        }else{
            $("#text").text(item.fuel + "%")
        }
    });
});