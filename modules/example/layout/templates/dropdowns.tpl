{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

<div id="contentWrap">
	<div id="content">
		<header id="header" role="banner">
			<div class="container bar">
				<div class="title">
					<a id="toggleMenu" class="visible-xs iconLink" href="#">{$lblMenu|uppercase}</a>
					<h2>Dropdown menus</h2>
				</div>
			</div>
		</header>

      	{include:'{$CORE_PATH}/layout/templates/notifications.tpl'}

		<section id="main" role="main">
			<div class="container">
				<h2>Example</h2>
				<p>Toggleable, contextual menu for displaying lists of links. Made interactive with the <a href="./javascript.html#dropdowns">dropdown JavaScript plugin</a>.</p>
				<div class="bs-docs-example">
					<div class="dropdown clearfix">
						<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu" style="display: block; position: static; margin-bottom: 5px; *width: 180px;">
							<li><a tabindex="-1" href="#">Action</a></li>
							<li><a tabindex="-1" href="#">Another action</a></li>
							<li><a tabindex="-1" href="#">Something else here</a></li>
							<li class="divider"></li>
							<li><a tabindex="-1" href="#">Separated link</a></li>
						</ul>
					</div>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"dropdown-menu"</span><span class="pln"> </span><span class="atn">role</span><span class="pun">=</span><span class="atv">"menu"</span><span class="pln"> </span><span class="atn">aria-labelledby</span><span class="pun">=</span><span class="atv">"dropdownMenu"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;li&gt;&lt;a</span><span class="pln"> </span><span class="atn">tabindex</span><span class="pun">=</span><span class="atv">"-1"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;</span><span class="pln">Action</span><span class="tag">&lt;/a&gt;&lt;/li&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;li&gt;&lt;a</span><span class="pln"> </span><span class="atn">tabindex</span><span class="pun">=</span><span class="atv">"-1"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;</span><span class="pln">Another action</span><span class="tag">&lt;/a&gt;&lt;/li&gt;</span></li><li class="L3"><span class="pln">  </span><span class="tag">&lt;li&gt;&lt;a</span><span class="pln"> </span><span class="atn">tabindex</span><span class="pun">=</span><span class="atv">"-1"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;</span><span class="pln">Something else here</span><span class="tag">&lt;/a&gt;&lt;/li&gt;</span></li><li class="L4"><span class="pln">  </span><span class="tag">&lt;li</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"divider"</span><span class="tag">&gt;&lt;/li&gt;</span></li><li class="L5"><span class="pln">  </span><span class="tag">&lt;li&gt;&lt;a</span><span class="pln"> </span><span class="atn">tabindex</span><span class="pun">=</span><span class="atv">"-1"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;</span><span class="pln">Separated link</span><span class="tag">&lt;/a&gt;&lt;/li&gt;</span></li><li class="L6"><span class="tag">&lt;/ul&gt;</span></li></ol></pre>

				<h2>Markup</h2>
				<p>Looking at just the dropdown menu, here's the required HTML. You need to wrap the dropdown's trigger and the dropdown menu within <code>.dropdown</code>, or another element that declares <code>position: relative;</code>. Then just create the menu.</p>

				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"dropdown"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="com">&lt;!-- Link or button to toggle dropdown --&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"dropdown-menu"</span><span class="pln"> </span><span class="atn">role</span><span class="pun">=</span><span class="atv">"menu"</span><span class="pln"> </span><span class="atn">aria-labelledby</span><span class="pun">=</span><span class="atv">"dLabel"</span><span class="tag">&gt;</span></li><li class="L3"><span class="pln">    </span><span class="tag">&lt;li&gt;&lt;a</span><span class="pln"> </span><span class="atn">tabindex</span><span class="pun">=</span><span class="atv">"-1"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;</span><span class="pln">Action</span><span class="tag">&lt;/a&gt;&lt;/li&gt;</span></li><li class="L4"><span class="pln">    </span><span class="tag">&lt;li&gt;&lt;a</span><span class="pln"> </span><span class="atn">tabindex</span><span class="pun">=</span><span class="atv">"-1"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;</span><span class="pln">Another action</span><span class="tag">&lt;/a&gt;&lt;/li&gt;</span></li><li class="L5"><span class="pln">    </span><span class="tag">&lt;li&gt;&lt;a</span><span class="pln"> </span><span class="atn">tabindex</span><span class="pun">=</span><span class="atv">"-1"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;</span><span class="pln">Something else here</span><span class="tag">&lt;/a&gt;&lt;/li&gt;</span></li><li class="L6"><span class="pln">    </span><span class="tag">&lt;li</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"divider"</span><span class="tag">&gt;&lt;/li&gt;</span></li><li class="L7"><span class="pln">    </span><span class="tag">&lt;li&gt;&lt;a</span><span class="pln"> </span><span class="atn">tabindex</span><span class="pun">=</span><span class="atv">"-1"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;</span><span class="pln">Separated link</span><span class="tag">&lt;/a&gt;&lt;/li&gt;</span></li><li class="L8"><span class="pln">  </span><span class="tag">&lt;/ul&gt;</span></li><li class="L9"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<h2>Options</h2>
				<h3>Aligning the menus</h3>
				<div class="bs-callout bs-callout-warning">
    			<h5>Deprecated <code>.pull-right</code> alignment</h5>
    			<p>As of v3.1.0, <code>.pull-right</code> has been depricated on dropdown menus. To right-align a menu, use <code>.dropdown-menu-right</code>. Right-aligned nav components in the navbar use a mixin version of this class to automatically align the menu. To override it, use <code>.dropdown-menu-left</code>.</p>
  			</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"dropdown-menu dropdown-menu-right"</span><span class="pln"> </span><span class="atn">role</span><span class="pun">=</span><span class="atv">"menu"</span><span class="pln"> </span><span class="atn">aria-labelledby</span><span class="pun">=</span><span class="atv">"dLabel"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  ...</span></li><li class="L2"><span class="tag">&lt;/ul&gt;</span></li></ol></pre>

				<h3>Headers</h3>
				<p>Add a header to label sections of actions in any dropdown menu.</p>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"dropdown-menu"</span><span class="pln"> </span><span class="atn">role</span><span class="pun">=</span><span class="atv">"menu"</span><span class="pln"> </span><span class="atn">aria-labelledby</span><span class="pun">=</span><span class="atv">"dropdownMenu2"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln"> </span><span class="pln">&lt;li</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"dropdown-header"</span><span class="pln"> </span><span class="atn">role</span><span class="pun">=</span><span class="atv">"presentation"</span><span class="pln"> </span><span class="tag">&gt;</span>Dropdown-header<span class="tag">&lt;/li&gt;</span></li><li class="L2"><span class="pln">  ...</span></li><li class="L3"><span class="pln"> </span><span class="pln">&lt;li</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"divider"</span><span class="pln"> </span><span class="atn">role</span><span class="pun">=</span><span class="atv">"presentation"</span><span class="pln"> </span><span class="tag">&gt;</span><span class="tag">&lt;/li&gt;</span></li><li class="L4"><span class="pln">  ...</span></li><li class="L5"><span class="tag">&lt;/ul&gt;</span></li></ol></pre>


				<h3>Disabled menu options</h3>
				<p>Add <code>.disabled</code> to a <code>&lt;li&gt;</code> in the dropdown to disable the link.</p>
				<div class="bs-docs-example">
					<div class="dropdown clearfix">
						<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu" style="display: block; position: static; margin-bottom: 5px; *width: 180px;">
							<li><a tabindex="-1" href="#">Regular link</a></li>
							<li class="disabled"><a tabindex="-1" href="#">Disabled link</a></li>
							<li><a tabindex="-1" href="#">Another link</a></li>
						</ul>
					</div>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"dropdown-menu"</span><span class="pln"> </span><span class="atn">role</span><span class="pun">=</span><span class="atv">"menu"</span><span class="pln"> </span><span class="atn">aria-labelledby</span><span class="pun">=</span><span class="atv">"dropdownMenu"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;li&gt;&lt;a</span><span class="pln"> </span><span class="atn">tabindex</span><span class="pun">=</span><span class="atv">"-1"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;</span><span class="pln">Regular link</span><span class="tag">&lt;/a&gt;&lt;/li&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;li</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"disabled"</span><span class="tag">&gt;&lt;a</span><span class="pln"> </span><span class="atn">tabindex</span><span class="pun">=</span><span class="atv">"-1"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;</span><span class="pln">Disabled link</span><span class="tag">&lt;/a&gt;&lt;/li&gt;</span></li><li class="L3"><span class="pln">  </span><span class="tag">&lt;li&gt;&lt;a</span><span class="pln"> </span><span class="atn">tabindex</span><span class="pun">=</span><span class="atv">"-1"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;</span><span class="pln">Another link</span><span class="tag">&lt;/a&gt;&lt;/li&gt;</span></li><li class="L4"><span class="tag">&lt;/ul&gt;</span></li></ol></pre>

				<h3>Sub menus on dropdowns</h3>
				<p>Submenu's are no longer supported</p>
				<!--<div class="bs-docs-example bs-docs-example-submenus clearfix">-->

					<!-- <div class="pull-left">
						<p class="text-muted">Default</p>
						<div class="dropdown clearfix">
							<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu" style="display: block; position: static; margin-bottom: 5px;">
								<li><a tabindex="-1" href="#">Action</a></li>
								<li><a tabindex="-1" href="#">Another action</a></li>
								<li><a tabindex="-1" href="#">Something else here</a></li>
								<li class="divider"></li>
								<li class="dropdown-submenu">
									<a tabindex="-1" href="#">More options</a>
									<ul class="dropdown-menu">
										<li><a tabindex="-1" href="#">Second level link</a></li>
										<li><a tabindex="-1" href="#">Second level link</a></li>
										<li><a tabindex="-1" href="#">Second level link</a></li>
										<li><a tabindex="-1" href="#">Second level link</a></li>
										<li><a tabindex="-1" href="#">Second level link</a></li>
									</ul>
								</li>
							</ul>
						</div>
					</div>

					<div class="pull-left">
						<p class="text-muted">Dropup</p>
						<div class="dropup">
							<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu" style="display: block; position: static; margin-bottom: 5px;">
								<li><a tabindex="-1" href="#">Action</a></li>
								<li><a tabindex="-1" href="#">Another action</a></li>
								<li><a tabindex="-1" href="#">Something else here</a></li>
								<li class="divider"></li>
								<li class="dropdown-submenu">
									<a tabindex="-1" href="#">More options</a>
									<ul class="dropdown-menu">
										<li><a tabindex="-1" href="#">Second level link</a></li>
										<li><a tabindex="-1" href="#">Second level link</a></li>
										<li><a tabindex="-1" href="#">Second level link</a></li>
										<li><a tabindex="-1" href="#">Second level link</a></li>
										<li><a tabindex="-1" href="#">Second level link</a></li>
									</ul>
								</li>
							</ul>
						</div>
					</div>

					<div class="pull-left">
						<p class="text-muted">Left submenu</p>
						<div class="dropdown">
							<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu" style="display: block; position: static; margin-bottom: 5px;">
								<li><a tabindex="-1" href="#">Action</a></li>
								<li><a tabindex="-1" href="#">Another action</a></li>
								<li><a tabindex="-1" href="#">Something else here</a></li>
								<li class="divider"></li>
								<li class="dropdown-submenu pull-left">
									<a tabindex="-1" href="#">More options</a>
									<ul class="dropdown-menu">
										<li><a tabindex="-1" href="#">Second level link</a></li>
										<li><a tabindex="-1" href="#">Second level link</a></li>
										<li><a tabindex="-1" href="#">Second level link</a></li>
										<li><a tabindex="-1" href="#">Second level link</a></li>
										<li><a tabindex="-1" href="#">Second level link</a></li>
									</ul>
								</li>
							</ul>
						</div>
					</div> -->

				<!--</div>-->
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"dropdown-menu"</span><span class="pln"> </span><span class="atn">role</span><span class="pun">=</span><span class="atv">"menu"</span><span class="pln"> </span><span class="atn">aria-labelledby</span><span class="pun">=</span><span class="atv">"dLabel"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  ...</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;li</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"dropdown-submenu"</span><span class="tag">&gt;</span></li><li class="L3"><span class="pln">    </span><span class="tag">&lt;a</span><span class="pln"> </span><span class="atn">tabindex</span><span class="pun">=</span><span class="atv">"-1"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;</span><span class="pln">More options</span><span class="tag">&lt;/a&gt;</span></li><li class="L4"><span class="pln">    </span><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"dropdown-menu"</span><span class="tag">&gt;</span></li><li class="L5"><span class="pln">      ...</span></li><li class="L6"><span class="pln">    </span><span class="tag">&lt;/ul&gt;</span></li><li class="L7"><span class="pln">  </span><span class="tag">&lt;/li&gt;</span></li><li class="L8"><span class="tag">&lt;/ul&gt;</span></li></ol></pre>
			</div>
		</section>
	</div>
</div>

{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
