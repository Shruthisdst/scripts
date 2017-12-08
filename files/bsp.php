echo ".........";
					foreach($chunks as $chk)
					{
						foreach($chk as $ss)
						{
							$fn = preg_match('/'. $searchWord . '/', $ss, $match);
							
							if($fn)
							{
								//~ echo $ss;
							}
						}
						echo $chk[3];
						
					}
					echo ".........<br />";
