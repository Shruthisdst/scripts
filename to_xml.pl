#!/usr/bin/perl

#~ use warnings;
#~ use strict;
use utf8;
#~ use Encode;

#~ open(IN,"Vol01/DHA.WS") or die "Can't Vol01/DHA.WS";
#~ open(OUT,">XML/D.xml") or die "Can't XML/D.xml";

$file = "test/HABINTRO.txt";

open(IN,$file) or die "Can't open $file";
open(OUT,">:encoding(utf8)","test/introduction.html") or die "Can't test/introduction.html";

binmode(STDOUT, ":utf8");
my $line = <IN>;
print OUT "<!doctype html>
<html lang=\"en\" class=\"no-js\">
<head>
	<meta charset=\"utf-8\">
	<link rel=\"stylesheet\" href=\"css/style.css\">
	<title>Bharata Darshana</title>
</head>
<body>\n";
while($line)
{
	chop($line);
	if($line =~ /^\@CENT = (.*)/)
	{
		$word = $1;
		print OUT  "<h1>".to_convert($word) . "</h1>\n";
	}
	elsif($line =~ /^\@SLOKA = (.*)/)
	{
		#~ print OUT $line . "\n";
	}
	elsif($line =~ /^\@BODYH = (.*)/)
	{
		#~ print OUT $line . "\n";
	}
	elsif($line =~ /^\@SUB1 = (.*)/)
	{
		$subWord = $1;
		print OUT  "<h2>".to_convert($subWord) . "</h2>\n";
	}
	else
	{
		print OUT to_convert($line) . "\n";
	}

	$line = <IN>;
}
print OUT "\t<div class=\"subhead\">*********</div>
</div>
</body>
</html>\n";
close(IN);
close(OUT);


