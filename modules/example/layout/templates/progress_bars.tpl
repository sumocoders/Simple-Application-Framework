{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

<div id="contentWrap">
	<div id="content">
		<header id="header" role="banner">
			<div class="container bar">
				<div class="title">
					<a id="toggleMenu" class="visible-phone iconLink" href="#">{$lblMenu|uppercase}</a>
					<h2>Progress bars <small>For loading, redirecting, or action status</small></h2>
				</div>
			</div>
		</header>

      	{include:'{$CORE_PATH}/layout/templates/notifications.tpl'}

		<section id="main" role="main">
			<div class="container">
				<h2>Examples and markup</h2>

				<h3>Basic</h3>
				<p>Default progress bar with a vertical gradient.</p>
				<div class="bs-docs-example">
					<div class="progress">
						<div class="progress-bar" style="width: 60%;"></div>
					</div>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"progress"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"progress-bar"</span><span class="pln"> </span><span class="atn">style</span><span class="pun">=</span><span class="atv">"</span><span class="pln">width</span><span class="pun">:</span><span class="pln"> </span><span class="lit">60</span><span class="pun">%;</span><span class="atv">"</span><span class="tag">&gt;&lt;/div&gt;</span></li><li class="L2"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<h3>Striped</h3>
				<p>Uses a gradient to create a striped effect. Not available in IE7-8.</p>
				<div class="bs-docs-example">
					<div class="progress progress-striped">
						<div class="progress-bar" style="width: 20%;"></div>
					</div>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"progress progress-striped"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"progress-bar"</span><span class="pln"> </span><span class="atn">style</span><span class="pun">=</span><span class="atv">"</span><span class="pln">width</span><span class="pun">:</span><span class="pln"> </span><span class="lit">20</span><span class="pun">%;</span><span class="atv">"</span><span class="tag">&gt;&lt;/div&gt;</span></li><li class="L2"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<h3>Animated</h3>
				<p>Add <code>.active</code> to <code>.progress-striped</code> to animate the stripes right to left. Not available in all versions of IE.</p>
				<div class="bs-docs-example">
					<div class="progress progress-striped active">
						<div class="progress-bar" style="width: 45%"></div>
					</div>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"progress progress-striped active"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"progress-bar"</span><span class="pln"> </span><span class="atn">style</span><span class="pun">=</span><span class="atv">"</span><span class="pln">width</span><span class="pun">:</span><span class="pln"> </span><span class="lit">40</span><span class="pun">%;</span><span class="atv">"</span><span class="tag">&gt;&lt;/div&gt;</span></li><li class="L2"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<h3>Stacked</h3>
				<p>Place multiple bars into the same <code>.progress</code> to stack them.</p>
				<div class="bs-docs-example">
					<div class="progress">
						<div class="progress-bar progress-bar-success" style="width: 35%"></div>
						<div class="progress-bar progress-bar-warning" style="width: 20%"></div>
						<div class="progress-bar progress-bar-danger" style="width: 10%"></div>
					</div>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"progress"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"progress-bar progress-bar-success"</span><span class="pln"> </span><span class="atn">style</span><span class="pun">=</span><span class="atv">"</span><span class="pln">width</span><span class="pun">:</span><span class="pln"> </span><span class="lit">35</span><span class="pun">%;</span><span class="atv">"</span><span class="tag">&gt;&lt;/div&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"progress-bar progress-bar-warning"</span><span class="pln"> </span><span class="atn">style</span><span class="pun">=</span><span class="atv">"</span><span class="pln">width</span><span class="pun">:</span><span class="pln"> </span><span class="lit">20</span><span class="pun">%;</span><span class="atv">"</span><span class="tag">&gt;&lt;/div&gt;</span></li><li class="L3"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"progress-bar progress-bar-danger"</span><span class="pln"> </span><span class="atn">style</span><span class="pun">=</span><span class="atv">"</span><span class="pln">width</span><span class="pun">:</span><span class="pln"> </span><span class="lit">10</span><span class="pun">%;</span><span class="atv">"</span><span class="tag">&gt;&lt;/div&gt;</span></li><li class="L4"><span class="tag">&lt;/div&gt;</span></li></ol></pre>


				<hr class="bs-docs-separator">


				<h2>Options</h2>

				<h3>Additional colors</h3>
				<p>Progress bars use some of the same button and alert classes for consistent styles.</p>
				<div class="bs-docs-example">
					<div class="progress progress-info" style="margin-bottom: 9px;">
						<div class="progress-bar progress-bar-info" style="width: 20%"></div>
					</div>
					<div class="progress progress-success" style="margin-bottom: 9px;">
						<div class="progress-bar progress-bar-success" style="width: 40%"></div>
					</div>
					<div class="progress progress-warning" style="margin-bottom: 9px;">
						<div class="progress-bar progress-bar-warning" style="width: 60%"></div>
					</div>
					<div class="progress progress-danger">
						<div class="progress-bar progress-bar-danger" style="width: 80%"></div>
					</div>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"progress progress-info"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"progress-bar progress-bar-info"</span><span class="pln"> </span><span class="atn">style</span><span class="pun">=</span><span class="atv">"</span><span class="pln">width</span><span class="pun">:</span><span class="pln"> </span><span class="lit">20</span><span class="pun">%</span><span class="atv">"</span><span class="tag">&gt;&lt;/div&gt;</span></li><li class="L2"><span class="tag">&lt;/div&gt;</span></li><li class="L3"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"progress progress-success"</span><span class="tag">&gt;</span></li><li class="L4"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"progress-bar progress-bar-success"</span><span class="pln"> </span><span class="atn">style</span><span class="pun">=</span><span class="atv">"</span><span class="pln">width</span><span class="pun">:</span><span class="pln"> </span><span class="lit">40</span><span class="pun">%</span><span class="atv">"</span><span class="tag">&gt;&lt;/div&gt;</span></li><li class="L5"><span class="tag">&lt;/div&gt;</span></li><li class="L6"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"progress progress-warning"</span><span class="tag">&gt;</span></li><li class="L7"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"progress-bar progress-bar-warning"</span><span class="pln"> </span><span class="atn">style</span><span class="pun">=</span><span class="atv">"</span><span class="pln">width</span><span class="pun">:</span><span class="pln"> </span><span class="lit">60</span><span class="pun">%</span><span class="atv">"</span><span class="tag">&gt;&lt;/div&gt;</span></li><li class="L8"><span class="tag">&lt;/div&gt;</span></li><li class="L9"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"progress progress-danger"</span><span class="tag">&gt;</span></li><li class="L0"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"progress-bar progress-bar-danger"</span><span class="pln"> </span><span class="atn">style</span><span class="pun">=</span><span class="atv">"</span><span class="pln">width</span><span class="pun">:</span><span class="pln"> </span><span class="lit">80</span><span class="pun">%</span><span class="atv">"</span><span class="tag">&gt;&lt;/div&gt;</span></li><li class="L1"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<h3>Striped bars</h3>
				<p>Similar to the solid colors, we have varied striped progress bars.</p>
				<div class="bs-docs-example">
					<div class="progress progress-info progress-striped" style="margin-bottom: 9px;">
						<div class="progress-bar progress-bar-info" style="width: 20%"></div>
					</div>
					<div class="progress progress-success progress-striped" style="margin-bottom: 9px;">
						<div class="progress-bar progress-bar-success" style="width: 40%"></div>
					</div>
					<div class="progress progress-warning progress-striped" style="margin-bottom: 9px;">
						<div class="progress-bar progress-bar-warning" style="width: 60%"></div>
					</div>
					<div class="progress progress-danger progress-striped">
						<div class="progress-bar progress-bar-danger" style="width: 80%"></div>
					</div>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"progress progress-info progress-striped"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"progress-bar progress-bar-info"</span><span class="pln"> </span><span class="atn">style</span><span class="pun">=</span><span class="atv">"</span><span class="pln">width</span><span class="pun">:</span><span class="pln"> </span><span class="lit">20</span><span class="pun">%</span><span class="atv">"</span><span class="tag">&gt;&lt;/div&gt;</span></li><li class="L2"><span class="tag">&lt;/div&gt;</span></li><li class="L3"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"progress progress-success progress-striped"</span><span class="tag">&gt;</span></li><li class="L4"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"progress-bar progress-bar-success"</span><span class="pln"> </span><span class="atn">style</span><span class="pun">=</span><span class="atv">"</span><span class="pln">width</span><span class="pun">:</span><span class="pln"> </span><span class="lit">40</span><span class="pun">%</span><span class="atv">"</span><span class="tag">&gt;&lt;/div&gt;</span></li><li class="L5"><span class="tag">&lt;/div&gt;</span></li><li class="L6"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"progress progress-warning progress-striped"</span><span class="tag">&gt;</span></li><li class="L7"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"progress-bar progress-bar-warning"</span><span class="pln"> </span><span class="atn">style</span><span class="pun">=</span><span class="atv">"</span><span class="pln">width</span><span class="pun">:</span><span class="pln"> </span><span class="lit">60</span><span class="pun">%</span><span class="atv">"</span><span class="tag">&gt;&lt;/div&gt;</span></li><li class="L8"><span class="tag">&lt;/div&gt;</span></li><li class="L9"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"progress progress-danger progress-striped"</span><span class="tag">&gt;</span></li><li class="L0"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"progress-bar progress-bar-danger"</span><span class="pln"> </span><span class="atn">style</span><span class="pun">=</span><span class="atv">"</span><span class="pln">width</span><span class="pun">:</span><span class="pln"> </span><span class="lit">80</span><span class="pun">%</span><span class="atv">"</span><span class="tag">&gt;&lt;/div&gt;</span></li><li class="L1"><span class="tag">&lt;/div&gt;</span></li></ol></pre>


				<hr class="bs-docs-separator">


				<h2>Browser support</h2>
				<p>Progress bars use CSS3 gradients, transitions, and animations to achieve all their effects. These features are not supported in IE7-9 or older versions of Firefox.</p>
				<p>Versions earlier than Internet Explorer 10 and Opera 12 do not support animations.</p>
			</div>
		</section>
	</div>
</div>

{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
