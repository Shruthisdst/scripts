#!/usr/bin/perl

open(IN,"bms.xml") or die "can't open bms.xml\n";
$line = <IN>;
while($line)
{
	if($line =~ /<volume vnum="(.*)">/)
	{
		$vnum_xml = $1;
	}
	elsif($line =~ /<issue inum="(.*)" month="(.*)" year="(.*)">/)
	{
		$inum_xml = $1;
	}
	elsif($line =~ /<page>(.*)<\/page>/)
	{
		$page_xml = $1;
		
	}
	elsif($line =~ /<\/entry>/)
	{
		get_page($vnum_xml, $inum_xml, $page_xml);
		
	}
	
	$line = <IN>;
}
close(IN);

sub get_page()
{
	my($vnum_xml, $inum_xml, $page_xml) = @_;
	print $vnum_xml, $inum_xml, $page_xml . "\n";
	$temp = '';
	@list1 = `ls -v Volumes`;
	for($i=0;$i<@list1;$i++)
	{
		chop ($list1[$i]);
		$vnum = $list1[$i];
		#print $vnum_xml . "\n";
		if($vnum_xml != $vnum)
		{
			#print $vnum_xml . "\n";
		}
		
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
				if($file != $temp)
				{
					#print $file."\n";
					$file = $temp;
				}
				
				
			}
		}
	}
}
