<?php
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQLib.inc');


$client = new rabbitMQClient("rmq/dataMQ.ini","testServer");

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
	case "friendList":
	$request = array();
	$request['type']=$postrequest["type"];
	$request['id']=$_SESSION["id"];
  $response = $client->send_request($request);

	break;

}
echo $response;
exit(0);




?>
