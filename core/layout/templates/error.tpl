{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}

<div id="content" class="container-fluid">
	<section id="{$MODULE}" class="{$ACTION} row-fluid">
		<div class="span12">
			<div class="alert alert-error">
				{$error}
			</div>
		</div>
	</section>

	{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
</div>
</body>
</html>