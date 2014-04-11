{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

<div id="contentWrap">
	<div id="content">
		<header id="header" role="banner">
			<div class="container bar">
				<div class="title">
					<a id="toggleMenu" class="visible-xs iconLink" href="#">{$lblMenu|uppercase}</a>
					<h2>Responsive utilities</h2>
				</div>
			</div>
		</header>

      	{include:'{$CORE_PATH}/layout/templates/notifications.tpl'}

		<section id="main" role="main">
			<div class="container">
				<h2>Responsive utilities</h2>
				<p class="lead">For faster mobile-friendly development, use these utility classes for showing and hiding content by device via media query. Also included are utility classes for toggling content when printed.</p>
				<p>Try to use these on a limited basis and avoid creating entirely different versions of the same site. Instead, use them to complement each device's presentation. <strong>Responsive utilities are currently only available for block and table toggling</strong>. Use with inline and table elements is currently not supported.</p>

				<h3>Available classes</h3>
				<p>Use a single or combination of the available classes for toggling content across viewport breakpoints.</p>
				<div class="table-responsive">
			    <table class="table table-bordered table-striped responsive-utilities">
                    <thead>
                        <tr>
                            <th>
                            Extra small devices
                            <small>Phones (&lt;768px)</small>
                            </th>
                            <th>
                            Small devices
                            <small>Tablets (≥768px)</small>
                            </th>
                            <th>
                            Medium devices
                            <small>Desktops (≥992px)</small>
                            </th>
                            <th>
                            Large devices
                            <small>Desktops (≥1200px)</small>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th><code>.visible-xs</code></th>
                            <td class="is-visible">Visible</td>
                            <td class="is-hidden">Hidden</td>
                            <td class="is-hidden">Hidden</td>
                            <td class="is-hidden">Hidden</td>
                        </tr>
                        <tr>
                            <th><code>.visible-sm</code></th>
                            <td class="is-hidden">Hidden</td>
                            <td class="is-visible">Visible</td>
                            <td class="is-hidden">Hidden</td>
                            <td class="is-hidden">Hidden</td>
                        </tr>
                        <tr>
                            <th><code>.visible-md</code></th>
                            <td class="is-hidden">Hidden</td>
                            <td class="is-hidden">Hidden</td>
                            <td class="is-visible">Visible</td>
                            <td class="is-hidden">Hidden</td>
                        </tr>
                        <tr>
                            <th><code>.visible-lg</code></th>
                            <td class="is-hidden">Hidden</td>
                            <td class="is-hidden">Hidden</td>
                            <td class="is-hidden">Hidden</td>
                            <td class="is-visible">Visible</td>
                        </tr>
                    </tbody>
                    <tbody>
                        <tr>
                            <th><code>.hidden-xs</code></th>
                            <td class="is-hidden">Hidden</td>
                            <td class="is-visible">Visible</td>
                            <td class="is-visible">Visible</td>
                            <td class="is-visible">Visible</td>
                        </tr>
                        <tr>
                            <th><code>.hidden-sm</code></th>
                            <td class="is-visible">Visible</td>
                            <td class="is-hidden">Hidden</td>
                            <td class="is-visible">Visible</td>
                            <td class="is-visible">Visible</td>
                        </tr>
                        <tr>
                            <th><code>.hidden-md</code></th>
                            <td class="is-visible">Visible</td>
                            <td class="is-visible">Visible</td>
                            <td class="is-hidden">Hidden</td>
                            <td class="is-visible">Visible</td>
                        </tr>
                        <tr>
                            <th><code>.hidden-lg</code></th>
                            <td class="is-visible">Visible</td>
                            <td class="is-visible">Visible</td>
                            <td class="is-visible">Visible</td>
                            <td class="is-hidden">Hidden</td>
                        </tr>
                    </tbody>
                    </table>
                </div>

                <h3>Print classes</h3>
                <p>Similar to the regular responsive classes, use these for toggling content for print.</p>
                <div class="table-responsive">
                    <table class="table table-bordered table-striped responsive-utilities">
                        <thead>
                            <tr>
                                <th>Class</th>
                                <th>Browser</th>
                                <th>Print</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th><code>.visible-print</code></th>
                                <td class="is-hidden">Hidden</td>
                                <td class="is-visible">Visible</td>
                            </tr>
                            <tr>
                                <th><code>.hidden-print</code></th>
                                <td class="is-visible">Visible</td>
                                <td class="is-hidden">Hidden</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
			</div>
		</section>
	</div>
</div>

{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
