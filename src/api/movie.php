
<?php
//step1


$cSession = curl_init();
//step2
$name = "cars";

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
//echo $result;

//$data =  json_decode($result,true);

//print_r($data);

echo "here";
echo $result['results'][0];
echo $result['results'][0]['title'];

/*
foreach ($data['results'][0] as $key =>$value) {


	echo "<br>";
	$moviedata = array();
	$moviedata = array("$key"=>"$value");

	echo $moviedata['id'];
	echo $moviedata['title'];
	echo $moviedata['overview'];
					if($key == 'genre_ids'){

					$genres = array();
				foreach ($data['results'][0]['genre_ids'] as $key =>$value) {
						//echo "$value";
						$genres[] = $value;

				}
				//print_r($genres);
					echo "genre_ids: ";echo implode(', ', $genres);

					}

	echo $moviedata['release_date'];
	echo $moviedata['poster_path'];
	echo $moviedata['backdrop_path'];

}
*/
?>
