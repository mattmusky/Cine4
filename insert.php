<?php

function createconnection(){
	$host = 'localhost';
	$user = 'root';
	$pass = '';
	$db = 'cine4';

	//create connection
	$con = mysqli_connect($host,$user,$pass,$db);

	if(!$con){
		echo 'Not connected to server';
	}
	return $con;
}

/*	if(!mysqli_select_db($con, 'cine4')){
		echo 'Database Not Selected';
	} */


/*
function createuser(Fname, Lname, Email, User, Pass) {
createconnection();
	//$sql = "INSERT INTO user (Fname, Lname, Email, Username, Password) VALUES ('$Fname', '$Lname', '$Email', '$Username', '$Pass')";
	$sql = "INSERT INTO user (Fname, Lname, Email, Username, Password) VALUES ('John', 'Edward', 'jaspercat@gmail.com', 'jesterkev', '12345')";

	if (!mysqli_query($con, $sql)) {
		echo 'Not Inserted';
	}
	else {
		echo 'Inserted';
	}
} */
	//header("refresh:2; url=index.html"}

function adduser($Fname, $Lname, $Email, $Username, $Password) {
//$con = createconnection();

$host = 'localhost';
	$user = 'root';
	$pass = 'infinity';
	$db = 'cine4';

	//create connection
	$con = mysqli_connect($host,$user,$pass,$db);

	if(!$con){
		echo 'Not connected to server';
	}
else {
	echo 'connected to server';
}



$eusername = mysqli_real_escape_string( $con, $Username);
$fusername = str_replace(' ', '', $eusername);
echo "test";
echo "SELECT * FROM user WHERE Username =", $fusername;

//	$sql=mysqli_query($con,"SELECT * FROM users WHERE Username = '$fusername'");
	$sql=mysqli_query($con,"SELECT * FROM user");
	if(mysqli_num_rows($sql)>=1) {
    	echo "name already exists";
	}
	else {
   		$sql = "INSERT INTO user (ID, Fname, Lname, Email, Username, Password) VALUES ('2', '$Fname' '$Lname', '$Email', '$fusername', '$Password')";
    }
}


$Fname = "Jimmy"; $Lname = "She"; $Email = "js456@gmail.com"; $User = "jvc78"; $Pass = "12345";
adduser($Fname, $Lname, $Email, $User, $Pass);

?>