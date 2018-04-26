<?php
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQLib.inc');
session_start();
$client = new rabbitMQClient("authMQ.ini", "testServer");
// intrepret POST MESSAGE
if (!isset($_POST)) {
  $msg = "NO POST MESSAGE SET";
  echo json_encode($msg);
  exit(0);
}
$postrequest = $_POST;
$response    = "unsupported request type";
switch ($postrequest["type"]) {
  case "login": #user login request
    $request           = array();
    $request['type']   = $postrequest["type"];
    $request['user']   = $postrequest["user"];
    $request['pass']   = crypt($postrequest["pass"], 'dogtown'); //hash and salt
    $response          = $client->send_request($request);
    $returnarr         = json_decode($response, true);
    $_SESSION["first"] = $returnarr['first'];
    $_SESSION["last"]  = $returnarr['last'];
    $_SESSION["email"] = $returnarr['email'];
    $_SESSION["user"]  = $returnarr['user'];
    $_SESSION["id"]    = $returnarr['id'];
    $_SESSION["cred"]  = "user";
    $response          = $returnarr['message'];
    break;
  case "reg": #user registration request
    $request          = array();
    $request['type']  = $postrequest["type"];
    $request['first'] = $postrequest["first"];
    $request['last']  = $postrequest["last"];
    $request['email'] = $postrequest["email"];
    $request['user']  = $postrequest["user"];
    $request['pass']  = crypt($postrequest["pass"], 'dogtown'); //hash and salt
    $response         = $client->send_request($request);
    break;
}
echo $response;
exit(0);
?>
