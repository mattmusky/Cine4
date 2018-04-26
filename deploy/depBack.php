#!/usr/bin/php
<?php
//rmq include
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQPush.inc');

function push($package, $target, $machine) {



    $host = preg_split('[-]', gethostname());
    $host = (strtolower($host[1].$host[2]));

    if ($host==$target.$machine) {
      echo ("here");
    }

}


function requestProcessor($request)
{

  echo(gethostname());
  switch ($request['type']) {
    case "push":
      return push($request['package'], $request['target'], $request['mach']);
  }
}

//function end
$server = new rabbitMQServer("rmq/pushMQ.ini", "testServer");
$server->process_requests('requestProcessor');
exit();

?>
