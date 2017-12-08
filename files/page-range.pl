#!/usr/bin/perl

$host = "localhost";
$db = "vp";
$usr = "root";
$pwd = "mysql";
$volume = "015";
#~ $issue = "12";
$offSet = 2;

use DBI();

open(FILE,">:utf8", "files/$volume.xml") or die "can't open $volume.xml\n";
#~ open(FILE,">:utf8", "files/$volume\_$issue.xml") or die "can't open $volume.xml\n";

my $dbh=DBI->connect("DBI:mysql:database=$db;host=$host","$usr","$pwd") or die $DBI::errstr;
$dbh->{'mysql_enable_utf8'} = 1;
$dbh->do('set names utf8');

#~ print FILE "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
#~ <!DOCTYPE vp SYSTEM \"vp.dtd\">\n
#~ <vp>
print FILE "\t<volume vnum=\"$volume\">\n";

$sth22=$dbh->prepare("select distinct issue from article where volume = $volume;");
$sth22->execute();
while($ref22 = $sth22->fetchrow_hashref())
{
	$issue = $ref22->{'issue'};
	print $issue . "\n";
   
	$sth11=$dbh->prepare("select * from article where volume = $volume and issue = '$issue' order by page;");
	$sth11->execute();

	my @array = get_pages($volume,$issue);
	$fl = 1;

	for($i=0;$i<@array;$i++)
	{
		$ref11 = $sth11->fetchrow_hashref();
		$page = $ref11->{'page'};
		$pageEnd = $array[$i+1]-1;
		if($pageEnd >= $page)
		{
			$sPage =  $page+$offSet;
			$ePage =  $pageEnd+$offSet;
			$sPage = append_zeros($sPage);
			$ePage = append_zeros($ePage);
			$pageRange = $sPage . "-" . $ePage;
			#~ print $pageRange . "\n";
		}
		else
		{
			$sPage =  $page+$offSet;
			$sPage = append_zeros($sPage);
			$pageRange = $sPage . "-" . $sPage;
			#~ print $pageRange . "\n";
		}
		$issue = $ref11->{'issue'};
		$month = $ref11->{'month'};
		$year = $ref11->{'year'};
		$theme = $ref11->{'theme'};
		$title = $ref11->{'title'};
		$feature = $ref11->{'feature'};
		$text = $ref11->{'text'};
		$authid = $ref11->{'authid'};
		
		if($fl == 1)
		{
			print FILE "\t\t<issue inum=\"$issue\" month=\"$month\" year=\"$year\" theme=\"$theme\">\n";
			$fl = 0;
		}

		print FILE "\t\t\t<entry>
		\t\t<title>$title<\/title>
		\t\t<feature>$feature<\/feature>
		\t\t<text>$text<\/text>
		\t\t<page>$pageRange<\/page>\n";

		if($authid != 0)
		{
			print FILE "\t\t\t\t<allauthors>\n";
		
			$sth12=$dbh->prepare("select * from author where authid = $authid;");
			$sth12->execute();
			while($ref12 = $sth12->fetchrow_hashref())
			{
				$authName = $ref12->{'authorname'};
				$sal = $ref12->{'salutation'};
				print FILE "\t\t\t\t\t<author salut=\"$sal\">$authName<\/author>\n";
			}
			$sth12->finish();
			print FILE "\t\t\t\t<\/allauthors>\n";
		}
		else
		{
			print FILE "\t\t\t\t<allauthors \/>\n";
		}
		print FILE "\t\t\t<\/entry>\n";

	}
	$sth11->finish();
	print FILE "\t\t<\/issue>\n";
}

$sth22->finish();

print FILE "\t<\/volume>\n";
#~ <\/vp>\n";

close(FILE);

sub get_pages()
{
	my($volume,$issue) = @_;
	my($page) = @_;
	my @test;
	my($sth1,$ref1) = @_;
	$sth1=$dbh->prepare("select page from article where volume = $volume and issue = $issue order by page;");
	$sth1->execute(); 
	while ($page = $sth1->fetchrow_array())
	{
		$pageEnd = $page;
		push @test, $pageEnd;
	}
	return @test;
}


sub append_zeros()
{
	my($Page) = @_;
	if($Page < 10)
	{
		$Page = "000" . $Page;
	}
	elsif($Page < 100)
	{
		$Page = "00" . $Page;
	}
	elsif($Page < 1000)
	{
		$Page = "0" . $Page;
	}
	else
	{
		$Page = $Page;
	}
	return $Page;
}
