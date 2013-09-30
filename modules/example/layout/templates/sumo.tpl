{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

<div id="contentWrap">
	<div id="content">
		<header id="header" role="banner">
			<div class="container bar">
				<div class="title">
					<a id="toggleMenu" class="visible-phone iconLink" href="#">{$lblMenu|uppercase}</a>
					<h2>SumoCoders Framework</h2>
				</div>
			</div>
		</header>

      	{include:'{$CORE_PATH}/layout/templates/notifications.tpl'}

		<section id="main" role="main">
			<div class="container">
				<h2 id="headings">No items</h2>
        <div class="noItems" role="status">
          <div class="iconNoItems">Geen items</div>
            No items yet
          </div>
        
        <pre class="prettyprint linenums" style="margin-bottom: 9px;"><ol class="linenums"><li class="L0"><span class="tag">&lt;div div class="noItems" role="status"&gt;</span></li><li class="L1"><span class="pln">  &lt;div class="iconNoItems"&gt;</span></li><li class="L2">    Geen items</li><li class="L3">  &lt;/div&gt;</span></li><li class="L4"><span class="tag">&lt;/div&gt;</span></li></ol></pre>
        
      </div>
		</section>
	</div>
</div>

{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
</body>
</html>