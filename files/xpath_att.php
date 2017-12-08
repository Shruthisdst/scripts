<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Basic Page Needs
    –––––––––––––––––––––––––––––––––––––––––––––––––– -->
    <meta charset="utf-8">
    <title>Bharatha Samskruthi Prakashana</title>
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Mobile Specific Metas
    –––––––––––––––––––––––––––––––––––––––––––––––––– -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- FONT
    –––––––––––––––––––––––––––––––––––––––––––––––––– -->
    <link rel="stylesheet" id="royal_enqueue_Lato-css" href="http://fonts.googleapis.com/css?family=Lato%3A100%2C200%2C300%2C400%2C500%2C600%2C700%2C800%2C900&amp;ver=1.0.0" type="text/css" media="all">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400italic,400,600,700' rel='stylesheet' type='text/css'>
    <link href="//fonts.googleapis.com/css?family=Raleway:100,400,300,600" rel="stylesheet" type="text/css">

    <!-- Javascript calls
    –––––––––––––––––––––––––––––––––––––––––––––––––– -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script type="text/x-mathjax-config">
      MathJax.Hub.Config({
        tex2jax: {inlineMath: [["$","$"],["\\(","\\)"]]}
      });
    </script>
    <script type="text/javascript" async src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS_HTML-full"></script>
    <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
	<script type="text/javascript" src="js/lightbox.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/masonry/3.1.5/masonry.pkgd.min.js"></script>
    
    <script type="text/javascript" src="js/common.js"></script>
    
    <!-- CSS
    –––––––––––––––––––––––––––––––––––––––––––––––––– -->
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- <link rel="stylesheet" href="css/skeleton.css"> -->

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css"> -->
    <link rel="stylesheet" href="css/navbar.css">
    <link rel="stylesheet" href="css/carousel.css">
    <link rel="stylesheet" href="css/page.css">
    <link rel="stylesheet" href="css/archive.css">
    <link rel="stylesheet" href="css/general.css">
    <link rel="stylesheet" href="css/flat.css">
    <link rel="stylesheet" href="css/form.css">
    <link rel="stylesheet" href="css/aux.css">
    <link rel="stylesheet" href="css/social.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/lightbox.css">

    <!-- Favicon
    –––––––––––––––––––––––––––––––––––––––––––––––––– -->
    <link rel="icon" type="image/png" href="images/favicon.ico">
</head>
<body>
    <!-- Navigation
    –––––––––––––––––––––––––––––––––––––––––––––––––– -->
    <nav class="navbar navbar-default navbar-fixed-top wider">
        <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-primary-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="navbar-primary-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="about.html">About</a></li>
                    <li><a href="#"><img src="images/logo.png" alt="Bharatha Samskruthi Prakashana" class="logo"></a></li>
                    <li class="active"><a href="books.html">Books</a></li>
                    <li><a href="#">Help</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
    <!-- End Navigation
    –––––––––––––––––––––––––––––––––––––––––––––––––– -->
    <div class="container">
        <div class="row">
            <!-- Column 1 -->
            <div class="col-md-12 text-center">
                <ul class="list-inline sub-nav">
                    <li><a href="kannada.html">Kannada</a></li>
                    <li><a>·</a></li>
                    <li><a href="english.html">English</a></li>
                    <li><a>·</a></li>
                    <li><a>Search</a></li>
                    <li id="searchForm">
                        <form class="navbar-form" role="search" action="search.php" method="get">
                            <div class="input-group add-on">
                                <input type="text" class="form-control" placeholder="Word" name="word" id="word">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                                </div>
                            </div>
                        </form>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    
<div class="container">
    <div class="row">
        <div class="col-md-8">
			<h2>Bharatha Samskruthi Prakashana</h2>
			<h3>Festivals of Bhārata</h3>
		</div>
	</div><hr />
	<div class="row">
<?php
include("connect.php");

$searchWord = $_GET['word'];

$query = "select * from habba where text regexp '" . $searchWord . "'";
$result = $db->query($query); 
$num_results = $result ? $result->num_rows : 0;

if($num_results > 0)
{
	echo '<h3>' . $num_results;
	echo ($num_results > 1) ? ' results' : ' result';
	echo '</h3>';
}
$result = $db->query($query);
$num_rows = $result ? $result->num_rows : 0;

if($num_rows > 0)
{
	while($row = $result->fetch_assoc())
	{
		$book_id = $row['book_id'];
		$entry_id = $row['entry_id'];
		$book_title = $row['book_title'];
		$text = $row['text'];
		echo '<h3>' . $book_title . '</h3>';

		$doc = new DOMDocument();
		libxml_use_internal_errors(true);
		$text = mb_convert_encoding($text, 'HTML-ENTITIES', 'UTF-8');
		$doc->loadHTML($text);
		
		$xpath = new DOMXpath($doc);
		$nodes = $xpath->query("//p[contains(.,'$searchWord')]");
		$nodes = $xpath->query("//h3[contains(.,'$searchWord')]");
		$nodes = $xpath->query("//li[contains(.,'$searchWord')]");
		foreach($nodes as $node) {
			$id = $node->getAttribute('id');
			echo $id . "<br />";
			$res = $node->nodeValue;
			$res = preg_replace('/' . $searchWord . '/', '<a href="books/' . $book_id . '/' . $entry_id .'.html#' . $id . '">' . $searchWord . '</a>', $res);
			echo $res . "<br /><br />";
			//~ echo '<a href="books/' . $book_id . '/' . $entry_id .'.html#' . $id . '">' . $res . '</a><br /><br />';
		}
	}
}
if($result){$result->free();}
$db->close();

?>
	</div>
</div>

    <!-- Footer -->
    <div id="k-subfooter">
        <div class="container"><!-- container -->
            <div class="row"><!-- row -->
                <div class="col-lg-6">
<!--
                    <p class="copy-text text-left">
                        © 2016 University of Mysore.
                    </p>
-->
                </div>
                <div class="col-lg-6">
                    <p class="copy-text text-right">
                        <!-- <a href="">Terms of Use</a> | <a href="">Privacy Policy</a> | <a href="">Sitemap</a> -->
<!--
                        <a href="<?=BASE_URL?>About_IASc/Contact_details/">Contact</a> | 
                        <a href="<?=BASE_URL?>About_IASc/Site_Index">Site index</a>
-->
                    </p>
                </div>
            </div><!-- row end -->
        </div><!-- container end -->
    </div>

    <!-- End Main page layout
    –––––––––––––––––––––––––––––––––––––––––––––––––– -->
</body>
</html>
