<?php
require_once('conn.inc');

//retieve friends list given user
function friendList($id)
{
  $con   = createconnection();
  $query = "SELECT u.uid, FIRST, LAST FROM usersfriendusers uj INNER JOIN users u ON u.uid = uj.frienduid WHERE uj.useruid = " . $id;
  $sql   = mysqli_query($con, $query);
  $data  = array();
  while ($row = mysqli_fetch_assoc($sql)) { // row will be an array with Number and checked as items
    $data[] = $row;
  }
  if (mysqli_error($con)) {
    errorSend("Friend List", 3, "SQL Error: " . mysqli_error($con) . " | " . $query);
  }
  return json_encode($data);
}

//get movie details from database
function movieFind($id)
{
  $con   = createconnection();
  $query = "SELECT * FROM `movies` WHERE MID=" . $id;
  $sql   = mysqli_query($con, $query);
  if (mysqli_error($con)) { errorSend("Movie Find", 3, "SQL Error: " . mysqli_error($con) . " | " . $query); }
  $data  = array();
  if ($row = mysqli_fetch_assoc($sql)) {
    $data[] = $row;
  } else {
    // add movie if not already in DB
    movieCall($id);
    $sql  = mysqli_query($con, $query);
    if (mysqli_error($con)) { errorSend("Movie Find New", 3, "SQL Error: " . mysqli_error($con) . " | " . $query); }
    $data = array();
    while ($row = mysqli_fetch_assoc($sql)) {
      $data[] = $row;
    }
  }
  //get movie genres
  $query = "SELECT G.GName FROM movieshasgenre as M INNER JOIN genre as G ON M.GID = G.GID WHERE M.MID =" . $id;
  $sql   = mysqli_query($con, $query);
  if (mysqli_error($con)) { errorSend("Get Movie Genre", 3, "SQL Error: " . mysqli_error($con) . " | " . $query); }
  $genre = array();
  while ($row = mysqli_fetch_assoc($sql)) {
    $genre[] = $row;
  }
  //get users who have favorited
  $data[] = $genre;
  $query  = "SELECT U.First, U.Last, U.UID FROM usersfavormovies as V INNER JOIN users as U on U.UID = V.UID INNER JOIN movies as M ON M.MID = V.MID WHERE M.MID =" . $id;
  $sql    = mysqli_query($con, $query);
  if (mysqli_error($con)) { errorSend("Get Movie Fav", 3, "SQL Error: " . mysqli_error($con) . " | " . $query); }
  $users  = array();
  while ($row = mysqli_fetch_assoc($sql)) {
    $users[] = $row;
  }
  //get users who have watched
  $data[] = $users;
  $query  = "SELECT U.First, U.Last, U.UID FROM usersviewmovies as V INNER JOIN users as U on U.UID = V.UID INNER JOIN movies as M ON M.MID = V.MID WHERE M.MID =" . $id;
  $sql    = mysqli_query($con, $query);
  if (mysqli_error($con)) { errorSend("Get Movie Watched", 3, "SQL Error: " . mysqli_error($con) . " | " . $query); }
  $usersW = array();
  while ($row = mysqli_fetch_assoc($sql)) {
    $usersW[] = $row;
  }
  $data[] = $usersW;
  return json_encode($data);
}

//add movie to database
function movieCall($id)
{
  $result    = apiCall($id);
  $data      = json_decode($result, true);
  $con       = createconnection();
  $title     = mysqli_real_escape_string($con, $data['title']);
  $overview  = mysqli_real_escape_string($con, $data['overview']);
  $ticket    = str_replace(' ', '+', $title);
  $insertsql = "INSERT INTO movies (`MID`, `Title`, `Overview`, `Date`, `Poster`, `Backdrop`, `DVDLink`, `TicketLink`) VALUES ( '" . $data['id'] . "','" . $title . "','" . $overview . "','" . $data['release_date'] . "','" . $data['poster_path'] . "','" . $data['backdrop_path'] . "','" . $ticket . "','" . $data['imdb_id'] . "')";
  if ($con->query($insertsql) === TRUE) {
    errorSend("Add movie",1,$id);
  } else {
    if (mysqli_error($con)) { errorSend("Movie Insert", 3, "SQL Error: " . mysqli_error($con) . " | " . $insertsql); }
  }
  //add genres to genre table
  $genresql = "INSERT INTO `movieshasgenre` (`MID`, `GID`) VALUES ";
  foreach ($data['genres'] as $value) {
    $genresql .= "(" . $id . ", " . $value['id'] . "),";
  }
  $genresql = rtrim($genresql, ", ");
  if ($con->query($genresql) === TRUE) {
    //echo "genreinsert";
  } else {
    if (mysqli_error($con)) { errorSend("Genre Insert", 3, "SQL Error: " . mysqli_error($con) . " | " . $genresql); }
  }
}

