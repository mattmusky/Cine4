//build html movie page
function movieBuilder(json) {
    var movie = JSON.parse(json);
    var divhere = document.getElementById('moviehere');
    divhere.innerHTML = '';
    var genre = '';
    var usersFav = '';
    var usersWat = '';
    for (i = 0; i < movie[1].length; i++) {
        var temp = `${movie[1][i].GName}, `;
        genre += temp;
    }
    genre = genre.substring(0, genre.length - 2);
    for (i = 0; i < movie[2].length; i++) {
        var temp = `<a href="profile.php?id=${movie[2][i].UID} ">${movie[2][i].First} ${movie[2][i].Last}</a>, `;
        usersFav += temp;
    }
    usersFav = usersFav.substring(0, usersFav.length - 2);
    if (movie[2].length > 0) {
        var usersFav = `<h6>Favorited: <small>${usersFav}</small></h6>`;
    }
    for (i = 0; i < movie[3].length; i++) {
        var temp = `<a href="profile.php?id=${movie[3][i].UID} ">${movie[3][i].First} ${movie[3][i].Last}</a>, `;
        usersWat += temp;
    }
    usersWat = usersWat.substring(0, usersWat.length - 2);
    if (movie[3].length > 0) {
        var usersWat = `<h6>Watched: <small>${usersWat}</small></h6>`;
    }
    var newhtml = `
      <!-- Movie Poster -->
      <div class="col-sm-3 p-2">
      <img src="https://image.tmdb.org/t/p/original/${movie[0].Poster}" class=" img-fluid rounded box-shadow">
      </div>
      <!-- Movie Information -->
      <div class="col-sm-6">
      <div class="pb-sm-3">
      <h1>${movie[0].Title}</h1>
      <h6>Overview: <small>${movie[0].Overview}</small></h6>
      <h6>Release Date: <small>${movie[0].Date}</small></h6>
      <h6>Genre: <small>${genre}</small></small></h6>
      ${usersFav}
      ${usersWat}
      <h6>DVD Purchase: <small><a href="https://www.amazon.com/s/ref=nb_sb_noss_1?&field-keywords=${movie[0].DVDLink}+dvd">Amazon</a>,&nbsp;<a href="http://www.blu-ray.com/search/?quicksearch=1&quicksearch_keyword=${movie[0].DVDLink}">Blu-Ray</a></small></h6>
      <h6>Showtimes & Ticket Purchase: <small><a href="http://www.imdb.com/showtimes/title/${movie[0].TicketLink}">IMDB</a></small></h6>

      </div>
      <div class="p-3 pt-sm-3">
      <div class="form-group">
      <label for="comment">Comment:</label>
      <textarea type="search" onsearch="submitComment()" class="form-control form-control-sm" rows="6" id="commentbox" placeholder="Place your thoughts here"></textarea>
      <button type="submit" onclick="submitComment()"" class="mt-2 btn btn-warning btn-sm float-right">Submit</button>
      </div>

      <!-- Comments Section -->

      <h5 class="mt-5">Comments</h5>
      <hr>
      <!-- Sort By Drop Down -->
                                    <div class="form-inline form-control-sm position-relative" style="top:-10px; left: -10px;">
                                        <select id="sortSelect" onchange="commentFind()" class="custom-select mr-4 ml-1 w-25">
                                            <option value="1" selected="">Sort By</option>
                                            <option value="1">Top</option>
                                            <option value="2">New</option>
                                        </select>
                                    </div>
                                    <!-- End Sort By Drop Down -->
      <div id="commentshere"></div>
      `;
    divhere.innerHTML += newhtml;
    //usersFavMovie();
    commentFind();
}

//send request for movie info
function submitMovie(id) {
    var message = "type=movieFind&id=" + id;
    sendMovData(message, movieBuilder);
    return 0;
}

//submit a user comment
function submitComment() {
    var comment = document.getElementById('commentbox').value;
    var message = "type=commentSub&id=" + movieid + "&comment=" + comment + "&user=" + userid;
    sendMovData(message, commentFind);
    return 0;
}

//vote on a comment
function submitVote(cid,dir) {

    var message = "type=voteSub&cid=" + cid + "&dir=" + dir;
    sendMovData(message, commentFind);
    return 0;
}

//request for comments on movie
function commentFind() {
  var e = document.getElementById("sortSelect");
  var sort = e.options[e.selectedIndex].value;
    var message = "type=commentFind&id=" + movieid + "&sort=" + sort;
    sendMovData(message, commentDisplay);
    return 0;
}

//show comment on movie page
function commentDisplay(comments) {
    var comments = JSON.parse(comments);
    var divhere = document.getElementById('commentshere');
    divhere.innerHTML = '';
    for (i = 0; i < comments.length; i++) {
      var rand = Math.floor(Math.random() * 100) + 1;
        var newhtml = `
        <div class="row">
    <div class="col-auto">
        <div class="row flex-column">
            <!-- Upvote/ Downvote-->
            <div class="col-12 p-0 text-right"><a class="commentbtn" onclick="submitVote(${comments[i].ComID},'up');"><span class="fas fa-chevron-circle-up" style="position: relative;bottom: -3px;"></span></a></div>
            <div class="col-12 p-0 text-right"><a class="commentbtn" onclick="submitVote(${comments[i].ComID},'down');"><span class="fas fa-chevron-circle-down" style="position: relative;top: -3px;"></span></a></div>
            <!-- End Upvote/ Downvote-->
        </div>
    </div>
    <div class="col">
        <div class="row flex-column align-self-start">
            <!-- Poster/User info(User/Date) -->
            <div class="col-auto text-left">
                <div><small><strong><a href="profile.php?id=${comments[i].UID}">${comments[i].First} ${comments[i].Last}</a>&nbsp;<div id="${rand}${comments[i].UID}" class="badges-container"></div>&nbsp;</strong></small>
                    <small style="font-size: x-small;" class="bg-light"> ${comments[i].CreateTime} </small>
                    <small style="font-size: x-small;" class="bg-light"> ${comments[i].Amount} points</small>
                </div>
            </div>
            <!-- End Poster/User info -->
            <!-- Actual Comment -->
            <div class="col-auto text-left">
                <p><small>${comments[i].Content}</small> </p>
            </div>
        </div>
    </div>
</div>
        `;
        divhere.innerHTML += newhtml;
        getBadges(comments[i].UID,rand);
    }
    return 0;
}

//send movie and comment data requests to php
function sendMovData(message, retmethod) {
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

//run on load
submitFriendList();
