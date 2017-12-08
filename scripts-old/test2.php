<?php
$data = "senaĪśvara Īśvara Īśvaradatta abhāva-yoga.";
$match = "Īśvara";


$words = preg_split('/ /',$data);

for($i=0;$i<sizeof($words);$i++)
{
	if(($words[$i] == $match))
	{
		//~ $data = $words[$i] . " ";
		
		$words[$i] = preg_replace('/' . $match . '/', '<span class="linkword">' . $match . '</span>', $words[$i]);
		echo $words[$i] . " ";
	}
	else
	{
		echo $words[$i] . " ";
	}
	
}

echo "\n";

?>
