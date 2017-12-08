#!/usr/bin/perl
@list1 = `ls -v Natarang/`;
for($i=0;$i<@list1;$i++)
{
	chop ($list1[$i]);
	$dl = $list1[$i];

	@list2 = `ls -v Natarang/$dl`;
	for($j=0;$j<@list2;$j++)
	{
		chop ($list2[$j]);
		$file = $list2[$j];
		$dir = $list2[$j];
		$dir =~ s/([a-z]+)\.JPG//g;
		$dir =~ s/^0//g;
		#~ system("mkdir Natarang/$dl/$dir");
		#~ system("mv Natarang/$dl/$file Natarang/$dl/$dir/$file");
	}
}
