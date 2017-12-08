#!/usr/bin/perl

@list = `ls data1/corrections/markandeya/2/temp/done/pg*.pdf`;
$start = 657;
$pat  = "2a";

for($i=0;$i<@list;$i++)
{
	#print $list[$i];
	chop($list[$i]);
	$fname = $pat . get_name($start) . ".pdf";
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
		$str = "0" . $val;	
	}
	else
	{
		$str = $val;		
	}
	return $str;
}

