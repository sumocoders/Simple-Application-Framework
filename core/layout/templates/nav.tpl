<div id="navBar" class="container-fluid">
	<div class="row-fluid">
		<nav id="nav" class="span9">
			<ul class="nav">
				<li><a href="/" rel="home">{$lblHome|ucfirst}</a></li>
				<li><a href="{$var|buildurl:'index':'users'}">{$lblUsers|ucfirst}</a></li>
			</ul>
		</nav>

		<div id="search" class="span3">
			<form class="form-horizontal">
				<div class="control-group">
					<div class="input-append">
						<input type="search" placeholder="{$lblSearch|ucfirst}" class="span2 searchField">
						<button type="button" class="btn">{$lblSearch|ucfirst}</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
