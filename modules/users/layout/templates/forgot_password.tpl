{include:'{$CORE_PATH}/layout/templates/head.tpl'}

<div class="container">
	<section id="{$MODULE}" class="{$ACTION}">
		<div class="row">
			<div class="col-xs-12">
				<header class="header hide">
					<h2>{$msgUsersLogin}</h2>
				</header>

				<a href="/" class="logo">Sumocoders</a>

				{option:report}<div class="alert alert-info">{$report}</div>{/option:report}

				{form:forgotPassword}
					{option:error}<div class="alert alert-error">{$errUsersForgotPasswordNoUserFound}</div>{/option:error}

					<fieldset>
						<div class="control-group{option:txtLoginError} error{/option:txtLoginError}">
							<label class="control-label" for="login">{$lblEmail|ucfirst}<abbr title="{$msgRequired}">*</abbr></label>
							<div class="controls input-group">
								<div class="input-group-addon username"></div>
								{$txtEmail} {$txtEmailError}
							</div>
						</div>

						<button type="submit" class="btn btn-primary btn-block">{$lblSend|ucfirst}<i class="icon iconArrowWhiteRight"></i></button>
					</fieldset>
				{/form:forgotPassword}
			</div>
		</div>
	</section>

	<!-- {include:'{$CORE_PATH}/layout/templates/footer.tpl'} -->
</div>
</body>
</html>
