{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

<div id="contentWrap">
	<div id="content">
		<header id="header" role="banner">
			<div class="container bar">
				<div class="title">
					<a id="toggleMenu" class="visible-phone iconLink" href="#">{$lblMenu|uppercase}</a>
					<h2>Typography</h2>
				</div>
			</div>
		</header>

      	{include:'{$CORE_PATH}/layout/templates/notifications.tpl'}

		<section id="main" role="main">
			<div class="container">
				<h2 id="headings">Headings</h2>
				<p>All HTML headings, <code>&lt;h1&gt;</code> through <code>&lt;h6&gt;</code> are available.</p>
				<div class="bs-docs-example">
					<h1>Nullam id dolor id nibh ultricies vehicula h1.</h1>
					<h2>Curabitur blandit tempus porttitor. Nulla vitae h2.</h2>
					<h3>Praesent commodo cursus magna, vel scelerisque nisl consectetur et h3.</h3>
					<h4>Morbi leo risus, porta ac consectetur ac, vestibulum at eros h4.</h4>
					<h5>Maecenas sed diam eget risus varius blandit sit amet non magna h5.</h5>
				</div>

				<h2 id="body-copy">Body copy</h2>
				<p>Bootstrap's global default <code>font-size</code> is <strong>14px</strong>, with a <code>line-height</code> of <strong>20px</strong>. This is applied to the <code>&lt;body&gt;</code> and all paragraphs. In addition, <code>&lt;p&gt;</code> (paragraphs) receive a bottom margin of half their line-height (10px by default).</p>
				<div class="bs-docs-example">
					<p>Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam id dolor id nibh ultricies vehicula.</p>
					<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec ullamcorper nulla non metus auctor fringilla. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Donec ullamcorper nulla non metus auctor fringilla.</p>
					<p>Maecenas sed diam eget risus varius blandit sit amet non magna. Donec id elit non mi porta gravida at eget metus. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>
				</div>
				<pre class="prettyprint"><span class="tag">&lt;p&gt;</span><span class="pln">...</span><span class="tag">&lt;/p&gt;</span></pre>

				<h3>Lead body copy</h3>
				<p>Make a paragraph stand out by adding <code>.lead</code>.</p>
				<div class="bs-docs-example">
					<p class="lead">Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus.</p>
				</div>
				<pre class="prettyprint"><span class="tag">&lt;p</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"lead"</span><span class="tag">&gt;</span><span class="pln">...</span><span class="tag">&lt;/p&gt;</span></pre>

				<h3>Built with Less</h3>
				<p>The typographic scale is based on two LESS variables in <strong>variables.less</strong>: <code>@baseFontSize</code> and <code>@baseLineHeight</code>. The first is the base font-size used throughout and the second is the base line-height. We use those variables and some simple math to create the margins, paddings, and line-heights of all our type and more. Customize them and Bootstrap adapts.</p>


				<hr class="bs-docs-separator">


				<h2 id="emphasis">Emphasis</h2>
				<p>Make use of HTML's default emphasis tags with lightweight styles.</p>

				<h3><code>&lt;small&gt;</code></h3>
				<p>For de-emphasizing inline or blocks of text, <small>use the small tag.</small></p>
				<div class="bs-docs-example">
					<p><small>This line of text is meant to be treated as fine print.</small></p>
				</div>
				<pre class="prettyprint"><span class="tag">&lt;p&gt;</span><span class="pln"></span><span class="tag">&lt;small&gt;</span><span class="pln">This line of text is meant to be treated as fine print.</span><span class="tag">&lt;/small&gt;</span><span class="pln"></span><span class="tag">&lt;/p&gt;</span></pre>

				<h3>Bold</h3>
				<p>For emphasizing a snippet of text with a heavier font-weight.</p>
				<div class="bs-docs-example">
					<p>The following snippet of text is <strong>rendered as bold text</strong>.</p>
				</div>
				<pre class="prettyprint"><span class="tag">&lt;strong&gt;</span><span class="pln">rendered as bold text</span><span class="tag">&lt;/strong&gt;</span></pre>

				<h3>Italics</h3>
				<p>For emphasizing a snippet of text with italics.</p>
				<div class="bs-docs-example">
					<p>The following snippet of text is <em>rendered as italicized text</em>.</p>
				</div>
				<pre class="prettyprint"><span class="tag">&lt;em&gt;</span><span class="pln">rendered as italicized text</span><span class="tag">&lt;/em&gt;</span></pre>

				<p><span class="label label-info">Heads up!</span> Feel free to use <code>&lt;b&gt;</code> and <code>&lt;i&gt;</code> in HTML5. <code>&lt;b&gt;</code> is meant to highlight words or phrases without conveying additional importance while <code>&lt;i&gt;</code> is mostly for voice, technical terms, etc.</p>

				<h3>Alignment classes</h3>
				<p>Easily realign text to components with text alignment classes.</p>
				<div class="bs-docs-example">
					<p class="text-left">Left aligned text.</p>
					<p class="text-center">Center aligned text.</p>
					<p class="text-right">Right aligned text.</p>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;p</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"text-left"</span><span class="tag">&gt;</span><span class="pln">Left aligned text.</span><span class="tag">&lt;/p&gt;</span></li><li class="L1"><span class="tag">&lt;p</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"text-center"</span><span class="tag">&gt;</span><span class="pln">Center aligned text.</span><span class="tag">&lt;/p&gt;</span></li><li class="L2"><span class="tag">&lt;p</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"text-right"</span><span class="tag">&gt;</span><span class="pln">Right aligned text.</span><span class="tag">&lt;/p&gt;</span></li></ol></pre>

				<h3>Emphasis classes</h3>
				<p>Convey meaning through color with a handful of emphasis utility classes.</p>
				<div class="bs-docs-example">
					<p class="muted">Fusce dapibus, tellus ac cursus commodo, tortor mauris nibh.</p>
					<p class="text-warning">Etiam porta sem malesuada magna mollis euismod.</p>
					<p class="text-error">Donec ullamcorper nulla non metus auctor fringilla.</p>
					<p class="text-info">Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis.</p>
					<p class="text-success">Duis mollis, est non commodo luctus, nisi erat porttitor ligula.</p>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;p</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"muted"</span><span class="tag">&gt;</span><span class="pln">Fusce dapibus, tellus ac cursus commodo, tortor mauris nibh.</span><span class="tag">&lt;/p&gt;</span></li><li class="L1"><span class="tag">&lt;p</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"text-warning"</span><span class="tag">&gt;</span><span class="pln">Etiam porta sem malesuada magna mollis euismod.</span><span class="tag">&lt;/p&gt;</span></li><li class="L2"><span class="tag">&lt;p</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"text-error"</span><span class="tag">&gt;</span><span class="pln">Donec ullamcorper nulla non metus auctor fringilla.</span><span class="tag">&lt;/p&gt;</span></li><li class="L3"><span class="tag">&lt;p</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"text-info"</span><span class="tag">&gt;</span><span class="pln">Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis.</span><span class="tag">&lt;/p&gt;</span></li><li class="L4"><span class="tag">&lt;p</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"text-success"</span><span class="tag">&gt;</span><span class="pln">Duis mollis, est non commodo luctus, nisi erat porttitor ligula.</span><span class="tag">&lt;/p&gt;</span></li></ol></pre>


				<hr class="bs-docs-separator">


				<h2 id="abbreviations">Abbreviations</h2>
				<p>Stylized implementation of HTML's <code>&lt;abbr&gt;</code> element for abbreviations and acronyms to show the expanded version on hover. Abbreviations with a <code>title</code> attribute have a light dotted bottom border and a help cursor on hover, providing additional context on hover.</p>

				<h3><code>&lt;abbr&gt;</code></h3>
				<p>For expanded text on long hover of an abbreviation, include the <code>title</code> attribute.</p>
				<div class="bs-docs-example">
					<p>An abbreviation of the word attribute is <abbr title="attribute">attr</abbr>.</p>
				</div>
				<pre class="prettyprint"><span class="tag">&lt;abbr</span><span class="pln"> </span><span class="atn">title</span><span class="pun">=</span><span class="atv">"attribute"</span><span class="tag">&gt;</span><span class="pln">attr</span><span class="tag">&lt;/abbr&gt;</span></pre>

				<h3><code>&lt;abbr class="initialism"&gt;</code></h3>
				<p>Add <code>.initialism</code> to an abbreviation for a slightly smaller font-size.</p>
				<div class="bs-docs-example">
					<p><abbr title="HyperText Markup Language" class="initialism">HTML</abbr> is the best thing since sliced bread.</p>
				</div>
				<pre class="prettyprint"><span class="tag">&lt;abbr</span><span class="pln"> </span><span class="atn">title</span><span class="pun">=</span><span class="atv">"HyperText Markup Language"</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"initialism"</span><span class="tag">&gt;</span><span class="pln">HTML</span><span class="tag">&lt;/abbr&gt;</span></pre>


				<hr class="bs-docs-separator">


				<h2 id="addresses">Addresses</h2>
				<p>Present contact information for the nearest ancestor or the entire body of work.</p>

				<h3><code>&lt;address&gt;</code></h3>
				<p>Preserve formatting by ending all lines with <code>&lt;br&gt;</code>.</p>
				<div class="bs-docs-example">
					<address>
						<strong>Twitter, Inc.</strong><br>
						795 Folsom Ave, Suite 600<br>
						San Francisco, CA 94107<br>
						<abbr title="Phone">P:</abbr> (123) 456-7890
					</address>
					<address>
						<strong>Full Name</strong><br>
						<a href="mailto:#">first.last@example.com</a>
					</address>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;address&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;strong&gt;</span><span class="pln">Twitter, Inc.</span><span class="tag">&lt;/strong&gt;&lt;br&gt;</span></li><li class="L2"><span class="pln">  795 Folsom Ave, Suite 600</span><span class="tag">&lt;br&gt;</span></li><li class="L3"><span class="pln">  San Francisco, CA 94107</span><span class="tag">&lt;br&gt;</span></li><li class="L4"><span class="pln">  </span><span class="tag">&lt;abbr</span><span class="pln"> </span><span class="atn">title</span><span class="pun">=</span><span class="atv">"Phone"</span><span class="tag">&gt;</span><span class="pln">P:</span><span class="tag">&lt;/abbr&gt;</span><span class="pln"> (123) 456-7890</span></li><li class="L5"><span class="tag">&lt;/address&gt;</span></li><li class="L6"><span class="pln">&nbsp;</span></li><li class="L7"><span class="tag">&lt;address&gt;</span></li><li class="L8"><span class="pln">  </span><span class="tag">&lt;strong&gt;</span><span class="pln">Full Name</span><span class="tag">&lt;/strong&gt;&lt;br&gt;</span></li><li class="L9"><span class="pln">  </span><span class="tag">&lt;a</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"mailto:#"</span><span class="tag">&gt;</span><span class="pln">first.last@example.com</span><span class="tag">&lt;/a&gt;</span></li><li class="L0"><span class="tag">&lt;/address&gt;</span></li></ol></pre>


				<hr class="bs-docs-separator">


				<h2 id="blockquotes">Blockquotes</h2>
				<p>For quoting blocks of content from another source within your document.</p>

				<h3>Default blockquote</h3>
				<p>Wrap <code>&lt;blockquote&gt;</code> around any <abbr title="HyperText Markup Language">HTML</abbr> as the quote. For straight quotes we recommend a <code>&lt;p&gt;</code>.</p>
				<div class="bs-docs-example">
					<blockquote>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
					</blockquote>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;blockquote&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;p&gt;</span><span class="pln">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</span><span class="tag">&lt;/p&gt;</span></li><li class="L2"><span class="tag">&lt;/blockquote&gt;</span></li></ol></pre>

				<h3>Blockquote options</h3>
				<p>Style and content changes for simple variations on a standard blockquote.</p>

				<h4>Naming a source</h4>
				<p>Add <code>&lt;small&gt;</code> tag for identifying the source. Wrap the name of the source work in <code>&lt;cite&gt;</code>.</p>
				<div class="bs-docs-example">
					<blockquote>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
						<small>Someone famous in <cite title="Source Title">Source Title</cite></small>
					</blockquote>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;blockquote&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;p&gt;</span><span class="pln">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</span><span class="tag">&lt;/p&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;small&gt;</span><span class="pln">Someone famous </span><span class="tag">&lt;cite</span><span class="pln"> </span><span class="atn">title</span><span class="pun">=</span><span class="atv">"Source Title"</span><span class="tag">&gt;</span><span class="pln">Source Title</span><span class="tag">&lt;/cite&gt;&lt;/small&gt;</span></li><li class="L3"><span class="tag">&lt;/blockquote&gt;</span></li></ol></pre>

				<h4>Alternate displays</h4>
				<p>Use <code>.pull-right</code> for a floated, right-aligned blockquote.</p>
				<div class="bs-docs-example" style="overflow: hidden;">
					<blockquote class="pull-right">
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
						<small>Someone famous in <cite title="Source Title">Source Title</cite></small>
					</blockquote>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;blockquote</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"pull-right"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  ...</span></li><li class="L2"><span class="tag">&lt;/blockquote&gt;</span></li></ol></pre>


				<hr class="bs-docs-separator">


				<!-- Lists -->
				<h2 id="lists">Lists</h2>

				<h3>Unordered</h3>
				<p>A list of items in which the order does <em>not</em> explicitly matter.</p>
				<div class="bs-docs-example">
					<ul>
						<li>Lorem ipsum dolor sit amet</li>
						<li>Consectetur adipiscing elit</li>
						<li>Integer molestie lorem at massa</li>
						<li>Facilisis in pretium nisl aliquet</li>
						<li>Nulla volutpat aliquam velit
							<ul>
								<li>Phasellus iaculis neque</li>
								<li>Purus sodales ultricies</li>
								<li>Vestibulum laoreet porttitor sem</li>
								<li>Ac tristique libero volutpat at</li>
							</ul>
						</li>
						<li>Faucibus porta lacus fringilla vel</li>
						<li>Aenean sit amet erat nunc</li>
						<li>Eget porttitor lorem</li>
					</ul>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;ul&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;li&gt;</span><span class="pln">...</span><span class="tag">&lt;/li&gt;</span></li><li class="L2"><span class="tag">&lt;/ul&gt;</span></li></ol></pre>

				<h3>Ordered</h3>
				<p>A list of items in which the order <em>does</em> explicitly matter.</p>
				<div class="bs-docs-example">
					<ol>
						<li>Lorem ipsum dolor sit amet</li>
						<li>Consectetur adipiscing elit</li>
						<li>Integer molestie lorem at massa</li>
						<li>Facilisis in pretium nisl aliquet</li>
						<li>Nulla volutpat aliquam velit</li>
						<li>Faucibus porta lacus fringilla vel</li>
						<li>Aenean sit amet erat nunc</li>
						<li>Eget porttitor lorem</li>
					</ol>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;ol&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;li&gt;</span><span class="pln">...</span><span class="tag">&lt;/li&gt;</span></li><li class="L2"><span class="tag">&lt;/ol&gt;</span></li></ol></pre>

				<h3>Unstyled</h3>
				<p>Remove the default <code>list-style</code> and left padding on list items (immediate children only).</p>
				<div class="bs-docs-example">
					<ul class="unstyled">
						<li>Lorem ipsum dolor sit amet</li>
						<li>Consectetur adipiscing elit</li>
						<li>Integer molestie lorem at massa</li>
						<li>Facilisis in pretium nisl aliquet</li>
						<li>Nulla volutpat aliquam velit
							<ul>
								<li>Phasellus iaculis neque</li>
								<li>Purus sodales ultricies</li>
								<li>Vestibulum laoreet porttitor sem</li>
								<li>Ac tristique libero volutpat at</li>
							</ul>
						</li>
						<li>Faucibus porta lacus fringilla vel</li>
						<li>Aenean sit amet erat nunc</li>
						<li>Eget porttitor lorem</li>
					</ul>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"unstyled"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;li&gt;</span><span class="pln">...</span><span class="tag">&lt;/li&gt;</span></li><li class="L2"><span class="tag">&lt;/ul&gt;</span></li></ol></pre>

				<h3>Inline</h3>
				<p>Place all list items on a single line with <code>inline-block</code> and some light padding.</p>
				<div class="bs-docs-example">
					<ul class="inline">
						<li>Lorem ipsum</li>
						<li>Phasellus iaculis</li>
						<li>Nulla volutpat</li>
					</ul>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"inline"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;li&gt;</span><span class="pln">...</span><span class="tag">&lt;/li&gt;</span></li><li class="L2"><span class="tag">&lt;/ul&gt;</span></li></ol></pre>

				<h3>Description</h3>
				<p>A list of terms with their associated descriptions.</p>
				<div class="bs-docs-example">
					<dl>
						<dt>Description lists</dt>
						<dd>A description list is perfect for defining terms.</dd>
						<dt>Euismod</dt>
						<dd>Vestibulum id ligula porta felis euismod semper eget lacinia odio sem nec elit.</dd>
						<dd>Donec id elit non mi porta gravida at eget metus.</dd>
						<dt>Malesuada porta</dt>
						<dd>Etiam porta sem malesuada magna mollis euismod.</dd>
					</dl>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;dl&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;dt&gt;</span><span class="pln">...</span><span class="tag">&lt;/dt&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;dd&gt;</span><span class="pln">...</span><span class="tag">&lt;/dd&gt;</span></li><li class="L3"><span class="tag">&lt;/dl&gt;</span></li></ol></pre>

				<h4>Horizontal description</h4>
				<p>Make terms and descriptions in <code>&lt;dl&gt;</code> line up side-by-side.</p>
				<div class="bs-docs-example">
					<dl class="dl-horizontal">
						<dt>Description lists</dt>
						<dd>A description list is perfect for defining terms.</dd>
						<dt>Euismod</dt>
						<dd>Vestibulum id ligula porta felis euismod semper eget lacinia odio sem nec elit.</dd>
						<dd>Donec id elit non mi porta gravida at eget metus.</dd>
						<dt>Malesuada porta</dt>
						<dd>Etiam porta sem malesuada magna mollis euismod.</dd>
						<dt>Felis euismod semper eget lacinia</dt>
						<dd>Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</dd>
					</dl>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;dl</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"dl-horizontal"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;dt&gt;</span><span class="pln">...</span><span class="tag">&lt;/dt&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;dd&gt;</span><span class="pln">...</span><span class="tag">&lt;/dd&gt;</span></li><li class="L3"><span class="tag">&lt;/dl&gt;</span></li></ol></pre>
				<p>
					<span class="label label-info">Heads up!</span>
					Horizontal description lists will truncate terms that are too long to fit in the left column fix <code>text-overflow</code>. In narrower viewports, they will change to the default stacked layout.
				</p>
			</div>
		</section>
	</div>
</div>

{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
</body>
</html>