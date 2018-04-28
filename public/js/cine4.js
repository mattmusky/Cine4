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


        var newhtml = `
        <li>
            <a href="profile.php?id=${json[i].uid}">${json[i].FIRST} ${json[i].LAST}&nbsp;<div id="fl${json[i].uid}" class="badges-container"></div></a>
        </li>
        `;
        divhere.innerHTML += newhtml;
        getBadges(json[i].uid,'fl');
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


function getBadges(uid,loc) {
    var request = new XMLHttpRequest();
    request.open("POST", "php/data.php", true);
    request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    request.onreadystatechange = function() {
        if ((this.readyState == 4) && (this.status == 200)) {

            calcBadges(this.responseText,uid,loc);
        }
    }

    request.send("type=getBadges&uid=" + uid);


}

function calcBadges(data,uid,loc) {
var json = JSON.parse(data);
var mov = json[0]['IFNULL(count(V.UID),0)'];
var fri = json[1]['IFNULL(count(V.UID),0)'];
var com = json[2]['IFNULL(count(V.UID),0)'];
var movhtm ='';
var frihtm ='';

if (mov>2) {
  movhtm = `<i class="ion-ribbon-b bronze"></i>&nbsp;`;
}
else if (mov>5) {
  movhtm = `<i class="ion-ribbon-a silver"></i>&nbsp;`;
}
else if (mov>8) {
  movhtm = `<i class="ion-trophy gold"></i>&nbsp;`;
}

if (fri>1) {
  frihtm = `<i class="ion-person twofriends"></i>&nbsp;`;
}
else if (fri>3) {
  frihtm = `<i class="ion-person-stalker fourfriends"></i>&nbsp;`;
}
else if (fri>5) {
  frihtm = `<i class="ion-ios-people sixfriends"></i>&nbsp;`;
}

if (loc=='pf'){
  var comhtm = `<div class="badge badge-pill profileBadge">${com}</div>`;
}
else {
  var comhtm = `<div class="badge badge-pill commentBadge">${com}</div>`;
}


var divhere = document.getElementById(loc+uid);
divhere.innerHTML = movhtm + frihtm + comhtm;



}
