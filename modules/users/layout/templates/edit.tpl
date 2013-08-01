{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

<div id="contentWrap">
	<div id="content">
		<header id="header" role="banner">
			<div class="container">
				<div class="title">
					<a id="toggleMenu" class="visible-phone iconLink" href="#">{$lblMenu|uppercase}</a>
					<h2>{$msgUsersEdit|sprintf:{$item.name}}</h2>
				</div>
				<div class="actions">
					<a href="#" class="dropdownToggle visible-phone" data-toggle="dropdownItems">{$lblActions|ucfirst}</a>
					<ul class="dropdownItems">
						<li><a class="iconList" href="{$var|buildurl:'index':'users'}">{$lblOverview|ucfirst}</a></li>
					</ul>
				</div>
			</div>
		</header>

		{include:'{$CORE_PATH}/layout/templates/notifications.tpl'}

		<section id="main" role="main">
			<div class="container">
				{form:edit}
					<div class="form">
						<div class="control-group{option:txtEmailError} error{/option:txtEmailError}">
							<label for="email" class="control-label">{$lblEmail|ucfirst}<abbr title="{$msgRequired}">*</abbr></label>
							<div class="controls">
								{$txtEmail} {$txtEmailError}
							</div>
						</div>
						<div class="control-group{option:txtNameError} error{/option:txtNameError}">
							<label for="name" class="control-label">{$lblName|ucfirst}<abbr title="{$msgRequired}">*</abbr></label>
							<div class="controls">
								{$txtName} {$txtNameError}
							</div>
						</div>
						<div class="control-group{option:txtPasswordError} error{/option:txtPasswordError}">
							<label for="password" class="control-label">{$lblPassword|ucfirst}<abbr title="{$msgRequired}">*</abbr></label>
							<div class="controls">
								{$txtPassword} {$txtPasswordError}
							</div>
						</div>
						{option:currentUser.isAdmin}
							<div class="control-group{option:ddmTypeError} error{/option:ddmTypeError}">
								<label for="type" class="control-label">{$lblType|ucfirst}<abbr title="{$msgRequired}">*</abbr></label>
								<div class="controls">
									{$ddmType} {$ddmTypeError}
								</div>
							</div>
							<div class="control-group">
								<div class="controls">
									<label class="checkbox">
										{$chkBlocked} {$lblBlocked}? {$chkBlockedError}
									</label>
								</div>
							</div>
						{/option:currentUser.isAdmin}

						<div class="form-actions">
							<input type="submit" class="btn btn-primary" name="ok" value="{$lblEdit|ucfirst}">
						</div>
					</div>
				{/form:edit}
			</div>
		</section>
	</div>
</div>

{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
</body>
</html>