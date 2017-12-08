#!/usr/bin/perl

@list1 = `ls -v Browsers/`;
for($i=0;$i<@list1;$i++)
{
	chop ($list1[$i]);
	$vol = $list1[$i];

	@list2 = `ls -v Browsers/$vol/`;
	for($j=0;$j<@list2;$j++)
	{
		chop ($list2[$j]);
		$num = $list2[$j];

		$cnt = $j+1;
		
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
		$input = "Browsers" . "/" . $vol . "/" . $num;
		$output = "Browsers" . "/" . $vol .  "/" . $a . ".JPG";
		print $input . "=>";
		print $output . "\n";
		system("mv $input $output");
	}
}
