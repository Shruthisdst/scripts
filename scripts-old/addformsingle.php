<?php
	$user='root';
	$password='mysql';
	$database='bjp';
	$table = 'election';

	$db = mysql_connect("localhost",$user,$password) or die("Not connected to database");
	mysql_select_db($database,$db) or die("No Database");
	
	$query = 'DROP TABLE IF EXISTS ' . $table;
	mysql_query($query);
	
	$query = 'CREATE TABLE ' . $table. '(
				applicant varchar(100), father varchar(100), 
				mother  varchar(100),  husband  varchar(100), 
				sex varchar(10), dob varchar(20) , age int, 
				qualification varchar(50) , occupation varchar(50) ,
				addressDetails varchar(1000), houseNumber varchar(100), 
				street varchar(500), town varchar(100), postOffice varchar(100), 
				taluk varchar(100), district varchar(100), 
				mobile varchar(50), telephone varchar(20), email varchar(50), 
				graduationSubject varchar(100), graduationUniversity varchar(100), graduationYear varchar(100), 
				constNumber varchar(100), constName varchar(100), constPart varchar(100), constPSnum varchar(100), constEpicNum varchar(100), 
				applicantId varchar(30) NOT NULL, PRIMARY KEY (applicantId)) ENGINE=MyISAM';
				
	mysql_query($query) or die("Table creation problem  " . mysql_error());
	
	$xml = simplexml_load_file('election.xml');
	foreach ($xml->entry as $entry)
	{
		$query = "INSERT INTO " . $table . " VALUES ('" . addslashes(trim($entry->name->applicant)) . "' , '" . addslashes(trim($entry->name->father)) . "', '" . addslashes(trim($entry->name->mother)) . "' , '" . addslashes(trim($entry->name->husband)) . "' ,  '" . trim($entry->sex) . "' , '" . trim($entry->dob) . "' , '" . trim($entry->age) . "' ,  '" . addslashes(trim($entry->qualification)) . "' , '" . trim($entry->occupation) . "' , '" . addslashes(trim($entry->address->details)) . "' ,  '" . addslashes(trim($entry->address->house_num)) . "' , '" . addslashes(trim($entry->address->street)) . "' , '" . addslashes(trim($entry->address->town)) . "' ,  '" . trim($entry->address->post_office) . "' , '" . trim($entry->address->taluk) . "' , '" . trim($entry->address->district) . "' ,  '" . trim($entry->address->mobile) . "', '" . trim($entry->address->telephone) . "' , '" . trim($entry->address->email) . "', '" . trim($entry->graduation_details->subject) . "', '" . trim($entry->graduation_details->university) . "' , '" . trim($entry->graduation_details->year) . "', '" . trim($entry->constituency_details->nummber) . "', '" . trim($entry->constituency_details->cname) . "' , '" . trim($entry->constituency_details->part) . "', '" . trim($entry->constituency_details->psnum) . "' , '" . trim($entry->constituency_details->epic_num) . "' , '" . trim($entry->name->applicantID) . "')";
		mysql_query($query) or die("Insertion problem  " . mysql_error());
	}
	
?>
