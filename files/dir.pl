#!/usr/bin/perl
@list1 = `ls -v Natarang/`;
@list11 = `ls -v ntg/`;
for($i=0;$i<@list1;$i++)
{
	chop ($list1[$i]);
	$dir1 = $list1[$i];
	chop ($list11[$i]);
	$dir11 = $list11[$i];
	print $dir1 . "\n";
	#~ system("mkdir ntg/$dir1");

	@list2 = `ls -v Natarang/$dir1`;
	for($j=0;$j<@list2;$j++)
	{
		chop ($list2[$j]);
		$file = $list2[$j];
		$file =~ s/([a-z]+)\.JPG//g;
		#~ $file =~ s/^0//g;
		print $file . "\n";
		#~ system("mkdir ntg/$dir11/$file");
	}
}
