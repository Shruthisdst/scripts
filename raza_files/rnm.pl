#!/usr/bin/perl

@list1 = `ls -v Unsorted/`;
for($i=0;$i<@list1;$i++)
{
	chop ($list1[$i]);
	$vol = $list1[$i];

	@list2 = `ls -v Unsorted/$vol/`;
	for($j=0;$j<@list2;$j++)
	{
		chop ($list2[$j]);
		$iss = $list2[$j];

		@list3 = `ls -v Unsorted/$vol/$iss/`;
		for($k=0;$k<@list3;$k++)
		{
			chop ($list3[$k]);
			$num = $list3[$k];
			$cnt = $k+1;
			
			if($cnt < 10)
			{
				$a = "000" . $cnt;
			}
			elsif($cnt < 100)
			{
				$a = "00" . $cnt;
			}
			elsif($cnt < 1000)
			{
				$a = "0" . $cnt;
			}
			else
			{
				$a = $cnt;
			}
			$input = "Unsorted" . "/" . $vol . "/" . $iss . "/" . $num;
			$output = "Unsorted" . "/" . $vol . "/" . $iss .  "/" . $a . ".JPG";
			print $input . "=>";
			print $output . "\n";
			#~ system("mv $input $output");
		}
	}
}
