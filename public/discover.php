<?php
session_start();

if ($_SESSION["cred"] != "user") {
	header("Location: login.html");
	exit();
	}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Cine4</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Courgette" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/cine4.css" rel="stylesheet">
</head>

<body>
    <div class="container-fluid">
        <h1 class="text-center p-2"><a class="main-title" href="discover.html">cine4</a></h1>
        <div class="row">
            <!-- Sidebar -->
            <div id="LeftColumn" class="col-xl-2 col-sm-3 p-0">
                <ul class="sidebar-nav p-0">
                    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                        <a class="navbar-brand" href="#" id="menu-toggle-out"><i class="fas fa-bars"></i>&nbsp;&nbsp;Friends</a>
                    </nav>
                    <li>
                        <a href="jimmy.html">Jimmy She</a>
                    </li>
                    <li>
                        <a href="#">Matt Muscarella</a>
                    </li>
                    <li>
                        <a href="#">Muz Khan</a>
                    </li>
                    <li>
                        <a href="#">Vishal Panchal</a>
                    </li>
                    <li>
                        <a href="#">Prof Kehoe</a>
                    </li>
                    <li>
                        <a href="#">Spider Man</a>
                    </li>
                    <li>
                        <a href="#">The Hulk</a>
                    </li>
                </ul>
            </div>
            <!-- /#sidebar-wrapper -->
            <!-- Main Wrap -->
            <div id="RightColumn" class="col-xl-10 col-sm-9 p-0">
                <nav class="navbar navbar-expand-lg navbar-dark bg-secondary">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item active">
                                <div class="sideToggle"><a href="#" class="navbar-brand" id="menu-toggle-in"><i class="fas fa-bars"></i>&nbsp;&nbsp;Friends</a></div>
                            </li>
                            <li>
                                <div class="input-group pr-2 pl-1">
                                    <div class="input-group-prepend">
                                        <button class="btn btn-dark" type="button"><i class="fas fa-search"></i></button>
                                    </div>
                                    <input type="text" class="form-control" placeholder="Search" aria-label="" aria-describedby="basic-addon1">
                                </div>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="starter.html">Discover</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="myList.html">My Lists</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="recommender.html">Recommender</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="friendsList.html">Manage Friends</a>
                            </li>
                        </ul>
                        <div class="my-2 my-lg-0">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item active">
                                    <a class="nav-link" href="#">Hi Jimmy!</a>
                                </li>
                                <li class="nav-item">
                                    <a class="navbar-brand nav-link" href="#"><i class="fas fa-sign-out-alt"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- Page Content -->
                <div class="p-3">
                    <h2>Discover Movies</h2>
                    <div class="form-inline m-3">
                        <select id="sortSelect" class="custom-select mr-4 ml-1" style="max-width: 150px">
                            <option selected="">Sort By</option>
                            <option value="popularity.desc">Popularity</option>
                            <option value="vote_average.desc">Rating</option>
                            <option value="release_date.desc">Release Date</option>
														<option value="revenue.desc">Revenue</option>

                        </select>
                        <select id="genreSelect" class="custom-select mr-4 ml-1" style="max-width: 150px">
                            <option selected="">Filter Genre</option>
														<option value="28">Action</option>
														<option value="12">Adventure</option>
														<option value="16">Animation</option>
														<option value="35">Comedy</option>
														<option value="80">Crime</option>
														<option value="99">Documentary</option>
														<option value="18">Drama</option>
														<option value="10751">Family</option>
														<option value="14">Fantasy</option>
														<option value="36">History</option>
														<option value="27">Horror</option>
														<option value="10402">Music</option>
														<option value="9648">Mystery</option>
														<option value="10749">Romance</option>
														<option value="878">ScienceFiction</option>
														<option value="10770">TVMovie</option>
														<option value="53">Thriller</option>
														<option value="10752">War</option>
														<option value="37">Western</option>
                        </select>
                    </div>

                    <div id="gridhere" class="p-2 row text-center text-lg-left">



                        <!-- Movie Poster Container -->
                        <div class="p-2 col-xl-2 col-lg-3 col-md-4 col-6">
                            <a href="moviePage.html" onclick="">
                                <img class="img-fluid rounded box-shadow" src="https://image.tmdb.org/t/p/w1280/q0R4crx2SehcEEQEkYObktdeFy.jpg" alt="">
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



                    </div>
                    <!--End row 1 -->
                </div>
                <!-- /page content -->
            </div>
            <!-- /main wrapper -->
        </div>
    </div>
    <footer class="py-3 bg-dark">
        <div class="container">
            <p class="m-0 text-center text-white">Cine4 - IT490 - 2018</p>
        </div>
        <!-- /.container -->
    </footer>
    <!-- Bootstrap core JavaScript -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <!-- Menu Toggle Script -->
    <script src="js/cine4.js"></script>
		<script src="js/discover.js"></script>
</body>

</html>