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
	elsif($line =~ /<entry hassup="(.*)">/)
	{
		$hassup = $1;
		
	}
	elsif($line =~ /<page>(.*)<\/page>/)
	{
		$page = $1;
		if($hassup != 0)
		{
			get_dir($vnum_xml, $inum_xml, $page, $hassup);
		}
	}
	$line = <IN>;
}
close(IN);

sub get_dir()
{
	my($vnum_xml, $inum_xml, $page, $hassup) = @_;
	$temp = '';
	@list1 = `ls -v Volumes`;
	for($i=0;$i<@list1;$i++)
	{
		$vnum = $vnum_xml;
		
		@list2 = `ls -v Volumes/$vnum`;
		for($j=0;$j<@list2;$j++)
		{
			$inum = $inum_xml;
			
			@list3 = `ls -v Volumes/$vnum/$inum`;
			
			for($k=0;$k<@list3;$k++)
			{
				$dir = $page;
				$somedir = "Volumes/$vnum/$inum/$dir";
				
				if (-d $somedir)
				{
					#print "$file" . "\n";
					if($page != $temp)
					{
						#print $vnum . "->" . $inum . "->" . $page."\n";
						print "dir found -> " . $somedir . "->" . $hassup . "\n";
						$page = $temp;
					}
					
				}
				else
				{
					if($page != $temp)
					{
						#print $vnum . "->" . $inum . "->" . $page."\n";
						print "dir not found -> " . $somedir . "->" . $hassup . "\n";
						$page = $temp;
					}
				}
				
			}
		}
	}
}
