
<?php
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQLib.inc');

function errorSend($src,$err)
{



$client = new rabbitMQClient("rmq/rabbitMQ.ini","testServer");

// start of data to send

//should include: server, task, file, line, warn level, message!
//$err = "test err";
$request = array();
$request['type']="error";
$request['source'] = $src;
$request['error'] = $err;

$response = $client->send_request($request);

//end of data to send

//$response = $client->publish($request);
/*
echo "client received response: ".PHP_EOL;
print_r($response);
echo "\n\n";

echo $argv[0]." END".PHP_EOL;
*/
}
