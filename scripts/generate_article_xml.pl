#!/usr/bin/perl

$host = $ARGV[0];
$db = $ARGV[1];
$usr = $ARGV[2];
$pwd = $ARGV[3];
$jcode = $ARGV[4];

use Encode;
use utf8;
use DBI();
use JSON;
use Unicode::String qw(utf8 latin1 utf16be);
#~ use open qw/ :std :encoding(utf-8) /;


$volumesPath = "/var/www/html/ias/public/Volumes";
%jtitle=(
'boms' => 'Bulletin of Materials Science',
'joaa' => 'Journal of Astrophysics and Astronomy',
'jbsc' => 'Journal of Biosciences',
'jcsc' => 'Journal of Chemical Sciences',
'jess' => 'Journal of Earth System Science',
'jgen' => 'Journal of Genetics',
'pram' => 'Pramana',
'pmsc' => 'Proceedings – Mathematical Sciences',
'reso' => 'Resonance',
'sadh' => 'Sadhana'
);

%jmetaData=(
'boms' => "\t\t<journal-meta>
			<journal-id>boms</journal-id>
			<journal-title-group>
				<journal-title>Bulletin of Materials Science</journal-title>
				<abbrev-journal-title abbrev-type=\"iso4\">Bull. Mater. Sci.</abbrev-journal-title>
			</journal-title-group>
			<issn pub-type=\"print\">0250-4707</issn>
			<issn pub-type=\"electronic\">0973-7669</issn>
			<publisher>
				<publisher-name>Indian Academy of Sciences</publisher-name>
				<publisher-loc>Bengaluru</publisher-loc>
			</publisher>
		</journal-meta>",
'joaa' => "\t\t<journal-meta>
			<journal-id>joaa</journal-id>
			<journal-title-group>
				<journal-title>Journal of Astrophysics and Astronomy</journal-title>
				<abbrev-journal-title abbrev-type=\"iso4\">J. Astrophys. Astr.</abbrev-journal-title>
			</journal-title-group>
			<issn pub-type=\"print\">0250-6335</issn>
			<issn pub-type=\"electronic\">0973-7758</issn>
			<publisher>
				<publisher-name>Indian Academy of Sciences</publisher-name>
				<publisher-loc>Bengaluru</publisher-loc>
			</publisher>
		</journal-meta>",
'jbsc' => "\t\t<journal-meta>
			<journal-id>jbsc</journal-id>
			<journal-title-group>
				<journal-title>Journal of Biosciences</journal-title>
				<abbrev-journal-title abbrev-type=\"iso4\">J. Biosci.</abbrev-journal-title>
			</journal-title-group>
			<issn pub-type=\"print\">0250-5991</issn>
			<issn pub-type=\"electronic\">0973-7138</issn>
			<publisher>
				<publisher-name>Indian Academy of Sciences</publisher-name>
				<publisher-loc>Bengaluru</publisher-loc>
			</publisher>
		</journal-meta>",
'jcsc' => "\t\t<journal-meta>
			<journal-id>jcsc</journal-id>
			<journal-title-group>
				<journal-title>Journal of Chemical Sciences</journal-title>
				<abbrev-journal-title abbrev-type=\"iso4\">J. Chem. Sci.</abbrev-journal-title>
			</journal-title-group>
			<issn pub-type=\"print\">0974-3626</issn>
			<issn pub-type=\"electronic\">0973-7103</issn>
			<publisher>
				<publisher-name>Indian Academy of Sciences</publisher-name>
				<publisher-loc>Bengaluru</publisher-loc>
			</publisher>
		</journal-meta>",
'jess' => "\t\t<journal-meta>
			<journal-id>jess</journal-id>
			<journal-title-group>
				<journal-title>Journal of Earth System Science</journal-title>
				<abbrev-journal-title abbrev-type=\"iso4\">J. Earth Syst. Sci.</abbrev-journal-title>
			</journal-title-group>
			<issn pub-type=\"print\">0253-4126</issn>
			<issn pub-type=\"electronic\">0973-774X</issn>
			<publisher>
				<publisher-name>Indian Academy of Sciences</publisher-name>
				<publisher-loc>Bengaluru</publisher-loc>
			</publisher>
		</journal-meta>",
'jgen' => "\t\t<journal-meta>
			<journal-id>jgen</journal-id>
			<journal-title-group>
				<journal-title>Journal of Genetics</journal-title>
				<abbrev-journal-title abbrev-type=\"iso4\">J. Genet.</abbrev-journal-title>
			</journal-title-group>
			<issn pub-type=\"print\">0022-1333</issn>
			<issn pub-type=\"electronic\">0973-7731</issn>
			<publisher>
				<publisher-name>Indian Academy of Sciences</publisher-name>
				<publisher-loc>Bengaluru</publisher-loc>
			</publisher>
		</journal-meta>",
'pram' => "\t\t<journal-meta>
			<journal-id>pram</journal-id>
			<journal-title-group>
				<journal-title>Pramana</journal-title>
				<abbrev-journal-title abbrev-type=\"iso4\">Pramana &#x2014; J. Phys.</abbrev-journal-title>
			</journal-title-group>
			<issn pub-type=\"print\">0304-4289</issn>
			<issn pub-type=\"electronic\">0973-7111</issn>
			<publisher>
				<publisher-name>Indian Academy of Sciences</publisher-name>
				<publisher-loc>Bengaluru</publisher-loc>
			</publisher>
		</journal-meta>",
'pmsc' => "\t\t<journal-meta>
			<journal-id>pmsc</journal-id>
			<journal-title-group>
				<journal-title>Proceedings – Mathematical Sciences</journal-title>
				<abbrev-journal-title abbrev-type=\"iso4\">Proc. Indian Acad. Sci. (Math. Sci.)</abbrev-journal-title>
			</journal-title-group>
			<issn pub-type=\"print\">0253-4142</issn>
			<issn pub-type=\"electronic\">0973-7685</issn>
			<publisher>
				<publisher-name>Indian Academy of Sciences</publisher-name>
				<publisher-loc>Bengaluru</publisher-loc>
			</publisher>
		</journal-meta>",
'reso' => "\t\t<journal-meta>
			<journal-id>reso</journal-id>
			<journal-title-group>
				<journal-title>Resonance</journal-title>
				<abbrev-journal-title abbrev-type=\"iso4\">Resonance</abbrev-journal-title>
			</journal-title-group>
			<issn pub-type=\"print\">0971-8044</issn>
			<issn pub-type=\"electronic\">0973-712X</issn>
			<publisher>
				<publisher-name>Indian Academy of Sciences</publisher-name>
				<publisher-loc>Bengaluru</publisher-loc>
			</publisher>
		</journal-meta>",
'sadh' => "\t\t<journal-meta>
			<journal-id>sadh</journal-id>
			<journal-title-group>
				<journal-title>Sadhana</journal-title>
				<abbrev-journal-title abbrev-type=\"iso4\">Sadhana</abbrev-journal-title>
			</journal-title-group>
			<issn pub-type=\"print\">0256-2499</issn>
			<issn pub-type=\"electronic\">0973-7677</issn>
			<publisher>
				<publisher-name>Indian Academy of Sciences</publisher-name>
				<publisher-loc>Bengaluru</publisher-loc>
			</publisher>
		</journal-meta>"
);


