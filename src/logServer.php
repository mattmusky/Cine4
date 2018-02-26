#!/usr/bin/php
<?php
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQLib.inc');

//db functions

require_once('inc/logRec.inc');




function requestProcessor($request)
{
  switch ($request['type'])
    {
      case "error":
        echo "-Error Recieved-".PHP_EOL;
        echo $request['task'].PHP_EOL;
        
        
        logIt($request);
        break;

      
      }







}


//function end

$server = new rabbitMQServer("rmq/logMQ.ini","testServer");

$server->process_requests('requestProcessor');
exit();
?>