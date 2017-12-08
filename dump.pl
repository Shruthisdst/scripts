#!/usr/bin/perl
use Encode;
use utf8;


#$str = "देवनागरी लिपि  हैं";
#$str = "स्थितियों उर्दू";
#~ $str = "कम्प्यूटर";
#$str = "ರ‍್";
$str = "ಅಬಕಸ್‍";

#~ $str =~ s/ರ‍್/ರ್/;

@list = split(//,$str);

for($i=0;$i<@list;$i++)
{
	$hex = DecToNumBase(ord($list[$i]), 16);
	$decimal = ord($list[$i]);
	print $hex . "\n";
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