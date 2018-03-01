$("#menu-toggle-in").click(function(e) {
    e.preventDefault();
    var left = $('#LeftColumn');
    var right = $('#RightColumn');

    right.removeClass("col-12");
    right.addClass("col-xl-10 col-sm-9");
    left.removeClass("hideLeft");
    left.addClass("col-xl-2 col-sm-3 ");
    $(".sideToggle").hide();
});

$("#menu-toggle-out").click(function(e) {
    e.preventDefault();
    var left = $('#LeftColumn');
    var right = $('#RightColumn');

    left.removeClass("col-xl-2 col-sm-3");
    left.addClass("hideLeft");
    right.removeClass("col-xl-10 col-sm-9");
    right.addClass("col-12");
    $(".sideToggle").show();
});
