
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
  sleep(5);
  $up = ping($host);
  if ($up) {
    if (!$state) {
      echo 'Up';
    exec("systemctl stop cine4_auth cine4_data cine4_log");
      $state = true;
    }
  } else {
    if ($state) {

  exec("systemctl start cine4_auth cine4_data cine4_log");
    echo 'Down';

$state = false;
}
  }
}
?>
