<?php
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQLib.inc');
function errorSend($task, $level, $message)
{
  $client             = new rabbitMQClient("logMQ.ini", gethostname());
  $bt                 = debug_backtrace();
  $caller             = array_shift($bt);
  $request            = array();
  $request['type']    = "error";
  $request['server']  = gethostname();
  $request['task']    = $task;
  $request['file']    = $caller['file'];
  $request['line']    = $caller['line'];
  $request['level']   = $level;
  $request['message'] = $message;
  $response           = $client->send_request($request);
  //end of data to send
}
