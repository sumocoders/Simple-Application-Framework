<footer id="footer" class="container-fluid">
	<div class="row-fluid">
		<div id="credits" class="span3">
			{* @todo replace the ... with the name of the application as a nice and url-compatible string *}
			<a href="http://www.sumocoders.be/?utm_source=...&amp;utm_medium=credits&amp;utm_campaign=client_sites" rel="external">
				SumoCoders
			</a>
		</div>

		<div id="legal" class="span4 content">
			{$msgFooterDisclaimer}
		</div>

		<div id="feedback" class="span2">
			<p>
				<a id="reportBug" href="#" class="bug">
					<i class="icon-bug"></i>
					{$msgReportBug}
				</a>
			</p>
		</div>
	</div>
</footer>
{include:'{$CORE_PATH}/layout/templates/dialogs.tpl'}
