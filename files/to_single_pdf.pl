#!/usr/bin/perl

$dir = "Vishwamitra_h";

@list1 = `ls data/Maharshis-h/$dir/0p*.pdf`;
@list2 = `ls data/Maharshis-h/$dir/1m*.pdf`;
@list3 = (@list1,@list2);
$filename = "data/Maharshis-h/$dir/index.pdf";
$cmd = "pdftk ";

for($i=0;$i<@list3;$i++)
{
	#print $list3[$i];
	chop($list3[$i]);
	
	$cmd = $cmd . $list3[$i] . " ";
}

$cmd = $cmd . " " . "cat output " . $filename;

#print $cmd . "\n"; ==> for debugging

system("$cmd");
