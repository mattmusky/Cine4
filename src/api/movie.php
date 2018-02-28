
<?php



$cSession = curl_init();

$name = "cars";

$url = "https://api.themoviedb.org/3/search/movie?api_key=63c5f394ee102de7ba90c4a6159080c2&query='".$name."'";
$url = str_replace(" ", '%20', $url);
curl_setopt($cSession,CURLOPT_URL, $url);
curl_setopt($cSession,CURLOPT_RETURNTRANSFER,true);
curl_setopt($cSession,CURLOPT_HEADER, false);

$result=curl_exec($cSession);

curl_close($cSession);


$data =  json_decode($result,true);

print $data['results'][0]['id'].PHP_EOL;
print $data['results'][0]['title'].PHP_EOL;
print $data['results'][0]['overview'].PHP_EOL;
print $data['results'][0]['release_date'].PHP_EOL;
print $data['results'][0]['poster_path'].PHP_EOL;
print $data['results'][0]['backdrop_path'].PHP_EOL;

foreach ($data['results'][0]['genre_ids'] as $value) {
print $value;
}

//INSERT INTO `Movies` (`MID`, `Title`, `Overview`, `Date`, `Poster`, `Backdrop`, `DVDLink`, `TicketLink`) VALUES ('424689', 'Cars 3', 'A car salesman', '2009-01-26', '/4hw5PghU2nOWNAr4CskRVM9ehrA.jpg', '/4hw5PghU2nOWNAr4CskRVM9ehrA.jpg', 'blank', 'blank');

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
