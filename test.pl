#!/usr/bin/perl

#~ use warnings;
#~ use strict;
use utf8;
#~ use Encode;

#~ open(IN,"Vol01/DHA.WS") or die "Can't Vol01/DHA.WS";
#~ open(OUT,">XML/D.xml") or die "Can't XML/D.xml";

$file = "Vol01/DHA.WS";

open(IN,$file) or die "Can't open $file";
open(OUT,">:encoding(utf8)","XML/D.xml") or die "Can't XML/D.xml";

binmode(STDOUT, ":utf8");
my $line = <IN>;
print OUT "<entry>\n";

while($line)
{
	chop($line);
	if($line =~ /\@NT = (.*)/)
	{
		$word = $1;
		print OUT "\t<\/description>\n<\/entry>\n<entry>\n";
		print OUT "\t<head>\n";
		print OUT "\t\t<word>". to_convert($word) ."<\/word>\n";
		print OUT "\t\t<alias><\/alias>\n";
		print OUT "\t\t<note>";
	}
	elsif($line =~ /\@N1 = (.*)/)
	{
		$note = $1;
		print OUT to_convert($note);
	}
	elsif($line)
	{
		print OUT "<\/note>\n";
		print OUT "\t\t<image><\/image>\n";
		print OUT "\t<\/head>\n\t<description>\n";
	}
	else
	{
		print OUT "\t\t<p>". to_convert($line) . "<\/p>\n";
	}

	$line = <IN>;
}
print OUT "<\/entry>\n";
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

	$unicode_string =~ s/<192>/—/g;
	$unicode_string =~ s/ /—/g;

	# Formatting characters

	$unicode_string =~ s/(.*?)/<em>\1<\/em>/g;
	$unicode_string =~ s/(.*?)/<b>\1<\/b>/g;
	$unicode_string =~ s/(.*?)/<u>\1<\/u>/g;
	$unicode_string =~ s/(.*?)/<sup>\1<\/sup>/g;
	$unicode_string =~ s/<F255MI>(.*?)/<em>\1<\/em>/g;
	$unicode_string =~ s/<F255P255MIC255>(.*?)/<em>\1<\/em>/g;
	$unicode_string =~ s/<\|>/ /g;
	# $unicode_string =~ s// /g;
	$unicode_string =~ s/  / /g;
	$unicode_string =~ s/  / /g;
	$unicode_string =~ s/  / /g;
	$unicode_string =~ s/<F51320MS>//g;
	$unicode_string =~ s/<MS>/<ref>/g;
	$unicode_string =~ s/<D>/<\/ref>/g;
	$unicode_string =~ s/\@SPACE = //g;
	$unicode_string =~ s/\@SPACE1 = //g;
	$unicode_string =~ s/<F51320P10MSC1>//g;
	$unicode_string =~ s/<W1>//g;
	$unicode_string =~ s/<R>/ /g;
	$unicode_string =~ s/<F255D>//g;
	$unicode_string =~ s/<F51320W1>//g;
	$unicode_string =~ s/<F51320P10W1C1>//g;
	$unicode_string =~ s/\@EMERGENCY = //g;
	$unicode_string =~ s/\@EMERGEN1 = //g;
	return($unicode_string);
}
