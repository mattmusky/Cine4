<?php
require_once('conn.inc');
require_once('apiCall.php');
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
  return json_encode($data);
}
function movieFind($id)
{
  $con   = createconnection();
  $query = "SELECT * FROM `movies` WHERE MID=" . $id;
  $sql   = mysqli_query($con, $query);
  $data  = array();
  if ($row = mysqli_fetch_assoc($sql)) {
    // row will be an array with Number and checked as items
    $data[] = $row;
  } else {
    errorSend("Add movie",1,"adding movie".$id);
    movieCall($id);
    $sql  = mysqli_query($con, $query);
    $data = array();
    while ($row = mysqli_fetch_assoc($sql)) { // row will be an array with Number and checked as items
      $data[] = $row;
    }
  }
  $query = "SELECT G.GName FROM movieshasgenre as M INNER JOIN genre as G ON M.GID = G.GID WHERE M.MID =" . $id;
  $sql   = mysqli_query($con, $query);
  $genre = array();
  while ($row = mysqli_fetch_assoc($sql)) {
    // row will be an array with Number and checked as items
    $genre[] = $row;
  }
  $data[] = $genre;
  $query  = "SELECT U.First, U.Last, U.UID FROM usersfavormovies as V INNER JOIN users as U on U.UID = V.UID INNER JOIN movies as M ON M.MID = V.MID WHERE M.MID =" . $id;
  $sql    = mysqli_query($con, $query);
  $users  = array();
  while ($row = mysqli_fetch_assoc($sql)) {
    // row will be an array with Number and checked as items
    $users[] = $row;
  }
  $data[] = $users;
  $query  = "SELECT U.First, U.Last, U.UID FROM usersviewmovies as V INNER JOIN users as U on U.UID = V.UID INNER JOIN movies as M ON M.MID = V.MID WHERE M.MID =" . $id;
  $sql    = mysqli_query($con, $query);
  $usersW = array();
  while ($row = mysqli_fetch_assoc($sql)) {
    // row will be an array with Number and checked as items
    $usersW[] = $row;
  }
  $data[] = $usersW;
  echo $query;
  print_r($data);
  return json_encode($data);
}
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
    echo "movieinsert";
  } else {
    echo $insertsql;
  }
  $genresql = "INSERT INTO `movieshasgenre` (`MID`, `GID`) VALUES ";
  foreach ($data['genres'] as $value) {
    $genresql .= "(" . $id . ", " . $value['id'] . "),";
  }
  $genresql = rtrim($genresql, ", ");
  if ($con->query($genresql) === TRUE) {
    echo "genreinsert";
  } else {
  }
  echo $genresql;
}
function commentSub($id, $user, $comment)
{
  $con       = createconnection();
  $comment   = mysqli_real_escape_string($con, $comment);
  $comid     = rand(10000, 99999);
  $insertsql = "INSERT INTO comments (`ComID`, `MID`, `Content`, `UID`, `Createtime`) VALUES ( '" . $comid . "','" . $id . "','" . $comment . "','" . $user . "', CURRENT_TIMESTAMP )";
  if ($con->query($insertsql) === TRUE) {
    echo "commentinsert";
  } else {
  }
}
function commentFind($id)
{
  $con   = createconnection();
  $query = "SELECT C.Content, C.CreateTime, U.First, U.Last, U.UID FROM comments as C INNER JOIN users as U ON C.UID = U.UID WHERE C.MID = " . $id . " ORDER BY C.CreateTime DESC";
  $sql   = mysqli_query($con, $query);
  $data  = array();
  while ($row = mysqli_fetch_assoc($sql)) {
    // row will be an array with Number and checked as items
    $data[] = $row;
  }
  echo $query;
  print_r($data);
  return json_encode($data);
}

function addList($list, $uid, $mid, $movie)
{
  $con = createconnection();
  $return  = array();
  $sql = "SELECT * FROM usersfavormovies WHERE uid = " . $uid . " AND mid = " . $mid;
  $result = mysqli_query($con, $sql);
  if (mysqli_num_rows($result) > 0) {
    echo "ALREADY IN FAVOR";
    $return['snap'] = 2;
    $return['msg'] = $movie . ' already in favorites';
    return json_encode($return);
  }
  $sql = "SELECT * FROM usersviewmovies WHERE uid = " . $uid . " AND mid = " . $mid;
  $result = mysqli_query($con, $sql);
  if (mysqli_num_rows($result) > 0) {
    $return['snap'] = 1;
    $return['msg'] = $movie . ' already in seen';
    return json_encode($return);
  }
  $insertsql = "INSERT INTO ".$list." (`UID`, `MID`) VALUES ( '" . $uid . "','" . $mid . "')";
  $result   = mysqli_query($con, $insertsql);
  echo 'num'.mysqli_affected_rows($con).'num';
  if (mysqli_affected_rows($con) > 0) {
    echo "11111111111";
  } else {
    movieCall($mid);
    $con->query($insertsql);
    echo "addfavNEWNEW";
  }
  $return['snap'] = 3;
  if ($list == 'usersviewmovies') {
      $return['msg'] = $movie . ' to seen';
  } else {
    $return['msg'] = $movie . ' to favorites';
  }
  return json_encode($return);
}



