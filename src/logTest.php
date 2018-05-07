#!/usr/bin/php
<?php
//rmq include
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQLib.inc');
include ("inc/logSend.inc");
errorSend("task name",1,"test error message");
exit();
?>
