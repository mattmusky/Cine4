#!/usr/bin/php
<?php
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQLib.inc');

//db functions

require_once('api/discover.inc');




function requestProcessor($request)
{
  
  switch ($request['type'])
    {
      case "discover":
        echo "-Discover-".PHP_EOL;
        return discoverCall($request['sort'], $request['genre']);
        break;


      }


}


//function end

$server = new rabbitMQServer("rmq/apiMQ.ini","testServer");

$server->process_requests('requestProcessor');
exit();
?>
