#!/usr/bin/perl
#pdf2djvu -i djvu/left/mb_left.djvu --dpi=600 --no-nfkc --crop-text mb_left.pdf	--> for reference

$dir = "renpdf";

@list1 = `ls data1/Srimad_Bhagavata/01/$dir/0p*.pdf`;
@list2 = `ls data1/Srimad_Bhagavata/01/$dir/1m*.pdf`;
@list3 = (@list1,@list2);

for($i=0;$i<@list3;$i++)
{
	#print $list3[$i];
	chop($list3[$i]);
	$filename = $list3[$i];
	$filename =~ s/\.pdf/.djvu/;
	print $list3[$i] . "==>" . $filename . "\n";

	system("pdf2djvu --dpi=600 --no-nfkc --crop-text --no-metadata -o $filename $list3[$i]");
}

