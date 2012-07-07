{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}
{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

	<div class="container-fluid">
		<section id="error" class="index row-fluid">
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