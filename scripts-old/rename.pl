#!/usr/bin/perl


$path="11";

$offset=586;

opendir(DIR, $path) or die("cannot open $path");
@dir=readdir(DIR);
@dir = sort(@dir);

if($offset>=1)
{
	for($i=@dir;$i>=1;$i--)
	{
		$fname = $dir[$i];
		$fname1 = $fname;
		$fname =~ s/CA_//g;
		
		if(($fname ne ".") && ($fname ne ".."))
		{
			@fn=split('\.',$fname);
			$fn1 = int($fn[0]) + $offset;

			if ($fn1 < 10)
			{
				$fn1 = "000".$fn1;
			}
			elsif ($fn1 < 100)
			{
				$fn1 = "00".$fn1;
			}
			elsif ($fn1 < 1000)
			{
				$fn1 = "0".$fn1;
			}

			print $fname1."->".$fn1.".djvu"."\n";
			system("mv $path/$fname1 $path/$fn1.djvu");
		}
	}
}
elsif($offset<1)
{
	for($i=1;$i<@dir;$i++)
	{
		$fname = $dir[$i];
		$fname1 = $fname;
		$fname =~ s/CA_//g;
		
		if(($fname ne ".") && ($fname ne ".."))
		{
			@fn=split('\.',$fname);
			
			$fn1 = int($fn[0]) + $offset;
	
			if ($fn1 < 10)
			{
				$fn1 = "000".$fn1;
			}
			elsif ($fn1 < 100)
			{
				$fn1 = "00".$fn1;
			}
			elsif ($fn1 < 1000)
			{
				$fn1 = "0".$fn1;
			}
			
			print $fname1."->".$fn1.".djvu"."\n";
			system("mv $path/$fname1 $path/$fn1.djvu");
		}
	}
}
