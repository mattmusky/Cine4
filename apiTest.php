<?php
//step1

function getMovieData (movieName) {
$cSession = curl_init(); 
//step2


$url = "https://api.themoviedb.org/3/search/movie?api_key=63c5f394ee102de7ba90c4a6159080c2&query='".$name."'";
$url = str_replace(" ", '%20', $url);
curl_setopt($cSession,CURLOPT_URL, $url);
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

}

$input = $argv[1];
echo $input;
getMovieData(input);

	


?>