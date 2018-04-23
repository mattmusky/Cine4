#!/usr/bin/php
<?php
//rmq include
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQLib.inc');

/** PHP arguments -
*   Command type,
*       create -
*           filename (created by client sent to server), origin = gethostname(), name
*       deploy
*           name, version, target
*       deprecate
*           name, version
*       rollback
*           name, version, target
*
*/

$args = parseArgs($argv);

switch($args[0]) {
    case("create"): {
        create($args);
        break;
    }
    case("deploy"): {
        deploy($args);
        break;
    }
    case("deprecate"): {
        deprecate($args);
        break;
    }
    case("rollback"): {
        rollback($args);
        break;
    }
    default: {
        echo $args[0] . " is not a valid command";
        break;
    }
}

function create($args) {
  echo ('here');

$name = "one";
$version ="two";
$target="theee";
  $client             = new rabbitMQClient("rmq/deployMQ.ini", "testServer");
  $request            = array();
  $request['type'] = "run_script";
  $request['name'] = $name;
  $request['ver'] = $version;
  $request['target'] = $target;
  $response           = $client->send_request($request);
  if($response) {
        echo "done";
    }
}

function deploy($args) {

}

function deprecate($args) {

}

function rollback($args) {

}

function parseArgs($argv){
    array_shift($argv); $o = array();
    foreach ($argv as $a){
        if (substr($a,0,2) == '--'){ $eq = strpos($a,'=');
            if ($eq !== false){ $o[substr($a,2,$eq-2)] = substr($a,$eq+1); }
            else { $k = substr($a,2); if (!isset($o[$k])){ $o[$k] = true; } } }
        else if (substr($a,0,1) == '-'){
            if (substr($a,2,1) == '='){ $o[substr($a,1,1)] = substr($a,3); }
            else { foreach (str_split(substr($a,1)) as $k){ if (!isset($o[$k])){ $o[$k] = true; } } } }
        else { $o[] = $a; } }
    return $o;
}

?>
