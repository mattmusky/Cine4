//show search result grid
function gridBuilder(json) {
    var tmdb = JSON.parse(json);
    var divhere = document.getElementById('gridhere');
    divhere.innerHTML = '';
    for (i = 0; i < tmdb.results.length; i++) {
        var newhtml = `
        <div class="p-2 col-xl-2 col-lg-3 col-md-4 col-6">
          <a href="movie.php?id=${tmdb.results[i].id}" title="${tmdb.results[i].original_title}">
              <img class="img-fluid rounded box-shadow" src="https://image.tmdb.org/t/p/w342/${tmdb.results[i].poster_path}" alt="">
          </a>
          <!-- Seen/Fav Buttons -->


              <div class="pt-1 d-flex justify-content-around">

                  <button class="btn btn-outline-warning btn-sm" onclick="addSeen(userid,${tmdb.results[i].id}, '${tmdb.results[i].original_title} to seen')">
                      <span class="fas fa-eye"></span>
                  </button>

                  <button class="btn btn-outline-warning btn-sm" onclick="addFav(userid,${tmdb.results[i].id}, '${tmdb.results[i].original_title} to favorites')">
                      <span class="far fa-eye-slash"></span>
                  </button>


          </div> <!-- End seen/fav row-->
        </div> <!-- End Movie Poster container -->
        `;
        divhere.innerHTML += newhtml;
    }
}
//create search request
function searchAPI(movie) {
    var message = "type=searchAPI&movie=" + movie;
    sendRequest(message);
    return 0;
}
//send search request to php
function sendRequest(message) {
    var request = new XMLHttpRequest();
    request.open("POST", "php/api.php", true);
    request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    request.onreadystatechange = function() {
        if ((this.readyState == 4) && (this.status == 200)) {
            gridBuilder(this.responseText);
        }
    }
    request.send(message);
}

//on load
submitFriendList();
