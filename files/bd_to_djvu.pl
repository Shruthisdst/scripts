#!/usr/bin/perl
#pdf2djvu -i djvu/left/mb_left.djvu --dpi=600 --no-nfkc --crop-text mb_left.pdf	--> for reference

$dir = "renpdf";

@list1 = `ls data1/corrections/homepage/pg*.pdf`;

for($i=0;$i<@list1;$i++)
{
	#print $list1[$i];
	chop($list1[$i]);
	$filename = $list1[$i];
	$filename =~ s/\.pdf/.djvu/;
	print $list1[$i] . "==>" . $filename . "\n";

	system("pdf2djvu --dpi=600 --no-nfkc --crop-text --no-metadata -o $filename $list1[$i]");
}

