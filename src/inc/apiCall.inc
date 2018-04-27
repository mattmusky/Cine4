
<?php
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQLib.inc');
function apiCall($id)
{
  $client          = new rabbitMQClient("apiMQ.ini", gethostname());
  $request         = array();
  $request['type'] = "movieCall";
  $request['id']   = $id;
  $response        = $client->send_request($request);
  return $response;
  //end of data to send
}
function smartCall($g1,$g2)
{
  $client          = new rabbitMQClient("apiMQ.ini", gethostname());
  $request         = array();
  $request['type'] = "smartCall";
  $request['g1']   = $g1;
  $request['g2']   = $g2;
  $response        = $client->send_request($request);
  return $response;
  //end of data to send
}
