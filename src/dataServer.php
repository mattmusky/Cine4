#!/usr/bin/php
<?php
//rmq inlude
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQLib.inc');
//inlude
require_once("inc/logSend.inc");
require_once('inc/apiCall.inc');
require_once('db/query.inc');


function requestProcessor($request)
{
  switch ($request['type']) {
    case "friendList": #Get user friend list
      //echo "-Friend List-" . PHP_EOL;
      return friendList($request['id']);
      break;
    case "movieFind": #Get movie data
      //echo "-Movie-" . PHP_EOL;
      return movieFind($request['id']);
      break;
    case "commentFind": #Get all comments for movie
      //echo "-commmentfind-" . PHP_EOL;
      return commentFind($request['id']);
      break;
    case "commentSub": #Submit new comment
      //echo "-commentsub-" . PHP_EOL;
      return commentSub($request['id'], $request['user'], $request['comment']);
      break;
    case "addList": #Add movie to user list
      //echo "-addList-" . PHP_EOL;
      return addList($request['list'],$request['uid'],$request['mid'],$request['movie']);
      break;
    case "getList": #Get a users list
      //echo "-getList-" . PHP_EOL;
      return getList($request['id'], $request['list']);
      break;
    case "removeList": #Remove a movie from a users list
      //echo "-removeList-" . PHP_EOL;
      return removeList($request['uid'], $request['mid'], $request['list']);
      break;
    case "allUser": #Get all users not currently friends
      //echo "-allUser-" . PHP_EOL;
      return allUser($request['uid']);
      break;
    case "addFriend": #add a friend
      //echo "-addFriend-" . PHP_EOL;
      return addFriend($request['uid'], $request['fid']);
      break;
    case "removeFriend": #remove a friend
      //echo "-removeFriend-" . PHP_EOL;
      return removeFriend($request['uid'], $request['fid']);
      break;
    case "profileName": #get users name given id
      //echo "-profileName-" . PHP_EOL;
      return profileName($request['id']);
      break;
    case "getRec": #get recommended movies
      //echo "-getRec-" . PHP_EOL;
      return getRec($request['id']);
      break;
  }
}
//function end
$server = new rabbitMQServer("rmq/dataMQ.ini", "testServer");
$server->process_requests('requestProcessor');
exit();
?>
