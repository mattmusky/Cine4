function gridBuilder(json,list) {

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
        <a href="#" onclick="remove(${json[i].MID},'${list}')"> <span class="fas fa-minus-circle text-danger"></span></a>
    </div>
    <!-- End Delete Button -->
</div>

`;

divhere.innerHTML += newhtml;




}
var divhere = document.getElementById('buttonshere');
divhere.innerHTML = '';
if (list=="usersviewmovies"){
var newhtml = `

<label class="btn btn-primary active">
    <a href="#" onclick="getList('usersviewmovies')"><input type="radio" name="options" id="option1" autocomplete="off" onclick="" checked="">Movies I've Seen</a>
</label>
<label class="btn btn-primary">
    <a href="#" onclick="getList('usersfavormovies')"><input type="radio" name="options" id="option2" autocomplete="off" onclick="" > Favorited</a>
</label>

`;
divhere.innerHTML += newhtml;
}

if (list=="usersfavormovies"){
var newhtml = `

<label class="btn btn-primary">
    <a href="#" onclick="getList('usersviewmovies')"><input type="radio" name="options" id="option1" autocomplete="off" onclick="" > Movies I've Seen</a>
</label>
<label class="btn btn-primary active">
    <a href="#" onclick="getList('usersfavormovies')"><input type="radio" name="options" id="option2" autocomplete="off" onclick="" checked=""> Favorited</a>
</label>

`;
divhere.innerHTML += newhtml;
}


}



function start() {
  submitFriendList();
  getList("usersviewmovies");
}
window.onload = start;