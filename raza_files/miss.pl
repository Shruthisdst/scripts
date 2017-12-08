#!/usr/bin/perl

open(IN,"<:utf8","Raza-Foundation.csv") or die "can't open Raza-Foundation.csv\n";
$line = <IN>;

while($line)
{
	if($line =~ /(.*)/)
	{
		$id = $1;
		($dir, $lid) = split('\_', $id);
		print $lid . "\n";
		system("mkdir us_files/$dir");
		system("mkdir us_files/$dir/$lid");
		open(OUT,">us_files/$dir/$lid.json") or die "us_files/$dir/$lid.json\n";
		print OUT "{\n";
		print OUT "\t\"id\":\"$lid\",\n";
		print OUT "\t\"Type\":\"Unsorted\",\n";
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

