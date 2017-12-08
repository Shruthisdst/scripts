#!/usr/bin/perl

@list1 = `ls -v Brochures`;
for($i=0;$i<@list1;$i++)
{
	chop ($list1[$i]);
	$vnum = $list1[$i];
	print $vnum . "\n";
	system("mkdir json/$vnum");
	open(OUT,">json/$vnum.json") or die "json/$vnum.json\n";
	print OUT "{\n";
	print OUT "\t\"albumID\":\"$vnum\",\n";
	print OUT "\t\"Title\":\"\",\n";
	print OUT "\t\"Description\":\"\"\n";
	print OUT "}\n";
	
	@list2 = `ls -v Brochures/$vnum`;
	for($j=0;$j<@list2;$j++)
	{
		chop($list2[$j]);
		$inum = $list2[$j];
		$path = "Brochures/$vnum/$inum";
		if(-d $path)
		{
			print $inum."\n";
			system("mkdir json/$vnum/$inum");
			open(OUT,">json/$vnum/$inum.json") or die "json/$vnum/$inum.json\n";
			print OUT "{\n";
			print OUT "\t\"id\":\"$inum\",\n";
			print OUT "\t\"Type\":\"Brochure\",\n";
			print OUT "\t\"Article-title\":\"\",\n";
			print OUT "\t\"Media\":\"\",\n";
			print OUT "\t\"Date\":\"\",\n";
			print OUT "\t\"Place\":\"\",\n";
			print OUT "\t\"Language\":\"\",\n";
			print OUT "\t\"Keywords\":\"\"\n";
			print OUT "}\n";
		}
	}
}
