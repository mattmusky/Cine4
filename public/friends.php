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
    <link href="css/list.css" rel="stylesheet">
    <!-- Font Awesome -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
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
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="starter.html">Discover</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="myList.html">My Lists</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="recommender.html">Recommender</a>
                            </li>
                            <li class="nav-item active">
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
                    <h2>Manage Friends</h2>
                    
                        <ul class="list-group" style="max-width: 300px;">
                            <li class="list-group-item" >
                                <div class="d-flex justify-content-between align-items-center">
                                    <span><a href="jimmy.html">Jimmy She</a></span>
                                    <span class="fas fa-minus-circle text-danger ml-2" onclick=""></span>
                                </div>
                            </li>
                           
                        </ul>
                    
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
    <script>
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

    aGrid();

    function aList() {
        var movieList = document.getElementById("movieList");
        var movieGrid = document.getElementById("gridhere");

        movieGrid.style.display = "none";
        movieList.style.display = "block";
    }

    function aGrid() {
        var movieList = document.getElementById("movieList");
        var movieGrid = document.getElementById("gridhere");
        movieGrid.style.display = "flex";
        movieList.style.display = "none";

    }

    /*   // JQuery Version of aList and aGrid function
    function aList() {
        $('#movieList').show();
        $('#gridhere').hide();
    }

    function aGrid() {
        $('#movieList').hide();
        $('#gridhere').show();
    }
*/
    </script>
</body>

</html>