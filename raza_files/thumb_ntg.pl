#!/usr/bin/perl
@list1 = `ls -v Natarang`;
for($i=0;$i<@list1;$i++)
{
	chop($list1[$i]);
	$vol = $list1[$i];
	
	@list2 = `ls -v Natarang/$vol`;
	for($j=0;$j<@list2;$j++)
	{
		chop ($list2[$j]);
		$iss = $list2[$j];
		system("mkdir Natarang/$vol/$iss/thumbs");

		@list3 = `ls -v Natarang/$vol/$iss/`;
		for($k=0;$k<@list3;$k++)
		{
			chop ($list3[$k]);
			$file = $list3[$k];
			($p1, $p2) = split('\.', $file);
			if($file =~ /md[0-9]*/)
			{
				
			}
			else
			{
				system("convert Natarang/$vol/$iss/$file -resize 300x  Natarang/$vol/$iss/thumbs/$file");
				system("convert Natarang/$vol/$iss/$file -resize 1000x1000  Natarang/$vol/$iss/$file");
				system("convert Natarang/$vol/$iss/$file Natarang/$vol/$iss/$p1.pdf");
			}
		}
		system("pdftk Natarang/$vol/$iss/*.pdf cat output Natarang/$vol/$iss/index.pdf");
	}
}
