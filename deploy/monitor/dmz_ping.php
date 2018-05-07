
<?php
$host = '10.2.2.13';
//PHP script to ping remote server and edit configs to enable HSB
$state = true;
function ping($host)
{
  exec(sprintf('ping -c 1 -W 10 %s', escapeshellarg($host)), $res, $rval);
  return $rval === 0;
}
while (1) {
  sleep(5);
  $up = ping($host);
  if ($up) {
    if (!$state) {
      echo 'Up';
    exec("systemctl stop cine4_api");
      $state = true;
    }
  } else {
    if ($state) {

  exec("systemctl start cine4_api");
    echo 'Down';

$state = false;
}
  }
}
?>
