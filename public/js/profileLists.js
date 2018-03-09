//build user profile movie html
function gridBuilder(json, list) {
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


                <div class="pt-1 d-flex justify-content-around">

                    <button class="btn btn-outline-warning btn-sm" onclick="addList('usersviewmovies', myid,${json[i].MID},'${json[i].Title}')">
                        <span class="fas fa-eye"></span>
                    </button>

                    <button class="btn btn-outline-warning btn-sm" onclick="addList('usersfavormovies', myid,${json[i].MID},'${json[i].Title}')"">
                        <span class="far fa-eye-slash"></span>
                    </button>


            </div> <!-- End seen/fav row-->
        </div> <!-- End Movie Poster container -->
        `;
        divhere.innerHTML += newhtml;
    }
    var divhere = document.getElementById('buttonshere');
    divhere.innerHTML = '';
    if (list == "usersviewmovies") {
        var newhtml = `


    <button type="button" id="usersviewmovies" onclick="getList('usersviewmovies')" class="btn btn-primary active">Movies I've Seen</button>
    <button type="button" id="usersfavormovies" onclick="getList('usersfavormovies')" class="btn-primary btn">Favorited</button>


`;
        divhere.innerHTML += newhtml;
    }
    if (list == "usersfavormovies") {
        var newhtml = `

<button type="button" id="usersviewmovies" onclick="getList('usersviewmovies')" class="btn btn-primary ">Movies I've Seen</button>
<button type="button" id="usersfavormovies" onclick="getList('usersfavormovies')" class="btn-primary btn active ">Favorited</button>

`;
        divhere.innerHTML += newhtml;
    }
}

//get a user's name given id
function profileName() {
    var request = new XMLHttpRequest();
    request.open("POST", "php/data.php", true);
    request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    request.onreadystatechange = function() {
        if ((this.readyState == 4) && (this.status == 200)) {
            var json = JSON.parse(this.responseText);
            var divhere = document.getElementById('profilename');
            divhere.innerHTML = `${json[0].FIRST}&nbsp;${json[0].LAST}`;
            divhere.innerHTML += '\'s Lists';
        }
    }
    request.send("type=profileName&id=" + userid);
}

//on load
submitFriendList();
getList("usersviewmovies");
profileName();