//insert a movie comment
function commentSub($id, $user, $comment)
{
  $con       = createconnection();
  $comment   = mysqli_real_escape_string($con, $comment);
  $comid     = rand(10000, 99999);
  $insertsql = "INSERT INTO comments (`ComID`, `MID`, `Content`, `UID`, `Createtime`) VALUES ( '" . $comid . "','" . $id . "','" . $comment . "','" . $user . "', CURRENT_TIMESTAMP )";
  if ($con->query($insertsql) === TRUE) {
    //echo "commentinsert";
  } else {
    if (mysqli_error($con)) { errorSend("Comment Sub", 3, "SQL Error: " . mysqli_error($con) . " | " . $insertsql); }
  }
}

//get all a movies comments
function commentFind($id)
{
  $con   = createconnection();
  $query = "SELECT C.Content, C.CreateTime, U.First, U.Last, U.UID FROM comments as C INNER JOIN users as U ON C.UID = U.UID WHERE C.MID = " . $id . " ORDER BY C.CreateTime DESC";
  $sql   = mysqli_query($con, $query);
  if (mysqli_error($con)) { errorSend("Comment Find", 3, "SQL Error: " . mysqli_error($con) . " | " . $query); }
  $data  = array();
  while ($row = mysqli_fetch_assoc($sql)) {
    $data[] = $row;
  }
  //echo $query;
  //print_r($data);
  return json_encode($data);
}

//add a movie to users list
function addList($list, $uid, $mid, $movie)
{
  $con = createconnection();
  $return  = array();
  //check if movie already exists in favorites
  $sql = "SELECT * FROM usersfavormovies WHERE uid = " . $uid . " AND mid = " . $mid;
  $result = mysqli_query($con, $sql);
  if (mysqli_error($con)) { errorSend("Check Fav", 3, "SQL Error: " . mysqli_error($con) . " | " . $sql); }
  if (mysqli_num_rows($result) > 0) {
    $return['snap'] = 2;
    $return['msg'] = $movie . ' already in favorites';
    return json_encode($return);
  }
  //check if movie already exists in seen
  $sql = "SELECT * FROM usersviewmovies WHERE uid = " . $uid . " AND mid = " . $mid;
  $result = mysqli_query($con, $sql);
  if (mysqli_error($con)) { errorSend("Check Seen", 3, "SQL Error: " . mysqli_error($con) . " | " . $sql); }
  if (mysqli_num_rows($result) > 0) {
    $return['snap'] = 1;
    $return['msg'] = $movie . ' already in seen';
    return json_encode($return);
  }
  //if not in a list, add to selected list
  $insertsql = "INSERT INTO ".$list." (`UID`, `MID`) VALUES ( '" . $uid . "','" . $mid . "')";
  $result   = mysqli_query($con, $insertsql);
  if (mysqli_error($con)) { errorSend("Add to List", 3, "SQL Error: " . mysqli_error($con) . " | " . $insertsql); }
  if (mysqli_affected_rows($con) > 0) {
  } else {
    movieCall($mid);
    $con->query($insertsql);
  }
  $return['snap'] = 3;
  if ($list == 'usersviewmovies') {
      $return['msg'] = $movie . ' to seen';
  } else {
    $return['msg'] = $movie . ' to favorites';
  }
  return json_encode($return);
}

//get all the movies in a users list
function getList($id, $list)
{
  $con   = createconnection();
  $query = "SELECT M.MID, M.Poster, M.Title, U.First, U.Last FROM " . $list . " as F INNER JOIN users as U on U.UID = F.UID INNER JOIN movies as M ON M.MID = F.MID WHERE U.UID = " . $id;
  $sql   = mysqli_query($con, $query);
  if (mysqli_error($con)) { errorSend("Get List", 3, "SQL Error: " . mysqli_error($con) . " | " . $query); }
  $data  = array();
  while ($row = mysqli_fetch_assoc($sql)) {
    $data[] = $row;
  }
  //echo $query;
  //print_r($data);
  return json_encode($data);
}

