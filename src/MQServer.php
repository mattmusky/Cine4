#!/usr/bin/php
<?php
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQLib.inc');


function logIt($src,$msg) {


  $log_file = '../resources/logs/log.txt';
  $handle = fopen($log_file, 'a') or die('Cannot open file:  '.$log_file);
  $msgout = date("m/d/Y h:i:s A") . " - " . $src . " - " . $msg . PHP_EOL;
  fwrite($handle, $msgout);

}

function auth($user,$pass) {
/*
      $db = mysqli_connect(DB_SERVER,DB_USERNAME,DB_PASSWORD,DB_DATABASE);
        $user = mysqli_real_escape_string($db,$user);
        $pass = mysqli_real_escape_string($db,$pass);

        $sql = "SELECT id FROM admin WHERE username = '$user' and passcode = '$pass'";
        $result = mysqli_query($db,$sql);
        $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
        $active = $row['active'];

        $count = mysqli_num_rows($result);


        if($count == 1) {

           return true;
        }
        else {
           return false;
         }
*/

if ($user == "matt"){
  return true;
}
else {
  return false;
}



}

function requestProcessor($request)
{
  switch ($request['type'])
    {
      case "error":
        echo "-Error Recieved-".PHP_EOL;
        echo $request['source'].PHP_EOL;
        logIt($request['source'],$request['error']);
        break;
      case "auth":
        echo "-Login Request-".PHP_EOL;
        echo $request['username'].PHP_EOL;
        return auth($request['username'],$request['password']);
        break;
      }







}




//function end

$server = new rabbitMQServer("rmq/rabbitMQ.ini","testServer");

$server->process_requests('requestProcessor');
exit();
?>
