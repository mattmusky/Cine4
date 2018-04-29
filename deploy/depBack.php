#!/usr/bin/php
<?php
//rmq include
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQPush.inc');
function push($package, $target, $machine)
{
  $host = preg_split('[-]', gethostname());
  $host = (strtolower($host[1] . $host[2]));
  if ($host == $target . $machine) {
    print "\n"; echo ("Deploying...");

  switch ($package) {
    case ("feweb"): {
      print "\n"; echo ("tar -xf /home/cine/pack/box.tar -C /");
      break;
    }
    case ("fephp"): {
      print "\n"; echo ("tar -xf /home/cine/pack/box.tar -C /");
      break;
    }
    case ("db"): {
      if (!array_key_exists(3,$host)){
      print "\n"; echo ("tar -xf /home/cine/pack/box.tar -C /");
      print "\n"; echo ("mysql -u root -pinfinity cine4 < /home/cine/cine4/config/cine4.sql");
    }
      break;
    }
    case ("bephp"): {
      print "\n"; echo ("tar -xf /home/cine/pack/box.tar -C /");
      if (!$host[3]) {
      print "\n"; echo ("systemctl restart cine4_auth cine4_data cine4_log");
    }
      break;
    }
    case ("apiphp"): {
      print "\n"; echo ("tar -xf /home/cine/pack/box.tar -C /");
      if (!$host[3]) {
      print "\n"; echo ("systemctl restart cine4_api");
    }
      break;
    }
    default: {
      print "\n"; echo $package . " is not a valid package";
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
