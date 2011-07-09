<header id="header">
	<h1>
		<a href="/" rel="home">
			<span class="ir">
				TITLE
			</span>
		</a>
	</h1>
</header>

{option:currentUser}
	<section id="user">
		<p>
			{$msgUsersLoggedInAs|sprintf:{$currentUser.name}} -
			<a href="{$var|buildurl:'logout':'users'}">{$lblSignOff}</a>
		</p>
	</section>
{/option:currentUser}