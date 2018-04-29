<?php
$host = '10.2.2.13';
//PHP script to ping remote server and edit configs to enable HSB
function ping($host)
{
  exec(sprintf('ping -c 1 -W 10 %s', escapeshellarg($host)), $res, $rval);
  return $rval === 0;
}
while (1) {
  $up = ping($host);
  if ($up) {
    //echo 'UP';
  } else {
    echo 'Down';
    print "\n"; echo ("systemctl start cine4_api");
    exit();
  }
}
