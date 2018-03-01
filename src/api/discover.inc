
<?php


function discoverCall($sort, $genre)
{

$cSession = curl_init();

$name = "cars";

$url = "https://api.themoviedb.org/3/discover/movie?api_key=63c5f394ee102de7ba90c4a6159080c2&language=en-US&sort_by=".$sort."&include_adult=false&include_video=false&page=1&with_genres=".$genre;

$url = str_replace(" ", '%20', $url);
curl_setopt($cSession,CURLOPT_URL, $url);
curl_setopt($cSession,CURLOPT_RETURNTRANSFER,true);
curl_setopt($cSession,CURLOPT_HEADER, false);

$result=curl_exec($cSession);

curl_close($cSession);


return $data;
}

?>
