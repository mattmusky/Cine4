#!/usr/bin/php
<?php
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQLib.inc');
//db functions
include ("inc/logSend.inc");
require_once('db/query.php');
function requestProcessor($request)
{
  switch ($request['type']) {
    case "friendList":
      echo "-Friend List-" . PHP_EOL;
      return friendList($request['id']);
      break;
    case "movieFind":
      echo "-Movie-" . PHP_EOL;
      return movieFind($request['id']);
      break;
    case "commentFind":
      echo "-commmentfind-" . PHP_EOL;
      return commentFind($request['id']);
      break;
    case "commentSub":
      echo "-commentsub-" . PHP_EOL;
      return commentSub($request['id'], $request['user'], $request['comment']);
      break;
    case "addSeen":
      echo "-addSeen-" . PHP_EOL;
      return addSeen($request['uid'], $request['mid']);
      break;
    case "addFav":
      echo "-addFav-" . PHP_EOL;
      return addFav($request['uid'], $request['mid']);
      break;
    case "getList":
      echo "-getList-" . PHP_EOL;
      return getList($request['id'], $request['list']);
      break;
    case "removeList":
      echo "-removeList-" . PHP_EOL;
      return removeList($request['uid'], $request['mid'], $request['list']);
      break;
    case "allUser":
      echo "-allUser-" . PHP_EOL;
      return allUser($request['uid']);
      break;
    case "addFriend":
      echo "-addFriend-" . PHP_EOL;
      return addFriend($request['uid'], $request['fid']);
      break;
    case "removeFriend":
      echo "-removeFriend-" . PHP_EOL;
      return removeFriend($request['uid'], $request['fid']);
      break;
    case "profileName":
      echo "-profileName-" . PHP_EOL;
      return profileName($request['id']);
      break;
    case "getRec":
      echo "-getRec-" . PHP_EOL;
      return getRec($request['id']);
      break;
  }
}
//function end
$server = new rabbitMQServer("rmq/dataMQ.ini", "testServer");
$server->process_requests('requestProcessor');
exit();
?>
