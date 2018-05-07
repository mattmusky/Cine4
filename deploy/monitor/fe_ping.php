<?php
$host = '10.2.2.12';
//PHP script to ping remote server and edit configs to enable HSB
$state = true;
function ping($host)
{
  exec(sprintf('ping -c 1 -W 10 %s', escapeshellarg($host)), $res, $rval);
  return $rval === 0;
}
while (1) {
  sleep(10);
  $up = ping($host);
  if ($up) {
    if (!$state) {
      echo 'Up';
      exec("mv /home/cine/cine4/public/php/rmq/apiMQ.ini /home/cine/cine4/public/php/rmq/apiMQ.fail && mv /home/cine/cine4/public/php/rmq/apiMQ.bak /home/cine/cine4/public/php/rmq/apiMQ.ini");
      exec("mv /home/cine/cine4/public/php/rmq/dataMQ.ini /home/cine/cine4/public/php/rmq/dataMQ.fail && mv /home/cine/cine4/public/php/rmq/dataMQ.bak /home/cine/cine4/public/php/rmq/dataMQ.ini");
      exec("mv /home/cine/cine4/public/php/rmq/authMQ.ini /home/cine/cine4/public/php/rmq/authMQ.fail && mv /home/cine/cine4/public/php/rmq/authMQ.bak /home/cine/cine4/public/php/rmq/authMQ.ini");

      $state = true;
    }
  } else {
    if ($state) {


    echo 'Down';
    exec("mv /home/cine/cine4/public/php/rmq/apiMQ.ini /home/cine/cine4/public/php/rmq/apiMQ.bak && mv /home/cine/cine4/public/php/rmq/apiMQ.fail /home/cine/cine4/public/php/rmq/apiMQ.ini");
    exec("mv /home/cine/cine4/public/php/rmq/dataMQ.ini /home/cine/cine4/public/php/rmq/dataMQ.bak && mv /home/cine/cine4/public/php/rmq/dataMQ.fail /home/cine/cine4/public/php/rmq/dataMQ.ini");
    exec("mv /home/cine/cine4/public/php/rmq/authMQ.ini /home/cine/cine4/public/php/rmq/authMQ.bak && mv /home/cine/cine4/public/php/rmq/authMQ.fail /home/cine/cine4/public/php/rmq/authMQ.ini");

$state = false;
}
  }
}
?>
