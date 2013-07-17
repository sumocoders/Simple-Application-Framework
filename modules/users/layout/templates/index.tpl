{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

<div id="contentWrap">
	<div id="content">
		<header id="header" role="banner">
			<div class="container">
				<div class="title">
					<a id="toggleMenu" class="visible-phone" href="#">{$lblMenu|uppercase}</a>
					<h2>{$lblUsers|ucfirst}</h2>
				</div>
				<div class="actions">
					<a href="#" class="dropdownToggle visible-phone" data-toggle="dropdownItems">{$lblActions|ucfirst}</a>
					<ul class="dropdownItems">
						<li><a class="iconAdd" href="{$var|buildurl:'add':'users'}">{$lblAdd|ucfirst}</a></li>
					</ul>
				</div>
			</div>
		</header>

		{include:'{$CORE_PATH}/layout/templates/notifications.tpl'}

		<main id="main" role="main">
			<div class="container">
				{option:dataGrid}
					{$dataGrid}
				{/option:dataGrid}
				{option:!dataGrid}
					<div class="alert alert-warning" role="status">
						{$msgUsersNoItems}
					</div>
				{/option:!dataGrid}
			</div>
		</main>
	</div>
</div>

{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
</body>
</html>