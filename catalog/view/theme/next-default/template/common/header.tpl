<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?php echo $title;
        if (isset($_GET['page'])) {
            echo " - " . ((int)$_GET['page']) . " " . $text_page;
        } ?></title>
    <base href="<?php echo $base; ?>"/>
    <?php if ($description) { ?>
        <meta name="description" content="<?php echo $description;
        if (isset($_GET['page'])) {
            echo " - " . ((int)$_GET['page']) . " " . $text_page;
        } ?>"/>
    <?php } ?>
    <?php if ($keywords) { ?>
        <meta name="keywords" content="<?php echo $keywords; ?>"/>
    <?php } ?>
    <meta property="og:title" content="<?php echo $title;
    if (isset($_GET['page'])) {
        echo " - " . ((int)$_GET['page']) . " " . $text_page;
    } ?>"/>
    <meta property="og:type" content="website"/>
    <meta property="og:url" content="<?php echo $og_url; ?>"/>

    <meta property="og:image" content="<?php echo $logo; ?>"/>
    <meta property="og:site_name" content="<?php echo $name; ?>"/>
    <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
    <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css"/>
    <link href="catalog/view/theme/next-default/stylesheet/stylesheet.css" rel="stylesheet">
    <?php foreach ($styles as $style) { ?>
        <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>"
              media="<?php echo $style['media']; ?>"/>
    <?php } ?>
    <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
    <?php foreach ($links as $link) { ?>
        <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>"/>
    <?php } ?>
    <?php foreach ($scripts as $script) { ?>
        <script src="<?php echo $script; ?>" type="text/javascript"></script>
    <?php } ?>
    <?php foreach ($analytics as $analytic) { ?>
        <?php echo $analytic; ?>
    <?php } ?>
    <script src="catalog/view/javascript/next-default/nextmenufix.js" type="text/javascript"></script>
</head>
<body class="<?php echo $class; ?>">
<header>
    <div id="top2">
        <div class="container">
            <div class="row vert-align">
                <div class="col-sm-3">
                    <div id="logo">
                        <?php if ($logo) { ?>

                            <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>"
                                                                alt="<?php echo $name; ?>" class="img-responsive"/></a>
                        <?php } else { ?>
                            <!--h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1-->
                        <?php } ?>
                        <div class='data_name tagline'><span class="name tagline"><?php echo $comment; ?></span></div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class='phone'><a href="<?php echo $contact; ?>"> <span
                            class=""><?php echo $telephone; ?></span></a></div>
                </div>
                <div id="md-size" class="col-sm-3"><?php echo $search; ?>
                </div>
                <div class="col-sm-3"><?php echo $cart; ?></div>
            </div>
        </div>
    </div>
</header>
<?php if ($categories) { ?>
    <div id="top3">
        <div class="container">
            <nav id="menu" class="navbar">
                <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
                    <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse"
                            data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
                </div>
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav">
                        <?php foreach ($categories as $category) { ?>
                            <?php if ($category['children']) { ?>
                                <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle"
                                                        data-toggle="dropdown"><?php echo $category['name']; ?></a>
                                    <div class="dropdown-menu">
                                        <div class="dropdown-inner">
                                            <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                                                <ul class="list-unstyled">
                                                    <?php foreach ($children as $child) { ?>
                                                        <li>
                                                            <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                                                        </li>
                                                    <?php } ?>
                                                </ul>
                                            <?php } ?>
                                        </div>
                                    </div>
                                </li>
                            <?php } else { ?>
                                <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                            <?php } ?>
                        <?php } ?>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
<?php } ?>
<div id="top4">
    <div class="slayders">
        <?php global $registry;
        $elements_places = $registry->get('elements_places');
        if (!empty($elements_places['post_header'])) { ?>
            <?php echo implode('', $elements_places['post_header']); ?>
        <?php } ?>
    </div>
</div>