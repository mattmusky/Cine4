<?php
require_once('conn.inc');
require_once('apiCall.php');
function friendList($id)
{
    $con   = createconnection();
    $query = "SELECT u.uid, FIRST, LAST FROM usersfriendusers uj INNER JOIN users u ON u.uid = uj.frienduid WHERE uj.useruid = " . $id;
    $sql   = mysqli_query($con, $query);
    $data  = array();
    while ($row = mysqli_fetch_assoc($sql)) { // row will be an array with Number and checked as items
        $data[] = $row;
    }
    echo $query;
    print_r($data);
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
        movieCall($id);
        $sql  = mysqli_query($con, $query);
        $data = array();
        while ($row = mysqli_fetch_assoc($sql)) { // row will be an array with Number and checked as items
            $data[] = $row;
        }
    }
    echo $query;
    print_r($data);
    return json_encode($data);
}
function movieCall($id)
{
    $result    = apiCall($id);
    $data      = json_decode($result, true);
    $con       = createconnection();
    $overview  = mysqli_real_escape_string($con, $data['overview']);
    $insertsql = "INSERT INTO movies (`MID`, `Title`, `Overview`, `Date`, `Poster`, `Backdrop`, `DVDLink`, `TicketLink`) VALUES ( '" . $data['id'] . "','" . $data['title'] . "','" . $overview . "','" . $data['release_date'] . "','" . $data['poster_path'] . "','" . $data['backdrop_path'] . "','" . $data['imdb_id'] . "','" . $data['imdb_id'] . "')";
    if ($con->query($insertsql) === TRUE) {
        echo "movieinsert";
    } else {
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
    $comid = rand(10000,99999);
    $insertsql = "INSERT INTO comments (`ComID`, `MID`, `Content`, `UID`, `Createtime`) VALUES ( '" . $comid . "','" . $id . "','" . $comment . "','" . $user . "', CURRENT_TIMESTAMP )";
    if ($con->query($insertsql) === TRUE) {
        echo "commentinsert";
    } else {
    }
}
function commentFind($id)
{
    $con   = createconnection();
    $query = "SELECT * FROM `comments` WHERE MID=" . $id;
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
?>
