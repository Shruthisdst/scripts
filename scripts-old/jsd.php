<?php
include ("functions.php");

$cxn = connect_to_db("vars.php");

$query = "select * from insti_05";

//echo $query . "\n";

$result = mysql_query ($query, $cxn) or
	die("Could not execute the query: " . mysql_error($cxn));

$n_rows = mysql_num_rows ($result);

//echo $n_rows;

$textwidth = 20.0;

// No. of cols
$k = 3;




$textheight = 27;

$colwidth = number_format( ($textwidth - 2) / $k, 2);

//$str = "{@{}>{\\raggedright}p{" .$colwidth. "cm}|";

//for ($i = 2; $i < $k; $i++) {
//
//	$s = "p{". $colwidth. "cm}<{\\raggedright}|";
//	$str .= $s;
//}

//$str .= "p{". $colwidth. "cm}<{\\raggedright}@{}}\n";

$latexFile = "\\documentclass[a4paper,12pt]{article}\n\\usepackage{longtable,array,txfonts}\n\\usepackage[newdimens]{labels}\n\\LabelCols=3\n\\LabelRows=8\n\\hoffset=0mm\n\\LeftPageMargin=0.8cm\n\\RightPageMargin=0.8cm\n\\TopPageMargin=1.3cm\n\\BottomPageMargin=1.3cm\n\\LeftLabelBorder=3.3mm\n\\RightLabelBorder=2mm\n\\TopLabelBorder=2mm\n\\BottomLabelBorder=2mm\n\\InterLabelColumn=2mm\n\\InterLabelRow=0mm\n\\LabelInfotrue\n\\def\\name#1{{\\fontfamily{lel}\\fontsize{12}{22}\\fontseries{bx}\\selectfont  #1}}\n\\begin{document}\n\\fontsize{10}{12}\n\\selectfont\n\\begin{labels}\n";


//$latexFile .= $str;
//echo $latexFile;


$i = 1; // initilize the counter
$count = 1;

while ( $row = mysql_fetch_array($result) ) {
	
	$scid = $row['scid'];
	$name = $row['name'];
	$address = $row['address'];

	//$str = "M.No: " . "" ."\\breakbreaktextbf{" . $identity . "}" ."-$no\\break";	

	$str = "{\\fontsize{7}{9}\selectfont 13 $|$ " . $scid . "}\\\\";
	$str = $str . "\\name{" . $name . "}";

if (!empty($address)) {
	$str = $str 	. "\\\\[2pt] " . $address;
}
//~ if (!empty($address2)) {
		//~ $str = $str   . ", " . $address2 . "\\break " . $district;
//~ }
//~ else{
	//~ $str = $str   .  "\\break " . $district;
//~ }

	$str = ereg_replace("&", "\\&", $str);
	$str = ereg_replace("#", "\\#", $str);
	$str = ereg_replace("\|\|", "$||$", $str);
	#$str = ereg_replace("&apos;", "'", $str);

	$latexFile .= $str;
		$latexFile .= "\n\n";
} // end while



$latexFile .= "\\end{labels}\n\\end{document}\n";

$filename = "20131129.tex";

$fileptr = fopen ($filename, "w");

fwrite ($fileptr, $latexFile);

fclose( $fileptr);

mysql_close($cxn);

//echo "\n\n Number of Records = $count \n\n";

?>
