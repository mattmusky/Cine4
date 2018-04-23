#!/usr/bin/php
<?php
//rmq include
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQLib.inc');
//include
require_once('inc/conn.inc');
$con   = createconnection();



function create($target, $name)
{
echo('testHERE');
  $client = new rabbitMQClient("pushMQ.ini","testServer");
              $req=array();
              $req['type'] = "run_script";
              $req['name'] = $name;
              //$req['ver'] = $version;
              $req['target'] = $target;
              $response = $client->send_request($req);
}

function deploy($name, $version, $target)
{

}

function deprecate($name, $version)
{

}

function rollback($name, $version, $target)
{

}

function requestProcessor($request)
{
  echo "received request".PHP_EOL;
  var_dump($request);
  if(!isset($request['type']))
  {
    return "ERROR: unsupported message type";
  }
  switch ($request['type'])
  {
    case "create":
        return create($request['target'], $request['name']);
    case "deploy":
        return deploy($request['name'], $request['version'], $request['target']);
    case "deprecate":
        return deprecate($request['name'], $request['version']);
    case "rollback":
        return rollback($request['name'], $request['version'], $request['target']);
  }
  return array("returnCode" => '0', 'message'=>"Server received request and processed");
}

$server = new rabbitMQServer("rmq/deployMQ.ini","testServer");

$server->process_requests('requestProcessor');
exit();
?>
