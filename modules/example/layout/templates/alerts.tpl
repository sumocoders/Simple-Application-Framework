{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

<div id="contentWrap">
	<div id="content">
		<header id="header" role="banner">
			<div class="container bar">
				<div class="title">
					<a id="toggleMenu" class="visible-phone iconLink" href="#">{$lblMenu|uppercase}</a>
					<h2>Alerts <small>Styles for success, warning, and error messages</small></h2>
				</div>
			</div>
		</header>

      	{include:'{$CORE_PATH}/layout/templates/notifications.tpl'}

		<section id="main" role="main">
			<div class="container">
				<h2>Alerts</h2>
				<p>Wrap any text and an optional dismiss button in <code>.alert</code> and one of the four contextual classes (e.g., <code>.alert-success</code>) for basic alert messages.</p>
				<p>Alerts don't have default classes, only base and modifier classes. A default gray alert doesn't make too much sense, so you're required to specify a type via contextual class. Choose from success, info, warning, or danger.</p>
				<div class="bs-docs-example">
					<div class="alert alert-warning alert-dismissable">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<strong>Warning!</strong> Best check yo self, you're not looking too good.
					</div>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"alert alert-warning alert-dismissable"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"button"</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"close"</span><span class="pln"> </span><span class="atn">data-dismiss</span><span class="pun">=</span><span class="atv">"alert"</span><span class="tag">&gt;</span><span class="pln">&amp;times;</span><span class="tag">&lt;/button&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;strong&gt;</span><span class="pln">Warning!</span><span class="tag">&lt;/strong&gt;</span><span class="pln"> Best check yo self, you're not looking too good.</span></li><li class="L3"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<h3>Contextual alternatives</h3>
				<p>Add optional classes to change an alert's connotation.</p>

				<h4>Error or danger</h4>
				<div class="bs-docs-example">
					<div class="alert alert-error">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<strong>Oh snap!</strong> Change a few things up and try submitting again.
					</div>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"alert alert-error"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  ...</span></li><li class="L2"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<h4>Success</h4>
				<div class="bs-docs-example">
					<div class="alert alert-success">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<strong>Well done!</strong> You successfully read this important alert message.
					</div>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"alert alert-success"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  ...</span></li><li class="L2"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<h4>Information</h4>
				<div class="bs-docs-example">
					<div class="alert alert-info">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<strong>Heads up!</strong> This alert needs your attention, but it's not super important.
					</div>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"alert alert-info"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  ...</span></li><li class="L2"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<hr class="bs-docs-separator">

				<h2>Dismissable alerts</h2>
				<p>Build on any alert by adding an optional <code>.alert-dismissable</code> and close button.</p>
				<p>Be sure to use the <code>&lt;button&gt;</code> element with the <code>data-dismiss="alert"</code> data attribute.</p>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"alert alert-warning alert-dismissable"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"button"</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"close"</span><span class="pln"> </span><span class="atn">data-dismiss</span><span class="pun">=</span><span class="atv">"alert"</span><span class="tag">&gt;</span><span class="pln">&amp;times;</span><span class="tag">&lt;/button&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;strong&gt;</span>Warning!<span class="tag">&lt;/strong&gt;</span><span class="pln"> </span>Better check yourself, you're not looking too good.</li><li class="L3"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<h3>Dismiss alerts via JavaScript</h3>
				<p>Use the <a href="./javascript.html#alerts">alerts jQuery plugin</a> for quick and easy dismissal of alerts.</p>

				<hr class="bs-docs-separator">

				<h2>Links in alerts</h2>
				<p>Use the <code>.alert-link</code> utility class to quickly provide matching colored links within any alert.</p>
				<div class="bs-docs-example">
					<div class="alert alert-info">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<strong>Heads up!</strong> This <a href="#" class="alert-link">alert needs your attention</a>, but it's not super important.
					</div>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"alert alert-info"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;strong&gt;</span>Heads up!<span class="tag">&lt;/strong&gt;</span><span class="pln"> </span>This<span class="pln"> </span><span class="tag">&lt;a</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"alert-link"</span><span class="tag">&gt;</span>alert needs your attention<span class="tag">&lt;/a&gt;</span>,<span class="pln"> </span>but it's not super important</li><li class="L2"><span class="tag">&lt;/div&gt;</span></li></ol></pre>
			</div>
		</section>
	</div>
</div>

{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
