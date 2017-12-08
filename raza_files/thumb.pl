#!/usr/bin/perl
@list1 = `ls -v Brochures`;
for($i=0;$i<@list1;$i++)
{
	chop($list1[$i]);
	$vol = $list1[$i];
	
	@list2 = `ls -v Brochures/$vol`;
	for($j=0;$j<@list2;$j++)
	{
		chop ($list2[$j]);
		$iss = $list2[$j];
		#~ system("mkdir Brochures/$vol/$iss/thumbs");
		#~ @list3 = `ls -v Brochures/$vol/$iss/*.JPG`;
		@list3 = `ls -v Brochures/$vol/$iss/thumbs/`;
		for($k=0;$k<@list3;$k++)
		{
			chop ($list3[$k]);
			$file = $list3[$k];
			#~ print $file."\n";
			($p1, $p2) = split('\.', $file);
			
			#~ system("cp $file Brochures/$vol/$iss/thumbs");
			system("convert 'Brochures/$vol/$iss/thumbs/$p1.JPG[300x]' Brochures/$vol/$iss/thumbs/$p1.JPG");
			#~ system("convert -resize 1000x1000 $file $file");
		}
	}
}
