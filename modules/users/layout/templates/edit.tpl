{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}
{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

	<div class="container-fluid">
		<section id="users" class="edit row-fluid">
			<div class="span12">
				<header class="header">
					<h2>{$msgUsersEdit|sprintf:{$item.name}}</h2>
				</header>

				{option:formEditHasError}
					<div class="alert alert-error">
						{$errGeneralFormError}
					</div>
				{/option:formEditHasError}

				{form:edit}
					<div class="form-horizontal">
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
						<div class="control-group{option:ddmTypeError} error{/option:ddmTypeError}">
							<label for="type" class="control-label">{$lblType|ucfirst}<abbr title="{$msgRequired}">*</abbr></label>
							<div class="controls">
								{$ddmType} {$ddmTypeError}
							</div>
						</div>

						<div class="form-actions">
							<input type="submit" class="btn btn-primary" name="ok" value="{$lblEdit|ucfirst}">
						</div>
					</div>
				{/form:edit}
			</div>
		</section>

		{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
	</div>
</body>
</html>