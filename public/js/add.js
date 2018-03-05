// add movie to favorite list
function addFav(uid, mid, notify) {
    var message = "type=addFav&uid=" + uid + "&mid=" + mid;
    sendAddData(message, notify);
    return 0;
}

//add movie to seen list
function addSeen(uid, mid, notify) {
    var message = "type=addSeen&uid=" + uid + "&mid=" + mid;
    sendAddData(message, notify);
    return 0;
}

//take formatted add movie message and send to php
function sendAddData(message, notify) {
    var request = new XMLHttpRequest();
    request.open("POST", "php/data.php", true);
    request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    request.onreadystatechange = function() {
        if ((this.readyState == 4) && (this.status == 200)) {
            snap(notify);
        }
    }
    request.send(message);
}

//display popup when movie is added
function snap(notify) {
    ohSnapX();
    ohSnap('&nbsp;' + notify, {
        'duration': '2000',
        'fade-duration': 'slow',
        'icon': 'fas fa-plus'
    });
}
