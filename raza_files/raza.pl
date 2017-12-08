#!/usr/bin/perl

@list = `ls -v Raza_Unsorted`;
for($i=0;$i<@list;$i++)
{
	chop ($list[$i]);
	$vol = $list[$i];

	@list1 = `ls -v Raza_Unsorted/$vol`;
	for($j=0;$j<@list1;$j++)
	{
		chop ($list1[$j]);
		$iss = $list1[$j];

		@list2 = `ls -v Raza_Unsorted/$vol/$iss`;
		for($k=0;$k<@list2;$k++)
		{
			chop ($list2[$k]);
			$num = $list2[$k];
			$firstItem = "Raza_Unsorted/$vol/$iss/$list2[0]";
			$somedir = "Raza_Unsorted/$vol/$iss/$num";
			if (-d $somedir)
			{
				@list3 = `ls -v $somedir`;
				for($l=0;$l<@list3;$l++)
				{
					chop ($list3[$l]);
					$file = $list3[$l];
					$cnt = $l+1;
					$name = appendZero($cnt) . ".JPG";
					print $somedir . "/" . $file . "=>";
					print $somedir . "/" . $name . "\n";
					#~ system ("mv $somedir/$file $somedir/$name")
				}
			}
			else
			{
				if(-d $firstItem)
				{
					$cnt = $k;
				}
				else
				{
					$cnt = $k+1;
				}
				$name = appendZero($cnt) . ".JPG";
				print "Raza_Unsorted/" . $vol . "/" . $iss . "/" . $num . "=>Raza_Unsorted/" . $vol . "/" . $iss . "/" . $name . "\n";
				#~ system("mv Raza_Unsorted/$vol/$iss/$num Raza_Unsorted/$vol/$iss/$name");
			}
		}
	}
}

sub appendZero()
{
	my($cnt) = @_;

	if($cnt < 10)
	{
		$aa = "000" . $cnt;
	}
	elsif($cnt1 < 100)
	{
		$aa = "00" . $cnt;
	}
	elsif($cnt1 < 1000)
	{
		$aa = "0" . $cnt;
	}
	else
	{
		$aa = $cnt;
	}
	return($aa);
}