%date_short=(
'M' => 'Manuscript Received',
'R' => 'Manuscript Revised',
'A' => 'Accepted',
'E' => 'Early Publication',
'U' => 'Unedited version published online'
);

$preamble = '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE article PUBLIC "-//NLM//DTD JATS (Z39.96) Journal Publishing DTD v1.1d3 20150301//EN" "JATS-journalpublishing1.dtd">
<article>
	<front>
';

$postinfo = '	</front>
</article>
';

my $dbh=DBI->connect("DBI:mysql:database=$db;host=$host","$usr","$pwd",{ mysql_enable_utf8 => 0 });
#my $dbh=DBI->connect("DBI:mysql:database=$db;host=$host","$usr","$pwd");

$sth_enc=$dbh->prepare("set names utf8mb4");
$sth_enc->execute();
$sth_enc->finish();

$sth=$dbh->prepare("select * from article where volume='085' and issue='03' and page='0467-0472'");
$sth->execute();

while($ref=$sth->fetchrow_hashref())
{
	##Article information from article table
	
	$journal = $ref->{'journal'};
	$id = $ref->{'id'};
	$volume = $ref->{'volume'};
	$issue = $ref->{'issue'};
	$month = $ref->{'month'};
	$year = $ref->{'year'};
	$info = $ref->{'info'};
	$hassup = $ref->{'hassup'};
	$title = $ref->{'title'};
	$feature = $ref->{'feature'};
	$page = $ref->{'page'};
	$abstract = $ref->{'abstract'};
	$keywords = $ref->{'keywords'};
	$authors = $ref->{'authors'};
	
	$authors =~ s/’/'/g;
	
	#print $authors;
	
	$dates = $ref->{'dates'};

	##########################################

	($fpage,$lpage) = split(/-/,$page);

	$fileName = $volumesPath . "/" . $journal . "/" . $volume . "/" . $issue . "/" . $page . ".xml"; 
	$folderName = $volumesPath . "/" . $journal . "/" . $volume . "/" . $issue . "/" . $page;

	print $id . "\n";
	open(OUT, ">$fileName") or die "Can't open $fileName\n";
	print OUT $preamble;

	##printing journal meta data -> specific to journal

	print OUT $jmetaData{$jcode} . "\n";

	#~ print OUT "\t\t<journal-meta>\n";
	#~ print OUT "\t\t\t<journal-id journal-id-type=\"boms\">" . $journal . "</journal-id>\n";
	#~ print OUT "\t\t\t<journal-title-group>\n";
	#~ print OUT "\t\t\t\t<journal-title>". $jtitle{$journal} ."</journal-title>\n";
	#~ print OUT "\t\t\t\t<abbrev-journal-title abbrev-type=\"ias_ta\">" . $journal . "</abbrev-journal-title>\n";
	#~ print OUT "\t\t\t</journal-title-group>\n";
	#~ print OUT "\t\t\t<publisher>\n";
	#~ print OUT "\t\t\t\t<publisher-name>IAS</publisher-name>\n";
	#~ print OUT "\t\t\t</publisher>\n";
	#~ print OUT "\t\t</journal-meta>\n";

	##printing Article meta data -> specific to Article
	print OUT "\t\t<article-meta>\n";
	print OUT "\t\t\t<article-id pub-id-type=\"ias\">" . $id . "</article-id>\n";

	#Article category -> we may have to change this part later
	if($feature ne "")
	{
		print OUT "\t\t\t<article-categories>\n";
		print OUT "\t\t\t\t<series-title>". $feature ."</series-title>\n";
		print OUT "\t\t\t</article-categories>\n";
	}
	else
	{
		print OUT "\t\t\t<article-categories />\n";		
	}

	#Article title
	print OUT "\t\t\t<title-group>\n";
	print OUT "\t\t\t\t<article-title>". $title ."</article-title>\n";
	print OUT "\t\t\t</title-group>\n";

	#printing Article Authors

	$decoded1 = decode_json($authors);

	my @authors1 = @{$decoded1};

	$count = 1;
	%affiliations = ();

	if(@authors1 > 0)
	{

		print OUT "\t\t\t<contrib-group>\n";

		foreach my $f1 ( @authors1 ) 
		{

			print OUT "\t\t\t\t<contrib contrib-type=\"author\">\n";
			print OUT "\t\t\t\t\t<name>\n";
			print OUT "\t\t\t\t\t\t<surname>". $f1->{"name"}{"last"} ."</surname>\n";
			print OUT "\t\t\t\t\t\t<given-names>". $f1->{"name"}{"first"} ."</given-names>\n";
			print OUT "\t\t\t\t\t</name>\n";
			print OUT "\t\t\t\t\t<string-name>". $f1->{"name"}{"full"} ."</string-name>\n";
			#print OUT "\t\t\t\t\t<role />\n";		
			
			%email_hash = %{$f1->{"email"}};
			@email_hash_keys = keys %email_hash;
			
			if(@email_hash_keys > 0)
			{
				for my $email_key(keys %email_hash)
				{
					print OUT "\t\t\t\t\t<email>" . $email_hash{$email_key} . "</email>\n";
				}		
			}
			else
			{
				print OUT "\t\t\t\t\t<email />\n";
			}			
			%hash = %{$f1->{"affiliation"}};

			@hash_keys = keys %hash;

			for($i=0;$i<@hash_keys;$i++)
			{
				$found = 0;
				for my $tempkey (keys %affiliations)
				{
					if($affiliations{$tempkey} eq $hash{$i})
					{
						$found = 1;
						$found_key = $tempkey;
						#print $tempkey . "\n";
						last;
					}
				}
				if(!$found)
				{
					$newkey = "aff-" . $count;
					$count++;
					$affiliations{$newkey} = utf8($hash{$i});
					print $newkey . " -> " . $affiliations{$newkey} . "\n";
					print OUT "\t\t\t\t\t<xref ref-type=\"aff\" rid=\"". $newkey ."\"/>\n";
				}
				else
				{
					print OUT "\t\t\t\t\t<xref ref-type=\"aff\" rid=\"". $found_key ."\"/>\n";			
				}
			} 
			
			print OUT "\t\t\t\t</contrib>\n";
		}

		@affiliations_keys = keys %affiliations;

		for($i=1;$i<=@affiliations_keys;$i++)
		{
			$tempkey = "aff-" . $i;
			$affiliation = $affiliations{$tempkey};
			$affiliation =~ s/&/&amp;/g;
			print OUT "\t\t\t\t<aff id=\"". $tempkey ."\">". $affiliation. "</aff>\n";
		}

		print OUT "\t\t\t</contrib-group>\n";
		
		%hash=();
		@hash_keys=();
		%affiliations=();
		@affiliations_keys=();
		%email_hash=();
		@email_hash_keys=();
	}
	else
	{
		print OUT "\t\t\t<contrib-group />\n";
	}	

	
	#print publication date -> date of publication of this journal
	#No data is available for day.
	print OUT "\t\t\t<pub-date date-type=\"published\">\n";
	print OUT "\t\t\t\t<string-date>".$year. "-" . $month . "-" . "00" . "</string-date>\n";
	#~ print OUT "\t\t\t\t<month>" . $month . "</month>\n";
	#~ print OUT "\t\t\t\t<year>" . $year . "</year>\n";
	print OUT "\t\t\t</pub-date>\n";
		
	print OUT "\t\t\t<volume>" . $volume . "</volume>\n";
	print OUT "\t\t\t<issue>" . $issue . "</issue>\n";
	
	if($info ne "")
	{
		print OUT "\t\t\t<issue-title>". $info ."</issue-title>\n";		
	}
	else
	{
		print OUT "\t\t\t<issue-title />\n";		
	}
	
	if($hassup)
	{
		if( -d $folderName)
		{
			opendir my $dir, $folderName or die "Cannot open directory: $!";
			my @files_list = readdir $dir;
			for($j = 0; $j<@files_list; $j++)
			{
				if( ($files_list[$j] ne ".") && ($files_list[$j] ne "..") )
				{ 
					my ($ext) = $files_list[$j] =~ /\.([^.]+)$/;
					print OUT "\t\t\t<supplementary-material xlink:href=\"". $files_list[$j] ."\" />\n";
				}
			}
			closedir $dir;
		}
	}
	else
	{
		print OUT "\t\t\t<supplementary-material />\n";		
	}

	print OUT "\t\t\t<page-range>" . $fpage . "-" . $lpage . "</page-range>\n";	
	#~ print OUT "\t\t\t<lpage>" . $lpage . "</lpage>\n";	

	#printing dates 
	if($dates ne "[]")
	{
		$dates  =~ s/\{//;
		$dates  =~ s/\}//;
		$dates  =~ s/"//g;

		@dates_list = split(/,/,$dates);
		
		print OUT "\t\t\t<history>\n";
		
		for($i=0;$i<@dates_list;$i++)
		{
			@tmp  = split(/:/,$dates_list[$i]);
			#print $tmp[0] . " -> " . $tmp[1] . "\n";
			print OUT "\t\t\t\t<date date-type=\"". $date_short{$tmp[0]} ."\">\n";
			@dateFields = split(/-/,$tmp[1]);
			print OUT "\t\t\t\t\t<string-date>". $dateFields[0] ."-" . $dateFields[1] . "-" . $dateFields[2] . "</string-date>\n";
			#~ print OUT "\t\t\t\t\t<day>". $dateFields[2] ."</day>\n";
			#~ print OUT "\t\t\t\t\t<month>". $dateFields[1] ."</month>\n";
			#~ print OUT "\t\t\t\t\t<year>". $dateFields[0] ."</year>\n";
			print OUT "\t\t\t\t</date>\n";
		}
		
		print OUT "\t\t\t</history>\n";
	}
	else
	{
		print OUT "\t\t\t<history />\n";	
	}
	#printing abstract
	if($abstract ne "")
	{		
		$abstract =~ s/<ul>/<list list-type="bullet">/g;
		$abstract =~ s/<\/ul>/<\/list>/g;
		$abstract =~ s/<ol>/<list list-type="ordered">/g;
		$abstract =~ s/<\/ol>/<\/list>/g;
		$abstract =~ s/<li>/<list-item>/g;
		$abstract =~ s/<li>/<\/list-item>/g;
		$abstract =~ s/^\n//g;
		$abstract =~ s/\t//g;
		$abstract =~ s/\n/\n\t\t\t\t/g;
		print OUT "\t\t\t<abstract>\n";
		print OUT "\t\t\t\t" . $abstract . "\n"; 
		print OUT "\t\t\t</abstract>\n";
	}
	else
	{
		print OUT "\t\t\t<abstract />\n";		
	}
	
	#printing keywords
	if($keywords ne "")
	{
		@keywords_list = split(/;/,$keywords);
		
		print OUT "\t\t\t<kwd-group kwd-group-type=\"author-generated\">\n";
		
		for($i = 0; $i<@keywords_list; $i++)
		{
			print OUT "\t\t\t\t<kwd>". $keywords_list[$i] ."</kwd>\n";
		}
		
		print OUT "\t\t\t</kwd-group>\n";
	}
	else
	{
		print OUT "<kwd-group />\n";
	}
	print OUT "\t\t</article-meta>\n";
	
	print OUT $postinfo;
	
	close(OUT);
	
	#print "$fpage->$lpage\n";
	#print $fileName . "\n";

}

$sth->finish();
$dbh->disconnect();
