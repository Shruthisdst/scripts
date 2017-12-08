#!/usr/bin/perl

@list = `ls data/Mahabharata_k/Arjuna-k/tmp/pg*.pdf`;
$start = 5;

for($i=0;$i<@list;$i++)
{
	#print $list[$i];
	chop($list[$i]);
	$fname = "1m" . get_name($start) . ".pdf";
	$filename = $list[$i];
	$filename =~ s/pg_(.*)\.pdf/$fname/;
	print $list[$i] . "==>" . $filename . "\n";
	system("mv $list[$i] $filename");
	$start++;
}

sub get_name()
{
	my($val) = @_;
	my($str);
	if($val < 10)
	{
		$str = "000" . $val;	
	}
	elsif($val < 100)
	{
		$str = "00" . $val;	
	}
	elsif($val < 1000)
	{
		$str = $val;	
	}
	
	return $str;
}

