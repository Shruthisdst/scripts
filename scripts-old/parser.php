<!DOCTYPE html>
<html>
<body>

<?php
//Initialize the XML parser
$parser=xml_parser_create();

global $ref_flag;

//Function to use at the start of an element
function start($parser,$element_name,$element_attrs) {
	global $ref_flag;
    if($element_name == 'REF')
    {
		//~ echo "<ref></ref>" . "\n";
	}
	else
	{
		//~ echo "no outout" . "\n";
	}
}

//Function to use at the end of an element
function stop($parser,$element_name) {
	global $ref_flag;
	if($ref_flag)
	{
		//~ echo "</ref>\n";
		$ref_flag = 0;
	}
	{
		//~ echo "<br>";
	}
}

//Function to use when finding character data
function char($parser,$data) {
	global $ref_flag;

	if($ref_flag)
	{
		//~ echo $data;
	}
	else
	{
		//~ echo $data;
	}
}
function getWords()
{
	$fileName = "eoh.xml";
	$xml = simplexml_load_file($fileName);

	foreach ($xml->volume as $volume)
	{
		foreach ($volume->entry as $entry)
		{
			$data = $entry->head->word;
		}
	}
}

//Specify element handler
xml_set_element_handler($parser,"start","stop");

//Specify data handler
xml_set_character_data_handler($parser,"char");

//Open XML file
$fp=fopen("eoh.xml","r");

//Read data
while ($data=fread($fp,4096)) {
    xml_parse($parser,$data,feof($fp)) or 
    die (sprintf("XML Error: %s at line %d", 
    xml_error_string(xml_get_error_code($parser)),
    xml_get_current_line_number($parser)));

$fileName = "eoh.xml";
$xml = simplexml_load_file($fp);
$wordList = array();

foreach ($xml->volume as $volume)
{
	foreach ($volume->entry as $entry)
	{
		$data = $entry->head->word;
		foreach ($entry->description as $desc)
		{
			$desc = $desc->saveXML();
			echo $desc . "\n";
		}
	}
}
}
//Free the XML parser
xml_parser_free($parser);
?>

</body>
</html>
