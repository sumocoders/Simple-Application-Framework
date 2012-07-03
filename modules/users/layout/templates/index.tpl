{include:'{$CORE_PATH}/layout/templates/head.tpl'}
	{include:'{$CORE_PATH}/layout/templates/header.tpl'}

	<div class="container-fluid">
		<section id="users" class="index" class="row-fluid">
			<div class="span4 offset4">


			</div>
		</section>


		<section id="users" class="index content">
			<header class="header buttonHolderRight clearfix">
				<h2>{$lblUsers|ucfirst}</h2>
				<a href="{$var|buildurl:'add':'users'}" class="button">{$lblAdd|ucfirst}</a>
			</header>

			{option:report}<div class="message success"><p>{$report}</p></div>{/option:report}

			{option:datagrid}{$datagrid}{/option:datagrid}
			{option:!datagrid}<div class="message notice"><p>{$msgUsersNoItems}</p></div>{/option:!datagrid}

		</section>

		{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
	</div>
</body>
</html>