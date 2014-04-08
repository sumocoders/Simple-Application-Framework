{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

<div id="contentWrap">
	<div id="content">
		<header id="header" role="banner">
			<div class="container">
				<div class="title">
					<a id="toggleMenu" class="visible-xs iconLink" href="#">{$lblMenu|uppercase}</a>
					<h2>{$msgUsersEdit|sprintf:{$item.name}}</h2>
				</div>
				{option:isAdmin}
					<div class="actions">
						<a href="#" class="dropdownToggle visible-xs" data-toggle="dropdownItems">{$lblActions|ucfirst}</a>
						<ul class="dropdownItems">
							<li><a class="iconList" href="{$var|buildurl:'index':'users'}">{$lblOverview|ucfirst}</a></li>
						</ul>
					</div>
				{/option:isAdmin}
			</div>
		</header>

		{include:'{$CORE_PATH}/layout/templates/notifications.tpl'}

		<section id="main" role="main">
			<div class="container">
				{form:edit}
					<div class="form">
						<div class="form-group{option:txtEmailError} error{/option:txtEmailError}">
							<label for="email" class="control-label">{$lblEmail|ucfirst}<abbr title="{$msgRequired}">*</abbr></label>
							{$txtEmail} {$txtEmailError}
						</div>
						<div class="form-group{option:txtNameError} error{/option:txtNameError}">
							<label for="name" class="control-label">{$lblName|ucfirst}<abbr title="{$msgRequired}">*</abbr></label>
							{$txtName} {$txtNameError}
						</div>
						<div class="form-group{option:txtPasswordError} error{/option:txtPasswordError}">
							<label for="password" class="control-label">{$lblPassword|ucfirst}<abbr title="{$msgRequired}">*</abbr></label>
							{$txtPassword} {$txtPasswordError}
						</div>
						{option:isAdmin}
							<div class="form-group{option:ddmTypeError} error{/option:ddmTypeError}">
								<label for="type" class="control-label">{$lblType|ucfirst}<abbr title="{$msgRequired}">*</abbr></label>
								{$ddmType} {$ddmTypeError}
							</div>
							<div class="form-group">
								<div class="checkbox">
									<label>
										{$chkBlocked} {$lblBlocked}? {$chkBlockedError}
									</label>
								</div>
							</div>
						{/option:isAdmin}

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
