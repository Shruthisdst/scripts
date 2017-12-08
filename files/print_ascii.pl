#/usr/bin/perl

for($i=0;$i<255;$i++)
{
	$hex = DecToNumBase($i, 16);
	print $i . " ----> " . chr($i) . "\n";
}


sub DecToNumBase
{
  my $decNumber = $_[0];
  my $numBase = $_[1];
  my $numNumber = '';

  while($decNumber ne 'end') 
  {
    # divide the decimal number by $numBase and 
    # store the remainder (modulus function) in 
    # the temporary variable $temp
    my $temp = $decNumber % $numBase;
    if($temp > 9) 
    {
      $temp = chr($temp + 55);
    }
    $numNumber = $temp . $numNumber;
    $decNumber = int($decNumber / $numBase);
    if($decNumber < $numBase) 
    {
      if($decNumber > 9) 
      {
        $decNumber = chr($decNumber + 55);
      }
      $numNumber = $decNumber . $numNumber;
      $decNumber = 'end'; 
    } 
  }
  return $numNumber;
}
