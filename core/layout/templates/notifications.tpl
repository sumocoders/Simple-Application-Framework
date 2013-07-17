{option:report}
	<div class="alert alert-success" role="status">
		<div class="container">
			<a class="close" data-dismiss="alert" title="{$lblClose|ucfirst}">{$lblClose|ucfirst}</a>
			{$report}
		</div>
	</div>
{/option:report}

{option:error}
	<div class="alert alert-error" role="alert">
		<div class="container">
			<button type="button" class="close" data-dismiss="alert" title="{$lblClose|ucfirst}">{$lblClose|ucfirst}</button>
			{$error}
		</div>
	</div>
{/option:error}

{option:warning}
	<div class="alert alert-warning" role="alert">
		<div class="container">
			<button type="button" class="close" data-dismiss="alert" title="{$lblClose|ucfirst}">{$lblClose|ucfirst}</button>
			{$warning}
		</div>
	</div>
{/option:warning}

{option:formHasError}
	<div class="alert alert-error" role="alert">
		<div class="container">
			<button type="button" class="close" data-dismiss="alert" title="{$lblClose|ucfirst}">{$lblClose|ucfirst}</button>
			{$errGeneralFormError}
		</div>
	</div>
{/option:formHasError}
