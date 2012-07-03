<div class="container-fluid">
	<div class="row-fluid">
		<nav class="span10">
			<ul class="nav">
				<li><a href="/" rel="home">{$lblHome|ucfirst}</a></li>
				<li><a href="{$var|buildurl:'index':'users'}">{$lblUsers|ucfirst}</a></li>
			</ul>
		</nav>

		<div class="span2">
			<form class="form-horizontal">
				<div class="control-group">
					<div class="input-append">
						<input type="text" id="appendedInputButton" class="span2">
						<button type="button" class="btn">Search</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
