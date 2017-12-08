#!/usr/bin/perl
@list1 = `ls -v Volumes`;
for($i=0;$i<@list1;$i++)
{
	chop ($list1[$i]);
	$vnum = $list1[$i];
	#print $vnum . "\n";
	
	@list2 = `ls -v Volumes/$vnum`;
	for($j=0;$j<@list2;$j++)
	{
		chop ($list2[$j]);
		$inum = $list2[$j];
		#print $inum . "\n";
	
		@list3 = `ls -v Volumes/$vnum/$inum`;
		for($k=0;$k<@list3;$k++)
		{
			chop ($list3[$k]);
			$file = $list3[$k];
			($page, $ext) = split('\.', $file);
			get_page($vnum, $inum, $page);
		}
	}

}

sub get_page()
{
	$host = "localhost";
	$db = "ias";
	$usr = "root";
	$pwd = "mysql";

	use DBI();
	my $dbh=DBI->connect("DBI:mysql:database=$db;host=$host","$usr","$pwd");

	my($vnum, $inum, $page) = @_;
	
	$sth = $dbh->prepare("select page from article where volume='$vnum'and issue='$inum'");
	$sth->execute();
	while($ref1 = $sth->fetchrow_hashref())
	{
		$volume1 = $ref1->{'volume'};
		$issue1 = $ref1->{'issue'};
		$page1 = $ref1->{'page'};
		print $volume1 . "=>" . $issue1 . "=>" . $page1 . "\n";
	}

}
