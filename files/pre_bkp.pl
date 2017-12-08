#!/usr/bin/perl

@list = `ls data1/Srimad_Bhagavata/01/temp/[0123]*_kantex.txt`;
@rep_line = ();

open(LOG,">preprocess.log") or die "Can't open preprocess.log\n";

for($i=0;$i<@list;$i++)
{
	#print $list[$i];
	chop($list[$i]);
	$newtxtfile = $list[$i];
	$newtxtfile =~ s/kantex/rep/;
	#print $list[$i] . "-->" . $newtxtfile . "\n";
	open(IN,"$list[$i]") or die "Can't open $list[$i]";
	open(OUT,">$newtxtfile") or die "Can't open $newtxtfile";
	
	@lines = <IN>;
	@rep_line = ();
	
	for($j=0;$j<@lines;$j++)
	{
		#print $lines[$j];
		chop($lines[$j]);
		if($lines[$j] =~ /"(.*)"/)
		{
			$str = $1;
			@list1 = split(/ /,$str);
			if(($str =~ /^([kKgGcCjJTDNtdnpPbBmyrlvsShL]+[xX])/) || ($str =~ /^(V|M|q|Y)/))
			{
				for($k=(@rep_line-1);$k>0;$k--)
				{
					#print $rep_line[$k] . "\n";
					if($rep_line[$k] =~ /"(.*)"/)
					{
						$temp = $1;
						if($temp ne "")
						{
							last;
						}
					}
				}
				if($k > 0)
				{
					$temp = $temp . $list1[0];
					$temp = rep_reg($temp);
					$list1[0] = "";
					$rep_line[$k] =~ s/"(.*)"/"$temp"/;
					$lines[$j] =~ s/"(.*)"/"@list1"/;
					push(@rep_line,$lines[$j]);
				}
				else
				{
					#print LOG $newtxtfile . "-->" . $lines[$j] . "\n"; --> debug
					push(@rep_line,$lines[$j]);
				}
				#print $lines[$j] . "-->" . $rep_line[$k] . "\n";
			}
			else
			{
				push(@rep_line,$lines[$j]);
			}
		}
		else
		{
			push(@rep_line,$lines[$j]);
		}
	}
	#$len1 = @lines;
	#$len2 = @rep_line;
	#if($len1 == $len2)
	#{
	for($l=0;$l<@rep_line;$l++)
	{
		if($rep_line[$l] =~ /"\\char'263"/)
		{	
			if($rep_line[$l-1] =~ /"(.*)"/)
			{
				$prv = $1;
				#print $prv . "\n";
			}
			if($rep_line[$l+1] =~ /"(.*)"/)
			{
				$nxt = $1;
				#print $nxt . "\n";
				@sprd = split(/ /,$nxt);
				$prv = $prv . "\\char'263" . $sprd[0];
				$sprd[0] = "";
				$rep_line[$l-1] =~ s/"(.*)"/"$prv"/;
				#print $rep_line[$l-1] . "\n";				
				$rep_line[$l+1] =~ s/"(.*)"/"@sprd"/;
			}
			$prv = "";
			$nxt = "";
			$rep_line[$l] =~ s/"(.*)"/""/;
			@sprd = ();
		}
	}
	@temp_line = ();
	for($l=0;$l<@rep_line;$l++)
	{	
		if($rep_line[$l] =~ /\(word ([0-9]+) ([0-9]+) ([0-9]+) ([0-9]+) ""\)/)
		{
			#print $rep_line[$l] . "\n";
			$x1 = $3;
			if($rep_line[$l-1] =~ /\(word ([0-9]+) ([0-9]+) ([0-9]+) ([0-9]+) "(.*)"\)/)
			{
				$x11 = $1;		
				$y11 = $2;
				$x12 = $x1;		
				$y12 = $4;
				$data = $5;
				$newstr = "\t(word $x11 $y11 $x12 $y12 \"$data\")";
				$rep_line[$l-1] = $newstr;
				$rep_line[$l] = "";
			}
		}
		else
		{
			push(@temp_line,$rep_line[$l]);
		}
	}	
	for($j=0;$j<@rep_line;$j++)
	{
		if($rep_line[$j] =~ /^$/)
		{
			
		}
		else
		{
			print OUT $rep_line[$j] . "\n";
		}
	}
	#}
	close(IN);
	close(OUT);
}

close(LOG);

sub rep_reg()
{
	my($temp_str) = @_;
	my($flag,$vyn);
	$temp_str =~ s/LxkX/kx/g;
	$temp_str =~ s/LxLX/Lx/g;
	$flag = 1;

	$vyn = "k|K|g|G|c|C|j|J|T|Th|D|Dh|N|t|th|d|dh|n|p|P|b|B|m|y|r|l|v|sh|S|s|h|L";

	$temp_str =~ s/($vyn)x($vyn)x($vyn)x/\1x\2X\3X/;
	$temp_str =~ s/($vyn)x($vyn)x($vyn)x/\1x\2X\3X/;
	$temp_str =~ s/($vyn)x($vyn)x($vyn)x/\1x\2X\3X/;
	$temp_str =~ s/($vyn)x($vyn)x/\1x\2X/;
	$temp_str =~ s/($vyn)x($vyn)x/\1x\2X/;
	$temp_str =~ s/($vyn)x($vyn)x/\1x\2X/;
	
	return($temp_str);	
}
