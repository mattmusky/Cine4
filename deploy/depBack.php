#!/usr/bin/php
<?php
//rmq include
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQPush.inc');

function push($v, $n, $target) {
    if($target !== gethostname()) {
        return;
    }
    $fname = $n."-".$v;
    $key = preg_split('[-]', $target);
    switch($key[1]) {

        }
    echo('here!!');
    echo($v + $n + $target);
    }



function requestProcessor($request)
{
  echo("bana");
  echo(gethostname());
  switch ($request['type']) {
    case "push":
      return push($request['ver'], $request['name'], $request['target']);
  }
}
//function end
$server = new rabbitMQServer("rmq/pushMQ.ini", "testServer");
$server->process_requests('requestProcessor');
exit();

?>
