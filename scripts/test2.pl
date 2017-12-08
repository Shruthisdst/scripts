use strict;
use XML::LibXML;

my $file = '/var/www/html/ias/md-src/xml/boms.xml';
my $parser = XML::LibXML->new();
my $tree = $parser->parse_file($file);
my $root = $tree->getDocumentElement;

foreach my $volume ($root->findnodes('volume/issue/entry/title')) {

	print $volume->nodeName(), ": ", $volume->string_value, "\n";
	exit(0);
	
}
