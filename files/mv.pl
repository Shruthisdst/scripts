#!/usr/bin/perl
@list = `ls -v ntg`;
for($i=0;$i<@list;$i++)
{
	chop ($list[$i]);
	$dir = $list[$i];
	#~ print $dir ."\n";
	
	@list11 = `ls -v ntg/$dir`;
	for($d=0;$d<@list11;$d++)
	{
		chop ($list11[$d]);
		$ldir1 = $list11[$d];
		$ldir2 = $list11[$d];
		$ldir2 =~ s/^0//g;
		#~ print $ldir1 . "=>" . $ldir2 . "\n";
		#~ system("mv ntg/$dir/$ldir1 ntg/$dir/$ldir2");
	
		@list1 = `ls Natarang/$dir`;
		for($j=0;$j<@list1;$j++)
		{
			chop ($list1[$j]);
			$file = $list1[$j];
			if($file =~ /$ldir[a-z]+/)
			{
				#~ system("cp Natarang/$dir/$file ntg/$dir/$ldir/$file");
			}
		}
	}
}
