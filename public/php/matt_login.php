<?php
session_start();
if (!isset($_POST))
{
	$msg = "NO POST MESSAGE SET, POLITELY FUCK OFF";
	echo json_encode($msg);
	exit(0);
}
$postrequest = $_POST;
$response = "0";
switch ($postrequest["type"])
{
	case "auth":

    if ($postrequest["user"] == "one") {
      $_SESSION["user"] = "one";
      $_SESSION["first"] = "Matt";
      $_SESSION["last"] = "Muscarella";
      $response = "1";
    }
    if ($postrequest["user"] == "two") {
      $response = "2";
    }

  case "reg":

  if ($postrequest["user"] == "three") {
    $response = "3";
  }

	break;
}
echo $response;
exit(0);




?>
