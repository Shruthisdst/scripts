#/usr/bin/perl

#$dir = "renpdf";
#@list = `ls test/bali_k/[012][pma]*.djvu`;

system("rm data1/corrections/homepage/*.txt");
#@list = `ls data/Purana_k/$dir/*.djvu`; #previous method
@list = `ls data1/corrections/homepage/*.pdf`;

for($i=0;$i<@list;$i++)
{
	chop($list[$i]);
	#print $list[$i];
	$txtfile = $list[$i];
	$txtfile =~ s/\.pdf/.txt/;
	print $list[$i] . "-->" . $txtfile. "\n";
	#system("djvutxt --detail=word $list[$i] $txtfile"); #previous method
	system("pdftotext -bbox -r 600  $list[$i] $txtfile");	
}
