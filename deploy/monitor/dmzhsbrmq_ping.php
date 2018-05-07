<?php
$ip = '10.2.2.12';
//PHP script to ping remote server and edit configs to enable HSB
$state = true;
function ping($host)
{
  exec(sprintf('ping -c 1 -W 10 %s', escapeshellarg($host)), $res, $rval);
  return $rval === 0;
}
while (1) {
  sleep(2);
  $up = ping($ip);
  if ($up) {
    if (!$state) {
      echo 'Up';
      exec("mv /home/cine/cine4/src/rmq/apiMQ.ini /home/cine/cine4/src/rmq/apiMQ.fail && mv /home/cine/cine4/src/rmq/apiMQ.bak /home/cine/cine4/src/rmq/apiMQ.ini");
      exec("mv /home/cine/cine4/src/rmq/logMQ.ini /home/cine/cine4/src/rmq/logMQ.fail && mv /home/cine/cine4/src/rmq/logMQ.bak /home/cine/cine4/src/rmq/logMQ.ini");

if (!ping('10.2.2.13')) {
  exec("systemctl restart cine4_api");
}


      $state = true;
    }
  } else {
    if ($state) {


    echo 'Down';
    exec("mv /home/cine/cine4/src/rmq/apiMQ.ini /home/cine/cine4/src/rmq/apiMQ.bak && mv /home/cine/cine4/src/rmq/apiMQ.fail /home/cine/cine4/src/rmq/apiMQ.ini");
    exec("mv /home/cine/cine4/src/rmq/logMQ.ini /home/cine/cine4/src/rmq/logMQ.bak && mv /home/cine/cine4/src/rmq/logMQ.fail /home/cine/cine4/src/rmq/logMQ.ini");

    if (!ping('10.2.2.13')) {
      exec("systemctl restart cine4_api");
    }

$state = false;
}
  }
}

?>
