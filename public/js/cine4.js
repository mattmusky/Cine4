//hide friend menu
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

//show friend menu
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

//get searchbox value and forward to search page
function search() {
    var search = document.getElementById('searchbox').value;
    search = encodeURI(search);
    window.location.href = `search.php?movie=${search}`;
}

//create sidebar friend list
function friendBuilder(json) {
    var json = JSON.parse(json);
    var divhere = document.getElementById('friendhere');
    divhere.innerHTML = '';
    for (i = 0; i < json.length; i++) {
      var badges = getBadges(json[i].uid);
        var newhtml = `
        <li>
            <a href="profile.php?id=${json[i].uid}">${json[i].FIRST} ${json[i].LAST}</a>
        </li>
        `;
        divhere.innerHTML += badges;
    }
}

//get friend list
function submitFriendList() {
    var message = "type=friendList";
    sendData(message, friendBuilder);
    return 0;
}


//send message to php
function sendData(message, retmethod) {
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
var done;
function getBadges(uid) {

    var request = new XMLHttpRequest();
    request.open("POST", "php/data.php", true);
    request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    request.onreadystatechange = function() {
        if ((this.readyState == 4) && (this.status == 200)) {

            done = calcBadges(this.responseText);
return(done);
        }
    }
    request.send("type=getBadges&uid=" + uid);
    alert(done);

}

function calcBadges(data) {
var json = JSON.parse(data);
var newhtml = `
HERE${json[0]}
`;
return (newhtml);

}
