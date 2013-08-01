{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

<div id="contentWrap">
	<div id="content">
		<header id="header" role="banner">
			<div class="container bar">
				<div class="title">
					<a id="toggleMenu" class="visible-phone iconLink" href="#">{$lblMenu|uppercase}</a>
					<h2>Button groups</h2>
				</div>
			</div>
		</header>

      	{include:'{$CORE_PATH}/layout/templates/notifications.tpl'}

		<section id="main" role="main">
			<div class="container">
				<h2>Examples</h2>
				<p>Two basic options, along with two more specific variations.</p>

				<h3>Single button group</h3>
				<p>Wrap a series of buttons with <code>.btn</code> in <code>.btn-group</code>.</p>
				<div class="bs-docs-example">
					<div class="btn-group" style="margin: 9px 0 5px;">
						<button class="btn">Left</button>
						<button class="btn">Middle</button>
						<button class="btn">Right</button>
					</div>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn-group"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn"</span><span class="tag">&gt;</span><span class="pln">Left</span><span class="tag">&lt;/button&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn"</span><span class="tag">&gt;</span><span class="pln">Middle</span><span class="tag">&lt;/button&gt;</span></li><li class="L3"><span class="pln">  </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn"</span><span class="tag">&gt;</span><span class="pln">Right</span><span class="tag">&lt;/button&gt;</span></li><li class="L4"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<h3>Multiple button groups</h3>
				<p>Combine sets of <code>&lt;div class="btn-group"&gt;</code> into a <code>&lt;div class="btn-toolbar"&gt;</code> for more complex components.</p>
				<div class="bs-docs-example">
					<div class="btn-toolbar" style="margin: 0;">
						<div class="btn-group">
							<button class="btn">1</button>
							<button class="btn">2</button>
							<button class="btn">3</button>
							<button class="btn">4</button>
						</div>
						<div class="btn-group">
							<button class="btn">5</button>
							<button class="btn">6</button>
							<button class="btn">7</button>
						</div>
						<div class="btn-group">
							<button class="btn">8</button>
						</div>
					</div>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn-toolbar"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn-group"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">    ...</span></li><li class="L3"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L4"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<h3>Vertical button groups</h3>
				<p>Make a set of buttons appear vertically stacked rather than horizontally.</p>
				<div class="bs-docs-example">
					<div class="btn-group btn-group-vertical">
						<button type="button" class="btn"><i class="icon-align-left"></i></button>
						<button type="button" class="btn"><i class="icon-align-center"></i></button>
						<button type="button" class="btn"><i class="icon-align-right"></i></button>
						<button type="button" class="btn"><i class="icon-align-justify"></i></button>
					</div>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn-group btn-group-vertical"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  ...</span></li><li class="L2"><span class="tag">&lt;/div&gt;</span></li></ol></pre>


				<hr class="bs-docs-separator">


				<h4>Checkbox and radio flavors</h4>
				<p>Button groups can also function as radios, where only one button may be active, or checkboxes, where any number of buttons may be active. View <a href="./javascript.html#buttons">the JavaScript docs</a> for that.</p>

				<h4>Dropdowns in button groups</h4>
				<p><span class="label label-info">Heads up!</span> Buttons with dropdowns must be individually wrapped in their own <code>.btn-group</code> within a <code>.btn-toolbar</code> for proper rendering.</p>
		</div>
		</section>
	</div>
</div>

{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
</body>
</html>