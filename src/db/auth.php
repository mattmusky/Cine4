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
        //errorSend("DB Connect",3,"Cannot connect to server");
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
            //errorSend("User Insert",1,"User added: " . $fusername);
            echo "useradded";
            return "user_added";
        } else {

            //errorSend("User Insert",3,"Error: " . $insertsql . "\n" . $con->error);
        }

    }
}

function checkPassword($username, $Password)
{
    $con = createconnection();

$returnarr = array();





    $eusername = mysqli_real_escape_string($con, $username);
    $fusername = str_replace(' ', '', $eusername);


    $sql = mysqli_query($con, "SELECT * FROM user WHERE Username ='" . $fusername . "'");

    if ($row = $sql->fetch_assoc()) {

        $dbpass = $row['Password'];

        if ($dbpass === $Password) {
            echo "matches \n";
            $returnarr['message']= "pass_corr";
						$returnarr['first']=$row['Fname'];
            $returnarr['last']=$row['Lname'];
            $returnarr['email']=$row['Email'];
            $returnarr['user']=$row['Username'];

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
