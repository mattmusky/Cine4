#!/usr/bin/php
<?php
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQLib.inc');
//db functions
require_once('api/discover.inc');
require_once('api/movie.inc');
require_once('api/search.inc');
function requestProcessor($request)
{
  switch ($request['type']) {
    case "discover":
      echo "-Discover-" . PHP_EOL;
      return discoverCall($request['sort'], $request['genre']);
      break;
    case "movieCall":
      echo "-movieCall-" . PHP_EOL;
      return movieCall($request['id']);
      break;
    case "searchAPI":
      echo "-searchAPI-" . PHP_EOL;
      return searchAPI($request['movie']);
      break;
  }
}
//function end
$server = new rabbitMQServer("rmq/apiMQ.ini", "testServer");
$server->process_requests('requestProcessor');
exit();
?>
