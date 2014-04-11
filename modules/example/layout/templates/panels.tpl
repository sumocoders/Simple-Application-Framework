{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

<div id="contentWrap">
	<div id="content">
		<header id="header" role="banner">
			<div class="container bar">
				<div class="title">
					<a id="toggleMenu" class="visible-xs iconLink" href="#">{$lblMenu|uppercase}</a>
					<h2>Panels</h2>
				</div>
			</div>
		</header>

      	{include:'{$CORE_PATH}/layout/templates/notifications.tpl'}

		<section id="main" role="main">
			<div class="container">
				<h2>Panels</h2>
				<p class="lead">While not always necessary, sometimes you need to put your DOM in a box. For those situations, try the panel component</p>

				<h3>Basic example classes</h3>
				<p>By default, all the <code>.panel</code> does is apply some basic border and padding to contain some content.</p>
				<div class="bs-docs-example">
					<div class="panel panel-default">
                        <div class="panel-body">Basic panel example</div>
					</div>
				</div>

				<h3>Panels with heading</h3>
				<p>Easily add a heading container to your panel with <code>.panel-heading</code>. You may also include any <code>&lt;h1&gt;</code>-<code>&lt;h6&gt;</code> with a <code>.panel-title</code> class to add a pre-styled heading.</p>
				<div class="bs-docs-example">
					<div class="panel panel-default">
                        <div class="panel-heading">Panel heading without title</div>
                        <div class="panel-body">Panel content</div>
					</div>
					<div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Panel title</h3>
                        </div>
                        <div class="panel-body">Panel content</div>
                    </div>
				</div>

				<h3>Panels with footer</h3>
				<p>Wrap buttons or secondary text in <code>.panel-footer</code>. Note that panel footers do not inherit colors and borders when using contextual variations as they are not meant to be in the foreground.</p>
				<div class="bs-docs-example">
					<div class="panel panel-default">
                        <div class="panel-body">Panel content</div>
                        <div class="panel-footer">Panel footer</div>
					</div>
				</div>

				<h3>Contextual alternatives</h3>
				<p>Use contextual classes to style list items, default or linked. Also includes <code>.active</code> state.</p>
				<div class="bs-docs-example">
    			    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Panel title</h3>
                        </div>
                        <div class="panel-body">Panel content</div>
                    </div>
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h3 class="panel-title">Panel title</h3>
                        </div>
                        <div class="panel-body">Panel content</div>
                    </div>
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">Panel title</h3>
                        </div>
                        <div class="panel-body">Panel content</div>
                    </div>
                    <div class="panel panel-warning">
                        <div class="panel-heading">
                            <h3 class="panel-title">Panel title</h3>
                        </div>
                        <div class="panel-body">Panel content</div>
                    </div>
                    <div class="panel panel-danger">
                        <div class="panel-heading">
                            <h3 class="panel-title">Panel title</h3>
                        </div>
                        <div class="panel-body">Panel content</div>
                    </div>
                </div>

				<h3>With tables</h3>
				<p>Add any non-bordered <code>.table</code> within a panel for a seamless design. If there is a <code>.panel-body</code>, we add an extra border to the top of the table for separation.</p>
				<div class="bs-docs-example">
                    <div class="panel panel-default">
                    <!-- Default panel contents -->
                        <div class="panel-heading">Panel heading</div>
                        <div class="panel-body">
                            <p>Some default panel content here. Nulla vitae elit libero, a pharetra augue. Aenean lacinia bibendum nulla sed consectetur. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                        </div>

                        <!-- Table -->
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Username</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>@mdo</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Jacob</td>
                                    <td>Thornton</td>
                                    <td>@fat</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>Larry</td>
                                    <td>the Bird</td>
                                    <td>@twitter</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
				</div>
				<p><span class="label label-info">Note!</span> If there is no panel body, the component moves from panel header to table without interruption.</p>

				<h3>With list groups</h3>
				<p>Easily include full-width list groups within any panel.</p>
				<div class="bs-docs-example">
                    <div class="panel panel-default">
                    <!-- Default panel contents -->
                        <div class="panel-heading">Panel heading</div>
                        <div class="panel-body">
                            <p>Some default panel content here. Nulla vitae elit libero, a pharetra augue. Aenean lacinia bibendum nulla sed consectetur. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                        </div>

                        <!-- List group -->
                        <ul class="list-group">
                            <li class="list-group-item">Cras justo odio</li>
                            <li class="list-group-item">Dapibus ac facilisis in</li>
                            <li class="list-group-item">Morbi leo risus</li>
                            <li class="list-group-item">Porta ac consectetur ac</li>
                            <li class="list-group-item">Vestibulum at eros</li>
                        </ul>
                    </div>
				</div>
			</div>
		</section>
	</div>
</div>

{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
