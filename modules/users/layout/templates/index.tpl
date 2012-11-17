{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}
{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

	<div id="content" class="container-fluid">
		<section id="{$MODULE}" class="{$ACTION} row-fluid">
			<div class="span12">
				<header class="header buttonHolderRight">
					<h2>{$lblUsers|ucfirst}</h2>

					<div class="btn-group">
						<a href="{$var|buildurl:'add':'users'}" class="btn">
							<i class="icon-plus"></i>
							{$lblAdd|ucfirst}
						</a>
					</div>
				</header>

				{option:report}
					<div class="alert alert-success">
						{$report}
					</div>
				{/option:report}
				{option:error}
					<div class="alert alert-error">
						{$error}
					</div>
				{/option:error}

				{option:dataGrid}
					{$dataGrid}
				{/option:dataGrid}
				{option:!dataGrid}
					<div class="alert">
						{$msgUsersNoItems}
					</div>
				{/option:!dataGrid}
			</div>
		</section>

		{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
	</div>
</body>
</html>