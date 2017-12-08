#!/usr/bin/perl

@list1 = `ls -v Unsorted/`;
for($i=0;$i<@list1;$i++)
{
	chop ($list1[$i]);
	$vol = $list1[$i];

	@list2 = `ls -v Unsorted/$vol`;
	for($j=0;$j<@list2;$j++)
	{
		chop ($list2[$j]);
		$iss = $list2[$j];
		$index = "Unsorted" . "/" . $vol . "/" . "index.JPG";
		
		
		
		@list3 = `ls -v Unsorted/$vol/$iss/`;
		for($k=0;$k<@list3;$k++)
		{
			chop ($list3[$k]);
			$file = $list3[$k];
			$input = "Unsorted" . "/" . $vol . "/" . $iss . "/" . $file;
			print $input . "\n";
			system("convert -units PixelsPerInch $input -density 400 $input");
		}
		print $index."\n";
		system("convert -units PixelsPerInch $index -density 400 $index");
	}
}
