{include:'{$CORE_PATH}/layout/templates/head.tpl'}

	<div class="container">
		<section id="{$MODULE}" class="{$ACTION}">
		  <div class="row-fluid">
  			<div class="span12">
  				<header class="header hide">
  					<h2>{$msgUsersLogin}</h2>
  				</header>

          		<a href="/" class="logo">Sumocoders</a>

  				{form:login}
  					{option:report}<div class="alert alert-info">{$report}</div>{/option:report}
  					{option:error}<div class="alert alert-error">{$errAuthenticationError}</div>{/option:error}

  					<fieldset>
  						<div class="control-group{option:txtLoginError} error{/option:txtLoginError}">
  							<label class="control-label" for="login">{$lblLogin|ucfirst}<abbr title="{$msgRequired}">*</abbr></label>
  							<div class="controls input-prepend">
  							  <div class="add-on username"></div>
  								{$txtLogin} {$txtLoginError}
  							</div>
  						</div>

  						<div class="control-group{option:txtPasswordError} error{/option:txtPasswordError}">
  							<label class="control-label" for="password">{$lblPassword|ucfirst}<abbr title="{$msgRequired}">*</abbr></label>
  							<div class="controls input-prepend">
  							  <div class="add-on password"></div>
  								{$txtPassword} {$txtPasswordError}
  							</div>
  						</div>
  						<button type="submit" class="btn btn-primary btn-block">{$lblSignIn|ucfirst}<i class="icon iconArrowWhiteRight"></i></button>
						<div class="forgotPassword">
							<small>
								<a href="{$var|buildurl:'forgot_password'}">{$msgUsersForgotPassword}</a>
							</small>
						</div>
  					</fieldset>
  				{/form:login}
  			</div>
		  </div>
		</section>

		<!-- {include:'{$CORE_PATH}/layout/templates/footer.tpl'} -->
	</div>
</body>
</html>
