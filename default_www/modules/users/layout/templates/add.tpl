{include:'{$CORE_PATH}/layout/templates/head.tpl'}
	<div id="container">
		{include:'{$CORE_PATH}/layout/templates/header.tpl'}
		{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

		<section id="users" class="add content">
			<header class="header">
				<h2>{$msgUsersAdd}</h2>
			</header>

			{form:add}
				{option:formAddHasError}<div class="message notice"><p>{$errGeneralFormError}</p></div>{/option:formAddHasError}

				<fieldset class="visibleFieldset">
					<p class="mediumInput{option:txtNameError} errorArea{/option:txtNameError}">
						<label for="name">{$lblName|ucfirst}<abbr title="{$msgRequired}">*</abbr></label>
						{$txtName} {$txtNameError}
					</p>
					<p class="mediumInput{option:txtEmailError} errorArea{/option:txtEmailError}">
						<label for="email">{$lblEmail|ucfirst}<small> (login)</small><abbr title="{$msgRequired}">*</abbr></label>
						{$txtEmail} {$txtEmailError}
					</p>
				</fieldset>

				<fieldset class="visibleFieldset">
					<p class="mediumInput{option:txtPassError} errorArea{/option:txtPassError}">
						<label for="pass">{$lblPassword|ucfirst}<abbr title="{$msgRequired}">*</abbr></label>
						{$txtPassword} {$txtPasswordError}
					</p>
					<p class="mediumInput{option:ddmTypeError} errorArea{/option:ddmTypeError}">
						<label for="type">{$lblType|ucfirst}<abbr title="{$msgRequired}">*</abbr></label>
						{$ddmType} {$ddmTypeError}
					</p>
				</fieldset>

				<p class="buttonHolder">
					<input type="submit" class="inputSubmit" name="ok" value="{$lblAdd|ucfirst}">
				</p>
			{/form:add}
		</section>

		{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
	</div>
</body>
</html>