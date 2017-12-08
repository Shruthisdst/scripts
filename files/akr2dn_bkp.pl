#!/usr/bin/perl

use Encode;
use utf8;

$GrA = "44|4B|69|49|AE|70|50|5F|43|6C|4C|4F|76|68|79|59|63|AD|B3|75|4A|4D|3C|6D|23|25|24|4E|3E|56|B8|BF|BB|BD|A8|FB|FC|A1|D9|D2|D0|E9|D8|DE|E2|D4|3BC|CD|CA|D6|EF|F1|F0|EE|AC";
%GrA_a=('44'=>'a',
'4B'=>'kh',
'69'=>'g',
'49'=>'gh',
'AE'=>'c',
'70'=>'j',
'50'=>'jh',
'5F'=>'~n',
'43'=>'.n',
'6C'=>'t',
'4C'=>'th',
'4F'=>'dh',
'76'=>'n',
'68'=>'p',
'79'=>'b',
'59'=>'bh',
'63'=>'m',
'AD'=>'y',
'B3'=>'y',
'75'=>'l',
'4A'=>'v',
'4D'=>'"s',
'3C'=>'.s',
'6D'=>'s',
'23'=>'k.s',
'25'=>'j~n',
'24'=>'tr',
'4E'=>'r-',
'3E'=>'n',
'56'=>'nn',
'B8'=>'khr',
'BF'=>'hy',
'BB'=>'hv',
'BD'=>'"sc',
'A8'=>'dm',
'FB'=>'gr',
'FC'=>'jr',
'A1'=>'~nj',
'D9'=>'~nc',
'D8'=>'vn',
'D0'=>'dy',
'E9'=>'"sv',
'D2'=>'pr',
'DE'=>'"sr',
'E2'=>'jhr',
'D4'=>'',
'3BC'=>'"s', #'EA'=>'l',
'CD'=>'',
'CA'=>'tt',
'D6'=>'pr',
'EF'=>'hm',
'F1'=>'sr',
'F0'=>'str',
'EE'=>'Y',
'AC'=>'kr');

$GrB = "46|54|53|2A|ED|EC|22|5B|7B|6F|6A|6E|55|7D|BC|F9|E4|FA|B9|B2|D3|B1|DC|B6|DA|DB|E0|D7|B7|C6|C2|EA|CE|C7|C3|FF|F7|E4|B2|B1|AB";
%GrB_a = (
'46'=>'i',
'54'=>'U',
'53'=>'e',
'2A'=>'"n',
'ED'=>'ch',
'EC'=>'.t',
'22'=>'.th',
'5B'=>'.d',
'7B'=>'.dh',
'6F'=>'d',
'6A'=>'r',
'6E'=>'h',
'55'=>'L',
'7D'=>'l',
'BC'=>'hl',
'F9'=>'.t.th',
'E4'=>'.s.t',
'FA'=>'.d.dh',
'B9'=>'"nk,',
'B2'=>'"ng',
'D3'=>'dbh',
'B1'=>'"nkh',
'DC'=>'dv',
'B6'=>'.dh.dh',
'DA'=>'hn',
'DB'=>'hr',
'E0'=>'ddh',
'D7'=>'ddh',
'B7'=>'.d.d',
'C6'=>'.t.t',
'C2'=>'db',
'EA'=>'dr',
'CE'=>'dd',
'C7'=>'.th.th',
'C3'=>'dg',
'FF'=>'.s.th',
'F7'=>'.s.th',
'E4'=>'.s.t',
'B2'=>'"ng',
'B1'=>'"nkh',
'AB'=>'"ngh');

$GrC = "6B|48";
%GrC_a = (
'6B'=>'k',
'48'=>'ph');

