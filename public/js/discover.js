function gridBuilder(json) {
    var tmdb = JSON.parse(json);


    for (i = 0; i < tmdb.results.length; i++) {

var newhtml = `

<div class="p-2 col-xl-2 col-lg-3 col-md-4 col-6">
    <a href="moviePage.html" title="${tmdb.results[i].original_title}" onclick="alert('${tmdb.results[i].id}')">
        <img class="img-fluid rounded box-shadow" src="https://image.tmdb.org/t/p/w342/${tmdb.results[i].poster_path}" alt="">
    </a>
    <!-- Seen/Fav Buttons -->


        <div class="pt-1 d-flex justify-content-around">

            <button class="btn btn-outline-warning btn-sm">
                <span class="fas fa-eye"></span>
            </button>

            <button class="btn btn-outline-warning btn-sm">
                <span class="far fa-eye-slash"></span>
            </button>


    </div> <!-- End seen/fav row-->
</div> <!-- End Movie Poster container -->

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

gridBuilder(response);

}

function sendRequest(message) {

var request = new XMLHttpRequest();
request.open("POST", "php/api.php", true);
request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
request.onreadystatechange = function() {
    if ((this.readyState == 4) && (this.status == 200)) {
        HandleResponse(this.responseText);
    }
}
request.send(message);

}



window.onload = submitFriendList;
