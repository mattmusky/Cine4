//build html for personal list
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
          <!-- Delete Button -->
          <div class="pt-1 d-flex justify-content-center">
              <a href="#" onclick="removeMV(${json[i].MID},'${list}')"> <span class="fas fa-minus-circle text-danger"></span></a>
          </div>
          <!-- End Delete Button -->
      </div>
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

//on load
submitFriendList();
getList("usersviewmovies");
