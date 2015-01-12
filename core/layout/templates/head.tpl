<!doctype html>
<html lang="{$LANGUAGE}">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

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

    {* Load full css if browser is > IE9 or not IE9 *}
    <!--[if gt IE 9]>
        <link rel="stylesheet" href="/core/layout/css/style.css?m={$LAST_MODIFIED}">
    <![endif]-->
    <!--[if !IE]> -->
        <link rel="stylesheet" href="/core/layout/css/style.css?m={$LAST_MODIFIED}">
    <!-- <![endif]-->

    {* Load css and bootstrap seperately if <= IE9 *}
    <!--[if lte IE 9]>
        <link rel="stylesheet" href="/core/layout/css/bootstrap.min.css?m={$LAST_MODIFIED}">
        <link rel="stylesheet" href="/core/layout/css/bootstrap-responsive.min.css?m={$LAST_MODIFIED}">
        <link rel="stylesheet" href="/core/layout/css/style_ie.css?m={$LAST_MODIFIED}">
    <![endif]-->
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

	<script>
		var jsData = {$jsData};
	</script>
	<script src="/core/js/jquery.js?m={$LAST_MODIFIED}"></script>
	<script src="/core/js/bootstrap.min.js?m={$LAST_MODIFIED}"></script>
    <script src="/core/js/typeahead.js?m={$LAST_MODIFIED}"></script>
	<script src="/core/js/sumo_plugins.js?m={$LAST_MODIFIED}"></script>
	<script src="/core/js/framework.data.js?m={$LAST_MODIFIED}"></script>
	<script src="/core/js/framework.locale.js?m={$LAST_MODIFIED}"></script>
	<script src="/core/js/framework.tags.js?m={$LAST_MODIFIED}"></script>
	<script src="/core/js/framework.form.js?m={$LAST_MODIFIED}"></script>
	<script src="/core/js/framework.js?m={$LAST_MODIFIED}"></script>
	<script src="/core/js/framework.form.search.js?m={$LAST_MODIFIED}"></script>
	<script src="/core/js/app.js?m={$LAST_MODIFIED}"></script>
	<script src="/core/js/respond.min.js?m={$LAST_MODIFIED}"></script>
	<script src="/core/js/ckeditor/ckeditor.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/modernizr/2.6.2/modernizr.min.js"></script>
	{option:javascript}
		{iteration:javascript}
			<script src="{$javascript.url}"></script>
		{/iteration:javascript}
	{/option:javascript}
</head>
<body class="{$MODULE} {$ACTION}">
	<!--[if lt IE 8 ]>
		<div id="ie6" class="alert alert-block" role="alert">
			<a href="#" class="close" data-dismiss="alert" title="{$lblClose|ucfirst}">x</a>
			{$msgOldBrowserWarning}
		</div>
	<![endif]-->
