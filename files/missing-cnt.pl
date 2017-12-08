#!/usr/bin/perl
my @numbers = `ls -v Volumes_bundle`;
for($i=0;$i<@numbers;$i++)
{
	chop ($numbers[$i]);
	$dir = $numbers[$i];

    my @numbers1 = `ls -v Volumes_bundle/$dir`;
    for($j=0;$j<@numbers1;$j++)
	{
		chop ($numbers1[$j]);
		$iss = $numbers1[$j];
		
		my @numbers2 = `ls -v Volumes_bundle/$dir/$iss`;
		$lastNumber = 0;
		@result = ();

		for $currentNumber (@numbers2)
		{
			$min = $lastNumber + 1;
			$max = $currentNumber - 1;
			push @result,  ($min .. $max);
			$lastNumber = $currentNumber;
		}

		print "$dir"."->"."$iss"."->"."$_\n" for (@result);
	}
}

