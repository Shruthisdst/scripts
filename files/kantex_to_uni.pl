#/usr/bin/perl

@list1 = `ls data1/corrections/homepage/*_rep.txt`;

for($k=0;$k<@list1;$k++)
{
	chop($list1[$k]);
	$infile = $list1[$k];
	$outfile = $list1[$k];
	$outfile =~ s/_rep\.txt/_uni.txt/;
	#print $infile . "-->" . $outfile . "\n";

open(IN,"$infile") or die "Can't open $infile";
open(OUT,">$outfile")  or die "Can't open $outfile";

$line = <IN>;

while($line)
{
	chop($line);
	if($line =~ /^select/)
	{
		print OUT $line . "\n";
	}	
	elsif($line =~ /"(.*)"/)
	{
		$str = $1;
		$uni_str1 = gen_unicode($str);
		$line =~ s/"(.*)"/"$uni_str1"/;
		print OUT $line . "\n";
		$str = "";
	}
	else
	{
		print OUT $line . "\n";
	}
	
$line = <IN>;	
}

close(IN);
close(OUT);	
	
}	



sub gen_unicode()
{
	
	my($kan_str) = @_;
	open(TMP, ">tmp.txt") or die "Can't open tmp.txt\n";
	my ($tmp,$flg,$i,$endash_uni,$endash,$flag);
	$flg = 1;

	$kan_str =~ s/LxLX/Lx/g;
	$kan_str =~ s/LxkX/kx/g;
	$kan_str =~ s/^C$/|/;
	$kan_str =~ s/CC/||/g;
	$kan_str =~ s/\\ralign\{(.*?)\}/!E! $ralign_btag !K! $1 !E! $ralign_etag !K! /g;
	$kan_str =~ s/\\char'263/!E!&#x0CBD;!K!/g;
	#$kan_str =~ s/VTi/V!E!&#x0CBD;!K!/g; #switch it on only if document contains Sanskrit shlokas
	$kan_str =~ s/\\char'365/!E!&#x0CC4;!K!/g;
	$kan_str =~ s/\\char'273/!E!&#x0CB1;!K!/g;
	$kan_str =~ s/\\s /!E!&#x0CBD;!K!/g;
	$kan_str =~ s/qq/q/g;
	$kan_str =~ s/R([kKgGcCjJTDNtdnpPbBmyrlvsShL]+[h]?)[xX]/\1xR/g;
	$kan_str =~ s/Rq/qR/g;
	$kan_str =~ s/RY/YR/g;
	$kan_str =~ s/eRrX/eRrx/g;
	$kan_str =~ s/RV/VR/g;
	
	$flag = 1;
	while($flag)
	{
		#print "HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH\n";
		if($kan_str =~ /\{\\rm (.*?)\}/)
		{
			$kan_str =~ s/\{\\rm (.*?)\}/!E!\1!K!/;
		}
		else
		{
			$flag = 0;
		}
	}
	
	#print $kan_str . "\n";
	
	#$endash = "&#x2014";
	#$endash_uni = chr(hex($endash));
	
	print TMP $kan_str;
	close(TMP);
	
	system("to_unicode4 tmp.txt > tmp1.txt");
	open(UN, "tmp1.txt") or die "Can't open tmp1.txt\n";	
	my $uni_str = <UN>;
	close(UN);
	
	#print FOUT $uni_str . "\n";
	
	
	
	my($decval,$val,$p);
	$uni_str =~ s/<br>//g;
	$uni_str =~ s/<\/br>//g;
	$uni_str =~ s/---/&#x2014;/g;
	$uni_str =~ s/--/&#x2013;/g;
	$uni_str =~ s/\|/&#x007C;/g;
	$uni_str =~ s/``/&#x201C;/g;	
	$uni_str =~ s/''/&#x201D;/g;
	$uni_str =~ s/`/&#x2018;/g;
	$uni_str =~ s/'/&#x2019;/g;
	$uni_str =~ s/&nbsp;/&#xa0;/g;
	#$uni_str =~ s/(&#x0CCD;)(&#x200C;)(&#x0C97;)(&#x0CCD;)/\1\3\4/;

	
		
	while($flg)
	{
		if($uni_str =~ /&#x([0-9A-F]+);/)
		{
			$val = $1;	
			$p = chr(hex($val));
			$uni_str =~ s/&#x$val;/$p/g;
		}
		else
		{
			$flg = 0;
		}
	}	

	#$uni_str =~ s/\bಸರ್‍\b/ಸರ್/g;
	return $uni_str;
}
