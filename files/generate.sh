#pdf2djvu -i djvu/left/mb_left.djvu --dpi=600 --no-nfkc --crop-text mb_left.pdf
#perl rename.pl
#perl to_djvu.pl
#perl bd_to_djvu.pl #for bharata darshana project
perl create_txt_layer.pl
perl convert_to_djvu_format.pl
perl Akruti_to_TeX.pl
perl preprocess.pl #previous method (before convert_to_djvu_format.pl)
perl kantex_to_uni.pl
perl embed_layer.pl
perl to_single_djvu.pl

#hindi documents
perl create_hindi_txt_layer.pl
perl convert_to_djvu_format.pl
perl to_uni.pl
