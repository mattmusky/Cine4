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

function search() {
var search = document.getElementById('searchbox').value;
alert(search);

}

function friendBuilder(json) {

    var json = JSON.parse(json);

var divhere = document.getElementById('friendhere');
divhere.innerHTML = '';
    for (i = 0; i < json.length; i++) {

var newhtml = `

<li>
    <a href="profile.php?id=${json[i].uid}">${json[i].FIRST} ${json[i].LAST}</a>
</li>




`;




divhere.innerHTML += newhtml;
    }


}

function submitFriendList() {


var message = "type=friendList";



sendData(message,friendBuilder);
return 0;
}

function sendData(message,retmethod) {

var request = new XMLHttpRequest();
request.open("POST", "php/data.php", true);
request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
request.onreadystatechange = function() {
    if ((this.readyState == 4) && (this.status == 200)) {

      switch (retmethod) {

        case friendBuilder:

        friendBuilder(this.responseText);
        break;
      }

    }
}
request.send(message);

}
