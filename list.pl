#!/usr/bin/perl
my @numbers = `ls -v Volumes`;
for($i=0;$i<@numbers;$i++)
{
	chop ($numbers[$i]);
	$dir = $numbers[$i];

    my @numbers1 = `ls -v Volumes/$dir`;
    $lastNumber = 0;
    @result = ();

    for $currentNumber (@numbers1)
    {
        $min = $lastNumber + 1;
        $max = $currentNumber - 1;
        push @result,  ($min .. $max);
        $lastNumber = $currentNumber;
    }

    print "$dir"."->"."$_\n" for (@result);
}
