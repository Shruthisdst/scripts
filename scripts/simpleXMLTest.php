<?php

	include "connect.php";

	libxml_use_internal_errors(true);

	$db = mysql_connect($host, $user, $password) or die("Not connected to database");
	$rs = mysql_select_db($database, $db) or die("No Database");
	mysql_query("set names utf8");



	$datesArray=array(
		'Manuscript Received'=>'M',
		'Revised'=>'R',
		'Accepted'=>'A',
		'Early Publication'=>'E',
		'Unedited version published online' => 'U'	
	);

	$myXMLData ="/var/www/html/ias/public/Volumes/boms/023/01/0001-0004.xml"; 

	$xml = simplexml_load_file($myXMLData);
	if ($xml === false) 
	{
		echo "Failed loading XML: ";
		foreach(libxml_get_errors() as $error) 
		{
			echo "<br>", $error->message;
		}
	} 
	else 
	{
	#    print_r($xml);

	$journal =  $xml->front->{'journal-meta'}->{'journal-id'};
	$articleId =  $xml->front->{'article-meta'}->{'article-id'};
	$volume =  $xml->front->{'article-meta'}->volume;
	$issue =  $xml->front->{'article-meta'}->issue;
	$month =  $xml->front->{'article-meta'}->{'pub-date'}->month;
	$year =  $xml->front->{'article-meta'}->{'pub-date'}->year;
	$info =  $xml->front->{'article-meta'}->{'issue-title'};
	$hasSup =  $xml->front->{'article-meta'}->{'supplementary-material'};
	$hasSup = ($hasSup == "")? 0 : 1;
	$title =  $xml->front->{'article-meta'}->{'title-group'}->{'article-title'};
	$feature =  $xml->front->{'article-meta'}->{'article-categories'}->{'subj-group'}->{'subject'};
	$page =  $xml->front->{'article-meta'}->fpage . "-" . $xml->front->{'article-meta'}->lpage;
	$abstract =  $xml->front->{'article-meta'}->abstract->asXML();
	$abstract = preg_replace("/<abstract>|<\/abstract>|\t*/","",$abstract);
	$history = $xml->front->{'article-meta'}->history;

	$dates = array();

	if($history != "")
	{
		
		foreach($xml->front->{'article-meta'}->history->date as $date)
		{
			$dateKey = $datesArray[(string) $date['date-type']];
			$dateValue = (string) $date['iso-8601-date'];
			$dates[$dateKey]=$dateValue;
		}

		$datesJson = json_encode($dates);
	}
	else
	{
		$datesJson = "[]";
		//~ echo $dates . "\n";
	}

	$affiliations = array();

	foreach($xml->front->{'article-meta'}->{'aff'} as $affiliation)
	{
		$affKey = $affiliation['id'];
		$affiliations[(string) $affKey] = (string) $affiliation;
	}


	$authors = array();

	$count = 0;

	foreach($xml->front->{'article-meta'}->{'contrib-group'}->contrib as $author)
	{
		#echo $author->name->{'given-names'} . "\n";
		
		$tempAuthor = array();
		$authorName = (string) $author->name->{'given-names'};
		$tempAuthor['name'] = array("full" => $authorName, "first" => "", "last" => "");

		$tempArray = array();

		foreach($author->xref as $aff)
		{	
			$affKey = (string) $aff['rid'];
			$affValue = (string) $affiliations[$affKey];
			array_push($tempArray, $affValue); 
			//echo $affKey . "\n"; 
		}

		$tempAuthor['affiliation'] = (object)$tempArray;
		$tempAuthor['email']=$author->email; 
		array_push($authors,$tempAuthor);
	}

	$authorsJson = json_encode($authors,JSON_UNESCAPED_UNICODE);

	$keyWords = "";

	foreach($xml->front->{'article-meta'}->{'kwd-group'}->kwd as $keyWord)
	{
		$keyWords = $keyWords . ";" . $keyWord;
	}

	$keyWords = preg_replace("/^;/","",$keyWords);
	
	$title = addslashes($title); 
	$feature = addslashes($feature); 
	$abstract = addslashes($abstract); 
	$keyWords = addslashes($keyWords); 

	$query = "INSERT INTO article VALUES('$journal', '$volume', '$issue', '$month', '$year', '$info', '$hasSup', '$title', '$feature', '$page', '$abstract','$keyWords','$authorsJson','$datesJson','$articleId')";
	mysql_query($query) or die("Error.......\n" . mysql_error());


	//For debugging
	//~ echo "Journal: " . $journal . "<br />\n"; 
	//~ echo "Article ID: " . $articleId . "<br />\n"; 
	//~ echo "Volume: " . $volume . "<br />\n"; 
	//~ echo "Issue: " . $issue . "<br />\n"; 
	//~ echo "Month: " . $month . "<br />\n"; 
	//~ echo "Year: " . $year . "<br />\n"; 
	//~ echo "Info: " . $info . "<br />\n"; 
	//~ echo "Hassup: " . $hasSup . "<br />\n"; 
	//~ echo "Title: " . $title . "<br />\n"; 
	//~ echo "Feature: " . $feature . "<br />\n"; 
	//~ echo "Page: " . $page . "<br />\n"; 
	//~ echo "Abstract: " . $abstract . "<br />\n"; 
	//~ echo "Keywords: " . $keyWords . "<br />\n"; 
	//~ echo "Dates :" . $datesJson . "\n";
	//~ echo "Authors :" . $authorsJson . "\n";
	}
?>
