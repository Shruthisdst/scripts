#!/usr/bin/perl
@list1 = `ls -v Volumes/`;
for($i=0;$i<@list1;$i++)
{
	chop ($list1[$i]);
	$vol = $list1[$i];
	
	@list2 = `ls -v Volumes/$vol`;
	for($j=0;$j<@list2;$j++)
	{
		chop ($list2[$j]);
		$iss = $list2[$j];

		@list3 = `ls -v Volumes/$vol/$iss/`;
		for($k=0;$k<@list3;$k++)
		{
			chop ($list3[$k]);
			$pages = $list3[$k];

			@list4 = `ls -v Volumes/$vol/$iss/$pages`;
			for($l=0;$l<@list4;$l++)
			{
				chop ($list4[$l]);
				$file = $list4[$l];
				$fileName = "Volumes/" . $vol . "/" . $iss . "/" . $pages . "/" . $file;
				$new = "rename/" . $vol . "/" . $iss . "/" . $pages . "/" . $file;
				open(IN,"<:utf8","$fileName") or die "can't open $fileName\n";
				open(FILE,">:utf8","$new") or die "can't open $fileName\n";
				$line = <IN>;
				while($line)
				{
					if($line =~ /<article-id pub-id-type="ias">(.*)<\/article-id>/)
					{
						$id =  $1;
						$id =~ s/currsci_(.*)/currsci_$vol\_$iss\_$pages/g;
						print "\t\t\t<article-id pub-id-type=\"ias\">$id<\/article-id>\n";
						print FILE "\t\t\t<article-id pub-id-type=\"ias\">$id<\/article-id>\n";
					}
					else
					{
						print $line . "\n";
						print FILE $line;
					}
					$line = <IN>;
				}


			}
		}
	}
}
