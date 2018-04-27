#!/usr/bin/php
<?php
//rmq include
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQLib.inc');
//api include
require_once('inc/logSend.inc');
require_once('api/discover.inc');
require_once('api/movie.inc');
require_once('api/search.inc');
require_once('api/smart.inc');

function requestProcessor($request)
{
  switch ($request['type']) {
    case "discover": # discover movie request
      //echo "-discover-" . PHP_EOL;
      return discoverCall($request['sort'], $request['genre']);
      break;
    case "movieCall": # movie details request
      //echo "-movieCall-" . PHP_EOL;
      return movieCall($request['id']);
      break;
    case "searchAPI": #movie search request
      //echo "-searchAPI-" . PHP_EOL;
      return searchAPI($request['movie']);
      break;
    case "smartCall": #smart search request
      //echo "-smartCall-" . PHP_EOL;
      return smartCall($request['g1'],$request['g2']);
      break;
  }
}
//function end

$server = new rabbitMQServer("apiMQ.ini", gethostname());
$server->process_requests('requestProcessor');

exit();
?>
