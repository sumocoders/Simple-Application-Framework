{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

<div id="contentWrap">
	<div id="content">
		<header id="header" role="banner">
			<div class="container bar">
				<div class="title">
					<a id="toggleMenu" class="visible-phone" href="#">{$lblMenu|uppercase}</a>
					<h2>{$lblExample|ucfirst}</h2>
				</div>
				<div class="actions">
					<a href="#" class="dropdownToggle visible-phone">{$lblActions|ucfirst}</a>
					<ul>
						<li><a class="iconList" href="#">{$lblOverview|ucfirst}</a></li>
						<li><a class="iconPrint" href="#">{$lblPrint|ucfirst}</a></li>
						<li><a class="iconAdd" href="#">{$lblAdd|ucfirst}</a></li>
					</ul>
				</div>
			</div>
		</header>

      	{include:'{$CORE_PATH}/layout/templates/notifications.tpl'}

		<section id="main" role="main">
        	<div class="container">
				<div class="row-fluid">
					<div class="span12">
						<p>This button will use a dialog to confirm the action.</p>
						<p>
							<a href="#url-after-confirmation" class="btn confirm" data-message="{$msgAreYouSure}">
								{$lblOk|ucfirst}
							</a>
						</p>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<p>
							This button will use a dialog to confirm the action, and when confirmed will dynamically build a form and submit it.
							<a href="https://github.com/sumocoders/Simple-Application-Framework/commit/6c8b5926bdfe8618a865274635094d1e04d3dce9">More information can be found on Github</a>.
						</p>
						<p>
							<a href="#url-off-the-form" class="btn btn-danger confirmPostForm"
								data-field-form="delete" data-field-form-id="1" data-message="{$msgAreYouSure}">
								<i class="icon-trash icon-white"></i>
								{$lblDelete|ucfirst}
							</a>
						</p>
					</div>
				</div>

				<table class="table">
					<thead>
						<tr>
							<th>Malesuada</th>
							<th colspan="2">Nullam</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Pellentesque Ligula</td>
							<td>Vehicula Porta</td>
							<td><a href="#" class="iconView">{$lblView|ucfirst}</a></td>
						</tr>
						<tr>
							<td>Cras sit</td>
							<td>vestibulum dapibus</td>
							<td><a href="#" class="iconView">{$lblView|ucfirst}</a></td>
						</tr>
						<tr>
							<td>Vehicula commodo cras</td>
							<td>Nibh Mattis</td>
							<td><a href="#" class="iconView">{$lblView|ucfirst}</a></td>
						</tr>
						<tr>
							<td>Vehicula cursus</td>
							<td>Magna Dapibus Tristique</td>
							<td><a href="#" class="iconView">{$lblView|ucfirst}</a></td>
						</tr>
					</tbody>
				</table>
			</div>
			<header class="taskbar">
			  <div class="container">
  				<div class="title">
  					<h2>Tellus ridiculus</h2>
  				</div>
  				<div class="actions">
  					<a href="#" class="dropdownToggle visible-phone" data-toggle="dropdownItems">{$lblActions|ucfirst}</a>
  					<ul class="dropdownItems">
  						<li><a class="iconList" href="#">{$lblOverview|ucfirst}</a></li>
  						<li><a class="iconPrint" href="#">{$lblPrint|ucfirst}</a></li>
  						<Li><a class="iconAdd" href="#">{$lblAdd|ucfirst}</a></Li>
  					</ul>
  				</div>
			  </div>
			</header>
			<div class="container">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#home" data-toggle="tab">Home</a></li>
					<li><a href="#profile" data-toggle="tab">Profile</a></li>
					<li><a href="#messages" data-toggle="tab">Messages</a></li>
					<li><a href="#settings" data-toggle="tab">Settings</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="home">
						<h3>Home, bitch</h3>
					</div>
					<div class="tab-pane" id="profile">
						<h3>This is your profile, bro</h3>
					</div>
					<div class="tab-pane" id="messages">
						<h3>You ain't got no friends, man</h3>
					</div>
					<div class="tab-pane" id="settings">
						<h3>Under tha hood</h3>
					</div>
				</div>
			</div>
		</section>
		{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
	</div>
</div>
</body>
</html>