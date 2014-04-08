{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

<div id="contentWrap">
	<div id="content">
		<header id="header" role="banner">
			<div class="container bar">
				<div class="title">
					<a id="toggleMenu" class="visible-xs iconLink" href="#">{$lblMenu|uppercase}</a>
					<h2>Labels and badges</h2>
				</div>
			</div>
		</header>

      	{include:'{$CORE_PATH}/layout/templates/notifications.tpl'}

		<section id="main" role="main">
			<div class="container">
				<h3>Labels</h3>
				<table class="table table-bordered table-striped">
					<thead>
					<tr>
						<th>Labels</th>
						<th>Markup</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td>
							<span class="label label-default">Default</span>
						</td>
						<td>
							<code>&lt;span class="label"&gt;Default&lt;/span&gt;</code>
						</td>
					</tr>
					<tr>
						<td>
							<span class="label label-success">Success</span>
						</td>
						<td>
							<code>&lt;span class="label label-success"&gt;Success&lt;/span&gt;</code>
						</td>
					</tr>
					<tr>
						<td>
							<span class="label label-warning">Warning</span>
						</td>
						<td>
							<code>&lt;span class="label label-warning"&gt;Warning&lt;/span&gt;</code>
						</td>
					</tr>
					<tr>
						<td>
							<span class="label label-danger">Important</span>
						</td>
						<td>
							<code>&lt;span class="label label-important"&gt;Important&lt;/span&gt;</code>
						</td>
					</tr>
					<tr>
						<td>
							<span class="label label-info">Info</span>
						</td>
						<td>
							<code>&lt;span class="label label-info"&gt;Info&lt;/span&gt;</code>
						</td>
					</tr>
					</tbody>
				</table>

				<h3>Badges</h3>
				<table class="table table-bordered table-striped">
					<thead>
					<tr>
						<th>Name</th>
						<th>Example</th>
						<th>Markup</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td>
							Default
						</td>
						<td>
							<span class="badge">1</span>
						</td>
						<td>
							<code>&lt;span class="badge"&gt;1&lt;/span&gt;</code>
						</td>
					</tr>
					</tbody>
				</table>

				<h3>Easily collapsible</h3>
				<p>For easy implementation, labels and badges will simply collapse (via CSS's <code>:empty</code> selector) when no content exists within.</p>

				<h3>Adapts to active nav state</h3>
				<p>Built-in styles are included for placing badges in active states in pill navigations</p>
				<ul class="nav nav-pills nav-stacked">
  				<li class="active">
    				<a href="#"><span class="badge pull-right">42</span>Home</a>
  				</li>
				</ul>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"nav nav-pills nav-stacked"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;li</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"active"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">    </span><span class="tag">&lt;a</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;</span></li><li class="L3"><span class="pln">      </span><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"badge pull-right"</span><span class="tag">&gt;</span>42<span class="tag">&lt;/span&gt;</span></li><li class="L4"><span class="pln">      </span>Home</li><li class="L5"><span class="pln">    </span><span class="tag">&lt;a&gt;</span><li class="L6"><span class="pln">  </span><span class="tag">&lt;/li&gt;</span></li><li class="L7"><span class="tag">&lt;ul&gt;</span></li></ol></pre>

			</div>
		</section>
	</div>
</div>

{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
