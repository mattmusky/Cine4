<?php
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQLib.inc');


$client = new rabbitMQClient("rmq/rabbitMQ.ini","testServer");

// intrepret POST MESSAGE

if (!isset($_POST))
{
	$msg = "NO POST MESSAGE SET, POLITELY FUCK OFF";
	echo json_encode($msg);
	exit(0);
}
$postrequest = $_POST;
$response = "unsupported request type, politely FUCK OFF";
switch ($postrequest["type"])
{
	case "auth":
		$response = "login, yeah we can do that";

    $request = array();
    $request['type']="auth";
    $request['username']=$postrequest["username"];
    $request['password']=$postrequest["password"];

    $response = $client->send_request($request);

	break;
}
echo $response;
exit(0);




?>
