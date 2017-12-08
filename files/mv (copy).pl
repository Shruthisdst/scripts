#!/usr/bin/perl
@list = `ls -v n1`;
for($i=0;$i<@list;$i++)
{
	chop ($list[$i]);
	$dir = $list[$i];
	
	@list1 = `ls US-001`;
	for($j=0;$j<@list1;$j++)
	{
		chop ($list1[$j]);
		$file = $list1[$j];
		if($file =~ /$dir[a-z]+/)
		{
			system("cp US-001/$file n1/$dir/$file");
		}
	}
}
