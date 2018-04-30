<?php
$host = '10.2.2.12';
//PHP script to ping remote server and edit configs to enable HSB
function ping($host)
{
  exec(sprintf('ping -c 1 -W 10 %s', escapeshellarg($host)), $res, $rval);
  return $rval === 0;
}
while (1) {
  sleep(10);
  $up = ping($host);
  if ($up) {
    //echo 'UP';
  } else {
    echo 'Down';
    exec("mv /home/cine/cine4/public/php/rmq/apiMQ.ini /home/cine/cine4/public/php/rmq/apiMQ.bak && mv /home/cine/cine4/public/php/rmq/apiMQ.fail /home/cine/cine4/public/php/rmq/apiMQ.ini");
    exec("mv /home/cine/cine4/public/php/rmq/dataMQ.ini /home/cine/cine4/public/php/rmq/dataMQ.bak && mv /home/cine/cine4/public/php/rmq/dataMQ.fail /home/cine/cine4/public/php/rmq/dataMQ.ini");
    exec("mv /home/cine/cine4/public/php/rmq/authMQ.ini /home/cine/cine4/public/php/rmq/authMQ.bak && mv /home/cine/cine4/public/php/rmq/authMQ.fail /home/cine/cine4/public/php/rmq/authMQ.ini");
    exit();
  }
}
