#!/usr/bin/php
<?php
//rmq include
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQLib.inc');
//include
require_once('inc/logRec.inc');

function requestProcessor($request)
{
  switch ($request['type']) {
    case "error":
      //echo "-Error Recieved-" . PHP_EOL;
      logIt($request);
      break;
  }
}
//function end
$server = new rabbitMQServer("logMQ.ini", gethostname());
$server->process_requests('requestProcessor');
exit();
?>
