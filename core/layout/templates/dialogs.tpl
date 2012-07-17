<div class="modal fade hide" id="confirmModal">
	<div class="modal-body">
		<p id="confirmModalMessage">…</p>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">{$lblCancel|ucfirst}</a>
		<a href="#" id="confirmModalOk" class="btn btn-primary">{$lblOk|ucfirst}</a>
	</div>
</div>

<div class="modal fade hide" id="reportBugModal">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">×</button>
		<h3>{$lblFeedback|ucfirst}</h3>
	</div>
	<div id="reportBugBox" class="modal-body">
		<div class="step step1">
			<p>{$msgBugReportStep1}</p>

			<div class="form-horizontal">
				<div class="control-group">
					<label for="reportBugDescription" class="control-label">{$lblDescription|ucfirst}<abbr title="{$lblRequiredField}">*</abbr></label>
					<div class="controls">
						<textarea id="reportBugDescription" class="input-xlarge" name="reportBugDescription" rows="6" cols="80"></textarea>
						<span id="reportBugDescriptionError" class="formError" style="display: none;">{$errFieldIsRequired}</span>
					</div>
				</div>
			</div>
		</div>

		<div class="step step2" style="display: none;">
			<p>{$msgBugReportStep2}</p>

			<div id="reportBugSubmitSpinnerHolder">
				<div id="reportBugSubmitSpinner">{$lblLoading|ucfirst}…</div>
			</div>
		</div>

		<div class="step step3" style="display: none;">
			<p>{$msgBugReportStep3}</p>

		</div>
	</div>
	<div class="modal-footer">
			<a href="#" id="reportBugPrevious" class="btn" style="display: none;">{$lblPrevious|ucfirst}</a>
			<a href="#" id="reportBugNext" class="btn btn-primary">{$lblNext|ucfirst}</a>
			<a href="#" id="reportBugSubmit" class="btn btn-primary disabled" style="display: none;">{$lblSend|ucfirst}</a>
			<a href="#" id="reportBugClose" class="btn btn-primary" data-dismiss="modal" style="display: none;">{$lblOk|ucfirst}</a>
	</div>
</div>
