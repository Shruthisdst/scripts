<?php

$host = $argv[1];
$database = $argv[2];
$user = $argv[3];
$password = $argv[4];
$jcode = $argv[5];

include "vars.php";

$db = mysql_connect($host, $user, $password) or die("Not connected to database");
$rs = mysql_select_db($database, $db) or die("No Database");
mysql_query("set names utf8mb4");

// where volume='029' and issue='04' and page='0399-0407'
$result = mysql_query("select * from article");

while($ref = mysql_fetch_array($result))
{

	$journal = $ref['journal'];
	$id = $ref['id'];
	$volume = $ref['volume'];
	$issue = $ref['issue'];
	$month = $ref['month'];
	$year = $ref['year'];
	$info = $ref['info'];
	$hasSup = $ref['hassup'];
	$title = $ref['title'];
	$feature = $ref['feature'];
	$page = $ref['page'];
	$abstract = $ref['abstract'];
	$keywords = $ref['keywords'];
	$authors = $ref['authors'];	
	$dates = $ref['dates'];	


	$fileName = $volumesPath . "/" . $journal . "/" . $volume . "/" . $issue . "/" . $page . ".xml"; 
	$folderName = $volumesPath . "/" . $journal . "/" . $volume . "/" . $issue . "/" . $page;

	// echo $fileName . "\n";
	// echo $folderName . "\n";

	// print $id . "\n";
	$XML = fopen($fileName, "w") or die("Unable to open file! $fileName");
	fwrite($XML,$preamble);

	//printing journal meta data -> specific to journal
	fwrite($XML,$jmetaData[$jcode]);
	fwrite($XML, "\n");	

	//printing Article meta data -> specific to Article
	fwrite($XML,"\t\t<article-meta>\n");
	fwrite($XML,"\t\t\t<article-id pub-id-type=\"ias\">" . $id . "</article-id>\n");

	//Article category -> we may have to change this part later
	if($feature != "")
	{
		$feature = replaceStrings($feature);
		fwrite($XML,"\t\t\t<article-categories>\n");
		fwrite($XML,"\t\t\t\t<series-title>". $feature ."</series-title>\n");
		fwrite($XML,"\t\t\t</article-categories>\n");
	}
	else
	{
		fwrite($XML,"\t\t\t<article-categories />\n");		
	}

	//Article title
	$title = replaceStrings($title);

	fwrite($XML,"\t\t\t<title-group>\n");
	fwrite($XML,"\t\t\t\t<article-title>". $title ."</article-title>\n");
	fwrite($XML,"\t\t\t</title-group>\n");


	#printing Article Authors
	$decodeAuthors = json_decode($authors,true);
	#echo sizeof($decodeAuthors) . "\n";	

	if(sizeof($decodeAuthors) > 0)
	{
			
		$allAffiliations = array();
		$count = 1;	

		fwrite($XML,"\t\t\t<contrib-group>\n");

		foreach ($decodeAuthors as $Author) 
		{
			// echo $Author["name"]["last"] . "\n";
			$authorLastName = $Author["name"]["last"];
			$authorFirstName = $Author["name"]["first"];
			$authorFullName = $Author["name"]["full"];

			$authorLastName = replaceStrings($authorLastName);
			$authorFirstName = replaceStrings($authorFirstName);
			$authorFullName = replaceStrings($authorFullName);


			fwrite($XML,"\t\t\t\t<contrib contrib-type=\"author\">\n");
			fwrite($XML,"\t\t\t\t\t<name>\n");
			fwrite($XML,"\t\t\t\t\t\t<surname>" . $authorLastName . "</surname>\n");
			fwrite($XML,"\t\t\t\t\t\t<given-names>" . $authorFirstName . "</given-names>\n");
			fwrite($XML,"\t\t\t\t\t</name>\n");
			fwrite($XML,"\t\t\t\t\t<string-name>" . $authorFullName . "</string-name>\n");
			
			if(sizeof($Author["email"]))
			{
				for($i=0;$i<sizeof($Author["email"]);$i++)	
				{
					fwrite($XML,"\t\t\t\t\t<email>" . $Author["email"][$i] . "</email>\n");
				}
			}
			else
			{
				fwrite($XML,"\t\t\t\t\t<email />\n");
			}

			for($i=0;$i<sizeof($Author["affiliation"]);$i++)
			{
				// echo $Author["affiliation"][$i] . "\n";
				$keyString = array_search($Author["affiliation"][$i], $allAffiliations);
				if(!($keyString))
				{
					//echo "H\n";
					$keyString = "aff-" . $count;
					//echo $keyString . "\n";
					$allAffiliations[$keyString] = $Author["affiliation"][$i]; 
					$count = $count + 1;
					//echo $count . "\n";
				}
				fwrite($XML,"\t\t\t\t\t<xref ref-type=\"aff\" rid=\"". $keyString ."\"/>\n");
			}

			fwrite($XML,"\t\t\t\t</contrib>\n");
		}

		foreach($allAffiliations as $key=>$value) 
		{
			//echo $key  . "=>" . $value . "\n";
			$value = replaceStrings($value);
			fwrite($XML,"\t\t\t\t<aff id=\"". $key ."\">". $value . "</aff>\n");	
		}
		fwrite($XML,"\t\t\t</contrib-group>\n");
	}
	else
	{
		fwrite($XML,"\t\t\t<contrib-group>\n");
		fwrite($XML,"\t\t\t\t<contrib />\n");
		fwrite($XML,"\t\t\t</contrib-group>\n");
	}


	//print publication date -> date of publication of this journal
	//No data is available for day.
	fwrite($XML,"\t\t\t<pub-date date-type=\"published\">\n");
	fwrite($XML,"\t\t\t\t<string-date>".$year. "-" . $month . "-" . "00" . "</string-date>\n");
	//fwrite($XML,"\t\t\t\t<month>" . $month . "</month>\n");
	//fwrite($XML,"\t\t\t\t<year>" . $year . "</year>\n");
	fwrite($XML,"\t\t\t</pub-date>\n");
		
	fwrite($XML,"\t\t\t<volume>" . $volume . "</volume>\n");
	fwrite($XML,"\t\t\t<issue>" . $issue . "</issue>\n");
	
	if($info != "")
	{
		$info = replaceStrings($info);
		fwrite($XML,"\t\t\t<issue-title>". $info ."</issue-title>\n");		
	}
	else
	{
		fwrite($XML,"\t\t\t<issue-title />\n");		
	}

	fwrite($XML,"\t\t\t<page-range>" . $page . "</page-range>\n");

	if($hasSup)
	{
		//code to handle supplementary material should go here...
		if( is_dir($folderName) )
		{
			$dirContents = scandir($folderName);
			foreach($dirContents as $dirItem)
			{
				if(is_file($folderName . '/' . $dirItem))
				{ 	
					//echo $dirItem . "\n";
					$dirItem = replaceStrings($dirItem);
					$extension = pathinfo($folderName . '/' . $dirItem, PATHINFO_EXTENSION);
					fwrite($XML,"\t\t\t<supplementary-material mimetype=\"application/". $extension ."\" xlink:href=\"". $dirItem ."\" />\n");
				}
			}
		}

	}
	else
	{
		fwrite($XML,"\t\t\t<supplementary-material />\n");
	}


	//printing dates 
	if($dates != "[]")
	{
		$datesDecoded = json_decode($dates,true);
		//var_dump($datesDecoded);
		fwrite($XML,"\t\t\t<history>\n");
		foreach($datesDecoded as $key=>$value)
		{
			//echo $key . "=>" . $value;
			fwrite($XML,"\t\t\t\t<date date-type=\"". $date_short{$key} ."\">\n");
			fwrite($XML,"\t\t\t\t\t<string-date>". $value . "</string-date>\n");
			fwrite($XML,"\t\t\t\t</date>\n");
		}
		fwrite($XML,"\t\t\t</history>\n");
	}
	else
	{
		fwrite($XML,"\t\t\t<history />\n");
	}

	//Self URI for the article
	fwrite($XML,"\t\t\t<self-uri xlink:href=\"http://www.ias.ac.in/article/fulltext/". $journal . "/" . $volume . "/" . $issue . "/" . $page ."\"/>\n");

	//printing abstract
	if($abstract != "")
	{		
		$abstract = replaceStrings($abstract);

		fwrite($XML,"\t\t\t<abstract>\n");
		fwrite($XML,"\t\t\t\t" . $abstract . "\n"); 
		fwrite($XML,"\t\t\t</abstract>\n");
	}
	else
	{
		fwrite($XML,"\t\t\t<abstract />\n");		
	}

	#printing keywords
	if($keywords != "")
	{
		$keywordsList = preg_split('/;/',$keywords);
		
		fwrite($XML,"\t\t\t<kwd-group kwd-group-type=\"author-generated\">\n");
		
		for($i = 0; $i<sizeof($keywordsList); $i++)
		{
			$keyWordsReplaced = $keywordsList[$i];
			$keyWordsReplaced = replaceStrings($keyWordsReplaced);

			fwrite($XML,"\t\t\t\t<kwd>". $keyWordsReplaced ."</kwd>\n");
		}
		
		fwrite($XML,"\t\t\t</kwd-group>\n");		
	}
	else
	{
		fwrite($XML,"\t\t\t<kwd-group>\n");
		fwrite($XML,"\t\t\t\t<kwd />\n");
		fwrite($XML,"\t\t\t</kwd-group>\n");
	}	

	fwrite($XML,"\t\t</article-meta>\n");
	fwrite($XML,$postinfo);
	fclose($XML);

	// echo $journal . "\n";
	// echo $id . "\n";
	// echo $volume . "\n";
	// echo $issue . "\n";
	// echo $month . "\n";
	// echo $year . "\n";
	// echo $info . "\n";
	// echo $hassup . "\n";
	// echo $title . "\n";
	// echo $feature . "\n";
	// echo $page . "\n";
	// echo $abstract . "\n";
	// echo $keywords . "\n";
	// echo $authors . "\n";
	// echo $dates . "\n";

}

function replaceStrings($string)
{
	$string = preg_replace('/<ul>/',"<list list-type=\"bullet\">", $string);
	$string = preg_replace('/<\/ul>/',"</list>", $string);
	$string = preg_replace('/<ol>/',"<list list-type=\"ordered\">", $string);
	$string = preg_replace('/<\/ol>/',"</list>", $string);
	$string = preg_replace('/<li>/',"<list-item><p>", $string);
	$string = preg_replace('/<\/li>/',"</p></list-item>", $string);
	$string = preg_replace('/<i>/',"<italic>", $string);
	$string = preg_replace('/<\/i>/',"</italic>", $string);
	$string = preg_replace('/<b>/',"<bold>", $string);
	$string = preg_replace('/<\/b>/',"</bold>", $string);
	$string = preg_replace('/<u>/',"<underline>", $string);
	$string = preg_replace('/<\/u>/',"</underline>", $string);
	$string = preg_replace('/\n/',"", $string);
	$string = preg_replace('/\t/',"", $string);
	$string = preg_replace('/\n/',"\n\t\t\t\t", $string);
	$string = preg_replace('/&/', '&amp;', $string);

	return $string;

}
?>