#!/usr/bin/php
<?php
//rmq include
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQPush.inc');
function push($package, $target, $machine)
{
  $host = preg_split('[-]', gethostname());
  $thishost = (strtolower($host[1] . $host[2]));
  if ($thishost == $target . $machine) {
    echo ("Deploying...");

  switch ($package) {
    case ("feweb"): {
      exec("tar -xf /home/cine/pack/box.tar -C /");
      break;
    }
    case ("fephp"): {
      exec("tar -xf /home/cine/pack/box.tar -C /");
      break;
    }
    case ("db"): {
      if (!isset($host[3])){
      exec("tar -xf /home/cine/pack/box.tar -C /");
      exec("mysql -u root -pinfinity cine4 < /home/cine/cine4/config/cine4.sql");
    }
      break;
    }
    case ("bephp"): {
      exec("tar -xf /home/cine/pack/box.tar -C /");
      if (!isset($host[3])) {
      exec("systemctl restart cine4_auth cine4_data cine4_log");
    }
      break;
    }
    case ("apiphp"): {
      exec("tar -xf /home/cine/pack/box.tar -C /");
      if (!isset($host[3])) {
      exec("systemctl restart cine4_api");
    }
      break;
    }
    default: {
      echo $package . " is not a valid package";
      break;
    }
  }
  return "Deployed " . $package;
  }

}
function requestProcessor($request)
{
  switch ($request['type']) {
    case "push":
      return push($request['package'], $request['target'], $request['mach']);
  }
}
//function end
$server = new rabbitMQServer("pushMQ.ini", "testServer");
$server->process_requests('requestProcessor');
exit();
?>
