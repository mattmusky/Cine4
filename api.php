<?php
//step1
$cSession = curl_init(); 
//step2
curl_setopt($cSession,CURLOPT_URL,"http://api.onemusicapi.com/20151208/release?title=Doolittle&artist=Pixies&user_key=40dc5014381ca294efbf2527add06ca0&inc=images&maxResultCount=1");
curl_setopt($cSession,CURLOPT_RETURNTRANSFER,true);
curl_setopt($cSession,CURLOPT_HEADER, false); 
//step3
$result=curl_exec($cSession);
//step4
curl_close($cSession);
//step5
echo $result;

//$data =  json_decode($result,true);

//print_r($data)

?>

<html>
<form action="http://api.onemusicapi.com/20151208/release?title=&artist=&inc=images&maxResultCount=1">
 Title:<br>
  <input type="text" name="title" value="Doolittle">
  <br>
 Artist:<br>
  <input type="text" name="artist" value="Pixies">
  <br>
  
  <input type="hidden" name="user_key" value="3d50880db21bd2e1a033fc309cf34bd3">
  <br><br>
  
  <input type="submit" value="Submit">
</form>

</html>