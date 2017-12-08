#!/usr/bin/perl

@list1 = `ls -v djvu`;
@list11 = `ls -v text`;
for($i=0;$i<@list1;$i++)
{
	chop ($list1[$i]);
	$vol1 = $list1[$i];
	system("mkdir text/$vol1");
	chop ($list11[$i]);
	$vol11 = $list11[$i];

	@list2 = `ls -v djvu/$vol1`;
	@list22 = `ls -v text/$vol11`;
	for($j=0;$j<@list2;$j++)
	{
		chop ($list2[$j]);
		$iss2 = $list2[$j];
		system("mkdir text/$vol1/$iss2");
		chop ($list22[$j]);
		$iss22 = $list22[$j];

		@list3 = `ls -v djvu/$vol1/$iss2`;
		for($k=0;$k<@list3;$k++)
		{
			chop ($list3[$k]);
			$file = $list3[$k];
			($p1, $p2) = split('\.', $file);
			
			if($file =~ /index/)
			{
				
			}
			else
			{
				print "djvused djvu" . "/" . $vol1 . "/" . $iss2 . "/" . $file;
				print " -e 'print-pure-txt' > text" . "/" . $vol1 . "/" . $iss2 . "/" . $p1 . ".txt" . "\n";
			}
		}
	}
}
