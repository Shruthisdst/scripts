#!/usr/bin/perl

#@list = `ls Rigveda/vol01/JPG/ Granthamala_JPG/14/30/pre_*.JPG`;
#@list = `ls Rigveda/vol35/JPG/test/pre_*.JPG`;
@list = `ls temp/*.JPG`;
$plate = "171";

$len = @list;

$qt = int($len / 26);
$rem = $len % 26;

if($rem > 0)
{
	$loops = $qt + 1;
}
else
{
	$loops = $qt;
}

$char = "96";
$idx = 0;

for($i=1;$i<=$loops;$i++)
{
	$char++;
	for($j=97;$j<=122;$j++)
	{
		chop($list[$idx]);
		
		$file =  $list[$idx];
		$file =~ s/(.*)\/(.*)/\1\//;
		$k = $j+1;
		$file = $file . $plate . chr($char) . chr($j) . "-" . chr($char)  . chr($k) . ".JPG";
		
		if($idx < $len)
		{
			print $list[$idx] . "-->" . $file . "\n";
			system("mv $list[$idx] $file");
			$idx++;		
		}
		else
		{
			last;
		}
		$j = $j+1;
	}
	
}

