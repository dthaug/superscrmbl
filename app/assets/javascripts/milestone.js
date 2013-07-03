$(document).ready(function(){
    var msbars = $(".msbar");
    if(msbars.length==0)
        return;
    $.each(msbars, function(key, val){
        var barwidth = $(this).html();
        $(this).animate({"width":barwidth+"%" }, "slow");
    });

    setInterval(function(){
        $.getJSON('/scrambles/1.json', function(scrambles){
            $.getJSON('/scrambles/1/orders.json', function(orders){
                var msbars = $(".msbar");
                if(msbars.length==0)
                    return;
                $.each(msbars, function(key, val){
                    if($(this).width=orders.length+""){
                        alert($(this).width);
                    var barwidth = orders.length;
                    $(this).animate({"width":barwidth+"%" }, "slow");
                }

                });
            $("#bids").html(orders.length);
        });
        });

    }, 2000);

});


