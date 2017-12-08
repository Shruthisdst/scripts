#!/bin/sh

host="localhost"
usr="root"
pwd='mysql'

# db="iasBOMS"
# journal="boms"

# db="iasJOAA"
# journal="joaa"

# db="iasJBSC"
# journal="jbsc"

# db="iasJCSC"
# journal="jcsc"

# db="iasJESS"
# journal="jess"

# db="iasJGEN"
# journal="jgen"

# db="iasPRAM"
# journal="pram"

# db="iasPMSC"
# journal="pmsc"

# db="iasRESO"
# journal="reso"

db="iasSADH"
journal="sadh"

#perl generate_article_xml.pl $host $db $usr $pwd $journal
php generate_article_xml.php $host $db $usr $pwd $journal
#perl generate_article_xml_from_xml.pl $journal 

#~ revisedDb="iasBOMS_revised"
#~ 
#~ echo "CREATE DATABASE IF NOT EXISTS $revisedDb CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;" | /usr/bin/mysql -u$usr -p$pwd
#~ echo "DROP TABLE IF EXISTS article; CREATE TABLE article (journal varchar(20) DEFAULT NULL, volume varchar(3) DEFAULT NULL, issue varchar(10) DEFAULT NULL, month varchar(6) DEFAULT NULL, year varchar(10) DEFAULT NULL, info varchar(200) DEFAULT NULL, hassup tinyint(1) DEFAULT NULL, title varchar(500) DEFAULT NULL, feature varchar(200) DEFAULT NULL, page varchar(20) DEFAULT NULL, abstract text, keywords varchar(400) DEFAULT NULL, authors text, dates mediumtext, id varchar(50) NOT NULL DEFAULT '', PRIMARY KEY (id) ) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4" | /usr/bin/mysql -u$usr -p$pwd $revisedDb
#~ 
#~ php simpleXMLTest.php 