sub to_convert()
{
	my($unicode_string) = @_;
	
	$unicode_string =~ s// /g;

	$unicode_string =~ s/<193>/ā/g;
	$unicode_string =~ s/<200>/ī/g;
	$unicode_string =~ s/<220>/ū/g;
	$unicode_string =~ s/<216>/ṛ/g;
	$unicode_string =~ s/<221>/ṁ/g;
	$unicode_string =~ s/<199>/ḥ/g;
	$unicode_string =~ s/<170>/Ḷ/g;
	
	$unicode_string =~ s/<209>/ṅ/g;
	$unicode_string =~ s/<210>/ñ/g;
	$unicode_string =~ s/<219>/ṭ/g;
	$unicode_string =~ s/<195>/ḍ/g;
	$unicode_string =~ s/<207>/ṇ/g;
	
	$unicode_string =~ s/<217>/ś/g;
	$unicode_string =~ s/á/ś/g;
	$unicode_string =~ s/<218>/ṣ/g;
	# $unicode_string =~ s/<xxx>/ಳ/g;


	$unicode_string =~ s/¡/Ā/g;
	$unicode_string =~ s/¨/Ī/g;
	$unicode_string =~ s/<188>/Ū/g;
	$unicode_string =~ s/<184>/Ṛ/g;
	$unicode_string =~ s/<189>/Ṁ/g;
	# $unicode_string =~ s/<xxx>/ಃ/g;

	$unicode_string =~ s/<177>/Ṅ/g;
	$unicode_string =~ s/<178>/Ñ/g;
	$unicode_string =~ s/<187>/Ṭ/g;
	$unicode_string =~ s/£/Ḍ/g;
	$unicode_string =~ s/§/Ḥ/g;
	$unicode_string =~ s/¯/Ṇ/g;
	$unicode_string =~ s/<185>/Ś/g;
	$unicode_string =~ s/<186>/Ṣ/g;
	$unicode_string =~ s/<202>/ḷ/g;
	$unicode_string =~ s/<214>/ṝ/g;
	
	$unicode_string =~ s/<161>/Ā/g;

	$unicode_string =~ s/<160>/—/g;
	$unicode_string =~ s/<192>/—/g;
	$unicode_string =~ s/ /—/g;
	$unicode_string =~ s/<MI>(.*?)<D>/<i>\1<\/i>/g; 
	$unicode_string =~ s/<F255P255MIC255>(.*?)<F51320P13W(.*?)>/<i>\1<\/i>/g;
	$unicode_string =~ s/<F51320P13MIC1>(.*?)<W1>/<i>\1<\/i>/g;

	$unicode_string =~ s/<MI>(.*?)<F51320P13W1C1>/<i>\1<\/i>/g;
	$unicode_string =~ s/<MI>(.*?)<W(.*?)>/<i>\1<\/i>/g;
	#~ $unicode_string =~ s/<MI>(.*?)<W1>/<i>\1<\/i>/g;
	$unicode_string =~ s/<P255MIC255>(.*?)<P13W1C1>/<i>\1<\/i>/g;
	$unicode_string =~ s/<F51320(.*?)>(.*?)<F255(.*?)>/<i>\2<\/i>/g;
	$unicode_string =~ s/<F51320>(.*?)<F255D>/<i>\1<\/i>/g;
	$unicode_string =~ s/<BI>(.*?)<F51320P13BC1>/<strong><i>\1<\/i><\/strong>/g;
	$unicode_string =~ s/<B>/<strong>/g;



	#~ $unicode_string =~ s/<F255P255MIC255>(.*?)<F51320P13W1IC1>/<i>\1<\/i>/g;
	#~ 
	$unicode_string =~ s/<F255P255DC255>//g;
	$unicode_string =~ s/<F255P255C255>//g;
	$unicode_string =~ s/<F51320BI>//g;
	$unicode_string =~ s/<F255B>//g;
	$unicode_string =~ s/<F255D>/<\/i>/g;
	$unicode_string =~ s/<BI>//g;
	$unicode_string =~ s/<[BDN]>//g;
	#~ $unicode_string =~ s/<F51320P13MIC1>|<P255MIC255>|<P13W1C1>|<F255P255MIC255>|<F51320P13W1C1>|<P255C255>//g;
	#~ $unicode_string =~ s/<F54866P14BC255>(.*?)<F255P255D>//g;
	#~ $unicode_string =~ s/<F54866P14B>(.*?)<F255P255D>//g;
	#~ $unicode_string =~ s/<F5(.*?)>|<P2(.*?)>|<P1(.*?)>|<F2(.*?)>//g;
	#~ $unicode_string =~ s/<W1>//g;
	#~ $unicode_string =~ s/<P13W1C1>/<\/i>/g;
	$unicode_string =~ s/<P255C255>//g;
	$unicode_string =~ s/<MI>/<i>/g;
	$unicode_string =~ s/<F255P255MIC255>/<i>/g;
	$unicode_string =~ s/<W1I>/<\/i>/g;




	# Formatting characters

	#~ $unicode_string =~ s/(.*?)/<em>\1<\/em>/g;
	#~ $unicode_string =~ s/(.*?)/<strong>\1<\/strong>/g;
	#~ $unicode_string =~ s/(.*?)/<u>\1<\/u>/g;
	#~ $unicode_string =~ s/(.*?)/<sup>\1<\/sup>/g;
	#~ $unicode_string =~ s/<F255MI>(.*?)/<em>\1<\/em>/g;
	#~ $unicode_string =~ s/<F255P255MIC255>(.*?)<F51320P13W1C1>/<i>\1<\/i>/g;
	#~ $unicode_string =~ s/\@SPACE = //g;
	#~ $unicode_string =~ s/\@SPACE1 = //g;
	#~ $unicode_string =~ s/\@EMERGENCY = //g;
	#~ $unicode_string =~ s/\@EMERGEN1 = //g;
	#~ $unicode_string =~ s/<MS>/<ref>/g;
	#~ $unicode_string =~ s/<D>/<\/ref>/g;
	#~ $unicode_string =~ s/\@S10N = (.*)/<h1>\1<\/h1>/g;
	#~ $unicode_string =~ s/\@S10 = (.*)/<h2>\1<\/h2>/g;
	#~ $unicode_string =~ s/\@SB = (.*)/<h3>\1<\/h3>/g;
	$unicode_string =~ s/<\$(.*?)>//g;
	#~ $unicode_string =~ s/<\|>/ /g;
	#~ $unicode_string =~ s/<p><\/p>/ /g;
	#~ $unicode_string =~ s/<F20M><F255D>/é/g;
	$unicode_string =~ s/\@BODYSP = //g;
	$unicode_string =~ s/\@BODYTEXTIN = //g;
	$unicode_string =~ s/\@SUB1 = //g;
	$unicode_string =~ s/  / /g;
	$unicode_string =~ s/  / /g;
	$unicode_string =~ s/  / /g;
	$unicode_string =~ s/<i> <i>/ <i>/g;
	return($unicode_string);
}
