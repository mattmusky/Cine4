function getFriend() {


var message = "type=friendList";



sendFriendData(message,showFriend);

return 0;
}

function getUsers() {


var message = "type=allUser";



sendFriendData(message,showUser);

return 0;
}

function addFriend(fid) {


var message = "type=addFriend&fid=" + fid;



sendFriendData(message,getFriend);
return 0;
}

function removeFriend(fid) {


var message = "type=removeFriend&fid=" + fid;;



sendFriendData(message,getFriend);
return 0;
}


function showFriends(json) {

    var json = JSON.parse(json);

var divhere = document.getElementById('friendlist');
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

function showUser(json) {

    var json = JSON.parse(json);

var divhere = document.getElementById('userlist');
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

function sendFriendData(message,retmethod) {

var request = new XMLHttpRequest();
request.open("POST", "php/data.php", true);
request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
request.onreadystatechange = function() {
    if ((this.readyState == 4) && (this.status == 200)) {

      switch (retmethod) {

        case getFriend:

        getFriend();
        break;
        case showFriend:

        showFriend(this.responseText);
        break;
        case showUser:

        showUser(this.responseText);
        break;
      }

    }
}
request.send(message);

}
