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

//echo('testHERE');

//exec("sudo cp -r ".$cwd." /tmp/".$genname);

$con   = createconnection();
$query = "SELECT	max(V.VersionNum) FROM	Version as V WHERE	V.PackageName = \"$package\"";;
$sql   = mysqli_query($con, $query);
$data  = array();
if ($row = mysqli_fetch_assoc($sql)) {
  $version = $row['max(V.VersionNum)']+1;
  echo 'version:';
  echo $version;
}

exec("scp -o StrictHostKeyChecking=no -r cine@".$host.":/home/cine/pack/box.tar /home/cine/packages/".$package."-".$version.".tar");


$sql = "INSERT INTO	Version (VersionID, VersionNum, Deprecate, PackageName) VALUES	(null, '" . $version . "', default, '" . $package. "')";

if ($con->query($sql) === TRUE) {
  echo "DONENE";
}



return "version2 made";
}

function deploy($package, $version, $target)
{


  $con   = createconnection();
  $query = "SELECT * FROM `Version` WHERE `PackageName` = \"$package\" and `VersionNum` = \"$version\"";
  $sql   = mysqli_query($con, $query);
  $data  = array();
  if ($row = mysqli_fetch_assoc($sql)) {


    $vid = $row['VersionID'];
    $dep = $row['Deprecate'];
    echo 'vid:';
    echo $vid;
    echo 'dep:';
    echo $dep;

    switch($package) {
        case("feweb"):
        case("fephp"): {
            $mach='fe';
            break;
        }
        case("db"):
        case("bephp"): {
            $mach='be';
            break;
        }
        case("apiphp"): {
            $mach='dmz';
            break;
        }

        default: {
            return $package . " is not a valid package";

        }
    }

    if ($dep=='Y'){
      return "package is depreciated";
    }



if ($target == 'prod') {


echo("scp -o StrictHostKeyChecking=no -r /home/cine/packages/".$package."-".$version.".tar cine@490-PROD-".$mach.":/home/cine/pack/box.tar");


}


  $client = new rabbitMQClient("pushMQ.ini","testServer");
              $request=array();
              $request['type'] = "push";
              $request['package'] = $package;
              $request['target'] = $target;
              $request['mach'] = $mach;
              $response = $client->send_request($request);





  }
  else {
    return "package does not exist";
  }
return "complete!";




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
  //var_dump($request);
  if(!isset($request['type']))
  {
    return "ERROR: unsupported message type";
  }
  switch ($request['type'])
  {
    case "create":
        return create($request['package'], $request['host']);
    case "deploy":
        return deploy($request['package'], $request['version'], $request['target']);
    case "deprecate":
        return deprecate($request['package'], $request['version']);
    case "rollback":
        return rollback($request['package'], $request['version'], $request['target']);
  }
  return array("returnCode" => '0', 'message'=>"Server received request and processed");
}

$server = new rabbitMQServer("deployMQ.ini","testServer");

$server->process_requests('requestProcessor');
exit();
?>
