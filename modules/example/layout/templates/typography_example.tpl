{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

<div id="contentWrap">
	<div id="content">
		<header id="header" role="banner">
			<div class="container bar">
				<div class="title">
					<a id="toggleMenu" class="visible-phone" href="#">{$lblMenu|uppercase}</a>
					<h2>Typographic components</h2>
				</div>
			</div>
		</header>

      	{include:'{$CORE_PATH}/layout/templates/notifications.tpl'}

		<section id="main" role="main">
			<div class="container">
					<h2>Hero unit</h2>
					<p>A lightweight, flexible component to showcase key content on your site. It works well on marketing and content-heavy sites.</p>
					<div class="bs-docs-example">
						<div class="hero-unit">
							<h1>Hello, world!</h1>
							<p>This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
							<p><a class="btn btn-primary btn-large">Learn more</a></p>
						</div>
					</div>
					<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"hero-unit"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;h1&gt;</span><span class="pln">Heading</span><span class="tag">&lt;/h1&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;p&gt;</span><span class="pln">Tagline</span><span class="tag">&lt;/p&gt;</span></li><li class="L3"><span class="pln">  </span><span class="tag">&lt;p&gt;</span></li><li class="L4"><span class="pln">    </span><span class="tag">&lt;a</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn btn-primary btn-large"</span><span class="tag">&gt;</span></li><li class="L5"><span class="pln">      Learn more</span></li><li class="L6"><span class="pln">    </span><span class="tag">&lt;/a&gt;</span></li><li class="L7"><span class="pln">  </span><span class="tag">&lt;/p&gt;</span></li><li class="L8"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

					<h2>Page header</h2>
					<p>A simple shell for an <code>h1</code> to appropriately space out and segment sections of content on a page. It can utilize the <code>h1</code>'s default <code>small</code>, element as well most other components (with additional styles).</p>
					<div class="bs-docs-example">
						<div class="page-header">
							<h1>Example page header <small>Subtext for header</small></h1>
						</div>
					</div>
					<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"page-header"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;h1&gt;</span><span class="pln">Example page header </span><span class="tag">&lt;small&gt;</span><span class="pln">Subtext for header</span><span class="tag">&lt;/small&gt;&lt;/h1&gt;</span></li><li class="L2"><span class="tag">&lt;/div&gt;</span></li></ol></pre>
			</div>
		</section>
	</div>
</div>

{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
</body>
</html>