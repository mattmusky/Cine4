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
	}c
} */
	//header("refresh:2; url=index.html"}

function adduser($Fname, $Lname, $Email, $Username, $Password) {
//$con = createconnection();

$host = 'localhost';
	$user = 'root';
	$pass = '';
	$db = 'cine4';

	//create connection
	$con = mysqli_connect($host,$user,$pass,$db);

	if(!$con){
		echo "Not connected to server \n";
	}
else {
	echo "connected to server \n";
}



$eusername = mysqli_real_escape_string( $con, $Username);
$fusername = str_replace(' ', '', $eusername);
echo "test";
echo "SELECT * FROM user WHERE Username =", $fusername;
	$sql=mysqli_query($con,"SELECT * FROM user WHERE Username = '$fusername'");

	if(mysqli_num_rows($sql)>=1) {
    	echo "name already exists";
	}
	else {
		//$hashpassword = password_hash('$Password', PASSWORD_BCRYPT);
   		$insertsql = "INSERT INTO user (Fname, Lname, Email, Username, Password) VALUES ( '". $Fname . "','" . $Lname . "','" . $Email . "','" . $fusername . "','" . $Password. "')";
        echo $insertsql;
   		if ($con->query($insertsql)===TRUE) {
   			echo "New record inserted \n";
   		}
   		else {
   			echo "Error: " . $insertsql . "\n" . $con->error;
   		}
   		echo "useradded";
    }
}

function checkPassword($username, $Password){
	$host = 'localhost';
	$user = 'root';
	$pass = '';
	$db = 'cine4';

	//create connection
	$con = mysqli_connect($host,$user,$pass,$db);

	if(!$con){
		echo "Not connected to server \n";
	}
else {
	echo "connected to server \n";
}



$eusername = mysqli_real_escape_string( $con, $username);
$fusername = str_replace(' ', '', $eusername);
//echo "test";

//echo "SELECT Password FROM user WHERE Username ='". $fusername ."'";

$sql=mysqli_query($con,"SELECT Password FROM user WHERE Username ='". $fusername ."'");

while($row = $sql->fetch_assoc()){
	$dbpass= $row['Password'];
	//echo $dbpass;
	//echo $Password;
	//$p=password_verify($Password,$dbpass);
	if($dbpass===$Password){
 		echo 'matches';
	
	}
	else
	{
		echo 'failed';
	}
	//echo $b;
}
	

}

$Fname = "Jim"; $Lname = "She"; $Email = "js456@gmail.com"; $User = "jackkdd"; $Pass = "12345";
//adduser($Fname, $Lname, $Email, $User, $Pass);

checkPassword('jackkdd','12345')
?>