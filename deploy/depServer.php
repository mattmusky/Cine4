#!/usr/bin/php
<?php
//rmq include
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQLib.inc');
//include
require_once('inc/conn.inc');




function create($package, $host)
{

echo('testHERE');

//exec("sudo cp -r ".$cwd." /tmp/".$genname);



$con   = createconnection();
$query = "SELECT	max(V.VersionNum) FROM	Version as V WHERE	V.PackageName = \"$package\"";;
$sql   = mysqli_query($con, $query);
$data  = array();
if ($row = mysqli_fetch_assoc($sql)) {
  print_r($row);
}
else {
  $version = 1
  echo(HERE);
}


return "version2 made";
}

function deploy($name, $version, $target)
{


  $client = new rabbitMQClient("pushMQ.ini","testServer");
              $request=array();
              $request['type'] = "push";
              $request['name'] = $name;
              //$request['ver'] = $version;
              $request['target'] = $target;
              $response = $client->send_request($request);

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
        return create($request['package'], $request['host']);
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
