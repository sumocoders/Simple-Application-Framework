<!doctype html>
<html lang="{$LANGUAGE}">
<head>
	<meta charset="utf-8">

	<title>
		{option:pageTitle}{$pageTitle}{/option:pageTitle}
		{option:!pageTitle}{$SITE_DEFAULT_TITLE}{/option:!pageTitle}
	</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="author" content="SumoCoders">

	<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<link rel="stylesheet" href="/core/layout/css/style.css?m={$LAST_MODIFIED}">
	{option:css}
		{iteration:css}
			<link rel="stylesheet" href="{$css.url}">
		{/iteration:css}
	{/option:css}

	<!-- icon in the URL-bar -->
	<link rel="shortcut icon" href="/favicon.ico">

	<!-- icon used when saved as a bookmark on iPhone/iPad/Android/... -->
	<link rel="apple-touch-icon" href="/apple-touch-icon.png">

	<!--  icon for facebook -->
	<link rel="image_src" href="/image_src.png" />

	<script src="/core/js/lib.js?m={$LAST_MODIFIED}"></script>
	<script src="/core/js/script.js?m={$LAST_MODIFIED}"></script>
	<script src="/core/js/theme_new.js?m={$LAST_MODIFIED}"></script>
	{option:javascript}
		{iteration:javascript}
			<script src="{$javascript.url}"></script>
		{/iteration:javascript}
	{/option:javascript}
	<script>
		var jsData = {$jsData};
	</script>
</head>
<body>
	<!--[if lt IE 8 ]>
		<div id="ie6" class="alert alert-block" role="alert">
			<a href="#" class="close" data-dismiss="alert" title="{$lblClose|ucfirst}">x</a>
			{$msgOldBrowserWarning}
		</div>
	<![endif]-->
