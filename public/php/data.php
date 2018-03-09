<?php
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQLib.inc');
session_start();
$client = new rabbitMQClient("rmq/dataMQ.ini", "testServer");
// intrepret POST MESSAGE
if (!isset($_POST)) {
  $msg = "NO POST MESSAGE SET";
  echo json_encode($msg);
  exit(0);
}
$postrequest = $_POST;
$response    = "unsupported request type";
switch ($postrequest["type"]) {
  case "friendList": #Get user friend list
    $request         = array();
    $request['type'] = $postrequest["type"];
    $request['id']   = $_SESSION["id"];
    $response        = $client->send_request($request);
    break;
  case "movieFind": #Get movie data
    $request         = array();
    $request['type'] = $postrequest["type"];
    $request['id']   = $postrequest["id"];
    $response        = $client->send_request($request);
    break;
  case "commentSub": #Submit new comment
    $request            = array();
    $request['type']    = $postrequest["type"];
    $request['id']      = $postrequest["id"];
    $request['user']    = $postrequest["user"];
    $request['comment'] = $postrequest["comment"];
    $response           = $client->send_request($request);
    break;
  case "commentFind": #Get all comments for movie
    $request         = array();
    $request['type'] = $postrequest["type"];
    $request['id']   = $postrequest["id"];
    $response        = $client->send_request($request);
    break;
  case "addList": #Add movie to user list
    $request         = array();
    $request['type'] = $postrequest["type"];
    $request['list']  = $postrequest["list"];
    $request['uid']  = $postrequest["uid"];
    $request['mid']  = $postrequest["mid"];
    $request['movie']  = $postrequest["movie"];
    $response        = $client->send_request($request);
    break;
  case "getList": #Get a users list
    $request         = array();
    $request['type'] = $postrequest["type"];
    $request['id']   = $postrequest["id"];
    $request['list'] = $postrequest["list"];
    $response        = $client->send_request($request);
    break;
  case "removeList": #Remove a movie from a users list
    $request         = array();
    $request['type'] = $postrequest["type"];
    $request['uid']  = $postrequest["uid"];
    $request['mid']  = $postrequest["mid"];
    $request['list'] = $postrequest["list"];
    $response        = $client->send_request($request);
    break;
  case "allUser": #get all users not currently friends
    $request         = array();
    $request['type'] = $postrequest["type"];
    $request['uid']  = $_SESSION["id"];
    $response        = $client->send_request($request);
    break;
  case "addFriend": #add a friend
    $request         = array();
    $request['type'] = $postrequest["type"];
    $request['fid']  = $postrequest["fid"];
    $request['uid']  = $_SESSION["id"];
    $response        = $client->send_request($request);
    break;
  case "removeFriend": #remove a fiend
    $request         = array();
    $request['type'] = $postrequest["type"];
    $request['fid']  = $postrequest["fid"];
    $request['uid']  = $_SESSION["id"];
    $response        = $client->send_request($request);
    break;
  case "profileName": #get profile name given id
    $request         = array();
    $request['type'] = $postrequest["type"];
    $request['id']   = $postrequest["id"];
    $response        = $client->send_request($request);
    break;
  case "getRec": #get recommended movies
    $request         = array();
    $request['type'] = $postrequest["type"];
    $request['id']   = $_SESSION["id"];
    $response        = $client->send_request($request);
    break;
}
echo $response;
exit(0);
?>
