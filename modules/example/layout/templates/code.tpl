{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

<div id="contentWrap">
	<div id="content">
		<header id="header" role="banner">
			<div class="container">
				<div class="title">
					<a id="toggleMenu" class="visible-phone" href="#">{$lblMenu|uppercase}</a>
					<h2>Code</h2>
				</div>
			</div>
		</header>

      	{include:'{$CORE_PATH}/layout/templates/notifications.tpl'}

		<main id="main" role="main">
			<div class="container">
				<h2>Inline</h2>
				<p>Wrap inline snippets of code with <code>&lt;code&gt;</code>.</p>
				<div class="bs-docs-example">
					For example, <code>&lt;section&gt;</code> should be wrapped as inline.
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="typ">For</span><span class="pln"> example</span><span class="pun">,</span><span class="pln"> </span><span class="str">&lt;code&gt;</span><span class="pun">&amp;</span><span class="pln">lt</span><span class="pun">;</span><span class="pln">section</span><span class="pun">&amp;</span><span class="pln">gt</span><span class="pun">;&lt;/</span><span class="pln">code</span><span class="pun">&gt;</span><span class="pln"> should be wrapped </span><span class="kwd">as</span><span class="pln"> </span><span class="kwd">inline</span><span class="pun">.</span></li></ol></pre>

				<h2>Basic block</h2>
				<p>Use <code>&lt;pre&gt;</code> for multiple lines of code. Be sure to escape any angle brackets in the code for proper rendering.</p>
				<div class="bs-docs-example">
					<pre>&lt;p&gt;Sample text here...&lt;/p&gt;</pre>
				</div>
				<pre class="prettyprint linenums" style="margin-bottom: 9px;"><ol class="linenums"><li class="L0"><span class="tag">&lt;pre&gt;</span></li><li class="L1"><span class="pln">  &amp;lt;p&amp;gt;Sample text here...&amp;lt;/p&amp;gt;</span></li><li class="L2"><span class="tag">&lt;/pre&gt;</span></li></ol></pre>
				<p><span class="label label-info">Heads up!</span> Be sure to keep code within <code>&lt;pre&gt;</code> tags as close to the left as possible; it will render all tabs.</p>
				<p>You may optionally add the <code>.pre-scrollable</code> class which will set a max-height of 350px and provide a y-axis scrollbar.</p>
			</div>
		</main>
	</div>
</div>

{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
</body>
</html>