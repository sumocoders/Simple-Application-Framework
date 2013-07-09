<!--
<div id="navBar" class="container-fluid">
	<div class="row-fluid">
		<nav id="nav" class="span9">
			<ul class="nav">
				<li><a href="/" rel="home">{$lblHome|ucfirst}</a></li>
				{option:currentUser.isAdmin}<li><a href="{$var|buildurl:'index':'users'}">{$lblUsers|ucfirst}</a></li>{/option:currentUser.isAdmin}
			</ul>
		</nav>

		<div id="search" class="span3">
			<form>
				<div class="control-group">
					<label for="searchQuery" class="hide control-label">{$lblSearch|ucfirst}</label>
					<div class="controls">
						<div class="input-append">
							<input id="searchQuery" name="q" type="search" placeholder="{$lblSearch|ucfirst}" class="input-medium">
							<button type="submit" class="btn hidden-phone hidden-tablet">
								<i class="icon-search"></i>
								<span class="hide">{$lblSearch|ucfirst}</span>
							</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
-->

<div id="navbar">
  <div class="container">
    <ul class="nav">
      <li><a href="/" rel="home">{$lblHome|ucfirst}</a></li>
      {option:currentUser.isAdmin}<li><a href="{$var|buildurl:'index':'users'}">{$lblUsers|ucfirst}</a></li>{/option:currentUser.isAdmin}
    </ul>
  </div>
</div>
