#!/usr/bin/perl

@list1 = `ls -v Book`;
for($i=0;$i<@list1;$i++)
{
	chop ($list1[$i]);
	$file = $list1[$i];
	print $file."=>";
	$file =~ s/B-//;
	$file1 = $file;
	print $file . "\n";
	system("mv Book/$file Book/$file1");
}