function getList($id, $list)
{
  $con   = createconnection();
  $query = "SELECT M.MID, M.Poster, M.Title, U.First, U.Last FROM " . $list . " as F INNER JOIN users as U on U.UID = F.UID INNER JOIN movies as M ON M.MID = F.MID WHERE U.UID = " . $id;
  $sql   = mysqli_query($con, $query);
  $data  = array();
  while ($row = mysqli_fetch_assoc($sql)) {
    // row will be an array with Number and checked as items
    $data[] = $row;
  }
  echo $query;
  print_r($data);
  return json_encode($data);
}
function removeList($uid, $mid, $list)
{
  $con = createconnection();
  $sql = "DELETE FROM `" . $list . "` WHERE `" . $list . "`.`UID` = " . $uid . " AND `" . $list . "`.`MID` = " . $mid;
  if ($con->query($sql) === TRUE) {
    echo "removemov";
  } else {
    echo "FAILLLLL";
  }
}
function removeFriend($uid, $fid)
{
  $con = createconnection();
  $sql = "DELETE FROM `usersfriendusers` WHERE `usersfriendusers`.`UserUID` = " . $uid . " AND `usersfriendusers`.`FriendUID` = " . $fid;
  if ($con->query($sql) === TRUE) {
    echo "removefriend";
  } else {
    echo "FAILLLLL";
  }
}
function addFriend($uid, $fid)
{
  $con = createconnection();
  $sql = "INSERT INTO `usersfriendusers` (`UserUID`, `FriendUID`) VALUES ('" . $uid . "', '" . $fid . "')";
  if ($con->query($sql) === TRUE) {
    echo "addfriend";
  } else {
    echo "FAILLLLL";
    echo $sql;
  }
}
function allUser($uid)
{
  $con   = createconnection();
  $query = "SELECT U.First, U.Last, U.UID FROM cine4.users as U WHERE (U.UID NOT IN (" . $uid . ")) AND (U.UID NOT IN (SELECT F.FriendUID from cine4.usersfriendusers as F WHERE F.UserUID = " . $uid . "))";
  $sql   = mysqli_query($con, $query);
  $data  = array();
  while ($row = mysqli_fetch_assoc($sql)) {
    // row will be an array with Number and checked as items
    $data[] = $row;
  }
  echo $query;
  print_r($data);
  return json_encode($data);
}
function profileName($id)
{
  $con   = createconnection();
  $query = "SELECT FIRST, LAST FROM users WHERE uid = " . $id;
  $sql   = mysqli_query($con, $query);
  $data  = array();
  while ($row = mysqli_fetch_assoc($sql)) { // row will be an array with Number and checked as items
    $data[] = $row;
  }
  echo $query;
  print_r($data);
  return json_encode($data);
}
function getRec($id)
{
  $con  = createconnection();
  $q1   = "CREATE TEMPORARY TABLE m_count(INDEX my_mid_index(MID))\n" . "SELECT count(MID) as movie_count, MID\n" . "FROM `usersfavormovies`\n" . "WHERE UID IN (SELECT F.FriendUID FROM `usersfriendusers` as F \n" . " WHERE F.UserUID = " . $id . " UNION SELECT UID FROM users\n" . " WHERE UID = " . $id . ")\n" . "\n" . "GROUP BY MID\n" . "HAVING movie_count > 1\n" . "ORDER BY movie_count DESC";
  $q2   = "SELECT DISTINCT M.Title, M.MID, M.Poster, C.movie_count\n" . "FROM users as U, movies as M, usersfriendusers as F, m_count as C, usersfavormovies as V\n" . "WHERE F.UserUID = " . $id . "\n" . "AND F.FriendUID = U.UID\n" . "AND V.UID = U.UID\n" . "AND C.MID = V.MID\n" . "AND M.MID = C.MID";
  $sql1 = mysqli_query($con, $q1);
  $sql2 = mysqli_query($con, $q2);
  $data = array();
  while ($row = mysqli_fetch_assoc($sql2)) { // row will be an array with Number and checked as items
    $data[] = $row;
  }
  //echo $query;
  print_r($data);
  return json_encode($data);
}
?>
