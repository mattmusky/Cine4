#!/usr/bin/php
<?php
//rmq include
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQLib.inc');
/** PHP arguments -
 *   Command type,
 *       create -
 *           package
 *       deploy
 *           package, version, target
 *       depreciate
 *           package, version
 *       rollback
 *           package,  target
 *
 */
$args = parseArgs($argv);
switch ($args[0]) {
  case ("create"): {
    create($args);
    break;
  }
  case ("deploy"): {
    deploy($args);
    break;
  }
  case ("depreciate"): {
    depreciate($args);
    break;
  }
  case ("rollback"): {
    rollback($args);
    break;
  }
  default: {
    print "\n"; echo $args[0] . " is not a valid command";
    break;
  }
}
function create($args)
{
  $package = $args[1];
  $host    = gethostname();
  $quit    = false;
  switch ($package) {
    case ("feweb"): {
      print "\n"; echo ("tar -cf /home/cine/pack/box.tar -P /home/cine/cine4/public --exclude='php'");
      break;
    }
    case ("fephp"): {
      print "\n"; echo ("tar -cf /home/cine/pack/box.tar -P /home/cine/cine4/public/php");
      break;
    }
    case ("db"): {
      print "\n"; echo ("mysqldump -u root -pinfinity cine4 > /home/cine/cine4/config/cine4.sql");
      print "\n"; echo ("tar -cf /home/cine/pack/box.tar -P /home/cine/cine4/config/cine4.sql");
      break;
    }
    case ("bephp"): {
      print "\n"; echo ("tar -cf /home/cine/pack/box.tar -P /home/cine/cine4/src --exclude='api'");
      break;
    }
    case ("apiphp"): {
      print "\n"; echo ("tar -cf /home/cine/pack/box.tar -P /home/cine/cine4/src/api");
      break;
    }
    default: {
      print "\n"; echo $package . " is not a valid package";
      $quit = true;
      break;
    }
  }
  if (!$quit) {
    $client             = new rabbitMQClient("deployMQ.ini", "testServer");
    $request            = array();
    $request['type']    = "create";
    $request['package'] = $package;
    $request['host']    = gethostname();
    $response           = $client->send_request($request);
    if ($response) {
      print "\n"; echo $response;
    }
  }
}
function deploy($args)
{
  $client             = new rabbitMQClient("deployMQ.ini", "testServer");
  $request            = array();
  $request['type']    = "deploy";
  $request['package'] = $args[1];
  $request['version'] = $args[2];
  $request['target']  = $args[3];
  $response           = $client->send_request($request);
  if ($response) {
    print "\n"; echo $response;
  }
}
function depreciate($args)
{
  $client             = new rabbitMQClient("deployMQ.ini", "testServer");
  $request            = array();
  $request['type']    = "depreciate";
  $request['package'] = $args[1];
  $request['version'] = $args[2];
  $response           = $client->send_request($request);
  if ($response) {
    print "\n"; echo $response;
  }
}
function rollback($args)
{
  $client             = new rabbitMQClient("deployMQ.ini", "testServer");
  $request            = array();
  $request['type']    = "rollback";
  $request['package'] = $args[1];
  $request['target']  = $args[2];
  $response           = $client->send_request($request);
  if ($response) {
    print "\n"; echo $response;
  }
}
function parseArgs($argv)
{
  array_shift($argv);
  $o = array();
  foreach ($argv as $a) {
    if (substr($a, 0, 2) == '--') {
      $eq = strpos($a, '=');
      if ($eq !== false) {
        $o[substr($a, 2, $eq - 2)] = substr($a, $eq + 1);
      } else {
        $k = substr($a, 2);
        if (!isset($o[$k])) {
          $o[$k] = true;
        }
      }
    } else if (substr($a, 0, 1) == '-') {
      if (substr($a, 2, 1) == '=') {
        $o[substr($a, 1, 1)] = substr($a, 3);
      } else {
        foreach (str_split(substr($a, 1)) as $k) {
          if (!isset($o[$k])) {
            $o[$k] = true;
          }
        }
      }
    } else {
      $o[] = $a;
    }
  }
  return $o;
}
?>
