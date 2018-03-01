function builder() {
    //var tmdb = JSON.parse(myJson);


    for (i = 0; i < 20; i++) {

var newhtml = `
<div class="col-lg-3 col-md-4 col-6">
  <a href="#" onclick="alert('${myJson.results[i].id}')" class="d-block mb-4 h-100">
    <img class="img-fluid img-thumbnail" src="https://image.tmdb.org/t/p/w342/${myJson.results[i].poster_path}" alt="">
  </a>
</div>

`;


var divhere = document.getElementById('gridhere');

divhere.innerHTML += newhtml;
    }

}



function submitDiscover() {

  var e = document.getElementById("sortSelect");
  var sort = e.options[e.selectedIndex].value;
  var e = document.getElementById("genreSelect");
  var genre = e.options[e.selectedIndex].value;

var message = "type=discover&sort=" + sort + "&genre=" + genre;



sendRequest(message);
return 0;
}

function HandleResponse(response) {
//var text = JSON.parse(response);
var text;
alert('DONE');
response = response.replace(/\s/g, "");

}

function sendRequest(message) {

var request = new XMLHttpRequest();
request.open("POST", "php/auth.php", true);
request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
request.onreadystatechange = function() {
    if ((this.readyState == 4) && (this.status == 200)) {
        HandleResponse(this.responseText);
    }
}
request.send(message);

}



window.onload = submitDiscover;
