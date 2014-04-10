{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

<div id="contentWrap">
	<div id="content">
		<header id="header" role="banner">
			<div class="container bar">
				<div class="title">
					<a id="toggleMenu" class="visible-xs iconLink" href="#">{$lblMenu|uppercase}</a>
					<h2>Icons</h2>
				</div>
			</div>
		</header>

      	{include:'{$CORE_PATH}/layout/templates/notifications.tpl'}

		<section id="main" role="main">
			<div class="container">
				<h2>Font Awesome</h2>
				<h3>Available icons</h3>
					<div class="fontawesome-icon">
						<ul class="fontawesome-icon-list">
			        <li>
			          <span class="fa fa-asterisk"></span>
			          <span class="fa-class">fa fa-asterisk</span>
			        </li>
			        <li>
			          <span class="fa fa-plus"></span>
			          <span class="fa-class">fa fa-plus</span>
			        </li>
			        <li>
			          <span class="fa fa-euro"></span>
			          <span class="fa-class">fa fa-euro</span>
			        </li>
			        <li>
			          <span class="fa fa-minus"></span>
			          <span class="fa-class">fa fa-minus</span>
			        </li>
			        <li>
			          <span class="fa fa-cloud"></span>
			          <span class="fa-class">fa fa-cloud</span>
			        </li>
			        <li>
			          <span class="fa fa-envelope"></span>
			          <span class="fa-class">fa fa-envelope</span>
			        </li>
			        <li>
			          <span class="fa fa-pencil"></span>
			          <span class="fa-class">fa fa-pencil</span>
			        </li>
			        <li>
			          <span class="fa fa-glass"></span>
			          <span class="fa-class">fa fa-glass</span>
			        </li>
			        <li>
			          <span class="fa fa-music"></span>
			          <span class="fa-class">fa fa-music</span>
			        </li>
			        <li>
			          <span class="fa fa-search"></span>
			          <span class="fa-class">fa fa-search</span>
			        </li>
			        <li>
			          <span class="fa fa-heart"></span>
			          <span class="fa-class">fa fa-heart</span>
			        </li>
			        <li>
			          <span class="fa fa-star"></span>
			          <span class="fa-class">fa fa-star</span>
			        </li>
			        <li>
			          <span class="fa fa-star-empty"></span>
			          <span class="fa-class">fa fa-star-empty</span>
			        </li>
			        <li>
			          <span class="fa fa-user"></span>
			          <span class="fa-class">fa fa-user</span>
			        </li>
			        <li>
			          <span class="fa fa-film"></span>
			          <span class="fa-class">fa fa-film</span>
			        </li>
			        <li>
			          <span class="fa fa-th-large"></span>
			          <span class="fa-class">fa fa-th-large</span>
			        </li>
			        <li>
			          <span class="fa fa-th"></span>
			          <span class="fa-class">fa fa-th</span>
			        </li>
			        <li>
			          <span class="fa fa-th-list"></span>
			          <span class="fa-class">fa fa-th-list</span>
			        </li>
			        <li>
			          <span class="fa fa-search-plus"></span>
			          <span class="fa-class">fa fa-search-plus</span>
			        </li>
			        <li>
			          <span class="fa fa-search-minus"></span>
			          <span class="fa-class">fa fa-search-minus</span>
			        </li>
			        <li>...</li>
			    </ul>
				</div>

				<h3>Font Awesone examples</h3>
				<p>Use them in buttons, button groups for a toolbar, navigation, or prepended form inputs.</p>
				<h4>Buttons</h4>

				<h5>Button group in a button toolbar</h5>
				<div class="bs-docs-example">
					<div class="btn-toolbar">
						<div class="btn-group">
							<a class="btn btn-default" href="#"><i class="fa fa-align-left"></i></a>
							<a class="btn" href="#"><i class="fa fa-align-center"></i></a>
							<a class="btn" href="#"><i class="fa fa-align-right"></i></a>
							<a class="btn" href="#"><i class="fa fa-align-justify"></i></a>
						</div>
					</div>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn-toolbar"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn-group"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">    </span><span class="tag">&lt;a</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;&lt;i</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"fa fa-align-left"</span><span class="tag">&gt;&lt;/i&gt;&lt;/a&gt;</span></li><li class="L3"><span class="pln">    </span><span class="tag">&lt;a</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;&lt;i</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"fa fa-align-center"</span><span class="tag">&gt;&lt;/i&gt;&lt;/a&gt;</span></li><li class="L4"><span class="pln">    </span><span class="tag">&lt;a</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;&lt;i</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"fa fa-align-right"</span><span class="tag">&gt;&lt;/i&gt;&lt;/a&gt;</span></li><li class="L5"><span class="pln">    </span><span class="tag">&lt;a</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;&lt;i</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"fa fa-align-justify"</span><span class="tag">&gt;&lt;/i&gt;&lt;/a&gt;</span></li><li class="L6"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L7"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<h5>Dropdown in a button group</h5>
				<div class="bs-docs-example">
					<div class="btn-group">
						<a class="btn btn-primary" href="#"><i class="icon-user icon-white"></i> User</a>
						<a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#"><i class="fa fa-pencil"></i> Edit</a></li>
							<li><a href="#"><i class="fa fa-trash-o"></i> Delete</a></li>
							<li><a href="#"><i class="fa fa-ban"></i> Ban</a></li>
							<li class="divider"></li>
							<li><a href="#"><i class="i"></i> Make admin</a></li>
						</ul>
					</div>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn-group"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;a</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn btn-primary"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;&lt;i</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"fa fa-user fa-white"</span><span class="tag">&gt;&lt;/i&gt;</span><span class="pln"> User</span><span class="tag">&lt;/a&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;a</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn btn-primary dropdown-toggle"</span><span class="pln"> </span><span class="atn">data-toggle</span><span class="pun">=</span><span class="atv">"dropdown"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"caret"</span><span class="tag">&gt;&lt;/span&gt;&lt;/a&gt;</span></li><li class="L3"><span class="pln">  </span><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"dropdown-menu"</span><span class="tag">&gt;</span></li><li class="L4"><span class="pln">    </span><span class="tag">&lt;li&gt;&lt;a</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;&lt;i</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"fa fa-pencil"</span><span class="tag">&gt;&lt;/i&gt;</span><span class="pln"> Edit</span><span class="tag">&lt;/a&gt;&lt;/li&gt;</span></li><li class="L5"><span class="pln">    </span><span class="tag">&lt;li&gt;&lt;a</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;&lt;i</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"fa fa-trash-o"</span><span class="tag">&gt;&lt;/i&gt;</span><span class="pln"> Delete</span><span class="tag">&lt;/a&gt;&lt;/li&gt;</span></li><li class="L7"><span class="pln">    </span><span class="tag">&lt;li</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"divider"</span><span class="tag">&gt;&lt;/li&gt;</span></li><li class="L8"><span class="pln">    </span><span class="tag">&lt;li&gt;&lt;a</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;&lt;i</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"i"</span><span class="tag">&gt;&lt;/i&gt;</span><span class="pln"> Make admin</span><span class="tag">&lt;/a&gt;&lt;/li&gt;</span></li><li class="L9"><span class="pln">  </span><span class="tag">&lt;/ul&gt;</span></li><li class="L0"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<h5>Button sizes</h5>
				<div class="bs-docs-example">
					<a class="btn btn-lg" href="#"><i class="fa fa-star"></i> Star</a>
					<a class="btn" href="#"><i class="fa fa-star"></i> Star</a>
					<a class="btn btn-sm" href="#"><i class="fa fa-star"></i> Star</a>
					<a class="btn btn-xs" href="#"><i class="fa fa-star"></i> Star</a>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;a</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn btn-lg"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;&lt;i</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"fa fa-star"</span><span class="tag">&gt;&lt;/i&gt;</span><span class="pln"> Star</span><span class="tag">&lt;/a&gt;</span></li><li class="L"1><span class="tag">&lt;a</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;&lt;i</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"fa fa-star"</span><span class="tag">&gt;&lt;/i&gt;</span><span class="pln"> Star</span><span class="tag">&lt;/a&gt;</span></li><li class="L2"><span class="tag">&lt;a</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn btn-sm"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;&lt;i</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"fa fa-star"</span><span class="tag">&gt;&lt;/i&gt;</span><span class="pln"> Star</span><span class="tag">&lt;/a&gt;</span></li><li class="L3"><span class="tag">&lt;a</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn btn-xs"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;&lt;i</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"fa fa-star"</span><span class="tag">&gt;&lt;/i&gt;</span><span class="pln"> Star</span><span class="tag">&lt;/a&gt;</span></li></ol></pre>

				<h4>Navigation</h4>
				<div class="bs-docs-example">
					<div class="well" style="padding: 8px 0; margin-bottom: 0;">
						<ul class="nav nav-list">
							<li class="active"><a href="#"><i class="fa fa-home"></i> Home</a></li>
							<li><a href="#"><i class="fa fa-book"></i> Library</a></li>
							<li><a href="#"><i class="fa fa-pencil"></i> Applications</a></li>
							<li><a href="#"><i class="i"></i> Misc</a></li>
						</ul>
					</div>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"nav nav-list"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;li</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"active"</span><span class="tag">&gt;&lt;a</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;&lt;i</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"fa fa-home"</span><span class="tag">&gt;&lt;/i&gt;</span><span class="pln"> Home</span><span class="tag">&lt;/a&gt;&lt;/li&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;li&gt;&lt;a</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;&lt;i</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"fa fa-book"</span><span class="tag">&gt;&lt;/i&gt;</span><span class="pln"> Library</span><span class="tag">&lt;/a&gt;&lt;/li&gt;</span></li><li class="L3"><span class="pln">  </span><span class="tag">&lt;li&gt;&lt;a</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;&lt;i</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"fa fa-pencil"</span><span class="tag">&gt;&lt;/i&gt;</span><span class="pln"> Applications</span><span class="tag">&lt;/a&gt;&lt;/li&gt;</span></li><li class="L4"><span class="pln">  </span><span class="tag">&lt;li&gt;&lt;a</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"#"</span><span class="tag">&gt;&lt;i</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"i"</span><span class="tag">&gt;&lt;/i&gt;</span><span class="pln"> Misc</span><span class="tag">&lt;/a&gt;&lt;/li&gt;</span></li><li class="L5"><span class="tag">&lt;/ul&gt;</span></li></ol></pre>

				<h4>Form fields</h4>
				<form class="bs-docs-example form-horizontal">
					<div class="control-group">
						<label class="control-label" for="inputIcon">Email address</label>
						<div class="controls">
							<div class="input-group col-xs-2">
								<span class="input-group-addon"><i class="fa fa-envelope"></i></span>
								<input class="form-control" id="inputIcon" type="text">
							</div>
						</div>
					</div>
				</form>

				<hr class="bs-docs-separator">

				<h2>Glyphicons</h2>
				<h3>Available glyphs</h3>
				<p>Includes 200 glyphs in font format from the Glyphicon Halflings set. <a href="http://glyphicons.com" target="_blank">Glyphicons</a> Halflings are normally not available for free, but their creator has made them available for Bootstrap free of cost. As a thank you, we only ask that you include a link back to <a href="http://glyphicons.com" target="_blank">Glyphicons</a> whenever possible.</p>

				<div class="bs-glyphicons">
			    <ul class="bs-glyphicons-list">
			        <li>
			          <span class="glyphicon glyphicon-asterisk"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-asterisk</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-plus"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-plus</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-euro"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-euro</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-minus"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-minus</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-cloud"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-cloud</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-envelope"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-envelope</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-pencil"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-pencil</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-glass"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-glass</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-music"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-music</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-search"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-search</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-heart"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-heart</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-star"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-star</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-star-empty"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-star-empty</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-user"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-user</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-film"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-film</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-th-large"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-th-large</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-th"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-th</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-th-list"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-th-list</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-ok"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-ok</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-remove"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-remove</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-zoom-in"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-zoom-in</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-zoom-out"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-zoom-out</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-off"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-off</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-signal"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-signal</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-cog"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-cog</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-trash"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-trash</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-home"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-home</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-file"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-file</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-time"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-time</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-road"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-road</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-download-alt"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-download-alt</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-download"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-download</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-upload"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-upload</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-inbox"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-inbox</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-play-circle"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-play-circle</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-repeat"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-repeat</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-refresh"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-refresh</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-list-alt"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-list-alt</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-lock"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-lock</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-flag"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-flag</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-headphones"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-headphones</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-volume-off"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-volume-off</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-volume-down"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-volume-down</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-volume-up"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-volume-up</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-qrcode"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-qrcode</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-barcode"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-barcode</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-tag"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-tag</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-tags"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-tags</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-book"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-book</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-bookmark"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-bookmark</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-print"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-print</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-camera"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-camera</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-font"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-font</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-bold"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-bold</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-italic"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-italic</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-text-height"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-text-height</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-text-width"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-text-width</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-align-left"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-align-left</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-align-center"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-align-center</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-align-right"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-align-right</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-align-justify"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-align-justify</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-list"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-list</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-indent-left"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-indent-left</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-indent-right"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-indent-right</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-facetime-video"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-facetime-video</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-picture"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-picture</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-map-marker"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-map-marker</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-adjust"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-adjust</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-tint"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-tint</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-edit"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-edit</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-share"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-share</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-check"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-check</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-move"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-move</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-step-backward"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-step-backward</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-fast-backward"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-fast-backward</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-backward"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-backward</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-play"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-play</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-pause"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-pause</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-stop"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-stop</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-forward"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-forward</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-fast-forward"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-fast-forward</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-step-forward"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-step-forward</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-eject"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-eject</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-chevron-left"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-chevron-left</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-chevron-right"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-chevron-right</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-plus-sign"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-plus-sign</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-minus-sign"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-minus-sign</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-remove-sign"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-remove-sign</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-ok-sign"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-ok-sign</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-question-sign"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-question-sign</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-info-sign"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-info-sign</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-screenshot"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-screenshot</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-remove-circle"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-remove-circle</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-ok-circle"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-ok-circle</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-ban-circle"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-ban-circle</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-arrow-left"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-arrow-left</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-arrow-right"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-arrow-right</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-arrow-up"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-arrow-up</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-arrow-down"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-arrow-down</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-share-alt"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-share-alt</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-resize-full"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-resize-full</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-resize-small"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-resize-small</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-exclamation-sign"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-exclamation-sign</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-gift"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-gift</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-leaf"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-leaf</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-fire"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-fire</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-eye-open"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-eye-open</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-eye-close"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-eye-close</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-warning-sign"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-warning-sign</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-plane"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-plane</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-calendar"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-calendar</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-random"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-random</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-comment"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-comment</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-magnet"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-magnet</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-chevron-up"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-chevron-up</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-chevron-down"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-chevron-down</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-retweet"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-retweet</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-shopping-cart"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-shopping-cart</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-folder-close"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-folder-close</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-folder-open"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-folder-open</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-resize-vertical"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-resize-vertical</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-resize-horizontal"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-resize-horizontal</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-hdd"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-hdd</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-bullhorn"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-bullhorn</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-bell"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-bell</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-certificate"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-certificate</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-thumbs-up"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-thumbs-up</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-thumbs-down"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-thumbs-down</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-hand-right"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-hand-right</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-hand-left"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-hand-left</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-hand-up"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-hand-up</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-hand-down"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-hand-down</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-circle-arrow-right"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-circle-arrow-right</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-circle-arrow-left"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-circle-arrow-left</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-circle-arrow-up"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-circle-arrow-up</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-circle-arrow-down"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-circle-arrow-down</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-globe"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-globe</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-wrench"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-wrench</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-tasks"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-tasks</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-filter"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-filter</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-briefcase"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-briefcase</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-fullscreen"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-fullscreen</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-dashboard"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-dashboard</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-paperclip"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-paperclip</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-heart-empty"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-heart-empty</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-link"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-link</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-phone"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-phone</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-pushpin"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-pushpin</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-usd"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-usd</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-gbp"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-gbp</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-sort"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-sort</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-sort-by-alphabet"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-sort-by-alphabet</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-sort-by-alphabet-alt"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-sort-by-alphabet-alt</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-sort-by-order"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-sort-by-order</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-sort-by-order-alt"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-sort-by-order-alt</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-sort-by-attributes"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-sort-by-attributes</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-sort-by-attributes-alt"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-sort-by-attributes-alt</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-unchecked"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-unchecked</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-expand"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-expand</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-collapse-down"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-collapse-down</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-collapse-up"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-collapse-up</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-log-in"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-log-in</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-flash"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-flash</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-log-out"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-log-out</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-new-window"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-new-window</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-record"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-record</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-save"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-save</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-open"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-open</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-saved"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-saved</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-import"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-import</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-export"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-export</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-send"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-send</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-floppy-disk"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-floppy-disk</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-floppy-saved"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-floppy-saved</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-floppy-remove"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-floppy-remove</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-floppy-save"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-floppy-save</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-floppy-open"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-floppy-open</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-credit-card"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-credit-card</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-transfer"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-transfer</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-cutlery"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-cutlery</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-header"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-header</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-compressed"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-compressed</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-earphone"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-earphone</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-phone-alt"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-phone-alt</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-tower"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-tower</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-stats"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-stats</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-sd-video"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-sd-video</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-hd-video"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-hd-video</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-subtitles"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-subtitles</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-sound-stereo"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-sound-stereo</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-sound-dolby"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-sound-dolby</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-sound-5-1"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-sound-5-1</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-sound-6-1"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-sound-6-1</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-sound-7-1"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-sound-7-1</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-copyright-mark"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-copyright-mark</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-registration-mark"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-registration-mark</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-cloud-download"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-cloud-download</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-cloud-upload"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-cloud-upload</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-tree-conifer"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-tree-conifer</span>
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-tree-deciduous"></span>
			          <span class="glyphicon-class">glyphicon glyphicon-tree-deciduous</span>
			        </li>
			    </ul>
			  </div>

				<hr class="bs-docs-separator">


				<h3>How to use</h3>
				<p>All icons require an <code>&lt;i&gt;</code> tag with a unique class, prefixed with <code>glyphicon-</code>. To use, place the following code just about anywhere:</p>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;i</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"glyphicon-search"</span><span class="tag">&gt;&lt;/i&gt;</span></li></ol></pre>
				<p>There are also styles available for inverted (white) icons, made ready with one extra class. We will specifically enforce this class on hover and active states for nav and dropdown links.</p>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;i</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"glyphicon-search glyphicon-white"</span><span class="tag">&gt;&lt;/i&gt;</span></li></ol></pre>
				<p>
					<span class="label label-info">Heads up!</span>
					When using beside strings of text, as in buttons or nav links, be sure to leave a space after the <code>&lt;i&gt;</code> tag for proper spacing.
				</p>


				<hr class="bs-docs-separator">


				<h3>Glyphicon examples</h3>
				<p>Use them in buttons, button groups for a toolbar, navigation, or prepended form inputs.</p>

				<h4>Buttons</h4>

				<h5>Button group in a button toolbar</h5>
				<div class="bs-docs-example">
					<div class="btn-toolbar">
						<div class="btn-group">
							<a class="btn" href="#"><i class="glyphicon glyphicon-align-left"></i></a>
							<a class="btn" href="#"><i class="glyphicon glyphicon-align-center"></i></a>
							<a class="btn" href="#"><i class="glyphicon glyphicon-align-right"></i></a>
							<a class="btn" href="#"><i class="glyphicon glyphicon-align-justify"></i></a>
						</div>
					</div>
				</div>

				<h5>Dropdown in a button group</h5>
				<div class="bs-docs-example">
					<div class="btn-group">
						<a class="btn btn-primary" href="#"><i class="icon-user icon-white"></i> User</a>
						<a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#"><i class="glyphicon glyphicon-pencil"></i> Edit</a></li>
							<li><a href="#"><i class="glyphicon glyphicon-trash"></i> Delete</a></li>
							<li><a href="#"><i class="glyphicon glyphicon-ban-circle"></i> Ban</a></li>
							<li class="divider"></li>
							<li><a href="#"><i class="i"></i> Make admin</a></li>
						</ul>
					</div>
				</div>

				<h5>Button sizes</h5>
				<div class="bs-docs-example">
					<a class="btn btn-lg" href="#"><i class="glyphicon glyphicon-star"></i> Star</a>
					<a class="btn" href="#"><i class="glyphicon glyphicon-star"></i> Star</a>
					<a class="btn btn-sm" href="#"><i class="glyphicon glyphicon-star"></i> Star</a>
					<a class="btn btn-xs" href="#"><i class="glyphicon glyphicon-star"></i> Star</a>
				</div>

				<h4>Navigation</h4>
				<div class="bs-docs-example">
					<div class="well" style="padding: 8px 0; margin-bottom: 0;">
						<ul class="nav nav-list">
							<li class="active"><a href="#"><i class="glyphicon glyphicon-home glyphicon-white"></i> Home</a></li>
							<li><a href="#"><i class="icon-book"></i> Library</a></li>
							<li><a href="#"><i class="icon-pencil"></i> Applications</a></li>
							<li><a href="#"><i class="i"></i> Misc</a></li>
						</ul>
					</div>
				</div>

				<h4>Form fields</h4>
				<form class="bs-docs-example form-horizontal">
					<div class="control-group">
						<label class="control-label" for="inputIcon">Email address</label>
						<div class="controls">
							<div class="input-prepend">
								<span class="add-on"><i class="glyphicon glyphicon-envelope"></i></span><input class="span2" id="inputIcon" type="text">
							</div>
						</div>
					</div>
				</form>
			</div>
		</section>
	</div>
</div>

{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
