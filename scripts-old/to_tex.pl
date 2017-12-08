#!/usr/bin/perl
$host = "localhost";
$db = "bjp";
$usr = "root";
$pwd = "mysql";

use DBI();

open(FILE,">test.tex") or die "can't open test.tex\n";

my $dbh=DBI->connect("DBI:mysql:database=$db;host=$host","$usr","$pwd");

print FILE "\\documentclass[a4paper]{article}
\\usepackage{longtable,array,txfonts}
\\usepackage[newdimens]{labels}
\\LabelCols=3
\\LabelRows=8
\\hoffset=0mm
\\LeftPageMargin=0.8cm
\\RightPageMargin=0.8cm
\\TopPageMargin=1.3cm
\\BottomPageMargin=1.3cm
\\LeftLabelBorder=3.3mm
\\RightLabelBorder=2mm
\\TopLabelBorder=2mm
\\BottomLabelBorder=2mm
\\InterLabelColumn=2mm
\\InterLabelRow=0mm
\\LabelInfotrue
\\begin{document}
\\fontsize{10}{12}
\\selectfont
\\begin{labels}\n";


$sth1=$dbh->prepare("select * from (select * from election where ( (addressDetails like '%mysuru%') || (houseNumber like '%mysuru%') || (street like '%mysuru%') ||  (town like '%mysuru%') || (postOffice like '%mysuru%') ||  (taluk like '%mysuru%') ||  (district like '%mysuru%') )) as tb1 where ((addressDetails like '%Vishweshwara Nagara%') || (houseNumber like '%Vishweshwara Nagara%') || (street like '%Vishweshwara Nagara%') ||  (town like '%Vishweshwara Nagara%') || (postOffice like '%Vishweshwara Nagara%') ||  (taluk like '%Vishweshwara Nagara%') ||  (district like '%Vishweshwara Nagara%') ) order by applicant");
$sth1->execute();
while($ref1 = $sth1->fetchrow_hashref())
{
	$applicant = $ref1->{'applicant'};
	$father = $ref1->{'father'};
	$mother = $ref1->{'mother'};
	$husband = $ref1->{'husband'};
	$sex = $ref1->{'sex'};
	$addressDetails = $ref1->{'addressDetails'};
	$houseNumber = $ref1->{'houseNumber'};
	$street = $ref1->{'street'};
	$town = $ref1->{'town'};
	$postOffice = $ref1->{'postOffice'};
	$taluk = $ref1->{'taluk'};
	$district = $ref1->{'district'};
	$mobile = $ref1->{'mobile'};
	$telephone = $ref1->{'telephone'};
	$applicantId  = $ref1->{'applicantId'};
	
	$houseNumber =~ s/#/\\#/g;
	$houseNumber =~ s/&/\\&/g;
	$addressDetails =~ s/#/\\#/g;
	$addressDetails =~ s/&/\\&/g;
	$district =~ s/&/\\&/g;
	$street =~ s/&/\\&/g;
	$street =~ s/#/\\#/g;
	$town =~ s/&/\\&/g;
	$town =~ s/#/\\#/g;
	$applicantId =~ s/_/\\_/g;
	@array = split('', $houseNumber);
	if($district ne "" && $district ne $town)
	{
		if($town =~ /$district$/)
		{
			$town =~ s/$district//;
		}
	}
	if($telephone =~ /[a-zA-Z\@\_.]/)
	{
		$telephone = '';
	}

print FILE "{\\large\\bf " . $applicant . "}\\\\ ";
if($husband ne "")
{
	print FILE " W/o $husband\\\\ ";

}
if($father ne "")
{
	if($sex eq 'Female')
	{
		print FILE " D/o $father\\\\ ";
	}
	else
	{
		print FILE " S/o $father\\\\ ";
	}
}
if($mother ne "")
{
	if($sex eq 'Female')
	{
		print FILE " D/o $mother\\\\ ";
	}
	else
	{
		print FILE " S/o $mother\\\\ ";
	}
}
if($addressDetails ne "")
{
	print FILE "$addressDetails, ";
}
if($houseNumber ne "")
{
	if(@array < 15)
	{
		print FILE "$houseNumber, ";
	}
	else
	{
		print FILE "$houseNumber\\\\ ";
	}
	
}
if($street ne "")
{
	print FILE "$street\\\\ ";
}
if(($town ne "") && ($town ne $district))
{
	if(($town ne $postOffice) && ($town ne $taluk))
	{
		print FILE "$town, ";
	}
}

if(($postOffice ne "") && ($postOffice ne $taluk))
{
	if($postOffice ne $district)
	{
		 print FILE "$postOffice, ";
	}
}
if(($taluk ne "") && ($taluk ne $district))
{
	print FILE "$taluk\\\\ ";
}
if($district ne "")
{
	print FILE "$district\\\\ ";
}
if($mobile ne "")
{
	print FILE "{\\small $mobile} ";
}
if($telephone ne "")
{
	print FILE "{\\small Tel: $telephone} ";
}
#~ if($applicantId)
#~ {
	#~ print FILE "{\\large ID: $applicantId}\n";
#~ }

print FILE "\n\n";

}
print FILE "\\end{labels}\n";

print FILE "\\end{document}\n";
