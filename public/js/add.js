function addFav(uid, mid) {


var message = "type=addFav&uid=" + uid+ "&mid=" + mid;

sendAddData(message);
return 0;
}

function addSeen(uid, mid) {


var message = "type=addSeen&uid=" + uid+ "&mid=" + mid;

sendAddData(message);
return 0;
}

function sendAddData(message) {

var request = new XMLHttpRequest();
request.open("POST", "php/data.php", true);
request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
request.onreadystatechange = function() {
    if ((this.readyState == 4) && (this.status == 200)) {



    }
}
request.send(message);

}
