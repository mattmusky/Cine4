#!/usr/bin/php
<?php
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQLib.inc');

//db functions

require_once('db/query.php');




function requestProcessor($request)
{

  switch ($request['type'])
    {
      case "friendList":
        echo "-Friend List-".PHP_EOL;
        return friendList($request['id']);
        break;


      }


}


//function end

$server = new rabbitMQServer("rmq/dataMQ.ini","testServer");

$server->process_requests('requestProcessor');
exit();
?>
