<?php
function friendList($id)
{
    $con = createconnection();

$returnarr = array();


    $query = "SELECT u.uid, FIRST, LAST FROM usersfriendusers uj INNER JOIN users u ON u.uid = uj.frienduid WHERE uj.useruid = 101";

    $sql = mysqli_query($con, $query);

    $data = array();

while ($row = mysql_fetch_assoc($sql)) { // row will be an array with Number and checked as items
    $data[] = $row;
}




print_r($data);

return json_encode($returnarr);

}

?>
