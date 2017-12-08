#!/usr/bin/perl

$numbers = "30|31|32|33|34|35|36|37|38|39";
%numbers_a=(
"30"=>"0",
"31"=>"1",
"32"=>"2",
"33"=>"3",
"34"=>"4",
"35"=>"5",
"36"=>"6",
"37"=>"7",
"38"=>"8",
"39"=>"9"
);

$swara = "25|41|45|6F|49|4E|6E|55|4F|59|61|65|69";
%swara_a=(
"25"=>"a",
"41"=>"A",
"45"=>"i",
"6F"=>"I",
"49"=>"u",
"4E"=>"U",
"6E"=>"Q",
"55"=>"e",
"4F"=>"E",
"59"=>"ai",
"61"=>"o",
"65"=>"O",
"69"=>"au",
);

$vyanjana = "64|D9|67|68|6A|6B|6C|6D|XX|71|72|74|76|77|78|79|7A|7B|7C|7D|7E|C1|B1|C5|C0|CC|70|B7|C0|3A|CD|C9|DD|D4";
%vyanjana_a = (
"64"=>"k",
"D9"=>"Ka",
"67"=>"g",
"68"=>"G",
"6A"=>"kn",
"6B"=>"c",
"6C"=>"C",
"6D"=>"ja",
"XX"=>"J",
"71"=>"cn",
"72"=>"Ta",
"74"=>"Th",
"76"=>"D",
"77"=>"Dh",
"78"=>"Na",
"79"=>"t",
"7A"=>"th",
"7B"=>"d",
"7C"=>"dh",
"7D"=>"n",
"7E"=>"p",
"C1"=>"P",
"B1"=>"ba",
"C5"=>"B",
"C0"=>"m",
"CC"=>"y",
"70"=>"r",
"B7"=>"la",
"C0"=>"v",
"3A"=>"sh", #B5
"CD"=>"S",
"C9"=>"s",
"DD"=>"h",
"D4"=>"L");

$ikara="D1|D8|D0|DC|E4|D7|D3|CA|xx|73|EF|DA|DB|78|BB|BC|AC|BA|BE|C4|D5|B2|AB|C6|CE|EE|B6|C6|FA|B8|FB|FD|F9";
%ikara_a = (
"D1" => "ki",
"D8" => "Ki",
"D0" => "gi",
"DC" => "Gi",
"D7" => "ci",
"E4" => "ci",
"D3" => "Ci",
"CA" => "ji",
"xx" => "Ji",
"73" => "Ti",
"EF" => "Thi",
"DA" => "Di",
"DB" => "Dhi",
"78" => "Ni",
"BB" => "ti",
"BC" => "thi",
"AC" => "di",
"BA" => "dhi",
"BE" => "ni",
"C4" => "pi",
"D5" => "Pi",
"B2" => "bi",
"AB" => "Bi",
"C6" => "mi",
"CE" => "yi",
"EE" => "ri",
"B6" => "li",
"C6" => "vi",
"FA" => "shi",
"B8" => "Si",
"FB" => "si",
"FD" => "hi",
"F9" => "Li");

$symbols = "D2|E2|C3|D6|A9|B0|F3|F2|B3|BD|EA|A3|F4|F1";
%symbols_a = (
"D2"=>"f",
"E2"=>"a",
"C3"=>"8", #connector
"D6"=>"A",
"A9"=>"V",
"B0"=>"u",
"F3"=>"6", #u
"F2"=>"7", #U
"B3"=>"U",
"BD"=>"q",
"EA"=>"e",
"A3"=>"9", #connector
"F4"=>"Y",
"F1"=>"w"
);

$vottu="22|F8|23|24|26|2a|2b|E6|40|42|43|44|46|47|48|4A|4B|4C|4D|50|51|52|53|E6|54|56|57|58|5A|F7|5B|5D|5E|5F|62|63|5C|A6|A7|A8|AD|AE|AF|BD|CB|DF|E0|E1|E3|E5|E7|E8|EB|EC";
%vottu_a = (
"22" => "kx",
"F8" => "kx",
"23" => "Kx",
"24" => "gx",
"26" => "Gx",
"2a" => "knx",
"2b" => "cx",
"E6" => "Cx",
"40" => "jx",
"42" => "Jx",
"43" => "cnx",
"44" => "Tx",
"46" => "Thx",
"47" => "Dx",
"48" => "Dhx",
"4A" => "Nx",
"4B" => "tx",
"4C" => "thx",
"4D" => "dx",
"50" => "dhx",
"51" => "nx",
"52" => "px",
"53" => "Px",
"E6" => "Px",
"54" => "bx",
"56" => "Bx",
"57" => "mx",
"58" => "yx",
"5A" => "rx",
"F7" => "rx",
"5B" => "lx",
"5D" => "vx",
"5E" => "shx",
"5F" => "Sx",
"62" => "sx",
"63" => "hx",
"5C" => "Lx",
"A6"=>"txyX",
"A7"=>"txqq",
"A8"=>"txyX",
"AD"=>"kxqq",
"AE"=>"txvX",
"AF"=>"kxqq",
"BD"=>"q",
"CB"=>"R",
"DF"=>"pxrX",
"E0"=>"6x",
"E1"=>"7x",
"E3"=>"8x",
"E5"=>"TxrX",
"E7"=>"txrX",
"E8"=>"txY",
"EB"=>"rxqq",
"EC"=>"sxqq",
"DE"=>"shirxV");

