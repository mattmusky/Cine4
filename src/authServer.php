#!/usr/bin/php
<?php
//rmq include
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQLib.inc');
//include
require_once('inc/logSend.inc');
require_once('db/auth.inc');


function requestProcessor($request)
{
  switch ($request['type']) {
    case "login": #user login request
      //echo "-Login Request-" . PHP_EOL;
      return checkPassword($request['user'], $request['pass']);
      break;
    case "reg": #user registration
      //echo "-Register Request-" . PHP_EOL;
      return adduser($request['first'], $request['last'], $request['email'], $request['user'], $request['pass']);
      break;
  }
}
//function end
$server = new rabbitMQServer("rmq/authMQ.ini", "testServer");
$server->process_requests('requestProcessor');
exit();
?>
