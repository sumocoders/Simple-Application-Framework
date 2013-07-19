<nav id="navbar" role="navigation">
	<a href="/" rel="home" class="logo hidden-phone">{$SITE_DEFAULT_TITLE}</a>

	<div id="searchBox" class="mobile" role="search">
		<form action="#">
			<div class="controls">
				<input id="searchQuery" name="q" type="search" placeholder="{$lblSearch|ucfirst}" class="input-medium">
				<button type="submit" class="btn">
					<i class="icon-search"></i>
					<span class="hide">{$lblSearch|ucfirst}</span>
				</button>
			</div>
		</form>
	</div>
	<div class="container">
		<ul class="nav">
			{option:currentUser}
				<li id="user">
					<a href="#" class="toggleSubNavigation">{$currentUser.name|uppercase}</a>
					<ul class="subNavigation">
						<li><a href="{$var|buildurl:'edit':'users'}/{$currentUser.id}">{$lblSettings|ucfirst}</a></li>
						<li><a href="{$var|buildurl:'logout':'users'}">{$lblLogout|ucfirst}</a></li>
					</ul>
				</li>
			{/option:currentUser}
			<li><a href="/" rel="home">{$lblHome|ucfirst}</a></li>
			{*
				@remark insert your navigation per module here. Below you
				can find an example on how to use the correct markup.
			*}
				<li>
					<a href="{$var|buildurl:'typography':'example'}" class="toggleSubNavigation">Bootstrap</a>
					<ul class="subNavigation">
						<li><a href="{$var|buildurl:'typography':'example'}">Typography</a></li>
						<li><a href="{$var|buildurl:'code':'example'}">Code</a></li>
						<li><a href="{$var|buildurl:'tables':'example'}">Tables</a></li>
						<li><a href="{$var|buildurl:'forms':'example'}">Forms</a></li>
						<li><a href="{$var|buildurl:'buttons':'example'}">Buttons</a></li>
						<li><a href="{$var|buildurl:'images':'example'}">Images</a></li>
						<li><a href="{$var|buildurl:'icons':'example'}">Icons by Glyphicons</a></li>

						<li><a href="{$var|buildurl:'dropdowns':'example'}">Dropdowns</a></li>
						<li><a href="{$var|buildurl:'button-groups':'example'}">Button groups</a></li>
						<li><a href="{$var|buildurl:'button-dropdowns':'example'}">Button dropdowns</a></li>
						<li><a href="{$var|buildurl:'navs':'example'}">Navs</a></li>
						<li><a href="{$var|buildurl:'breadcrumbs':'example'}">Breadcrumbs</a></li>
						<li><a href="{$var|buildurl:'pagination-example':'example'}">Pagination</a></li>
						<li><a href="{$var|buildurl:'labels-and-badges':'example'}">Labels and badges</a></li>
						<li><a href="{$var|buildurl:'typography-example':'example'}">Typography</a></li>
						<li><a href="{$var|buildurl:'thumbnails-example':'example'}">Thumbnails</a></li>
						<li><a href="{$var|buildurl:'alerts':'example'}">Alerts</a></li>
						<li><a href="{$var|buildurl:'progress-bars':'example'}">Progress bars</a></li>
						<li><a href="{$var|buildurl:'media-object':'example'}">Media object</a></li>
						<li><a href="{$var|buildurl:'misc':'example'}">Misc</a></li>
					</ul>
				</li>
			{option:currentUser.isAdmin}
				<li>
					<a href="{$var|buildurl:'index':'users'}">{$lblUsers|ucfirst}</a>
				</li>
			{/option:currentUser.isAdmin}
		</ul>
	</div>
	<div id="searchBox" class="desktop" role="search">
		<form action="#">
			<div class="controls">
				<input id="searchQuery" name="q" type="search" placeholder="{$lblSearch|ucfirst}" class="input-medium">
				<button type="submit" class="btn">
					<i class="icon-search"></i>
					<span class="hide">{$lblSearch|ucfirst}</span>
				</button>
			</div>
		</form>
	</div>
</nav>
<a href="#" id="toggleTabletNavbar">{$lblMenu|uppercase}</a>