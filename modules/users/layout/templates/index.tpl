{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}
{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

	<div class="container-fluid">
		<section id="users" class="index row-fluid">
			<div class="span12">
				<header class="header buttonHolderRight clearfix">
					<h2>{$lblUsers|ucfirst}</h2>

					<a href="{$var|buildurl:'add':'users'}" class="btn">
						<i class="icon-plus"></i>
						{$lblAdd|ucfirst}
					</a>
				</header>

				{option:report}
					<div class="alert alert-success">
						{$report}
					</div>
				{/option:report}

				{option:datagrid}
					{$datagrid}
				{/option:datagrid}
				{option:!datagrid}
					<div class="alert">
						{$msgUsersNoItems}
					</div>
				{/option:!datagrid}
			</div>
		</section>

		{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
	</div>
</body>
</html>