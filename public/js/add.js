//add movie to user list
function addList(list, uid, mid, movie) {
    var message = "type=addList&list=" + list + "&uid=" + uid + "&mid=" + mid + "&movie=" + movie;
    sendAddData(message);
    return 0;
}

//take formatted add movie message and send to php
function sendAddData(message) {
    var request = new XMLHttpRequest();
    request.open("POST", "php/data.php", true);
    request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    request.onreadystatechange = function() {
        if ((this.readyState == 4) && (this.status == 200)) {
            snap(this.responseText);
        }
    }
    request.send(message);
}

//display popup when movie is added
function snap(notify) {
  ohSnapX();
  var result = JSON.parse(notify);
  if (result.snap == 1) {
    ohSnap('&nbsp;' + result.msg, {
      'color': 'blue',
      'duration': '2000',
      'fade-duration': 'slow',
      'icon': 'fas fa-eye'
    });
  } else if (result.snap == 2) {
    ohSnap('&nbsp;' + result.msg, {
      'color': 'blue',
      'duration': '2000',
      'fade-duration': 'slow',
      'icon': 'far fa-eye-slash'
    });
  } else if (result.snap == 3) {
    ohSnap('&nbsp;' + result.msg, {
      'duration': '2000',
      'fade-duration': 'slow',
      'icon': 'fas fa-plus'
    });
  }
}
