<footer id="footer" class="container-fluid">
	<div class="row-fluid">
		<div id="credits" class="span3">
			{* @todo replace the ... with the name of the application as a nice and url-compatible string *}
			<a href="http://www.sumocoders.be/?utm_source=...&amp;utm_medium=credits&amp;utm_campaign=client_sites" rel="external">
				SumoCoders
			</a>
			© {$timestamp|date:'Y'} SumoCoders BVBA
		</div>

		<div id="legal" class="span4">
			<p>
				Lorem <a href="http://site-{$timestamp}.be">ipsum</a>, <a href="http://www.sumocoders.be">visited</a> dolor sit amet, consectetur adipiscing elit. In tellus diam, blandit ac dictum sit amet, pellentesque quis risus. Quisque rutrum, metus vel auctor dignissim.
			</p>
			<p>
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tellus diam, blandit ac dictum sit amet, pellentesque quis risus. Quisque rutrum, metus vel auctor dignissim.
			</p>
		</div>

		<div id="feedback" class="span2">
			<p>
				<a href="#" class="bug">
					<i class="icon-bug"></i>
					{$msgReportBug}
				</a>
			</p>
		</div>
	</div>
</footer>