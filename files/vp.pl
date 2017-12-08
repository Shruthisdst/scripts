#!/usr/bin/perl
$host = "localhost";
$db = "vp";
$usr = "root";
$pwd = "mysql";

use DBI();


open(FILE,">:utf8", "test.xml") or die "can't open test.xml\n";

my $dbh=DBI->connect("DBI:mysql:database=$db;host=$host","$usr","$pwd") or die $DBI::errstr;
$dbh->{'mysql_enable_utf8'} = 1;
$dbh->do('set names utf8');


$sth1=$dbh->prepare("select * from article where volume = 001;");
$sth1->execute();
@test = ();
$offSet = 2;
print FILE "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE vp SYSTEM \"vp.dtd\">\n
<vp>
\t<volume vnum=\"001\">\n";
while($ref1 = $sth1->fetchrow_hashref())
{
    $issue = $ref1->{'issue'};
    $month = $ref1->{'month'};
    $year = $ref1->{'year'};
    $theme = $ref1->{'theme'};
    if($issue != $part)
	{
		print FILE "\t\t<issue inum=\"$issue\" month=\"$month\" year=\"$year\" theme=\"$theme\">\n";
    
		$sth11=$dbh->prepare("select * from article where volume = 001 and issue = 01 order by page;");
		$sth11->execute();
		while($ref11 = $sth11->fetchrow_hashref())
		{
			$vol = $ref11->{'volume'};
			$iss = $ref11->{'issue'};
			@test = print_pages($vol, $iss);
			$page = $ref11->{'page'};
			$title = $ref11->{'title'};
			$feature = $ref11->{'feature'};
			$text = $ref11->{'text'};
			$authid = $ref11->{'authid'};
			$page = $page - $offSet;
			if($page < 10)
			{
				$page = "000" . $page
			}
			elsif($page < 100)
			{
				$page = "00" . $page
			}
			elsif($page < 1000)
			{
				$page = "0" . $page
			}
			print FILE "\t\t\t<entry>
			\t<title>$title<\/title>
			\t<feature>$feature<\/feature>
			\t<text>$text<\/text>\n";
			
			
			
			#~ \t<page>$page<\/page>
			
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

		$part = $issue;
	}
	
    
}
print FILE "\t<\/volume>
<\/vp>";
$sth1->finish();

close(FILE);

sub print_pages()
{
	my($vol, $iss) = @_;
	print $vol ."\n";
	
	
}
