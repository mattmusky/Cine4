<?php

function createconnection()
{
    $host = 'localhost';
    $user = 'root';
    $pass = 'infinity';
    $db   = 'cine4';

    //create connection
    $con = mysqli_connect($host, $user, $pass, $db);

    if (!$con) {
        echo 'Not connected to server';
    }
    return $con;
}



function adduser($Fname, $Lname, $Email, $Username, $Password)
{
    $con = createconnection();





    $eusername = mysqli_real_escape_string($con, $Username);
    $fusername = str_replace(' ', '', $eusername);


    $sql = mysqli_query($con, "SELECT * FROM user WHERE Username = '$fusername'");

    if (mysqli_num_rows($sql) >= 1) {
        echo "name already exists";
        return "name_exists";
    } else {

        $insertsql = "INSERT INTO user (Fname, Lname, Email, Username, Password) VALUES ( '" . $Fname . "','" . $Lname . "','" . $Email . "','" . $fusername . "','" . $Password . "')";

        if ($con->query($insertsql) === TRUE) {
            echo "New record inserted \n";
        } else {
            echo "Error: " . $insertsql . "\n" . $con->error;
        }
        echo "useradded";
        return "user_added";
    }
}

function checkPassword($username, $Password)
{
    $con = createconnection();

$returnarr = array();
				
				



    $eusername = mysqli_real_escape_string($con, $username);
    $fusername = str_replace(' ', '', $eusername);


    $sql = mysqli_query($con, "SELECT Password FROM user WHERE Username ='" . $fusername . "'");

    if ($row = $sql->fetch_assoc()) {

        $dbpass = $row['Password'];

        if ($dbpass === $Password) {
            echo "matches \n";
            $returnarr['message']= "pass_corr";
						$returnarr['first']=$row['Password'];

        } else {
		
			$returnarr['message']= "pass_incorr";
		}
				
    }
		else {
		
			$returnarr['message']= "pass_incorr";
		}
		

return json_encode($returnarr);
}


//adduser($Fname, $Lname, $Email, $User, $Pass);
//checkPassword('user', 'pass');
?>
