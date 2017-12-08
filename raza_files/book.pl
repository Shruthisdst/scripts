#!/usr/bin/perl

open(IN,"<:utf8","Raza-Foundation.csv") or die "can't open Raza-Foundation.csv\n";
$line = <IN>;

while($line)
{
	if($line =~ /(.*)\|(.*)\|/)
	{
		$id = $1;
		$title = $2;
		print $title . "\n";
		$id =~ s/B-//g;
		#~ system("mkdir json/$id");
		open(OUT,">json/$id.json") or die "json/$id.json\n";
		print OUT "{\n";
		print OUT "\t\"id\":\"$id\",\n";
		print OUT "\t\"Type\":\"Book\",\n";
		print OUT "\t\"title\":\"$title\"\n";
		print OUT "}\n";
	}
	close(OUT);
	$line = <IN>;
}
close(IN);

