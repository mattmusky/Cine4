<?php
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQLib.inc');


$client = new rabbitMQClient("rmq/apiMQ.ini","testServer");

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
	case "discover":
    
    $response = $client->send_request($postrequest);



	break;

}
echo $response;
exit(0);




?>
