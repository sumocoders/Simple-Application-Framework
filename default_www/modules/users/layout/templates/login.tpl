{include:'{$CORE_PATH}/layout/templates/head.tpl'}
	<div id="container">
		{include:'{$CORE_PATH}/layout/templates/header.tpl'}

		<section id="users" class="login content">
			<header class="header">
				<h2>{$msgUsersLogin}</h2>
			</header>

			{form:login}
				{option:report}<div class="message success"><p>{$report}</p></div>{/option:report}
				{option:error}<div class="message error"><p>{$errAuthenticationError}</p></div>{/option:error}

				<fieldset class="visibleFieldset horizontal{option:error} errorArea{/option:error}">
					<p{option:txtLoginError} class="errorArea"{/option:txtLoginError}>
						<label for="login">{$lblLogin|ucfirst}<abbr title="{$msgRequired}">*</abbr></label>
						{$txtLogin} {$txtLoginError}
					</p>
					<p{option:txtPasswordError} class="errorArea"{/option:txtPasswordError}>
						<label for="password">{$lblPassword|ucfirst}<abbr title="{$msgRequired}">*</abbr></label>
						{$txtPassword} {$txtPasswordError}
					</p>
					<p>
						<input type="submit" class="inputSubmit" name="ok" value="{$lblSignIn|ucfirst}">
					</p>
					<span class="logo"></span>
				</fieldset>
			{/form:login}
		{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
	</div>
</body>
</html>