$special = "66|75|C2|C7|C8|CF";
%special_a=(
"66"=>"K",
"75"=>"j",
"C2"=>"T",
"C7"=>"N",
"C8"=>"l",
"CF"=>"b"
);

$anuswara = "AA";
$visarga = "FF";


#$str = 'n°IeUªÿ13 529 yâ½';
#$str = 'uÖ uê³C© Éê©îûpâ°Àâ Ìâ°mCÀâò %ĞQÍê³D©Àâ° }âç }âÀê³© }âÀâ°ÿ. ÀêôpÖgâX ÀêôpÖgâXÅâdÖ¦yâWmÌâÃÖ}â°ÅÖÆyâ uÖC}ÖÌâ° Æ{ÖXgâ°pâÀê© }âÀê³© }âÀâ°ÿ gâÅâË{â¶[ {âdâ_Ìâ°mCÀâ}â°Q |â]ªÉâ ';
#$str = 'Àê³©';
$str = 'Àâ°î©×gâÔê© Àâ°°ªyÖ{â Àâ°İâ¸ËgâÔâ³ Ayâ}â° ÅâgâÀâªyâ}ê© Àâ°°ayÖ{â ÅâgâÀâayâ}ê© Àâ°İâËgâÔâ3 Àâ°°ayÖ{â Àâ°°ªyÖ{â';
#$str = 'úZ©dâ½ÍÖJ~âËxÀâ°Éâ°K úZ©Éâ{â°$pâ°kâpâÇÖpâÆ}ÖM~âËxÀâ°Éâ°K eª yâyâbyÒ ÀâóËXm@İâzâË {âªÍâåÌâÃÖ ~â¬W¾©ª ÀÖpâÇê©}ê³M© ÉâKÉêWô ¾yâXª yâ]Àê°©ÀÖ{âXÉâKûW}âb¶· OÀÖ{ÖXdê³_J©Ìâ°Ëÿ';

		
@list = split(//,$str);
$prev = 0;
$kantex = "";
$vflag = 0;
$cons = 0;
$m_flag = 0;
$final_str = "";

for($i=0;$i<@list;$i++)
{
	$hex = DecToNumBase(ord($list[$i]), 16);
	$decimal = ord($list[$i]);
	#print $hex . "\n";
	if($list[$i] ne " ")
	{
		Convert_to_TeX($hex);
	}
	else
	{
		replace_reg();
		#print $list[$i];
		$final_str = $final_str . $list[$i];
		$vflag = 0;
		$cons = 0;
		$m_flag = 0;		
	}
}	

replace_reg();
print $final_str . "\n";

sub Convert_to_TeX()
{
	my($hex) = @_;

	if(is_swara($hex))
	{
		if($kantex ne "")
		{
			#print $kantex;
			$final_str = $final_str . $kantex;
		}
		if($hex ne "6E")
		{
			#print $swara_a{$hex};
			$final_str = $final_str . $swara_a{$hex};
			$kantex = "";
		}
		else
		{
			$kantex = $swara_a{$hex};
		}
		$prev = 1;
		$cons = 0;
	}
	elsif(is_symbol($hex))
	{
		if(($prev == 1) && ($hex =~ /B0|F3/))
		{
			$kantex = $kantex . "u";
			#print $kantex;
			$final_str  = $final_str . $kantex;
			$kantex = "";
		}
		elsif(($prev == 1) && ($hex =~ /F2|B3/))
		{
			$kantex = $kantex . "U";
			#print $kantex;
			$final_str  = $final_str . $kantex;
			$kantex = "";
		}
		elsif($prev == 2)
		{
			$kantex = $kantex . $symbols_a{$hex};
		}
		#~ elsif(($prev == 5) && ($kantex == "v") && ($symbols_a{$hex} == "a"))
		#~ {
			#~ $m_flag = 1;
			#~ $kantex = $kantex . $symbols_a{$hex};
			#~ $m_flag = 0;
		#~ }
		#~ elsif($m_flag)
		#~ {
			#~ $kantex =~ s/v/m/;
			#~ $kantex = $kantex . $symbols_a{$hex};
			#~ print $kantex;
			#~ $kantex = "";
		#~ }	
		else
		{
			$kantex = $kantex . $symbols_a{$hex}; 
		}
		$prev = 2;
	}
	elsif(is_MH($hex))	
	{
		replace_reg();
		if($hex eq "AA")
		{
			$kantex = $kantex . "M";
		}
		elsif($hex eq "FF")
		{
			$kantex = $kantex . "H";
		}
		#print $kantex;
		$final_str = $final_str . $kantex;
		$kantex = "";
		$prev = 3;
		$cons = 0;
	}
	elsif(is_number($hex))
	{
		replace_reg();
		$kantex = $numbers_a{$hex};
		#print $kantex;
		$final_str = $final_str . $kantex;
		$prev = 4;
		$kantex = "";
		$cons = 0;
	}
	elsif(is_vyanjana($hex))
	{
		replace_reg();
		$kantex = $vyanjana_a{$hex};
		$prev = 5;
		$cons = 0;
	}
	elsif(is_vottu($hex))
	{
		$cons++;
		if($cons > 1)
		{
			$tmp = $vottu_a{$hex};
			$tmp =~ s/x/X/;
			$kantex = $kantex . $tmp;
			$tmp = "";
		}
		else
		{
			$kantex = $kantex . $vottu_a{$hex};
		}
		$prev = 6;
	}
	elsif(is_ikara($hex))
	{
		replace_reg();
		#print $ikara_a{$hex};
		$final_str = $final_str . $ikara_a{$hex};
		$cons = 0; 
		$prev = 7;
	}
	elsif(is_special($hex))
	{
		replace_reg();
		$kantex = $special_a{$hex};
		$prev = 5;
		$cons = 0;		
	}
	
}

sub replace_reg()
{
	#print $kantex . "\n";
	if($kantex ne "")
	{
		if(($kantex =~ /^v|y/) && ($kantex =~ /auu|au|a8A|eU|eu/))
		{
			$kantex =~ s/v/m/;
			$kantex =~ s/auu/u/;
			$kantex =~ s/au/a/;
			$kantex =~ s/aU/U/;
			$kantex =~ s/aA/A/;
			$kantex =~ s/a8A/A/;
			$kantex =~ s/eU/o/;
			$kantex =~ s/eu/e/;
			$kantex =~ s/x Y/xY/;
			}
		else
		{
			$kantex =~ s/au/u/;
			$kantex =~ s/a6/u/;
			$kantex =~ s/a7/U/;
			$kantex =~ s/eU/o/;
			$kantex =~ s/9e/e/;
			$kantex =~ s/x Y/xY/;			
		}
		#print $kantex;
		$final_str = $final_str . $kantex;
		$kantex = "";
	}	
}

sub is_swara()
{
	my($hex) = @_;

	if($hex =~ /$swara/)
	{
		return(1);
	}
	else
	{
		return(0);
	}
}

sub is_vyanjana()
{
	my($hex) = @_;

	if($hex =~ /$vyanjana/)
	{
		return(1);
	}
	else
	{
		return(0);
	}
}

sub is_special()
{
	my($hex) = @_;

	if($hex =~ /$special/)
	{
		return(1);
	}
	else
	{
		return(0);
	}
}

sub is_vottu()
{
	my($hex) = @_;

	if($hex =~ /$vottu/)
	{
		return(1);
	}
	else
	{
		return(0);
	}
}

sub is_symbol()
{
	my($hex) = @_;

	if($hex =~ /$symbols/)
	{
		return(1);
	}
	else
	{
		return(0);
	}
}

sub is_MH()
{
	my($hex) = @_;

	if($hex =~ /AA|FF/)
	{
		return(1);
	}
	else
	{
		return(0);
	}
}

sub is_ikara()
{
	my($hex) = @_;

	if($hex =~ /$ikara/)
	{
		return(1);
	}
	else
	{
		return(0);
	}
}

sub is_number()
{
	my($hex) = @_;

	if($hex =~ /$numbers/)
	{
		return(1);
	}
	else
	{
		return(0);
	}
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
