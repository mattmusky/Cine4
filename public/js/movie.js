function movieBuilder(json) {

    var movie = JSON.parse(json);

    var divhere = document.getElementById('moviehere');
    divhere.innerHTML = '';



var newhtml = `


<!-- Movie Poster -->
<div class="col-sm-3 p-2">
    <img src="https://image.tmdb.org/t/p/original/${movie[0].Poster}" class=" img-fluid rounded box-shadow">
</div>
<!-- Movie Information -->
<div class="col-sm-6">
    <div class="pb-sm-5">
    <h1>${movie[0].Title}</h1>
    <h6>Overview: <small>${movie[0].Overview}</small></h6>
    <h6>Release Date: <small>${movie[0].Date}</small></h6>
    <h6>DVD Purchase: <small><a href="http://www.imdb.com/showtimes/title/${movie[0].DVDLink}">Amazon</a></small></h6>
    <h6>Showtimes: <small><a href="http://www.imdb.com/showtimes/title/${movie[0].TicketLink}">IMDB</a></small></h6>

    </div>
<div class="p-3 pt-sm-5">
    <div class="form-group">
        <label for="comment">Comment:</label>
        <textarea class="form-control form-control-sm" rows="6" id="commentbox" placeholder="Place your thoughts here"></textarea>
        <button type="submit" onclick="submitComment()"" class="mt-2 btn btn-warning btn-sm float-right">Submit</button>
    </div>

    <!-- Comments Section -->

    <h5 class="mt-5">Comments</h5>
    <hr>
    <div id="commentshere"></div>

`;

divhere.innerHTML += newhtml;
commentFind();
}



function submitMovie(id) {

var message = "type=movieFind&id=" + id;

sendMovData(message,movieBuilder);
return 0;
}

function submitComment() {

var comment = document.getElementById('commentbox').value;
var message = "type=commentSub&id=" + movieid+ "&comment=" + comment+ "&user=" + userid;

sendMovData(message,commentFind);
return 0;
}

function commentFind() {

var message = "type=commentFind&id=" + movieid;

sendMovData(message,commentDisplay);
return 0;
}

function commentDisplay(comments) {


var comments = JSON.parse(comments);
var divhere = document.getElementById('commentshere');
divhere.innerHTML = '';

for (i = 0; i < comments.length; i++) {

var newhtml = `


<div class="row comment">
    <div class="col-6  p-3">
        <div class="head" style="margin-bottom: 10px;"><small><strong class="mr-2">${comments[i].UID}</strong> ${comments[i].Createtime} </small></div>
        <p class="small">${comments[i].Content}</p>
    </div>
</div>

`;




divhere.innerHTML += newhtml;
}
return 0;

}

submitFriendList();


function sendMovData(message,retmethod) {

var request = new XMLHttpRequest();
request.open("POST", "php/data.php", true);
request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
request.onreadystatechange = function() {
    if ((this.readyState == 4) && (this.status == 200)) {

      switch (retmethod) {


        case movieBuilder:
          movieBuilder(this.responseText);
          break;
          case commentFind:
            commentFind();
            break;
            case commentDisplay:
              commentDisplay(this.responseText);
              break;
      }

    }
}
request.send(message);

}
