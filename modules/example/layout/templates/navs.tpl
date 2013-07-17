{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

<div id="contentWrap">
	<div id="content">
		<header id="header" role="banner">
			<div class="container">
				<div class="title">
					<a id="toggleMenu" class="visible-phone" href="#">{$lblMenu|uppercase}</a>
					<h2>Nav: tabs, pills, and lists</h2>
				</div>
			</div>
		</header>

      	{include:'{$CORE_PATH}/layout/templates/notifications.tpl'}

		<main id="main" role="main">
			<div class="container">
				<h2>Lightweight defaults <small>Same markup, different classes</small></h2>
				<p>All nav components here—tabs, pills, and lists—<strong>share the same base markup and styles</strong> through the <code>.nav</code> class.</p>

				<h3>Basic tabs</h3>
				<p>Take a regular <code>&lt;ul&gt;</code> of links and add <code>.nav-tabs</code>:</p>
				<div class="bs-docs-example">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#">Home</a></li>
						<li><a href="#">Profile</a></li>
						<li><a href="#">Messages</a></li>
					</ul>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"nav nav-tabs"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;li</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"active"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">    </span><span class="tag">&lt;a</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;</span><span class="pln">Home</span><span class="tag">&lt;/a&gt;</span></li><li class="L3"><span class="pln">  </span><span class="tag">&lt;/li&gt;</span></li><li class="L4"><span class="pln">  </span><span class="tag">&lt;li&gt;&lt;a</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;</span><span class="pln">...</span><span class="tag">&lt;/a&gt;&lt;/li&gt;</span></li><li class="L5"><span class="pln">  </span><span class="tag">&lt;li&gt;&lt;a</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;</span><span class="pln">...</span><span class="tag">&lt;/a&gt;&lt;/li&gt;</span></li><li class="L6"><span class="tag">&lt;/ul&gt;</span></li></ol></pre>

				<h3>Basic pills</h3>
				<p>Take that same HTML, but use <code>.nav-pills</code> instead:</p>
				<div class="bs-docs-example">
					<ul class="nav nav-pills">
						<li class="active"><a href="#">Home</a></li>
						<li><a href="#">Profile</a></li>
						<li><a href="#">Messages</a></li>
					</ul>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"nav nav-pills"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;li</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"active"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">    </span><span class="tag">&lt;a</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;</span><span class="pln">Home</span><span class="tag">&lt;/a&gt;</span></li><li class="L3"><span class="pln">  </span><span class="tag">&lt;/li&gt;</span></li><li class="L4"><span class="pln">  </span><span class="tag">&lt;li&gt;&lt;a</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;</span><span class="pln">...</span><span class="tag">&lt;/a&gt;&lt;/li&gt;</span></li><li class="L5"><span class="pln">  </span><span class="tag">&lt;li&gt;&lt;a</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;</span><span class="pln">...</span><span class="tag">&lt;/a&gt;&lt;/li&gt;</span></li><li class="L6"><span class="tag">&lt;/ul&gt;</span></li></ol></pre>

				<h3>Disabled state</h3>
				<p>For any nav component (tabs, pills, or list), add <code>.disabled</code> for <strong>gray links and no hover effects</strong>. Links will remain clickable, however, unless you remove the <code>href</code> attribute. Alternatively, you could implement custom JavaScript to prevent those clicks.</p>
				<div class="bs-docs-example">
					<ul class="nav nav-pills">
						<li><a href="#">Clickable link</a></li>
						<li><a href="#">Clickable link</a></li>
						<li class="disabled"><a href="#">Disabled link</a></li>
					</ul>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"nav nav-pills"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  ...</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;li</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"disabled"</span><span class="tag">&gt;&lt;a</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;</span><span class="pln">Home</span><span class="tag">&lt;/a&gt;&lt;/li&gt;</span></li><li class="L3"><span class="pln">  ...</span></li><li class="L4"><span class="tag">&lt;/ul&gt;</span></li></ol></pre>

				<h3>Component alignment</h3>
				<p>To align nav links, use the <code>.pull-left</code> or <code>.pull-right</code> utility classes. Both classes will add a CSS float in the specified direction.</p>


				<hr class="bs-docs-separator">


				<h2>Stackable</h2>
				<p>As tabs and pills are horizontal by default, just add a second class, <code>.nav-stacked</code>, to make them appear vertically stacked.</p>

				<h3>Stacked tabs</h3>
				<div class="bs-docs-example">
					<ul class="nav nav-tabs nav-stacked">
						<li class="active"><a href="#">Home</a></li>
						<li><a href="#">Profile</a></li>
						<li><a href="#">Messages</a></li>
					</ul>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"nav nav-tabs nav-stacked"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  ...</span></li><li class="L2"><span class="tag">&lt;/ul&gt;</span></li></ol></pre>

				<h3>Stacked pills</h3>
				<div class="bs-docs-example">
					<ul class="nav nav-pills nav-stacked">
						<li class="active"><a href="#">Home</a></li>
						<li><a href="#">Profile</a></li>
						<li><a href="#">Messages</a></li>
					</ul>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"nav nav-pills nav-stacked"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  ...</span></li><li class="L2"><span class="tag">&lt;/ul&gt;</span></li></ol></pre>


				<hr class="bs-docs-separator">


				<h2>Dropdowns</h2>
				<p>Add dropdown menus with a little extra HTML and the <a href="./javascript.html#dropdowns">dropdowns JavaScript plugin</a>.</p>

				<h3>Tabs with dropdowns</h3>
				<div class="bs-docs-example">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#">Home</a></li>
						<li><a href="#">Help</a></li>
						<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#">Dropdown <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li><a href="#">Separated link</a></li>
							</ul>
						</li>
					</ul>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"nav nav-tabs"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;li</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"dropdown"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">    </span><span class="tag">&lt;a</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"dropdown-toggle"</span></li><li class="L3"><span class="pln">       </span><span class="atn">data-toggle</span><span class="pun">=</span><span class="atv">"dropdown"</span></li><li class="L4"><span class="pln">       </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;</span></li><li class="L5"><span class="pln">        Dropdown</span></li><li class="L6"><span class="pln">        </span><span class="tag">&lt;b</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"caret"</span><span class="tag">&gt;&lt;/b&gt;</span></li><li class="L7"><span class="pln">      </span><span class="tag">&lt;/a&gt;</span></li><li class="L8"><span class="pln">    </span><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"dropdown-menu"</span><span class="tag">&gt;</span></li><li class="L9"><span class="pln">      </span><span class="com">&lt;!-- links --&gt;</span></li><li class="L0"><span class="pln">    </span><span class="tag">&lt;/ul&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;/li&gt;</span></li><li class="L2"><span class="tag">&lt;/ul&gt;</span></li></ol></pre>

				<h3>Pills with dropdowns</h3>
				<div class="bs-docs-example">
					<ul class="nav nav-pills">
						<li class="active"><a href="#">Home</a></li>
						<li><a href="#">Help</a></li>
						<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#">Dropdown <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li><a href="#">Separated link</a></li>
							</ul>
						</li>
					</ul>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"nav nav-pills"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;li</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"dropdown"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">    </span><span class="tag">&lt;a</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"dropdown-toggle"</span></li><li class="L3"><span class="pln">       </span><span class="atn">data-toggle</span><span class="pun">=</span><span class="atv">"dropdown"</span></li><li class="L4"><span class="pln">       </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;</span></li><li class="L5"><span class="pln">        Dropdown</span></li><li class="L6"><span class="pln">        </span><span class="tag">&lt;b</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"caret"</span><span class="tag">&gt;&lt;/b&gt;</span></li><li class="L7"><span class="pln">      </span><span class="tag">&lt;/a&gt;</span></li><li class="L8"><span class="pln">    </span><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"dropdown-menu"</span><span class="tag">&gt;</span></li><li class="L9"><span class="pln">      </span><span class="com">&lt;!-- links --&gt;</span></li><li class="L0"><span class="pln">    </span><span class="tag">&lt;/ul&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;/li&gt;</span></li><li class="L2"><span class="tag">&lt;/ul&gt;</span></li></ol></pre>


				<hr class="bs-docs-separator">


				<h2>Nav lists</h2>
				<p>A simple and easy way to build groups of nav links with optional headers. They're best used in sidebars like the Finder in OS X.</p>

				<h3>Example nav list</h3>
				<p>Take a list of links and add <code>class="nav nav-list"</code>:</p>
				<div class="bs-docs-example">
					<div class="well" style="max-width: 340px; padding: 8px 0;">
						<ul class="nav nav-list">
							<li class="nav-header">List header</li>
							<li class="active"><a href="#">Home</a></li>
							<li><a href="#">Library</a></li>
							<li><a href="#">Applications</a></li>
							<li class="nav-header">Another list header</li>
							<li><a href="#">Profile</a></li>
							<li><a href="#">Settings</a></li>
							<li class="divider"></li>
							<li><a href="#">Help</a></li>
						</ul>
					</div> <!-- /well -->
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"nav nav-list"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;li</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"nav-header"</span><span class="tag">&gt;</span><span class="pln">List header</span><span class="tag">&lt;/li&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;li</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"active"</span><span class="tag">&gt;&lt;a</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;</span><span class="pln">Home</span><span class="tag">&lt;/a&gt;&lt;/li&gt;</span></li><li class="L3"><span class="pln">  </span><span class="tag">&lt;li&gt;&lt;a</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;</span><span class="pln">Library</span><span class="tag">&lt;/a&gt;&lt;/li&gt;</span></li><li class="L4"><span class="pln">  ...</span></li><li class="L5"><span class="tag">&lt;/ul&gt;</span></li></ol></pre>
				<p>
					<span class="label label-info">Note</span>
					For nesting within a nav list, include <code>class="nav nav-list"</code> on any nested <code>&lt;ul&gt;</code>.
				</p>

				<h3>Horizontal dividers</h3>
				<p>Add a horizontal divider by creating an empty list item with the class <code>.divider</code>, like so:</p>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"nav nav-list"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  ...</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;li</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"divider"</span><span class="tag">&gt;&lt;/li&gt;</span></li><li class="L3"><span class="pln">  ...</span></li><li class="L4"><span class="tag">&lt;/ul&gt;</span></li></ol></pre>


				<hr class="bs-docs-separator">


				<h2>Tabbable nav</h2>
				<p>Bring your tabs to life with a simple plugin to toggle between content via tabs. Bootstrap integrates tabbable tabs in four styles: top (default), right, bottom, and left.</p>

				<h3>Tabbable example</h3>
				<p>To make tabs tabbable, create a <code>.tab-pane</code> with unique ID for every tab and wrap them in <code>.tab-content</code>.</p>
				<div class="bs-docs-example">
					<div class="tabbable" style="margin-bottom: 18px;">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#tab1" data-toggle="tab">Section 1</a></li>
							<li><a href="#tab2" data-toggle="tab">Section 2</a></li>
							<li><a href="#tab3" data-toggle="tab">Section 3</a></li>
						</ul>
						<div class="tab-content" style="padding-bottom: 9px; border-bottom: 1px solid #ddd;">
							<div class="tab-pane active" id="tab1">
								<p>I'm in Section 1.</p>
							</div>
							<div class="tab-pane" id="tab2">
								<p>Howdy, I'm in Section 2.</p>
							</div>
							<div class="tab-pane" id="tab3">
								<p>What up girl, this is Section 3.</p>
							</div>
						</div>
					</div> <!-- /tabbable -->
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"tabbable"</span><span class="tag">&gt;</span><span class="pln"> </span><span class="com">&lt;!-- Only required for left/right tabs --&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"nav nav-tabs"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">    </span><span class="tag">&lt;li</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"active"</span><span class="tag">&gt;&lt;a</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#tab1"</span><span class="pln"> </span><span class="atn">data-toggle</span><span class="pun">=</span><span class="atv">"tab"</span><span class="tag">&gt;</span><span class="pln">Section 1</span><span class="tag">&lt;/a&gt;&lt;/li&gt;</span></li><li class="L3"><span class="pln">    </span><span class="tag">&lt;li&gt;&lt;a</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#tab2"</span><span class="pln"> </span><span class="atn">data-toggle</span><span class="pun">=</span><span class="atv">"tab"</span><span class="tag">&gt;</span><span class="pln">Section 2</span><span class="tag">&lt;/a&gt;&lt;/li&gt;</span></li><li class="L4"><span class="pln">  </span><span class="tag">&lt;/ul&gt;</span></li><li class="L5"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"tab-content"</span><span class="tag">&gt;</span></li><li class="L6"><span class="pln">    </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"tab-pane active"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"tab1"</span><span class="tag">&gt;</span></li><li class="L7"><span class="pln">      </span><span class="tag">&lt;p&gt;</span><span class="pln">I'm in Section 1.</span><span class="tag">&lt;/p&gt;</span></li><li class="L8"><span class="pln">    </span><span class="tag">&lt;/div&gt;</span></li><li class="L9"><span class="pln">    </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"tab-pane"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"tab2"</span><span class="tag">&gt;</span></li><li class="L0"><span class="pln">      </span><span class="tag">&lt;p&gt;</span><span class="pln">Howdy, I'm in Section 2.</span><span class="tag">&lt;/p&gt;</span></li><li class="L1"><span class="pln">    </span><span class="tag">&lt;/div&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L3"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<h4>Fade in tabs</h4>
				<p>To make tabs fade in, add <code>.fade</code> to each <code>.tab-pane</code>.</p>

				<h4>Requires jQuery plugin</h4>
				<p>All tabbable tabs are powered by our lightweight jQuery plugin. Read more about how to bring tabbable tabs to life <a href="./javascript.html#tabs">on the JavaScript docs page</a>.</p>

				<h3>Tabbable in any direction</h3>

				<h4>Tabs on the bottom</h4>
				<p>Flip the order of the HTML and add a class to put tabs on the bottom.</p>
				<div class="bs-docs-example">
					<div class="tabbable tabs-below">
						<div class="tab-content">
							<div class="tab-pane active" id="A">
								<p>I'm in Section A.</p>
							</div>
							<div class="tab-pane" id="B">
								<p>Howdy, I'm in Section B.</p>
							</div>
							<div class="tab-pane" id="C">
								<p>What up girl, this is Section C.</p>
							</div>
						</div>
						<ul class="nav nav-tabs">
							<li class="active"><a href="#A" data-toggle="tab">Section 1</a></li>
							<li><a href="#B" data-toggle="tab">Section 2</a></li>
							<li><a href="#C" data-toggle="tab">Section 3</a></li>
						</ul>
					</div> <!-- /tabbable -->
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"tabbable tabs-below"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"tab-content"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">    ...</span></li><li class="L3"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L4"><span class="pln">  </span><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"nav nav-tabs"</span><span class="tag">&gt;</span></li><li class="L5"><span class="pln">    ...</span></li><li class="L6"><span class="pln">  </span><span class="tag">&lt;/ul&gt;</span></li><li class="L7"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<h4>Tabs on the left</h4>
				<p>Swap the class to put tabs on the left.</p>
				<div class="bs-docs-example">
					<div class="tabbable tabs-left">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#lA" data-toggle="tab">Section 1</a></li>
							<li><a href="#lB" data-toggle="tab">Section 2</a></li>
							<li><a href="#lC" data-toggle="tab">Section 3</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="lA">
								<p>I'm in Section A.</p>
							</div>
							<div class="tab-pane" id="lB">
								<p>Howdy, I'm in Section B.</p>
							</div>
							<div class="tab-pane" id="lC">
								<p>What up girl, this is Section C.</p>
							</div>
						</div>
					</div> <!-- /tabbable -->
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"tabbable tabs-left"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"nav nav-tabs"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">    ...</span></li><li class="L3"><span class="pln">  </span><span class="tag">&lt;/ul&gt;</span></li><li class="L4"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"tab-content"</span><span class="tag">&gt;</span></li><li class="L5"><span class="pln">    ...</span></li><li class="L6"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L7"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<h4>Tabs on the right</h4>
				<p>Swap the class to put tabs on the right.</p>
				<div class="bs-docs-example">
					<div class="tabbable tabs-right">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#rA" data-toggle="tab">Section 1</a></li>
							<li><a href="#rB" data-toggle="tab">Section 2</a></li>
							<li><a href="#rC" data-toggle="tab">Section 3</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="rA">
								<p>I'm in Section A.</p>
							</div>
							<div class="tab-pane" id="rB">
								<p>Howdy, I'm in Section B.</p>
							</div>
							<div class="tab-pane" id="rC">
								<p>What up girl, this is Section C.</p>
							</div>
						</div>
					</div> <!-- /tabbable -->
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"tabbable tabs-right"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"nav nav-tabs"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">    ...</span></li><li class="L3"><span class="pln">  </span><span class="tag">&lt;/ul&gt;</span></li><li class="L4"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"tab-content"</span><span class="tag">&gt;</span></li><li class="L5"><span class="pln">    ...</span></li><li class="L6"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L7"><span class="tag">&lt;/div&gt;</span></li></ol></pre>
			</div>
		</main>
	</div>
</div>

{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
</body>
</html>