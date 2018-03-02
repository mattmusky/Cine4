
<?php
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQLib.inc');

function apiCall($id)
{



			$client = new rabbitMQClient("rmq/apiMQ.ini","testServer");



			$request = array();

			$request['type']="movieCall";


			$request['id'] = $id;




			$response = $client->send_request($request);
      return $response;
			//end of data to send


}
