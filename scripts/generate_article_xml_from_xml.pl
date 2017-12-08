#!/usr/bin/perl

$journalName = $ARGV[0];

use JSON;
use XML::LibXML;

$volumesPath = "/var/www/html/ias/public/Volumes";
$xmlPath = "/var/www/html/ias/md-src/xml";

%jtitle=('boms' => 'Bulletin of Materials Science');
%date_short=(
'M' => 'Manuscript Received',
'R' => 'Revised',
'A' => 'Accepted',
'E' => 'Early Publication'
);

$preamble = '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE article PUBLIC "-//NLM//DTD JATS (Z39.96) Journal Publishing DTD v1.1d3 20150301//EN" "JATS-journalpublishing1.dtd">
<article article-type="article">
	<front>
';

$postinfo = '	</front>
</article>
';
$parser = XML::LibXML->new();
$xmlFileName = $xmlPath . "/" . $journalName . ".xml";

$tree = $parser -> parse_file($xmlFileName);
$rootElement = $tree -> getDocumentElement();

#~ $elname = $rootElement -> getName();
$journalTitle = $rootElement -> getAttribute('title');

#~ print $journalTitle . "\n";

@volumes = $rootElement->getElementsByTagName('volume');

foreach $vol(@volumes)
{
	$vnum = $vol->getAttribute('vnum');

	#~ print $vnum . "\n";

	@parts = $vol->getElementsByTagName('issue');	
	
	foreach $prt (@parts)
	{

		$inum = $prt->getAttribute('inum');
		$month = $prt->getAttribute('month');
		$year = $prt->getAttribute('year');
		$info = $prt->getAttribute('info');
		#~ print $inum . "-" . $month . "-" . $year . "-" . $info . "\n";		
	
		@entries = $prt->getElementsByTagName('entry');
	
		foreach $entry (@entries)
		{
			$hasSup = $entry->getAttribute('hassup');
			$title = $entry->getElementsByTagName('title');
			$feature = $entry->getElementsByTagName('feature');
			$page = $entry->getElementsByTagName('page');
			$abstract = $entry->getElementsByTagName('abstract');
			print $title . "\n";
			exit(0);
			
		}
	
		#~ print "\n";
	} ##For each part
}##For each volume 



#~ print $elname . "\n";

#~ print $xmlFileName . "\n";

#~ open(XML,"$xmlFileName") or die "Can't open $xmlFileName\n";
#~ 
#~ $line = <XML>;
#~ 
#~ while($line)
#~ {
	#~ if($line =~ )
	#~ 
	#~ 
	#~ 
	#~ $line = <XML>;	
#~ }


