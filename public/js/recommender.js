//build recommended movie grid
function gridBuilder(json) {
    var json = JSON.parse(json);
    var divhere = document.getElementById('gridhere');
    divhere.innerHTML = '';
    for (i = 0; i < json.length; i++) {
        var newhtml = `


<div class="p-2 col-xl-2 col-lg-3 col-md-4 col-6">
    <a href="movie.php?id=${json[i].MID}" title="${json[i].Title}">
        <img class="img-fluid rounded box-shadow" src="https://image.tmdb.org/t/p/w342/${json[i].Poster}" alt="">
    </a>
    <!-- Seen/Fav Buttons -->
    <div class="pt-1 d-flex justify-content-center">
        <span class="badge badge-pill badge-warning">${json[i].movie_count}</span>
    </div>
    <!-- End seen/fav row-->
</div>


`;
        divhere.innerHTML += newhtml;
    }
}

//get recommended movies
function getRec() {
    var request = new XMLHttpRequest();
    request.open("POST", "php/data.php", true);
    request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    request.onreadystatechange = function() {
        if ((this.readyState == 4) && (this.status == 200)) {
            gridBuilder(this.responseText);
        }
    }
    request.send("type=getRec");
}

//on load
submitFriendList();
getRec();
