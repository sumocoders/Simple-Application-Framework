<nav id="navbar" role="navigation">
	<a href="/" class="logo hidden-phone">{$SITE_DEFAULT_TITLE}</a>

	<div id="searchBox" class="mobile" role="search">
		<div class="controls">
			<input id="searchQuery" name="q" type="search" placeholder="{$lblSearch|ucfirst}" class="input-medium">
			<button type="submit" class="btn">
				<i class="icon-search"></i>
				<span class="hide">{$lblSearch|ucfirst}</span>
			</button>
		</div>
	</div>
	<div class="container">
		<ul class="nav">
			{option:currentUser}
				<li id="user">
					<a href="#" class="toggleSubNavigation">{$currentUser.name|uppercase}</a>
					<ul class="subNavigation">
						<li><a href="{$var|buildurl:'edit':'users'}/{$currentUser.id}">{$lblSettings|ucfirst}</a></li>
						<li><a href="#" id="reportBug">{$lblSendFeedback|ucfirst}</a></li>
						<li><a href="{$var|buildurl:'logout':'users'}">{$lblLogout|ucfirst}</a></li>
					</ul>
				</li>
			{/option:currentUser}
			<li><a href="/" rel="home">{$lblHome|ucfirst}</a></li>
			{*
				@remark insert your navigation per module here. Below you
				can find an example on how to use the correct markup.

				<li>
					<a href="/" class="toggleSubNavigation">link 2</a>
					<ul class="subNavigation">
						<li><a href="#">Sublink 1</a></li>
						<li><a href="#">Sublink 2</a></li>
						<li><a href="#">Sublink 3</a></li>
					</ul>
				</li>
			*}
			{option:currentUser.isAdmin}
				<li>
					<a href="{$var|buildurl:'index':'users'}">{$lblUsers|ucfirst}</a>
				</li>
			{/option:currentUser.isAdmin}
		</ul>
	</div>
	<div id="searchBox" class="desktop" role="search">
		<div class="controls">
			<input id="searchQuery" name="q" type="search" placeholder="{$lblSearch|ucfirst}" class="input-medium">
			<button type="submit" class="btn">
				<i class="icon-search"></i>
				<span class="hide">{$lblSearch|ucfirst}</span>
			</button>
		</div>
	</div>
</nav>
<a href="#" id="toggleTabletNavbar">{$lblMenu|uppercase}</a>