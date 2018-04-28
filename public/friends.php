<?php
  session_start();

  if ($_SESSION["cred"] != "user") {
  	header("Location: index.html");
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
    <link rel="icon" href="img/favicon.png">
    <title>Cine4</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Courgette" rel="stylesheet">
    <link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Custom styles for this template -->
    <link href="css/cine4.css" rel="stylesheet">
    <link href="css/list.css" rel="stylesheet">
    <!-- Font Awesome -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
  </head>
  <body>
    <div class="container-fluid h-100">
      <h1 class="text-center p-2"><a class="main-title" href="discover.php">cine4</a></h1>
      <div class="row sideheight">
        <!-- Sidebar -->
        <div id="LeftColumn" class=" col-xl-2 col-sm-3 p-0 ">
          <ul class="sidebar-nav p-0">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
              <a class="navbar-brand" href="#" id="menu-toggle-out"><i class="fas fa-bars"></i>&nbsp;&nbsp;Friends</a>
            </nav>
            <div id="friendhere"></div>



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
                      <button class="btn btn-dark" onclick="search()" type="button"><i class="fas fa-search"></i></button>
                    </div>
                    <input type="search" id="searchbox" onsearch="search()" class="form-control" placeholder="Search" aria-label="" aria-describedby="basic-addon1">
                  </div>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="discover.php">Discover</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="lists.php">My Movies</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="smart.php">Smart Suggestions</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="recommender.php">Our List</a>
                </li>
                <li class="nav-item active">
                  <a class="nav-link" href="friends.php">Friends & Badges</a>
                </li>
              </ul>
              <div class="my-2 my-lg-0">
                <ul class="navbar-nav mr-auto">
                  <li class="nav-item active">
                    <a class="nav-link" href="#">Hi <?php print $_SESSION["first"];?>!&nbsp;<div id="nb<?php print $_SESSION["id"];?>" class="badges-container"></div></a>

                  </li>
                  <li class="nav-item">
                    <a class="navbar-brand nav-link" href="logout.php"><i class="fas fa-sign-out-alt"></i></a>
                  </li>
                </ul>
              </div>
            </div>
          </nav>
          <!-- Page Content -->
          <div class="pageContent p-3">
             <div class="container-fluid">
                <!-- Main Row -->
                <div class="row">
                   <!-- Manage Friends Col -->



                     <div class="col-sm-3 border-right border-right">
                     <h2>Manage Friends</h2>
                     <ul id='friendlist' class="list-group" style="max-width: 300px;">
                     </ul>
                     <br>
                     <h2>Add Friends</h2>
                     <ul id='userlist' class="list-group" style="max-width: 300px;">
                     </ul>
                   </div>

                   <!-- End Manage Friends Col -->
                   <!-- Badges Col 1 -->
                   <div class="col-sm-3 border-right">
                      <div class="row flex-column">
                         <!-- Start Badge -->
                         <div class="col-12">
                            <div class="row">
                               <div class="col-5 p-0 text-center">
                                  <i class="ion-ribbon-b bronze bigMovieBadge"></i>
                               </div>
                               <div class="col p-0 ">
                                  <h4 class=" ">Bronze</h4>
                                  <p>Pick and add three movies you want to watch to your list </p>
                               </div>
                            </div>
                         </div>
                         <!-- End Badge -->
                         <!-- Start Badge -->
                         <div class="col-12 ">
                            <div class="row ">
                               <div class="col-5 p-0 text-center ">
                                  <i class="ion-ribbon-a silver bigMovieBadge "></i>
                               </div>
                               <div class="col p-0 ">
                                  <h4 class=" ">Silver</h4>
                                  <p>Pick and add six movies you want to watch to your list </p>
                               </div>
                            </div>
                         </div>
                         <!-- End Badge -->
                         <!-- Start Badge -->
                         <div class="col-12 ">
                            <div class="row ">
                               <div class="col-5 p-0 text-center ">
                                  <i class="ion-trophy gold bigMovieBadge " style="font-size: 105px; "></i>
                               </div>
                               <div class="col p-0 ">
                                  <h4 class=" ">Gold</h4>
                                  <p>Pick and add nine movies you want to watch to your list</p>
                               </div>
                            </div>
                         </div>
                         <!-- End Badge -->
                      </div>
                      <!-- End Row flex column -->
                   </div>
                   <!-- End Badges Col 1 -->
                   <!-- Badges Col 2 -->
                   <div class="col-sm-3 border-right ">
                      <div class="row flex-column ">
                         <!-- Start Badge -->
                         <div class="col-12 ">
                            <div class="row ">
                               <div class="col-5 p-0 text-center ">
                                  <i class="ion-person twofriends bigMovieBadge " style=" position: relative; bottom: 37px; "></i>
                               </div>
                               <div class="col p-0 ">
                                  <h4 class=" ">Two Friends</h4>
                                  <p>Add two friends to your friends list </p>
                               </div>
                            </div>
                         </div>
                         <!-- End Badge -->
                         <!-- Start Badge -->
                         <div class="col-12 ">
                            <div class="row ">
                               <div class="col-5 p-0 text-center ">
                                  <i class="ion-person-stalker fourfriends bigMovieBadge " style="position: relative; bottom: 32px; "></i>
                               </div>
                               <div class="col p-0 ">
                                  <h4 class=" ">Four Friends</h4>
                                  <p>Add four friends to your friends list </p>
                               </div>
                            </div>
                         </div>
                         <!-- End Badge -->
                         <!-- Start Badge -->
                         <div class="col-12 ">
                            <div class="row ">
                               <div class="col-5 p-0 text-center ">
                                  <i class="ion-ios-people sixfriends bigMovieBadge " style=" position: relative; top: -41px; "></i>
                               </div>
                               <div class="col p-0 ">
                                  <h4 class=" ">Six Friends</h4>
                                  <p>Add six friends to your friends list </p>
                               </div>
                            </div>
                         </div>
                         <!-- End Badge -->
                      </div>
                      <!-- End Row flex column -->
                   </div>
                   <!-- End Badges Col 2 -->
                   <!-- Badges Col 2 -->
                   <div class="col-sm-3 border-right ">
                      <div class="row flex-column ">
                         <!-- Start Badge -->
                         <div class="col-12 p-0 ">
                            <div class="row ">
                               <div class="col-5 p-0 text-center ">
                                  <div class="badge badge-pill " style="font-size: 34px; color:white; background-color: purple; ">1</div>
                               </div>
                               <div class="col p-0 " style=" position: relative; right: 15px; ">
                                  <h4 class=" ">Comment</h4>
                                  <p>Submit a comment on a movie and earn a counter </p>
                               </div>
                            </div>
                         </div>
                         <!-- End Badge -->
                      </div>
                      <!-- End Row flex column -->
                   </div>
                   <!-- End Badges Col 2 -->
                </div>
                <!-- End Main Row -->
             </div>
          </div>

          <!-- /page content -->
        </div>
        <!-- /main wrapper -->
      </div>
      <div class='row'>
        <div class='col-12 p-0'>
          <footer class="py-3 bg-dark">
            <div class="container">
              <p class="m-0 text-center text-white">Cine4 - IT490 - 2018</p>
            </div>
            <!-- /.container -->
          </footer>
        </div>
      </div>
    </div>
    <!-- Bootstrap core JavaScript -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <!-- Menu Toggle Script -->
    <script src="js/cine4.js"></script>
    <script src="js/friends.js"></script>
    <script>
      var myid = <?php echo $_SESSION["id"]; ?>;
      getBadges(myid,'nb');

    </script>
  </body>
</html>
