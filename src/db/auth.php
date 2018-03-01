<?php


require_once('conn.inc');


function adduser($Fname, $Lname, $Email, $Username, $Password)
{
    $con = createconnection();





    $eusername = mysqli_real_escape_string($con, $Username);
    $fusername = str_replace(' ', '', $eusername);

    $id = rand(10000,99999);
    $sql = mysqli_query($con, "SELECT * FROM users WHERE User = '$fusername'");

    if (mysqli_num_rows($sql) >= 1) {
        echo "name already exists";
        return "name_exists";
    } else {

        $insertsql = "INSERT INTO users (UID, First, Last, Email, User, Pass, FriendID) VALUES ( '" . $id . "','" . $Fname . "','" . $Lname . "','" . $Email . "','" . $fusername . "','" . $Password . "','" . $id . "')";

        if ($con->query($insertsql) === TRUE) {
            errorSend("User Insert",1,"User added: " . $fusername);
            echo "useradded";
            return "user_added";
        } else {

            errorSend("User Insert",3,"Error: " . $insertsql . "\n" . $con->error);
        }

    }
}

function checkPassword($username, $Password)
{
    $con = createconnection();

$returnarr = array();





    $eusername = mysqli_real_escape_string($con, $username);
    $fusername = str_replace(' ', '', $eusername);


    $sql = mysqli_query($con, "SELECT * FROM users WHERE User ='" . $fusername . "'");

    if ($row = $sql->fetch_assoc()) {

        $dbpass = $row['Pass'];

        if ($dbpass === $Password) {
            echo "matches \n";
            $returnarr['message']= "pass_corr";
						$returnarr['first']=$row['First'];
            $returnarr['last']=$row['Last'];
            $returnarr['email']=$row['Email'];
            $returnarr['user']=$row['User'];
            $returnarr['id']=$row['UID'];

        } else {

			$returnarr['message']= "pass_incorr";
			errorSend("Password Incorrect",1,"User: " . $fusername);
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
