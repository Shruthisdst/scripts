#!/usr/bin/perl

open(IN,"<:utf8","Raza-Foundation.csv") or die "can't open Raza-Foundation.csv\n";
$line = <IN>;

while($line)
{
	if($line =~ /(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|/)
	{
		$id = $1;
		$title = $2;
		$media = $3;
		$date = $4;
		$place = $5;
		$lang = $6;
		$keywords = $7;
		($dir, $lid) = split('\_', $id);
		print $lid . "\n";
		system("mkdir articles/$dir");
		system("mkdir articles/$dir/$lid");
		open(OUT,">articles/$dir/$lid.json") or die "articles/$dir/$lid.json\n";
		print OUT "{\n";
		print OUT "\t\"id\":\"$lid\",\n";
		print OUT "\t\"Type\":\"Article\",\n";
		print OUT "\t\"Article-title\":\"$title\",\n";
		print OUT "\t\"Media\":\"$media\",\n";
		print OUT "\t\"Date\":\"$date\",\n";
		print OUT "\t\"Place\":\"$place\",\n";
		print OUT "\t\"Language\":\"$lang\",\n";
		print OUT "\t\"Keywords\":\"$keywords\"\n";
		print OUT "}\n";
	}
	close(OUT);
	$line = <IN>;
}
close(IN);

