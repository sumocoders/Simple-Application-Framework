{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}
{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

	<div id="content" class="container-fluid">
		<section id="{$MODULE}" class="{$ACTION}">
			<div class="row-fluid">
				<div class="span12 content">
					<p>
						Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Sed posuere consectetur est at lobortis. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Aenean lacinia bibendum nulla sed consectetur.
					</p>
					<p>
						Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Nullam id dolor id nibh ultricies vehicula ut id elit. Etiam porta sem malesuada magna mollis euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Curabitur blandit tempus porttitor. Vestibulum id ligula porta felis euismod semper.
					</p>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span12">
					<h2>Some examples</h2>

					<h3>Delete-button</h3>
					<p>This button will use a dialog to confirm the action.</p>
					<p>
						<a href="#delete-url" class="btn btn-danger confirm" data-message="{$msgAreYouSure}">
							<i class="icon-trash icon-white"></i>
						{$lblDelete|ucfirst}
						</a>
					</p>

				</div>
			</div>
		</section>

		{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
	</div>
</body>
</html>