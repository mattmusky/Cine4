//get a users movie list
function getList(list) {
    var message = "type=getList&id=" + userid + "&list=" + list;
    sendRequest(message, list);
    return 0;
}
//remove a movie from a list
function removeMV(mid, list) {
    var message = "type=removeList&list=" + list + "&uid=" + userid + "&mid=" + mid;
    sendRemoveRequest(message, list);
    return 0;
}
//submit list request to php
function sendRequest(message, list) {
    var request = new XMLHttpRequest();
    request.open("POST", "php/data.php", true);
    request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    request.onreadystatechange = function() {
        if ((this.readyState == 4) && (this.status == 200)) {
            gridBuilder(this.responseText, list);
        }
    }
    request.send(message);
}
//submit remove request to php
function sendRemoveRequest(message, list) {
    var request = new XMLHttpRequest();
    request.open("POST", "php/data.php", true);
    request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    request.onreadystatechange = function() {
        if ((this.readyState == 4) && (this.status == 200)) {
            getList(list);
        }
    }
    request.send(message);
}
