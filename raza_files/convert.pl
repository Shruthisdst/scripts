#!/usr/bin/perl

@list1 = `ls -v Articles/`;
for($i=0;$i<@list1;$i++)
{
	chop ($list1[$i]);
	$vol = $list1[$i];

	@list2 = `ls -v Articles/$vol/`;
	for($j=0;$j<@list2;$j++)
	{
		chop ($list2[$j]);
		$iss = $list2[$j];

		@list3 = `ls -v Articles/$vol/$iss/`;
		for($k=0;$k<@list3;$k++)
		{
			chop ($list3[$k]);
			$num = $list3[$k];
			print $num . "\n";

			#~ $num =~ s/\(/\\(/g;
			#~ $num =~ s/\)/\\)/g;
			#~ $index = "Articles" . "/" . $vol . "/" . $iss . "/" . "index.JPG";
			#~ system("convert -units PixelsPerInch $index -density 400 $index");
			@list4 = `ls -v Articles/$vol/$iss/$num/`;

			for($l=0;$l<@list4;$l++)
			{
				chop ($list4[$l]);
				$file = $list4[$l];
				$input = "Articles" . "/" . $vol . "/" . $iss . "/" . $num . "/" . $file;
				#~ print $input . "\n";
				#~ system("convert -units PixelsPerInch $input -density 400 $input");
			}
		}
	}
}
