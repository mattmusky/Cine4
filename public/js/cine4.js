$("#menu-toggle-in").click(function(e) {
    e.preventDefault();
    var left = $('#LeftColumn');
    var right = $('#RightColumn');

    right.removeClass("col-12");
    right.addClass("col-xl-10 col-sm-9");
    left.removeClass("hideLeft");
    left.addClass("col-xl-2 col-sm-3 ");
    $(".sideToggle").hide();
});

$("#menu-toggle-out").click(function(e) {
    e.preventDefault();
    var left = $('#LeftColumn');
    var right = $('#RightColumn');

    left.removeClass("col-xl-2 col-sm-3");
    left.addClass("hideLeft");
    right.removeClass("col-xl-10 col-sm-9");
    right.addClass("col-12");
    $(".sideToggle").show();
});


function friendBuilder(json) {
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

function submitFriendList() {


var message = "type=friendList";



sendData(message,friendBuilder);
return 0;
}

function sendData(message,retmethod) {

var request = new XMLHttpRequest();
request.open("POST", "php/data.php", true);
request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
request.onreadystatechange = function() {
    if ((this.readyState == 4) && (this.status == 200)) {
      switch (retmethod){
        case friendBuilder:
        friendBuilder(this.responseText);
      }

    }
}
request.send(message);

}
