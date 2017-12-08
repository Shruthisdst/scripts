#!/usr/bin/perl
@list1 = `ls -v Volumes`;
for($i=0;$i<@list1;$i++)
{
	chop ($list1[$i]);
	$vnum = $list1[$i];
	
	@list2 = `ls -v Volumes/$vnum`;
	for($j=0;$j<@list2;$j++)
	{
		chop ($list2[$j]);
		$inum = $list2[$j];
		
		@list3 = `ls -v Volumes/$vnum/$inum`;
		
		for($k=0;$k<@list3;$k++)
		{
			chop ($list3[$k]);
			$file = $list3[$k];
			($p1, $p2) = split('\.',$file);
			$dir = $file;
			$somedir = "Volumes/$vnum/$inum/$dir";
			if (-d $somedir)
			{
				#print "$file" . "\n";
			
				if($file != "extra")
				{
					print "dir there -> $somedir" . "\n";
				}
				else
				{
					print "dir vot there" . "\n";
				}
			}
		}
	}
}
