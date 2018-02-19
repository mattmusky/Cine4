#!/usr/bin/php
<?php
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQLib.inc');

//db functions
require_once('db/auth.php');
require_once('inc/logRec.inc');




function requestProcessor($request)
{
  switch ($request['type'])
    {
      case "error":
        echo "-Error Recieved-".PHP_EOL;
        echo $request['task'].PHP_EOL;
        echo "here";
        //should include: server, task, file, line, warn level, message!
        logIt($request);
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
