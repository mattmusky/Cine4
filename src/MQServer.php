#!/usr/bin/php
<?php
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQLib.inc');

//db functions
require_once('db/auth.php');

function logIt($src,$msg) {


  $log_file = '../resources/logs/log.txt';
  $handle = fopen($log_file, 'a') or die('Cannot open file:  '.$log_file);
  $msgout = date("m/d/Y h:i:s A") . " - " . $src . " - " . $msg . PHP_EOL;
  fwrite($handle, $msgout);

}


function requestProcessor($request)
{
  switch ($request['type'])
    {
      case "error":
        echo "-Error Recieved-".PHP_EOL;
        echo $request['source'].PHP_EOL;
        logIt($request['source'],$request['error']);
        break;
      case "login":
        echo "-Login Request-".PHP_EOL;
        echo $request['user'].PHP_EOL;
        return checkPassword($request['user'], $request['pass']);
				
				

        break;
        case "reg":
          echo "-Register Request-".PHP_EOL;
          echo $request['user'].PHP_EOL;
          return adduser($request['first'], $request['last'], $request['email'], $request['user'], $request['pass']);
					
					
          break;
      }







}


//function end

$server = new rabbitMQServer("rmq/rabbitMQ.ini","testServer");

$server->process_requests('requestProcessor');
exit();
?>
