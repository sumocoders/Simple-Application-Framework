{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

<div id="contentWrap">
	<div id="content">
		<header id="header" role="banner">
			<div class="container">
				<div class="title">
					<a id="toggleMenu" class="visible-phone" href="#">{$lblMenu|uppercase}</a>
					<h2>Alerts <small>Styles for success, warning, and error messages</small></h2>
				</div>
			</div>
		</header>

      	{include:'{$CORE_PATH}/layout/templates/notifications.tpl'}

		<main id="main" role="main">
			<div class="container">
				<h2>Default alert</h2>
				<p>Wrap any text and an optional dismiss button in <code>.alert</code> for a basic warning alert message.</p>
				<div class="bs-docs-example">
					<div class="alert">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<strong>Warning!</strong> Best check yo self, you're not looking too good.
					</div>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"alert"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"button"</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"close"</span><span class="pln"> </span><span class="atn">data-dismiss</span><span class="pun">=</span><span class="atv">"alert"</span><span class="tag">&gt;</span><span class="pln">&amp;times;</span><span class="tag">&lt;/button&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;strong&gt;</span><span class="pln">Warning!</span><span class="tag">&lt;/strong&gt;</span><span class="pln"> Best check yo self, you're not looking too good.</span></li><li class="L3"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<h3>Dismiss buttons</h3>
				<p>Mobile Safari and Mobile Opera browsers, in addition to the <code>data-dismiss="alert"</code> attribute, require an <code>href="#"</code> for the dismissal of alerts when using an <code>&lt;a&gt;</code> tag.</p>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;a</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"close"</span><span class="pln"> </span><span class="atn">data-dismiss</span><span class="pun">=</span><span class="atv">"alert"</span><span class="tag">&gt;</span><span class="pln">&amp;times;</span><span class="tag">&lt;/a&gt;</span></li></ol></pre>
				<p>Alternatively, you may use a <code>&lt;button&gt;</code> element with the data attribute, which we have opted to do for our docs. When using <code>&lt;button&gt;</code>, you must include <code>type="button"</code> or your forms may not submit.</p>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"button"</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"close"</span><span class="pln"> </span><span class="atn">data-dismiss</span><span class="pun">=</span><span class="atv">"alert"</span><span class="tag">&gt;</span><span class="pln">&amp;times;</span><span class="tag">&lt;/button&gt;</span></li></ol></pre>

				<h3>Dismiss alerts via JavaScript</h3>
				<p>Use the <a href="./javascript.html#alerts">alerts jQuery plugin</a> for quick and easy dismissal of alerts.</p>


				<hr class="bs-docs-separator">


				<h2>Options</h2>
				<p>For longer messages, increase the padding on the top and bottom of the alert wrapper by adding <code>.alert-block</code>.</p>
				<div class="bs-docs-example">
					<div class="alert alert-block">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<h4>Warning!</h4>
						<p>Best check yo self, you're not looking too good. Nulla vitae elit libero, a pharetra augue. Praesent commodo cursus magna, vel scelerisque nisl consectetur et.</p>
					</div>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"alert alert-block"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"button"</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"close"</span><span class="pln"> </span><span class="atn">data-dismiss</span><span class="pun">=</span><span class="atv">"alert"</span><span class="tag">&gt;</span><span class="pln">&amp;times;</span><span class="tag">&lt;/button&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;h4&gt;</span><span class="pln">Warning!</span><span class="tag">&lt;/h4&gt;</span></li><li class="L3"><span class="pln">  Best check yo self, you're not...</span></li><li class="L4"><span class="tag">&lt;/div&gt;</span></li></ol></pre>


				<hr class="bs-docs-separator">


				<h2>Contextual alternatives</h2>
				<p>Add optional classes to change an alert's connotation.</p>

				<h3>Error or danger</h3>
				<div class="bs-docs-example">
					<div class="alert alert-error">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<strong>Oh snap!</strong> Change a few things up and try submitting again.
					</div>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"alert alert-error"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  ...</span></li><li class="L2"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<h3>Success</h3>
				<div class="bs-docs-example">
					<div class="alert alert-success">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<strong>Well done!</strong> You successfully read this important alert message.
					</div>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"alert alert-success"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  ...</span></li><li class="L2"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<h3>Information</h3>
				<div class="bs-docs-example">
					<div class="alert alert-info">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<strong>Heads up!</strong> This alert needs your attention, but it's not super important.
					</div>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"alert alert-info"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  ...</span></li><li class="L2"><span class="tag">&lt;/div&gt;</span></li></ol></pre>
			</div>
		</main>
	</div>
</div>

{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
</body>
</html>