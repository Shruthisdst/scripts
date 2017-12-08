#!/usr/bin/perl
@vol1 = `ls -v Text`;
@vol2 = `ls -v text`;
for($v=0;$v<@vol1;$v++)
{
	chop($vol1[$v]);
	$volume1 = $vol1[$v];
	chop($vol2[$v]);
	$volume2 = $vol2[$v];
	@list = `ls -v Text/$volume1`;
	@list2 = `ls -v text/$volume2`;
	for($i=0;$i<@list;$i++)
	{
		chop ($list[$i]);
		$issue = $list[$i];
		chop($list2[$i]);
		$Text = $list2[$i];
		@list1 = `ls -v Text/$volume1/$issue`;
		@list4 = `ls -v text/$volume2/$Text`;

		for($j=0;$j<@list1;$j++)
		{
			chop($list1[$j]);
			$file = $list1[$j];
			chop($list4[$j]);
			$tfile = $list4[$j];
			#print $file ."\n";

			open(IN, "Text/$volume1/$issue/$file") or die "can't open Text/001/$issue/$file\n";
			open(OUT,">text/$volume2/$Text/$file") or die "can't open text/001/$Text/$file\n";
			@lines=<IN>;

			$contents = "";
			for($l=0;$l<@lines;$l++)
			{
				chop($lines[$l]);
				$lines[$l]=~ s/\n/ /g;
				
				$contents = $contents.$lines[$l];
			}
			$contents =~ s/[0-9]//g;
			$contents =~ s/[.·;:,'`!\[\]\{\}\-=+*&@$^()|\\\/?"~><%•_]//g;
			$contents =~ s/[°»¢±©#£«§€]//g;

			$contents =~ s/\s+/ /g;
			@con = split(" ",$contents);
			$single_line = "";

			for($c=0;$c<@con;$c++)
			{
				$line = $con[$c];
				$line = lc($line);
				if(!($line =~ /^A$|^As$|^An$|^And$|^On$|^a$|^about$|^above$|^across$|^after$|^again$|^against$|^all$|^almost$|^alone$|^along$|^already$|^also$|^although$|^always$|^among$|^an$|^and$|^another$|^Another$|^any$|^anybody$|^anyone$|^anything$|^anywhere$|^are$|^area$|^areas$|^around$|^as$|^ask$|^asked$|^asking$|^asks$|^at$|^away$|^back$|^backed$|^backing$|^backs$|^be$|^below$|^Be$|^became$|^because$|^become$|^becomes$|^been$|^before$|^began$|^behind$|^being$|^beings$|^best$|^better$|^between$|^big$|^both$|^but$|^But$|^by$|^came$|^can$|^cannot$|^case$|^cases$|^certain$|^certainly$|^clear$|^clearly$|^come$|^could$|^did$|^differ$|^different$|^differently$|^does$|^do$|^done$|^down$|^down$|^downed$|^downing$|^downs$|^during$|^each$|^early$|^either$|^end$|^ended$|^ending$|^ends$|^enough$|^even$|^evenly$|^ever$|^every$|^everybody$|^everyone$|^everything$|^everywhere$|^face$|^faces$|^fact$|^facts$|^far$|^felt$|^few$|^find$|^finds$|^first$|^For$|^for$|^four$|^from$|^full$|^fully$|^further$|^furthered$|^furthering$|^furthers$|^gave$|^general$|^generally$|^get$|^gets$|^give$|^given$|^gives$|^going$|^good$|^goods$|^got$|^great$|^greater$|^greatext$|^group$|^grouped$|^grouping$|^groups$|^had$|^has$|^have$|^having$|^he$|^her$|^here$|^Here$|^herself$|^high$|^high$|^high$|^higher$|^highest$|^him$|^himself$|^his$|^how$|^however$|^if$|^ie$|^If$|^important$|^in$|^In$|^interest$|^interested$|^interesting$|^interests$|^into$|^$|^It$|^its$|^it$|^itself$|^is$|^Is$|^just$|^keep$|^keeps$|^kind$|^knew$|^know$|^known$|^knows$|^large$|^largely$|^last$|^later$|^latext$|^least$|^less$|^let$|^lets$|^like$|^likely$|^long$|^longer$|^longest$|^made$|^make$|^making$|^man$|^many$|^may$|^member$|^members$|^men$|^might$|^more$|^most$|^mostly$|^mrs$|^much$|^Much$|^must$|^myself$|^necessary$|^need$|^needed$|^needing$|^needs$|^never$|^new$|^new$|^newer$|^newest$|^next$|^nobody$|^no$|^non$|^noone$|^not$|^nothing$|^now$|^Now$|^nowhere$|^number$|^numbers$|^of$|^off$|^often$|^old$|^older$|^oldest$|^on$|^once$|^one$|^ones$|^only$|^open$|^opened$|^opening$|^opens$|^or$|^order$|^ordered$|^ordering$|^orders$|^other$|^others$|^our$|^out$|^over$|^part$|^parted$|^parting$|^parts$|^per$|^perhaps$|^place$|^places$|^point$|^pointed$|^pointing$|^points$|^possible$|^present$|^presented$|^presenting$|^presents$|^put$|^puts$|^quite$|^rather$|^really$|^right$|^right$|^room$|^rooms$|^said$|^same$|^saw$|^say$|^says$|^second$|^seconds$|^see$|^seem$|^seemed$|^seeming$|^seems$|^sees$|^several$|^shall$|^she$|^should$|^show$|^showed$|^showing$|^shows$|^side$|^sides$|^since$|^small$|^smaller$|^smallest$|^so$|^some$|^somebody$|^someone$|^something$|^somewhere$|^still$|^still$|^such$|^sure$|^The$|^take$|^taken$|^than$|^that$|^That$|^the$|^their$|^them$|^then$|^Then$|^There$|^there$|^therefore$|^Therefore$|^these$|^they$|^thing$|^things$|^think$|^thinks$|^This$|^this$|^those$|^though$|^thought$|^thoughts$|^three$|^through$|^thus$|^Thus$|^today$|^together$|^to$|^To$|^too$|^took$|^toward$|^turn$|^turned$|^turning$|^turns$|^two$|^under$|^until$|^up$|^Up$|^upon$|^upto$|^use$|^used$|^uses$|^very$|^want$|^wanted$|^wanting$|^wants$|^was$|^way$|^ways$|^we$|^We$|^well$|^wells$|^went$|^were$|^what$|^What$|^when$|^where$|^whether$|^which$|^while$|^who$|^whole$|^whose$|^why$|^will$|^with$|^within$|^without$|^work$|^would$|^worked$|^working$|^works$|^would $|^year$|^years$|^yet$|^you$|^young$|^younger$|^youngest$|^your$|^yours$/))
				{
					$line =~ s/\n//;
					$single_line = $single_line . " " . $line;
					$single_line =~ s/^ //g;
				}
			}
			open(OUT,">text/$volume2/$Text/$file") or die "can't open text/$volume2/$Text/$file\n";
			print OUT $single_line;
			close(IN);
			close(OUT);
		}
	}
}
