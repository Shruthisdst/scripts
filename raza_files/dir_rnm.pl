#!/usr/bin/perl
$path = 004;
@list1 = `ls -v $path`;
for($i=0;$i<@list1;$i++)
{
	chop ($list1[$i]);
	$file = $list1[$i];
	$cnt = $i+1;
	if($cnt < 10)
	{
		$a = "00" . $cnt;
	}
	elsif($cnt < 100)
	{
		$a = "0" . $cnt;
	}
	else
	{
		$a = $cnt;
	}
	print $path . "/" . $file . "=>" . $path . "/" . $a . "\n";
	#~ system("mv $path/$file test/$a");
}
