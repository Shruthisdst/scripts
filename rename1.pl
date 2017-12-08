#!/usr/bin/perl
@list1 = `ls -v Volumes/`;
for($i=0;$i<@list1;$i++)
{
	chop ($list1[$i]);
	$vol = $list1[$i];
	
	@list2 = `ls -v Volumes/$vol`;
	for($j=0;$j<@list2;$j++)
	{
		chop ($list2[$j]);
		$iss = $list2[$j];

		@list3 = `ls -v Volumes/$vol/$iss/`;
		for($k=0;$k<@list3;$k++)
		{
			chop ($list3[$k]);
			$pages = $list3[$k];

			@list4 = `ls -v Volumes/$vol/$iss/$pages`;
			for($l=0;$l<@list4;$l++)
			{
				chop ($list4[$l]);
				$file = $list4[$l];
				#~ print $file . "\n";
				#~ print "Volumes/$vol/$iss/$pages/$file" . "=>" . "Volumes/$vol/$iss/$pages/index.xml" . "\n";
				system("mv Volumes/$vol/$iss/$pages/$file Volumes/$vol/$iss/$pages/index.xml");
			}
		}
	}
}
