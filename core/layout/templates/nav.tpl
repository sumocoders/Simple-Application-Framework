<div id="navBar" class="container-fluid">
	<div class="row-fluid">
		<nav id="nav" class="span9">
			<ul class="nav">
				<li><a href="/" rel="home">{$lblHome|ucfirst}</a></li>
				<li><a href="{$var|buildurl:'index':'users'}">{$lblUsers|ucfirst}</a></li>
			</ul>
		</nav>

		{* @later: implement a side-wide search
			<div id="search" class="span3">
				<form class="form-search">
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
		*}
	</div>
</div>
