<div class="container-fluid">
	<div class="row-fluid">
		<div class="span8">
			<h1>
				<a href="/" rel="home">
					{$SITE_DEFAULT_TITLE}
				</a>
			</h1>
		</div>

		<div class="span4">
			{option:currentUser}
				<div id="user">
					<p>
						{$msgUsersLoggedInAs|sprintf:{$currentUser.name}} |
						<a href="{$var|buildurl:'logout':'users'}">{$lblSignOff}</a>
					</p>
				</div>
			{/option:currentUser}
		</div>
	</div>
</div>

