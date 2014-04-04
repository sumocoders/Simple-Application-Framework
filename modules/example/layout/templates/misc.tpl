{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

<div id="contentWrap">
	<div id="content">
		<header id="header" role="banner">
			<div class="container bar">
				<div class="title">
					<a id="toggleMenu" class="visible-phone iconLink" href="#">{$lblMenu|uppercase}</a>
					<h2>Miscellaneous <small>Lightweight utility components</small></h2>
				</div>
			</div>
		</header>

      	{include:'{$CORE_PATH}/layout/templates/notifications.tpl'}

		<section id="main" role="main">
			<div class="container">
				<section id="misc">
				<h2>Wells</h2>
				<p>Use the well as a simple effect on an element to give it an inset effect.</p>
				<div class="bs-docs-example">
					<div class="well">
						Look, I'm in a well!
					</div>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"well"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  ...</span></li><li class="L2"><span class="tag">&lt;/div&gt;</span></li></ol></pre>
				<h3>Optional classes</h3>
				<p>Control padding and rounded corners with two optional modifier classes.</p>
				<div class="bs-docs-example">
					<div class="well well-lg">
						Look, I'm in a well!
					</div>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"well well-lg"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  ...</span></li><li class="L2"><span class="tag">&lt;/div&gt;</span></li></ol></pre>
				<div class="bs-docs-example">
					<div class="well well-sm">
						Look, I'm in a well!
					</div>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"well well-sm"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  ...</span></li><li class="L2"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<h2>Close icon</h2>
				<p>Use the generic close icon for dismissing content like modals and alerts.</p>
				<div class="bs-docs-example">
					<p><button class="close" style="float: none;">×</button></p>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"close"</span><span class="tag">&gt;</span><span class="pln">&amp;times;</span><span class="tag">&lt;/button&gt;</span></li></ol></pre>

				<h2 id="helper-classes-floats">Helper classes</h2>
				<p>Simple, focused classes for small display or behavior tweaks.</p>

				<h4>.pull-left</h4>
				<p>Float an element left</p>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="kwd">class</span><span class="pun">=</span><span class="str">"pull-left"</span></li></ol></pre>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="pun">.</span><span class="pln">pull</span><span class="pun">-</span><span class="pln">left </span><span class="pun">{</span></li><li class="L1"><span class="pln">  </span><span class="kwd">float</span><span class="pun">:</span><span class="pln"> left</span><span class="pun">;</span></li><li class="L2"><span class="pun">}</span></li></ol></pre>

				<h4>.pull-right</h4>
				<p>Float an element right</p>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="kwd">class</span><span class="pun">=</span><span class="str">"pull-right"</span></li></ol></pre>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="pun">.</span><span class="pln">pull</span><span class="pun">-</span><span class="pln">right </span><span class="pun">{</span></li><li class="L1"><span class="pln">  </span><span class="kwd">float</span><span class="pun">:</span><span class="pln"> right</span><span class="pun">;</span></li><li class="L2"><span class="pun">}</span></li></ol></pre>

				<h4>Center content blocks</h4>
				<p>Set an element to <code>display: block</code> and center via <code>margin</code>. Available as a mixin and class.</p>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="kwd">class</span><span class="pun">=</span><span class="str">"center-block"</span></li></ol></pre>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="pun">.</span><span class="pln">center-block </span><span class="pun">{</span></li><li class="L1"><span class="pln">  display</span><span class="pun">:</span><span class="pln"> </span><span class="com">block;</span></li><li class="L2"><span class="pln">  margin-right</span><span class="pun">:</span><span class="pln"> </span><span class="com">auto;</span></li><li class="L3"><span class="pln">  margin-left</span><span class="pun">:</span><span class="pln"> </span><span class="com">auto;</span></li><li class="L4"><span class="pun">}</span></li></ol></pre>

				<h4>.clearfix</h4>
				<p>Clear the <code>float</code> on any element</p>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="kwd">class</span><span class="pun">=</span><span class="str">"clearfix"</span></li></ol></pre>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="pun">.</span><span class="pln">clearfix </span><span class="pun">{</span></li><li class="L1"><span class="pln">  </span><span class="pun">*</span><span class="pln">zoom</span><span class="pun">:</span><span class="pln"> </span><span class="lit">1</span><span class="pun">;</span></li><li class="L2"><span class="pln">  </span><span class="pun">&amp;:</span><span class="pln">before</span><span class="pun">,</span></li><li class="L3"><span class="pln">  </span><span class="pun">&amp;:</span><span class="pln">after </span><span class="pun">{</span></li><li class="L4"><span class="pln">    display</span><span class="pun">:</span><span class="pln"> table</span><span class="pun">;</span></li><li class="L5"><span class="pln">    content</span><span class="pun">:</span><span class="pln"> </span><span class="str">""</span><span class="pun">;</span></li><li class="L6"><span class="pln">  </span><span class="pun">}</span></li><li class="L7"><span class="pln">  </span><span class="pun">&amp;:</span><span class="pln">after </span><span class="pun">{</span></li><li class="L8"><span class="pln">    clear</span><span class="pun">:</span><span class="pln"> both</span><span class="pun">;</span></li><li class="L9"><span class="pln">  </span><span class="pun">}</span></li><li class="L0"><span class="pun">}</span></li></ol></pre>

				<h4>Showing and hiding content</h4>
				<p>Force an element to be shown or hidden (including for screen readers) with the use of <code>.show</code> and <code>.hidden</code> classes. These classes use <code>!important</code> to avoid specificity conflicts, just like the <a href="#helper-classes-floats">quick floats</a>. They are only available for block level toggling. They can also be used as mixins.</p>
				<p><code>.hide</code> is available, but it does not always affect screen readers and is deprecated as of v3.0.1. Use <code>.hidden</code> or <code>.sr</code>-only instead.</p>
				<p>Furthermore, <code>.invisible</code> can be used to toggle only the visibility of an element, meaning its <code>display</code> is not modified and the element can still affect the flow of the document.</p>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="kwd">class</span><span class="pun">=</span><span class="str">"show"</span></li><li class="L1"><span class="kwd">class</span><span class="pun">=</span><span class="str">"hidden"</span></li><li class="L2"><span class="kwd">class</span><span class="pun">=</span><span class="str">"invisible"</span></li></ol></pre>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="pun">.</span><span class="pln">show </span><span class="pun">{</span></li><li class="L1"><span class="pln">  display</span><span class="pun">:</span><span class="pln"> </span><span class="com">block !important;</span></li><li class="L2"><span class="pun">}</span></li><li class="L3"></li><li class="L4"><span class="pun">.</span><span class="pln">hidden </span><span class="pun">{</span></li><li class="L4"><span class="pln">  display</span><span class="pun">:</span><span class="pln"> </span><span class="com">none !important;</span></li><li class="L5"><span class="pln">  visibility</span><span class="pun">:</span><span class="pln"> </span><span class="com">hidden !important;</span></li><li class="L6"><span class="pun">}</span></li><li class="L7"></li><li class="L8"><span class="pun">.</span><span class="pln">invisible </span><span class="pun">{</span></li><li class="L9"><span class="pln">  visibility</span><span class="pun">:</span><span class="pln"> </span><span class="com">hidden;</span></li><li class="L10"><span class="pun">}</span></li></ol></pre>

				<h4>Screen reader content</h4>
				<p>Hide an element to all devices except screen readers with .sr-only. Necessary for following <a href="../getting-started/#accessibility">accessibility best practices</a>.</p>
				<pre class="prettyprint linenums"><span class="tag">&lt;a</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"sr-only"</span><span class="pln"> </span><span class="atn">href</span><span class-"pun">=</span><span class="atv">"#content"</span><span class="tag">&gt;</span>Skip to main content<span class="tag">&lt;/a&gt;</span></pre>

				<h4>Image replacement</h4>
				<p>Utilize the .text-hide class or mixin to help replace an element's text content with a background image.</p>
				<pre class="prettyprint linenums"><span class="tag">&lt;h1</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"text-hide"</span><span class="tag">&gt;</span>Skip to main content<span class="tag">&lt;/h1&gt;</span></pre>
			</div>
		</section>
	</div>
</div>

{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
