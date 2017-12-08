#!/usr/bin/perl

@list = `ls -v bb`;
$cnt = 245;
if($cnt < 1000)
{
	$cnt = "0" . $cnt;
}
for($i=0;$i<@list;$i++)
{
	chop($list[$i]);
	$file = $list[$i];
	
	print $file . "=>" . $cnt . "\n";
	system("mv bb/$file 02/$cnt.djvu");
	$cnt++;
}
