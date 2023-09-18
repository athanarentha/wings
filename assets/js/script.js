//jQuery time
var currentFs, nextFs, previousFs; //fieldsets
var left, opacity, scale; //fieldset properties which we will animate
var animating; //flag to prevent quick multi-click glitches

$(document).on('click', '.previous', function () {
    if (animating) return false;
    animating = true;

    currentFs = $(this).parent();
    previousFs = $(this).parent().prev();

    $("#progressbar li").eq($("fieldset").index(currentFs)).removeClass("active");

    previousFs.show();
    currentFs.animate({ opacity: 0 }, {
        step: function (now) {
            scale = 0.8 + (1 - now) * 0.2;
            left = ((1 - now) * 50) + "%";
            opacity = 1 - now;
            currentFs.css({ 'left': left });
            previousFs.css({ 'transform': 'scale(' + scale + ')', 'opacity': opacity });
        },
        duration: 800,
        complete: function () {
            currentFs.hide();
            previousFs.css({'position':'relative'});
            animating = false;
        }
    });
});

$(document).on('click', '.next', function () {
    if (animating) return false;
    animating = true;

    currentFs = $(this).parent();
    nextFs = $(this).parent().next();

    $("#progressbar li").eq($("fieldset").index(nextFs)).addClass("active");
    nextFs.show();
    currentFs.animate({ opacity: 0 }, {
        step: function (now) {
            scale = 1 - (1 - now) * 0.2;
            left = (now * 50) + "%";
            opacity = 1 - now;
            currentFs.css({
                'transform': 'scale(' + scale + ')',
                'position': 'absolute'
            });
            nextFs.css({ 'left': left, 'opacity': opacity });
        },
        duration: 800,
        complete: function () {
            currentFs.hide();
            animating = false;
        }
    });
});

$(document).on('click', '.buy',function () {
    $(this).hide()
    let data = $(this).data('data')
    if (typeof data !== 'undefined') {
        $.ajax({
            url:'./add-product.php',
            method:'post',
            data:{data},
            success:function(res){
                if (res == 'sukses') {
                    loadCart()
                }else {
                    console.log(res);
                }
           }
        });
    }
})
$(document).on('change', '.quantity', function () {
    let val = $(this).val()
    let data = $(this).data('data')
    $.ajax({
        url:'./update-qty.php',
        method:'post',
        data:{val,data},
        success:function(res){
            loadCart()
        }
    })
})
function loadCart(){
    $('#cart').load('./component/cart.php');
}
loadCart()
$(document).on('click', '.checkout',function (){
    $.ajax({
        url:'./checkout.php',
        method:"post",
        success:function(res){
            if (res.status == 'sukses') {
                alert('success');
            }else {
                console.log(res);
            }
        }
    })
})