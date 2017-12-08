#!/usr/bin/perl

$dir = "Varuna-e";

@list1 = `ls data/Veda-e/$dir/0p*.djvu`;
@list2 = `ls data/Veda-e/$dir/1m*.djvu`;
@list3 = (@list1,@list2);
$filename = "data/Veda-e/$dir/index.djvu";
$cmd = "djvm -c $filename ";

for($i=0;$i<@list3;$i++)
{
	print $list3[$i];
	chop($list3[$i]);
	
	$cmd = $cmd . $list3[$i] . " ";
	
	#~ if($i == 0)
	#~ {
		#~ system("djvm -c $filename $list3[$i]");
	#~ }
	#~ else
	#~ {
		#~ system("djvm -i $filename $list3[$i]");
	#~ }
}

system("$cmd");
system("djvmcvt -i $filename data/Veda-e/$dir/indirect index.djvu");
