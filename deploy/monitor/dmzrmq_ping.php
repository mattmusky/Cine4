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
    exec("mv /home/cine/cine4/src/rmq/apiMQ.ini /home/cine/cine4/src/rmq/apiMQ.bak && mv /home/cine/cine4/src/rmq/apiMQ.fail /home/cine/cine4/src/rmq/apiMQ.ini");
    exec("mv /home/cine/cine4/src/rmq/logMQ.ini /home/cine/cine4/src/rmq/logMQ.bak && mv /home/cine/cine4/src/rmq/logMQ.fail /home/cine/cine4/src/rmq/logMQ.ini");
    exit();
  }
}
