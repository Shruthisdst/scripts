#!/usr/bin/perl

open(IN,"<:utf8","album.csv") or die "can't open album.csv\n";
$line = <IN>;

while($line)
{
	if($line =~ /(.*)\|(.*)\|/)
	{
		$id = $1;
		$title = $2;
		open(OUT,">us_files/$id.json") or die "us_files/$id.json\n";
		print OUT "{\n";
		print OUT "\t\"albumID\":\"$id\",\n";
		print OUT "\t\"Title\":\"$title\",\n";
		print OUT "\t\"Description\":\"\"\n";
		print OUT "}\n";
	}
	close(OUT);
	$line = <IN>;
}
close(IN);