$GrD = "AA|47|A9|3BC|A2|E7|DF|C8|E8|CB|EB|3A|21|27|28|29|2C|2D|2E|2F|3B|3F|60|7E|2013|2018|2019";
%GrD_a = (
'47'=>'u',
'AA'=>'rU',
'A9'=>'ru',
'3BC'=>'*',
'A2'=>'d.r',
'E7'=>'.a',
'DF'=>'.o',
'C8'=>'L',
'E8'=>'l.r',
'CB'=>'h.r',
'EB'=>'.h',
'3A'=>'.h',
'21'=>'!',
'27'=>'\'',
'28'=>'(',
'29'=>')',
'2C'=>',',
'2D'=>'-',
'2E'=>'. ',
'2F'=>'/',
'3B'=>';',
'3F'=>'?',
'60'=>'`',
'7E'=>'|',
'2013'=>'-',
'2018'=>'`',
'2019'=>'\'');

$GrE = "30|31|32|33|34|35|36|37|38|39";
%GrE_a = ('30'=>'0',
'31'=>'1',
'32'=>'2',
'33'=>'3',
'34'=>'4',
'35'=>'5',
'36'=>'6',
'37'=>'7',
'38'=>'8',
'39'=>'9');

$GrF = "26|3D|40|41|42|45|51|52|57|58|5A|5C|5D|5E|61|62|64|66|67|71|72|73|74|77|78|7A|7C|B4|CA|A5|E6|E5|A6|A7|E8|C5|C1|EF|CF";
%GrF_a = (
'26'=>'r',
'3D'=>'.r',
'40'=>'~a',
'41'=>'rxI.m',
'42'=>'/',
'45'=>'xi.m',
'51'=>'ai.m',
'52'=>'I.m',
'57'=>'e.m',
'58'=>'rxe.m',
'5A'=>'rxai.m',
'5C'=>'rxi.m',
'5D'=>'',
'5E'=>'r',
'61'=>'rxI',
'62'=>'.m',
'64'=>'&',
'66'=>'xi',
'67'=>'u',
'71'=>'xi',
'72'=>'I',
'73'=>'e',
'74'=>'U',
'77'=>'ai',
'78'=>'rxe',
'7A'=>'rxai',
'7C'=>'rxi',
'B4'=>'r',
'CA'=>'',
'A5'=>'rx.m',
'E6'=>'R',
'E5'=>'',
'A6'=>'',
'A7'=>'',
'E8'=>'U',
'C5'=>'',
'C1'=>'',
'EF'=>'',
'CF'=>'r');


#$filename = "sample_data/Document1.hnd";
$filename = "sample_data/arjuna-h.txt";
open(IN,"<:utf8","$filename") or die "can't open $filename";

$line = <IN>;

