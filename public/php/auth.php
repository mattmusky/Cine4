<?php
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQLib.inc');


$client = new rabbitMQClient("rmq/rabbitMQ.ini","testServer");

// intrepret POST MESSAGE

if (!isset($_POST))
{
	$msg = "NO POST MESSAGE SET";
	echo json_encode($msg);
	exit(0);
}
$postrequest = $_POST;
$response = "unsupported request type";


switch ($postrequest["type"])
{
	case "login":
    $request = array();
    $request['type']=$postrequest["type"];
    $request['user']=$postrequest["user"];
    $request['pass']=$postrequest["pass"];
    $response = $client->send_request($request);
		
	$returnarr = json_decode($response, true);
	$response = $returnarr['message'];
		
	break;
	case "reg":
	$request = array();
	$request['type']=$postrequest["type"];
	$request['first']=$postrequest["first"];
	$request['last']=$postrequest["last"];
	$request['email']=$postrequest["email"];
	$request['user']=$postrequest["user"];
	$request['pass']=$postrequest["pass"];
	$response = $client->send_request($request);
	

	break;
}
echo $response;
exit(0);




?>
