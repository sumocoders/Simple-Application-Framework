<!doctype html>
<html lang="{$LANGUAGE}">
<head>
	<meta charset="utf-8">

	<!-- Faster page load hack, when using conditional comments it will block further downloads, it is solved by putting an empty conditional before other ones. -->
	<!--[if IE]><![endif]-->

	<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame -->
	<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->

	<title>TITLE</title>

	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="author" content="SumoCoders">

	<!-- icon in the URL-bar -->
	<link rel="shortcut icon" href="/favicon.ico">

	<!-- icon used when saved as a bookmark on iPhone/iPad/Android/... -->
	<link rel="apple-touch-icon" href="/apple-touch-icon.png">

	<!--  icon for facebook -->
	<link rel="image_src" href="/image_src.png" />

	<link rel="stylesheet" href="/core/layout/css/jquery_ui/jquery_ui.css?m={$LAST_MODIFIED}">
	<link rel="stylesheet" href="/core/layout/css/style.css?m={$LAST_MODIFIED}">
	{option:css}{iteration:css}<script src="{$css.url}"></script>{/iteration:css}{/option:css}

	<script src="/core/js/modernizr.js"></script>
	<script src="/core/js/jquery.js"></script>
	<script src="/core/js/html2canvas.js"></script>
	<script src="/core/js/jquery.ui.js"></script>
	{option:javascript}{iteration:javascript}<script src="{$javascript.url}"></script>{/iteration:javascript}{/option:javascript}
	<script src="/js.php?module=core&amp;file=site.js&amp;language={$LANGUAGE}&amp;m={$LAST_MODIFIED}"></script>
</head>

<!-- Target IE browsers specifically without extra http requests. -->
<!--[if lt IE 7 ]><body class="ie6"><![endif]-->
<!--[if IE 7 ]><body class="ie7"><![endif]-->
<!--[if IE 8 ]><body class="ie8"><![endif]-->
<!--[if IE 9 ]><body class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <body> <!--<![endif]-->

<!-- Warning for people that still use IE6 -->
<!--[if lt IE 7 ]>
	<div id="ie6" class="notice">
		<p>
			{$msgOldBrowserWarning}
		</p>
	</div>
<![endif]-->
