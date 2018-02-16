<?php

$host = 'localhost';
$user = 'root';
$pass = '';
$db = 'cine4';

//create connection
$con = mysqli_connect($host,$user,$pass,$db);

if($con){
	echo 'connected successfully to Cine4 database';

}


$sql = "INSERT INTO user (StdID, Fname, Lname, Email, Username, Password) VALUES ('10', 'Jaune', 'Ross', 'soma@gmail.com', 'Jross456', 'carthage')";

$query = mysqli_query($con, $sql);
if($query)
	echo 'data inserted successfully';

?>


