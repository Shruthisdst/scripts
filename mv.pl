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
		@list3 = `ls -v Volumes/$vol/$iss`;
		for($k=0;$k<@list3;$k++)
		{
			chop ($list3[$k]);
			$file = $list3[$k];
			#~ $file =~ s/([0-9]+)-([0-9]+)-([1-9]+)//g;
			$file1 = $list3[$k+1];
			chop ($file1);
			($p1, $p2) = split('\.', $file);
			($s1, $s2) = split('\.', $file1);
			($a,$b,$c) = split('\-', $p1);
			($p,$q,$r) = split('\-', $s1);
			
			if(($a == $p) && ($b == $q))
			{
				if($c == 0)
				{
					$tmp = $c + 1;
					$dest1 =  "Volumes/$vol/$iss/" . $a . "-" . $b . "_" . $tmp;
					system("mkdir Volumes/$vol/$iss/$a-$b\_$tmp/");
					system("mv Volumes/$vol/$iss/$file $dest1");
				}
				$cnt = $r + 1;
				$dest2 =  "Volumes/$vol/$iss/" . $p . "-" . $q . "_" . $cnt;
				
				system("mkdir Volumes/$vol/$iss/$p-$q\_$cnt");
				system("mv Volumes/$vol/$iss/$file1 $dest2");
			}
			if(($a != $p) || ($b != $q))
			{
				if($c == 0)
				{
					$dest3 =  "Volumes/$vol/$iss/" . $a . "-" . $b;
					print "Volumes/$vol/$iss/$file" . "=>" . $dest3 . "\n";
					system("mkdir Volumes/$vol/$iss/$a-$b/");
					system("mv Volumes/$vol/$iss/$file $dest3");
				}
			}
		}
	}
}
