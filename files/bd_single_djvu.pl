#!/usr/bin/perl


@list1 = `ls data1/About_Page/*.djvu`;
$filename = "data1/About_Page/index.djvu";
$cmd = "djvm -c $filename ";

for($i=0;$i<@list1;$i++)
{
	print $list1[$i];
	chop($list1[$i]);
	
	$cmd = $cmd . $list1[$i] . " ";
}

system("$cmd");
#system("djvmcvt -i $filename data1/Srimad_Bhagavata/01/temp/done/indirect index.djvu");