while($line)
{
	chop($line);
	#print $line . "\n";
	
	@list = split(//,$line);
	$final_str = "";
	$devtex = "";
	$danda = 0;
	for($i=0;$i<@list;$i++)
	{
		$hex = DecToNumBase(ord($list[$i]), 16);
		$decimal = ord($list[$i]);
		if($list[$i] eq " ")
		{
			replace_reg();
			$final_str = $final_str . " ";
		}
		else
		{
			Convert_to_Devnag($hex);
		}
	}
	replace_reg();
	print_line();
	$final_str = "";
	$line = <IN>;
}

if($devtex ne "")
{
	replace_reg();
	print_line();
}
close(IN);

sub print_line()
{
	#~ $final_str =~ s/[\s]*\.h-[\s]*/:-/g;	
	#~ $final_str =~ s/[\s]*\.h[\s]*/:/g;	
	$final_str =~ s/R\.d/R/g;	
	$final_str =~ s/aY/y/g;	
	$final_str =~ s/ttk/kt/g;	
	$final_str =~ s/tkk/tk/g;	
	$final_str =~ s/a&/&/g;	
	print $final_str . "\n";
}

sub Convert_to_Devnag()
{
	my($hex) = @_;
	
	if(is_GRA($hex))
	{
		#print $hex . "->" . $list[$i] . "->A\n"; 
		if($prev == 6 && $devtex !~ /xi/ && $devtex !~ /ra$/)
		{
			replace_reg();
			$devtex = $devtex . $GrA_a{$hex} . "x";
		}
		elsif(($prev == 6) && ($danda == 1))
		{
			#printdev();
			$devtex =~ s/a$/A/;
			replace_reg();
			$devtex = $devtex . $GrA_a{$hex} . "x";
		}
		elsif($prev == 99)
		{
			$devtex =~ s/x/$GrA_a{$hex}x/;
		}
		elsif(($devtex ne "") && ($danda > 1))
		{
			$devtex =~ s/a/A/;
			replace_reg();
			$devtex = $devtex . $GrA_a{$hex} . "x";
		}
		elsif(($devtex ne "") && ($prev == 2) && ($danda == 0) && ($devtex !~ /^e/))
		{
			replace_reg();	
			$devtex = $devtex . $GrA_a{$hex} . "x";
		}
		elsif(($devtex ne "") && ($prev =~ /1|2/) && ($danda == 0) && ($devtex !~ /^e/))
		{
			$devtex =~ s/x/$GrA_a{$hex}x/;
		}
		elsif( ($devtex ne "") && ($devtex =~ /x/) && ($danda == 0) && ($devtex =~ /^e/))
		{
			replace_reg();
			$devtex = $devtex . $GrA_a{$hex} . "x";
		}
		elsif( ($devtex ne "") && ($devtex =~ /x/) && ($danda == 0) )
		{
			$devtex =~ s/x/$GrA_a{$hex}x/;			
		}
		elsif(($devtex ne "") && ($prev =~ /1|2/))
		{
			replace_reg();
			$devtex = $devtex . $GrA_a{$hex} . "x";			
		}
		else
		{
			replace_reg();
			$devtex = $devtex . $GrA_a{$hex} . "x";			
		}
		$prev = 1;
	}
	elsif(is_GRB($hex))
	{
		#print $hex . "->" . $list[$i] . "->B\n";			
		if($prev == 99)
		{
			if($devtex =~ /x/)
			{
				$devtex =~ s/x/$GrB_a{$hex}x/;
			}
			else
			{
				$devtex =~ s/(.)(.*)/$1$GrB_a{$hex}$2/;
			}
		}		
		elsif($prev == 6 && $devtex !~ /xi/)
		{
			replace_reg();
			$devtex = $devtex . $GrB_a{$hex} . "xa";
		}
		elsif(($devtex ne "") && ($prev =~ /1/) && ($danda == 0))
		{
			if($devtex =~ /xi/)
			{
				$devtex =~ s/xi/$GrB_a{$hex}i/;
			}
			elsif($devtex =~ /x/)
			{
				$devtex =~ s/x/$GrB_a{$hex}xa/;
			}
			else
			{
				$devtex = $devtex . $GrB_a{$hex} . "xa";
			}
		}
		elsif(($devtex ne "") && ($prev == 2) && ($danda == 1))
		{
			$devtex =~ s/a/A/;
			replace_reg();
			$devtex = $devtex . $GrB_a{$hex} . "xa";
		}		
		elsif(($devtex ne "") && ($prev =~ /1|2/))
		{
			replace_reg();
			$devtex = $devtex . $GrB_a{$hex} . "xa";
		}
		elsif( ($devtex ne "") && ($devtex =~ /x/) )
		{
			#print $devtex . "\n";
			$devtex =~ s/x/$GrB_a{$hex}/;
		}
		else
		{
			$devtex = $devtex . $GrB_a{$hex} . "xa";
		}	
		$prev = 2;
		#print $devtex . "\n";
	}
	elsif(is_GRC($hex))
	{
		#print $hex . "->" . $list[$i] . "->B\n";
		if(($devtex ne "") && ($prev == 2) && ($danda == 0) && ($devtex !~ /^e/))
		{
			replace_reg();	
			$devtex = $devtex . $GrC_a{$hex} . "x";
		}		
		elsif(($devtex ne "") && ($prev =~ /1|2/) && ($danda == 0) && ($devtex !~ /^e/))
		{
			$devtex =~ s/x/$GrC_a{$hex}x/;
		}
		elsif(($devtex ne "") && ($prev =~ /1|2/))
		{
			replace_reg();
			$devtex = $devtex . $GrC_a{$hex} . "x";
		}
		elsif( ($devtex ne "") && ($devtex =~ /x/) && ($danda == 0))
		{
			#print $devtex . "\n";
			$devtex =~ s/x/$GrC_a{$hex}/;
		}
		else
		{
			replace_reg();
			$devtex = $devtex . $GrC_a{$hex} . "x" ;			
		}		
		$prev = 1;
	}
	elsif(is_GRD($hex))
	{
		#print $hex . "->" . $list[$i] . "->D\n";
		if($devtex ne "")
		{
			replace_reg();
			$devtex = $devtex . $GrD_a{$hex};
		}
		elsif( ($list[$i] =~ /[–!`(),-.\/;?'|‘’-]/) )
		{
			$devtex = $devtex . $GrD_a{$hex};
			replace_reg();
		}
		else
		{
			$devtex = $devtex . $GrD_a{$hex};
		}
		$prev = 4;
	}
	elsif(is_GRE($hex))
	{
		#print $hex . "->" . $list[$i] . "->E\n";			
		$devtex = $devtex . $GrE_a{$hex};		
		$prev = 5;
	}
	elsif(is_GRF($hex))
	{
		#print $hex . "->" . $list[$i] . "->F\n";
		if( ($prev == 2) && ($devtex =~ /^i/) && ($list[$i] eq "&"))
		{
			$devtex =~ s/ixa/I/; 
		}
		elsif($list[$i] eq "&")
		{			
			$devtex = "r" . $devtex;
		}
		elsif($hex eq "A5")
		{			
			$tmp_str = $devtex;
			$devtex = $GrF_a{$hex};
			$devtex =~ s/x/$tmp_str/;
			replace_reg();
			$tmp_str;
			$danda = 0;
		}
		elsif($hex eq "41")
		{			
			$tmp_str = $devtex;
			$tmp_str =~ s/(a|A)//;
			$devtex = $GrF_a{$hex};
			$devtex =~ s/x/$tmp_str/;
			replace_reg();
			$tmp_str = "";
			$danda = 0;
		}
		elsif($hex eq "58")
		{			
			$tmp_str = $devtex;
			$tmp_str =~ s/(.)(.*)/$1/;
			$devtex = $GrF_a{$hex};
			$devtex =~ s/x/$tmp_str/;
			replace_reg();
			$tmp_str = "";
			$danda = 0;
		}
		elsif($hex eq "78")
		{
			$tmp_str = $devtex;
			if($tmp_str =~ /x/)
			{
				$tmp_str =~ s/(.*)x(.*)/$1/;
			}
			else
			{
				$tmp_str =~ s/(.*).$/$1/;
			}
			$devtex = $GrF_a{$hex};
			$devtex =~ s/x/$tmp_str/;
			if( (($prev == 1) && ($danda == 2)) || (($prev == 2) && ($danda == 1)))
			{
				$devtex =~ s/e$/o/;
			}
			replace_reg();
			$tmp_str = "";
			$danda = 0;
		}
		elsif($hex eq "7A")
		{
			$tmp_str = $devtex;
			$tmp_str =~ s/(.*)x(.*)/$1/;
			$devtex = $GrF_a{$hex};
			$devtex =~ s/x/$tmp_str/;			
			replace_reg();
			$tmp_str = "";
			$danda = 0;
		}
		elsif(($hex eq "40") && ($devtex =~ /x/))
		{			
			if( ($danda == 1) && ($prev == 2) )
			{
				$devtex =~ s/.$/~o/;
			}
			elsif($devtex =~ /ax/)
			{
				$devtex =~ s/ax/~a/;
			}
			else
			{
				$devtex =~ s/.$/~a/;
			}
			replace_reg();
			$danda = 0;
		}
		elsif(($hex eq "40") && ($devtex !~ /^(a|A)/))
		{			
			$devtex =~ s/a$/~a/;
			$devtex =~ s/A$/~o/;
			replace_reg();
			$danda = 0;
		}
		elsif(($hex eq "40") && ($devtex =~ /^(a|A)/) && ($danda > 1))
		{			
			$devtex =~ s/^(a|A)/~o/;
			replace_reg();
			$danda = 0;
		}
		elsif(($hex eq "40") && ($devtex =~ /^(a|A)/) && ($danda == 1))
		{			
			$devtex =~ s/^(a|A)/~a/;
			replace_reg();
			$danda = 0;
		}
		elsif($hex eq "52")
		{			
			$devtex =~ s/(a|A)$/$GrF_a{$hex}/;
			replace_reg();
			$danda = 0;
		}
		elsif($list[$i] eq "a")
		{			
			$devtex = "r" . $devtex;
			$devtex =~ s/A/I/;
		}
		elsif( ($prev == 2) && ($devtex =~ /^e/) && ($list[$i] eq "s") && ($danda == 0))
		{
			$devtex =~ s/exa/ai/; 
		}
		elsif( ($prev == 1) && ($devtex =~ /^a/) && ($list[$i] eq "s") && ($danda == 2))
		{
			$devtex =~ s/a/o/; 
			$danda = 0;
		}
		elsif( ($prev == 1) && ($devtex =~ /^a/) && ($list[$i] eq "w") && ($danda == 2))
		{
			$devtex =~ s/a/au/; 
			$danda = 0;
		}
		elsif( ($danda >=1) && ($list[$i] =~ /[Efq|\\]/) )
		{			
			if( ($devtex ne "") && ($devtex =~ /A$/) && ($danda == 2))
			{
				if($prev != 2)
				{
					$devtex =~ s/A$/a/;
				}
				$danda--;
			}
			elsif( ($devtex ne "") && ($devtex =~ /A$/) && ($danda == 1) && ($prev == 2))
			{
				$devtex =~ s/A$/a/;
				$danda--;
			}
			elsif(($devtex =~ /^dr/) && ($danda == 1))
			{
				$devtex =~ s/A$/a/;
			}
			$danda--;
			replace_reg();
			$devtex = $GrF_a{$hex};
			$danda = 0;
		}
		elsif( ($prev == 1) && ($list[$i] eq "r"))
		{
			$devtex =~ s/x//;
			$devtex =~ s/(a|A)$/I/;
			$danda = 0;
		}
		elsif( ($prev == 2) && ($list[$i] eq "r"))
		{
			$devtex =~ s/x//;
			$devtex =~ s/(a|A)$/I/;
			$danda = 0;
		}
		elsif( ($prev == 6) && ($list[$i] eq "r"))
		{
			$devtex =~ s/(a|A)$/I/;
			$danda = 0;
		}
		elsif( ($prev == 1) && ($list[$i] eq "g") )
		{
			#print $devtex . "\n";
			$devtex =~ s/x//;
			$devtex =~ s/a$/u/;
			$danda = 0;
		}
		elsif( ($prev == 2) && ($list[$i] eq "g"))
		{
			$devtex =~ s/x//;
			$devtex =~ s/a$/u/;
			$danda = 0;
		}		
		elsif( ($prev == 1) && ($list[$i] =~ /t|Ò/) )
		{
			$devtex =~ s/x//;
			$devtex =~ s/a$/U/;
			$danda = 0;
		}
		elsif( ($prev == 2) && ($list[$i] =~ /t|Ò/))
		{
			$devtex =~ s/x//;
			$devtex =~ s/a$/U/;
			$danda = 0;
		}		
		elsif( ($prev == 6) && ($list[$i] =~ /t|Ò/))
		{
			$devtex =~ s/x//;
			$devtex =~ s/a$/U/;
			$danda = 0;
		}		
		elsif( ($prev == 1) && ($list[$i] eq "=") )
		{
			$devtex =~ s/x//;
			$devtex =~ s/a$/.r/;
			$danda = 0;
		}
		elsif( ($prev == 2) && ($list[$i] eq "="))
		{
			$devtex =~ s/x//;
			$devtex =~ s/a$/.r/;
			$danda = 0;
		}
		elsif( ($prev == 1) && ($list[$i] eq "s") && ($danda == 1))
		{
			$devtex =~ s/x//;
			$devtex =~ s/a$/e/;
			$danda = 0;
		}
		elsif( ($prev == 2) && ($list[$i] eq "s") && ($danda == 0))
		{
			$devtex =~ s/x//;
			$devtex =~ s/a$/e/;
			$danda = 0;
		}
		elsif( ($prev == 1) && ($list[$i] eq "s") && ($danda == 2))
		{
			$devtex =~ s/x//;
			$devtex =~ s/(a|A)$/o/;
			$danda = 0;
		}
		elsif( ($prev == 2) && ($list[$i] eq "s") && ($danda == 1))
		{
			$devtex =~ s/.$/o/;
			$devtex =~ s/x//;
			$danda = 0;
		}
		elsif( ($prev == 6) && ($list[$i] eq "s") && ($danda == 0) )
		{
			$devtex =~ s/(a|A)$/e/;
			$danda = 0;
		}		
		elsif( ($prev == 1) && ($list[$i] eq "w") && ($danda == 1))
		{
			$devtex =~ s/x//;
			$devtex =~ s/a$/ai/;
			$danda = 0;
		}
		elsif( ($prev == 2) && ($list[$i] eq "w") && ($danda == 0) )
		{
			$devtex =~ s/x//;
			$devtex =~ s/a$/ai/;
			$danda = 0;
		}
		elsif( ($prev == 1) && ($list[$i] eq "w") && ($danda == 2))
		{
			$devtex =~ s/x//;
			$devtex =~ s/(a|A)$/au/;
			$danda = 0;
		}
		elsif( ($prev == 2) && ($list[$i] eq "w") && ($danda == 1))
		{
			$devtex =~ s/x//;
			$devtex =~ s/(a|A)$/au/;
			$danda = 0;
		}
		elsif($hex =~ "B4|CF")
		{
			$devtex =~ s/x/$GrF_a{$hex}/;
			$danda = 0;
		}
		#~ elsif($list[$i] =~ /b|\[/)
		#~ {
			#~ $devtex = $devtex . $GrF_a{$hex};
			#~ replace_reg();
		#~ }
		else
		{
			if($GrF_a{$hex} eq "u")
			{
				$devtex =~ s/a$/u/;
			}
			elsif( ($GrF_a{$hex} eq "e.m") && ($prev == 1))
			{
				if($danda == 1)
				{
					$devtex =~ s/.$/e.m/;
				}
				elsif($danda == 2)
				{
					$devtex =~ s/.$/o.m/;
				}
			}
			elsif( ($GrF_a{$hex} eq "e.m") && ($prev == 2))
			{
				if($danda == 1)
				{
					$devtex =~ s/.$/o.m/;
				}
				else
				{
					$devtex =~ s/.$/e.m/;
				}
			}
			elsif( ($GrF_a{$hex} eq "ai.m") && ($prev == 1))
			{
				if($danda == 1)
				{
					$devtex =~ s/.$/ai.m/;
				}
				elsif($danda == 2)
				{
					$devtex =~ s/.$/au.m/;
				}
			}
			elsif( ($GrF_a{$hex} eq "ai.m") && ($prev == 2))
			{
				if($danda == 1)
				{
					$devtex =~ s/.$/au.m/;
				}
				else
				{
					$devtex =~ s/.$/ai.m/;
				}
			}
			elsif(($hex eq "5E") && ($devtex =~ /x/))
			{
				$devtex =~ s/x/$GrF_a{$hex}/;
			}
			elsif(($hex eq "5E") && ($devtex =~ /i$/))
			{
				$devtex =~ s/i/$GrF_a{$hex}i/;
			}
			else
			{
				$devtex = $devtex . $GrF_a{$hex};
				replace_reg();
			}
		}
		$prev = 6;
	}
	elsif(($hex eq "65") || ($hex eq "ED"))
	{
		$danda++;
		if(($danda == 1) && ($prev == 1) && ($devtex !~ /^a/) && ($devtex !~ /i|\.m/))
		{			
			$devtex = $devtex . "a";				
		}
		elsif(($danda == 2) && ($prev == 1))
		{			
			$devtex =~ s/x//;
			$devtex =~ s/a$/A/;
		}
		elsif(($danda == 1) && ($prev == 2))
		{
			$devtex =~ s/a$/A/;
		}
		#$prev = 7;
		#print "e->" . $danda . "\n";
	}
	elsif($hex eq "C0")
	{
		if($devtex =~ /^(k|ph)/)
		{
		}
		else
		{
			if($devtex =~ /^(ttxa)/)
			{
				$devtex =~ s/x/kx/;
			}
			elsif($devtex !~ /^r(k|ph)/)
			{
				$devtex =~ s/x/$1x/;
			}
		}
	}
	elsif($hex eq "2B")
	{
		if($devtex =~ /^tr/)
		{
			$devtex = ".r";
		}
	}
	elsif($hex eq "CC")
	{
		if($devtex =~ /^(k|ph)/)
		{
			$prev = 99;
			$devtex =~ s/a$//;
			$danda--;
		}
	}
}

sub replace_reg()
{
	#print "$devtex($danda)\n";
	if($danda == 2 && ($devtex !~ /^a/))
	{
		$devtex =~ s/^a/A/;
	}
	elsif($danda == 2 && ($devtex =~ /^a/))
	{
		$devtex =~ s/a/A/;
	}
	elsif($danda == 1 && ($prev == 2))
	{
		$devtex =~ s/a/A/;
	}
	elsif($danda > 2)
	{
		$devtex =~ s/a/A/;
	}
	$devtex =~ s/x//;
	$devtex =~ s/^ea/e/;
	$devtex =~ s/^ia/i/;
	$devtex =~ s/^ua/u/;
	$devtex =~ s/^Ua/U/;
	$final_str = $final_str . $devtex;
	$devtex = "";
	$danda = 0;
	$prev = 0;
}

sub is_GRA()
{
	my($hex) = @_;

	if($hex =~ /$GrA/)
	{
		return(1);
	}
	else
	{
		return(0);
	}
}

sub is_GRB()
{
	my($hex) = @_;

	if($hex =~ /$GrB/)
	{
		return(1);
	}
	else
	{
		return(0);
	}
}

sub is_GRC()
{
	my($hex) = @_;

	if($hex =~ /$GrC/)
	{
		return(1);
	}
	else
	{
		return(0);
	}
}

sub is_GRD()
{
	my($hex) = @_;

	if($hex =~ /$GrD/)
	{
		return(1);
	}
	else
	{
		return(0);
	}
}

sub is_GRE()
{
	my($hex) = @_;

	if($hex =~ /$GrE/)
	{
		return(1);
	}
	else
	{
		return(0);
	}
}

sub is_GRF()
{
	my($hex) = @_;

	if($hex =~ /$GrF/)
	{
		return(1);
	}
	else
	{
		return(0);
	}
}

sub DecToNumBase()
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

sub printdev()
{
	print $devtex . "($danda-$prev)\n";
	
}

#X, Z pending
