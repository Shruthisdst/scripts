use strict;
use XML::LibXML;

my $file = '/var/www/html/ias/md-src/xml/boms.xml';
my $parser = XML::LibXML->new();
my $tree = $parser->parse_file($file);
my $root = $tree->getDocumentElement;
my @volumes = $root->getElementsByTagName('volume');

foreach my $vol (@volumes) {
    my $vnum = $vol->getAttribute('vnum');
    print $vnum . "\n";
    #~ my @name_node  = $camelid->getElementsByTagName('common-name');
    #~ my $common_name = $name_node[0]->getFirstChild->getData;
    #~ my @c_node  = $camelid->getElementsByTagName('conservation');
    #~ my $status =  $c_node[0]->getAttribute('status');
    #~ print "$common_name ($latin_name) $status \n";
}
