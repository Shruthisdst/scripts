#!/usr/bin/perl

@list1 = `ls -v test`;
for($i=0;$i<@list1;$i++)
{
	chop ($list1[$i]);
	$vol = $list1[$i];
	print $vol . "\n";
	
	@list2 = `ls -v test/$vol`;
	for($j=0;$j<@list2;$j++)
	{
		chop ($list2[$j]);
		$iss = $list2[$j];
		print $iss . "\n";
		#~ system("djvmcvt -i test/$vol/$iss/index.djvu test/$vol/$iss/ index.djvu");
	}
}