//remove a movie from a users list
function removeList($uid, $mid, $list)
{
  $con = createconnection();
  $sql = "DELETE FROM `" . $list . "` WHERE `" . $list . "`.`UID` = " . $uid . " AND `" . $list . "`.`MID` = " . $mid;
  if ($con->query($sql) === TRUE) {
    //echo "removemov";
  } else {
    if (mysqli_error($con)) { errorSend("Remove from List", 3, "SQL Error: " . mysqli_error($con) . " | " . $sql); }
  }
}

//remove a users friend
function removeFriend($uid, $fid)
{
  $con = createconnection();
  $sql = "DELETE FROM `usersfriendusers` WHERE `usersfriendusers`.`UserUID` = " . $uid . " AND `usersfriendusers`.`FriendUID` = " . $fid;
  if ($con->query($sql) === TRUE) {
    //echo "removefriend";
  } else {
    if (mysqli_error($con)) { errorSend("Remove Friend", 3, "SQL Error: " . mysqli_error($con) . " | " . $sql); }
  }
}

//add a friend
function addFriend($uid, $fid)
{
  $con = createconnection();
  $sql = "INSERT INTO `usersfriendusers` (`UserUID`, `FriendUID`) VALUES ('" . $uid . "', '" . $fid . "')";
  if ($con->query($sql) === TRUE) {
    //echo "addfriend";
  } else {
    if (mysqli_error($con)) { errorSend("Add Friend", 3, "SQL Error: " . mysqli_error($con) . " | " . $sql); }
  }
}

//get all users not already friends
function allUser($uid)
{
  $con   = createconnection();
  $query = "SELECT U.First, U.Last, U.UID FROM cine4.users as U WHERE (U.UID NOT IN (" . $uid . ")) AND (U.UID NOT IN (SELECT F.FriendUID from cine4.usersfriendusers as F WHERE F.UserUID = " . $uid . "))";
  $sql   = mysqli_query($con, $query);
  if (mysqli_error($con)) { errorSend("Non Friends", 3, "SQL Error: " . mysqli_error($con) . " | " . $query); }
  $data  = array();
  while ($row = mysqli_fetch_assoc($sql)) {
    $data[] = $row;
  }
  //echo $query;
  //print_r($data);
  return json_encode($data);
}

//get users name given id
function profileName($id)
{
  $con   = createconnection();
  $query = "SELECT FIRST, LAST FROM users WHERE uid = " . $id;
  $sql   = mysqli_query($con, $query);
  if (mysqli_error($con)) { errorSend("Profile Name", 3, "SQL Error: " . mysqli_error($con) . " | " . $query); }
  $data  = array();
  while ($row = mysqli_fetch_assoc($sql)) {
    $data[] = $row;
  }
  //echo $query;
  //print_r($data);
  return json_encode($data);
}

//get recommended movies, all movie incommon with friends, not watched, sort by friend count
function getRec($id)
{
  $con  = createconnection();
  $q1   = "CREATE TEMPORARY TABLE m_count(INDEX my_mid_index(MID))\n" . "SELECT count(MID) as movie_count, MID\n" . "FROM `usersfavormovies`\n" . "WHERE UID IN (SELECT F.FriendUID FROM `usersfriendusers` as F \n" . " WHERE F.UserUID = " . $id . " UNION SELECT UID FROM users\n" . " WHERE UID = " . $id . ")\n" . "\n" . "GROUP BY MID\n" . "HAVING movie_count > 1\n" . "ORDER BY movie_count DESC";
  $q2   = "SELECT DISTINCT M.Title, M.MID, M.Poster, C.movie_count\n" . "FROM users as U, movies as M, usersfriendusers as F, m_count as C, usersfavormovies as V\n" . "WHERE F.UserUID = " . $id . "\n" . "AND F.FriendUID = U.UID\n" . "AND V.UID = U.UID\n" . "AND C.MID = V.MID\n" . "AND M.MID = C.MID";
  $sql1 = mysqli_query($con, $q1);
  if (mysqli_error($con)) { errorSend("Get Rec Temp Table", 3, "SQL Error: " . mysqli_error($con) . " | " . $q1); }
  $sql2 = mysqli_query($con, $q2);
  if (mysqli_error($con)) { errorSend("Get Rec Select", 3, "SQL Error: " . mysqli_error($con) . " | " . $q2); }
  $data = array();
  while ($row = mysqli_fetch_assoc($sql2)) {
    $data[] = $row;
  }
  //print_r($data);
  return json_encode($data);
}
?>
