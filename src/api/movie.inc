
<?php
//movie details request
function movieCall($id)
{
  $cSession = curl_init();
  $url      = "https://api.themoviedb.org/3/movie/" . $id . "?api_key=63c5f394ee102de7ba90c4a6159080c2&language=en-US";
  //echo $url;
  $url = str_replace(" ", '%20', $url);
  curl_setopt($cSession, CURLOPT_URL, $url);
  curl_setopt($cSession, CURLOPT_RETURNTRANSFER, true);
  curl_setopt($cSession, CURLOPT_HEADER, false);
  $result = curl_exec($cSession);
  if(!$result)
  {
      errorSend("Curl Error",3,$url ." | ". curl_error($cSession));
  }
  curl_close($cSession);
  return $result;
}
?>
