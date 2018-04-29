//get list of users friends
function getFriend() {
    var message = "type=friendList";
    sendFriendData(message, 'showFriend');
    getUsers();
    submitFriendList();
    return 0;
}

//get all users who are not currently friends
function getUsers() {
    var message = "type=allUser";
    sendFriendData(message, 'showUser');
    return 0;
}

//add a friend
function addFriend(fid) {
    var message = "type=addFriend&fid=" + fid;
    sendFriendData(message, 'getFriend');
    return 0;
}

//remove a friend
function removeFriend(fid) {
    var message = "type=removeFriend&fid=" + fid;;
    sendFriendData(message, 'getFriend');
    return 0;
}

//create html friend lists
function showFriend(json) {
    var json = JSON.parse(json);
    var divhere = document.getElementById('friendlist');
    divhere.innerHTML = '';
    for (i = 0; i < json.length; i++) {
        var newhtml = `
<li class="list-group-item" >
    <div class="d-flex justify-content-between align-items-center">
        <span><a href="profile.php?id=${json[i].uid}">${json[i].FIRST} ${json[i].LAST}&nbsp;<div id="mf${json[i].uid}" class="badges-container"></div></a></span>
        <a href="#"><span class="fas fa-lg fa-minus-circle text-danger ml-2" onclick="removeFriend('${json[i].uid}')"></span></a>
    </div>
</li>


`;
        divhere.innerHTML += newhtml;
        getBadges(json[i].uid,'mf');
    }
}

//create html non friends list
function showUser(json) {
    var json = JSON.parse(json);
    var divhere = document.getElementById('userlist');
    divhere.innerHTML = '';
    for (i = 0; i < json.length; i++) {
        var newhtml = `
<li class="list-group-item" >
    <div class="d-flex justify-content-between align-items-center">
        <span><a href="profile.php?id=${json[i].UID}">${json[i].First} ${json[i].Last}&nbsp;<div id="mf${json[i].UID}" class="badges-container"></div></a></span>
        <a href="#"><span class="fas fa-lg fa-plus-circle text-success ml-2" onclick="addFriend('${json[i].UID}')"></span></a>
    </div>
</li>

`;
        divhere.innerHTML += newhtml;
        getBadges(json[i].uid,'mf');
    }
}

//submit requests to php
function sendFriendData(message, retmethod) {
    var request = new XMLHttpRequest();
    request.open("POST", "php/data.php", true);
    request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    request.onreadystatechange = function() {
        if ((this.readyState == 4) && (this.status == 200)) {
            switch (retmethod) {
                case 'getFriend':
                    getFriend();
                    break;
                case 'showFriend':
                    showFriend(this.responseText);
                    break;
                case 'showUser':
                    showUser(this.responseText);
                    break;
            }
        }
    }
    request.send(message);
}

//run on load
getFriend();
