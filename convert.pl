#!/usr/bin/perl

use utf8;
use Encode;


$file = "CAP_txt/Y.txt";

open(IN,$file) or die "Can't open $file";
open(OUT,">:encoding(utf8)","CAP_txt/Y_CAP.txt") or die "Can't CAP_txt/Y_CAP.txt";

binmode(STDOUT, ":utf8");

$line = <IN>;

while($line)
{
	chop($line);
	
	$line =~ s// /g;

	$line =~ s/<160>/—/g;
	$line =~ s/<161>/Ā/g;
	$line =~ s/<193>/ā/g;
	$line =~ s/<200>/ī/g;
	$line =~ s/<220>/ū/g;
	$line =~ s/<216>/ṛ/g;
	$line =~ s/<217>/ś/g;
	$line =~ s/<221>/ṁ/g;
	$line =~ s/<199>/ḥ/g;
	$line =~ s/<170>/Ḷ/g;
	
	$line =~ s/<209>/ṅ/g;
	$line =~ s/<210>/ñ/g;
	$line =~ s/<219>/ṭ/g;
	$line =~ s/<195>/ḍ/g;
	$line =~ s/<207>/ṇ/g;
	
	$line =~ s/á/ś/g;
	$line =~ s/<218>/ṣ/g;
	# $line =~ s/<xxx>/ಳ/g;


	$line =~ s/¡/Ā/g;
	$line =~ s/¨/Ī/g;
	$line =~ s/<188>/Ū/g;
	$line =~ s/<184>/Ṛ/g;
	$line =~ s/<189>/Ṁ/g;
	# $line =~ s/<xxx>/ಃ/g;

	$line =~ s/<177>/Ṅ/g;
	$line =~ s/<178>/Ñ/g;
	$line =~ s/<187>/Ṭ/g;
	$line =~ s/£/Ḍ/g;
	$line =~ s/§/Ḥ/g;
	$line =~ s/¯/Ṇ/g;
	$line =~ s/<185>/Ś/g;
	$line =~ s/<186>/Ṣ/g;
	$line =~ s/<202>/ḷ/g;

	$line =~ s/<192>/—/g;
	$line =~ s/ /—/g;

	# Formatting characters

	$line =~ s/(.*?)/<em>\1<\/em>/g;
	$line =~ s/(.*?)/<b>\1<\/b>/g;
	$line =~ s/(.*?)/<u>\1<\/u>/g;
	$line =~ s/(.*?)/<sup>\1<\/sup>/g;
	$line =~ s/<F255MI>(.*?)/<em>\1<\/em>/g;
	$line =~ s/<F255P255MIC255>(.*?)/<em>\1<\/em>/g;
	$line =~ s/<MI>(.*)<D>/<em>\1<\/em>/g;
	$line =~ s/<\$(.*?)>//g;
	$line =~ s/<\|>/ /g;
	# $line =~ s// /g;
	$line =~ s/  / /g;
	$line =~ s/  / /g;
	$line =~ s/  / /g;

	print OUT $line . "\n";	
	
	$line = <IN>;
}

close(IN);
close(OUT);
