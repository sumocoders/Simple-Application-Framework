{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

<div id="contentWrap">
	<div id="content">
		<header id="header" role="banner">
			<div class="container bar">
				<div class="title">
					<a id="toggleMenu" class="visible-phone iconLink" href="#">{$lblMenu|uppercase}</a>
					<h2>Forms</h2>
				</div>
			</div>
		</header>

      	{include:'{$CORE_PATH}/layout/templates/notifications.tpl'}

		<section id="main" role="main">
			<div class="container">
				<h2>Default styles</h2>
				<p>Individual form controls automatically receive some global styling. All textual <code>&lt;input&gt;</code>, <code>&lt;textarea&gt;</code>, and <code>&lt;select&gt;</code> elements with <code>.form-control</code> are set to <code>width: 100%;</code> by default. Wrap labels and controls in <code>.form-group</code> for optimum spacing.</p>
				<div class="bs-docs-example">
					<form role="form">
			      <div class="form-group">
			        <label for="exampleInputEmail1">Email address</label>
			        <input type="email" placeholder="Enter email" id="exampleInputEmail1" class="form-control">
			      </div>
			      <div class="form-group">
			        <label for="exampleInputPassword1">Password</label>
			        <input type="password" placeholder="Password" id="exampleInputPassword1" class="form-control">
			      </div>
			      <div class="form-group">
			        <label for="exampleInputFile">File input</label>
			        <input type="file" id="exampleInputFile">
			        <p class="help-block">Example block-level help text here.</p>
			      </div>
			      <div class="checkbox">
			        <label>
			          <input type="checkbox"> Check me out
			        </label>
			      </div>
			      <button class="btn btn-default" type="submit">Submit</button>
			    </form>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;form</span><span class="pln"> </span><span class="atn">role</span><span class="pun">=</span><span class="atv">"role"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-group"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">    </span><span class="tag">&lt;label</span><span class="pln"> </span><span class="atn">for</span><span class="pun">=</span><span class="atv">"exampleInputEmail1"</span><span class="tag">&gt;</span>Email address<span class="tag">&lt;/label&gt;</span></li><li class="L3"><span class="pln">    </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"email"</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-control"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"exampleInputEmail1"</span><span class="pln"> </span><span class="atn">placeholder</span><span class="pun">=</span><span class="atv">"Enter email"</span><span class="tag">&gt;</span></li><li class="L4"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L5"><span class="pln">  </span>...</li><li class="L6"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-group"</span><span class="tag">&gt;</span></li><li class="L7"><span class="pln">    </span><span class="tag">&lt;label</span><span class="pln"> </span><span class="atn">for</span><span class="pun">=</span><span class="atv">"exampleInputFile"</span><span class="tag">&gt;</span>File input<span class="tag">&lt;/label&gt;</span></li><li class="L8"><span class="pln">    </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"file"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"exampleInputFile"</span><span class="tag">&gt;</span></li><li class="L9"><span class="pln">    </span><span class="tag">&lt;p</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"help-block"</span><span class="tag">&gt;</span>Example block-level help text here.<span class="tag">&lt;/p&gt;</span></li><li class="L10"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L11"><span class="pln">  </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"submit"</span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn btn-default"</span><span class="tag">&gt;</span>Submit<span class="tag">&lt;/button&gt;</span></li><li class="L12"><span class="tag">&lt;/form&gt;</span></li></ol></pre>


				<hr class="bs-docs-separator">


				<h2>Optional layouts</h2>
				<p>Included with Bootstrap are two optional form layouts for common use cases.</p>

				<h5>Requires custom widths</h5>
				<p>Inputs, selects, and textareas are 100% wide by default in Bootstrap. To use the inline form, you'll have to set a width on the form controls used within.</p>

				<h5>Always add labels</h5>
				<p>Screen readers will have trouble with your forms if you don't include a label for every input. For these inline forms, you can hide the labels using the <code>.sr-only</code> class.</p>

				<h3>Inline form</h3>
				<p>Add <code>.form-inline</code> for left-aligned labels and inline-block controls for a compact layout.</p>
				<div class="bs-docs-example">
					<form role="form" class="form-inline">
			      <div class="form-group">
			        <label for="exampleInputEmail2" class="sr-only">Email address</label>
			        <input type="email" placeholder="Enter email" id="exampleInputEmail2" class="form-control input-sm">
			      </div>
			      <div class="form-group">
			        <label for="exampleInputPassword2" class="sr-only">Password</label>
			        <input type="password" placeholder="Password" id="exampleInputPassword2" class="form-control input-sm">
			      </div>
			      <div class="checkbox">
			        <label>
			          <input type="checkbox"> Remember me
			        </label>
			      </div>
			      <button class="btn btn-default btn-sm" type="submit">Sign in</button>
			    </form>
			  </div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;form</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-inline"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-group"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">    </span><span class="tag">&lt;label</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"sr-only"</span><span class="pln"> </span><span class="atn">for</span><span class="pun">=</span><span class="atv">"exampleInputEmail2"</span><span class="tag">&gt;</span>Email address<span class="tag">&lt;/label&gt;</span></li><li class="L3"><span class="pln">    </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-control input-sm"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"exampleInputEmail2"</span><span class="pln"> </span><span class="atn">placeholder</span><span class="pun">=</span><span class="atv">"Enter email"</span><span class="tag">&gt;</span></li><li class="L4"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L5"><span class="pln">  </span>...</li><li class="L5"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"checkbox"</span><span class="tag">&gt;</span></li><li class="L6"><span class="pln">    </span><span class="tag">&lt;label&gt;</span></li><li class="L7"><span class="pln">      </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"checkbox"</span><span class="tag">&gt;</span></li><li class="L7"><span class="pln">    </span><span class="tag">&lt;label&gt;</span></li><li class="L8"><span class="pln">  </span><span class="tag">&lt;div&gt;</span></li><li class="L9"><span class="pln">  </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"submit"</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn"</span><span class="tag">&gt;</span><span class="pln">Sign in</span><span class="tag">&lt;/button&gt;</span></li><li class="L10"><span class="tag">&lt;/form&gt;</span></li></ol></pre>

				<h3>Horizontal form</h3>
				<p>Use Bootstrap's predefined grid classes to align labels and groups of form controls in a horizontal layout by adding <code>.form-horizontal</code> to the form. Doing so changes <code>.form-groups</code> to behave as grid rows, so no need for <code>.row</code>.</p>
				<div class="bs-docs-example">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="control-label col-sm-2" for="inputEmail">Email</label>
							<div class="col-sm-10">
								<input type="text" id="inputEmail" placeholder="Email">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="inputPassword">Password</label>
							<div class="col-sm-10">
								<input type="password" id="inputPassword" placeholder="Password">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="checkbox">
									<label>
										<input type="checkbox"> Remember me
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default">Sign in</button>
							</div>
						</div>
					</form>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;form</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-horizontal"</span><span class="pln"> </span><span class="atn">role</span><span class="pun">=</span><span class="atv">"form"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-group"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">    </span><span class="tag">&lt;label</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"control-label col-sm-2"</span><span class="pln"> </span><span class="atn">for</span><span class="pun">=</span><span class="atv">"inputEmail"</span><span class="tag">&gt;</span><span class="pln">Email</span><span class="tag">&lt;/label&gt;</span></li><li class="L3"><span class="pln">    </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"col-sm-10"</span><span class="tag">&gt;</span></li><li class="L4"><span class="pln">      </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"inputEmail"</span><span class="pln"> </span><span class="atn">placeholder</span><span class="pun">=</span><span class="atv">"Email"</span><span class="tag">&gt;</span></li><li class="L5"><span class="pln">    </span><span class="tag">&lt;/div&gt;</span></li><li class="L6"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L7"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-group"</span><span class="tag">&gt;</span></li><li class="L8"><span class="pln">    </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"col-sm-offset-2 col-sm-10"</span><span class="tag">&gt;</span></li><li class="L9"><span class="pln">      </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"checkbox"</span><span class="tag">&gt;</span></li><li class="L10"><span class="pln">        </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"submit"</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn btn-default"</span><span class="tag">&gt;</span><span class="pln">Sign in</span><span class="tag">&lt;/button&gt;</span></li><li class="L11"><span class="pln">      </span><span class="tag">&lt;/div&gt;</span></li><li class="L12"><span class="pln">    </span><span class="tag">&lt;/div&gt;</span></li><li class="L12"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L13"><span class="tag">&lt;/form&gt;</span></li></ol></pre>


				<hr class="bs-docs-separator">


				<h2>Supported form controls</h2>
				<p>Examples of standard form controls supported in an example form layout.</p>

				<h3>Inputs</h3>
				<p>Most common form control, text-based input fields. Includes support for all HTML5 types: <code>text, password, datetime, datetime-local, date, month, time, week, number, email, url, search, tel, and color</code>.</p>
				<p>Requires the use of a specified <code>type</code> at all times.</p>
				<form class="bs-docs-example form-inline">
					<input type="text" placeholder="Text input">
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">placeholder</span><span class="pun">=</span><span class="atv">"Text input"</span><span class="tag">&gt;</span></li></ol></pre>

				<h3>Textarea</h3>
				<p>Form control which supports multiple lines of text. Change <code>rows</code> attribute as necessary.</p>
				<form class="bs-docs-example form-inline">
					<textarea rows="3"></textarea>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;textarea</span><span class="pln"> </span><span class="atn">rows</span><span class="pun">=</span><span class="atv">"3"</span><span class="tag">&gt;&lt;/textarea&gt;</span></li></ol></pre>

				<h3>Checkboxes and radios</h3>
				<p>Checkboxes are for selecting one or several options in a list while radios are for selecting one option from many.</p>
				<h4>Default (stacked)</h4>
				<form class="bs-docs-example">
					<div class="checkbox">
						<label>
							<input type="checkbox" value="">
							Option one is this and that—be sure to include why it's great
						</label>
					</div>
					<br>
					<div class="radio">
						<label>
							<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
							Option one is this and that—be sure to include why it's great
						</label>
					</div>
					<div class="radio">
						<label>
							<input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
							Option two can be something else and selecting it will deselect option one
						</label>
					</div>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"checkbox"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;label&gt;</span></li><li class="L2"><span class="pln">    </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"checkbox"</span><span class="pln"> </span><span class="atn">value</span><span class="pun">=</span><span class="atv">""</span><span class="tag">&gt;</span></li><li class="L3"><span class="pln">    Option one is this and that—be sure to include why it's great</span></li><li class="L3"><span class="pln">  </span><span class="tag">&lt;/label&gt;</span></li><li class="L4"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<h4>Inline checkboxes</h4>
				<p>Add the <code>.checkbox-inline</code> or <code>.radio-inline</code> class to a series of checkboxes or radios for controls appear on the same line.</p>
				<form class="bs-docs-example">
					<label class="checkbox-inline">
						<input type="checkbox" id="inlineCheckbox1" value="option1"> 1
					</label>
					<label class="checkbox-inline">
						<input type="checkbox" id="inlineCheckbox2" value="option2"> 2
					</label>
					<label class="checkbox-inline">
						<input type="checkbox" id="inlineCheckbox3" value="option3"> 3
					</label>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;label</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"checkbox-inline"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"checkbox"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"inlineCheckbox1"</span><span class="pln"> </span><span class="atn">value</span><span class="pun">=</span><span class="atv">"option1"</span><span class="tag">&gt;</span><span class="pln"> 1</span></li><li class="L2"><span class="tag">&lt;/label&gt;</span></li><li class="L3"><span class="tag">&lt;label</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"checkbox-inline"</span><span class="tag">&gt;</span></li><li class="L4"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"checkbox"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"inlineCheckbox2"</span><span class="pln"> </span><span class="atn">value</span><span class="pun">=</span><span class="atv">"option2"</span><span class="tag">&gt;</span><span class="pln"> 2</span></li><li class="L5"><span class="tag">&lt;/label&gt;</span></li><li class="L6"><span class="tag">&lt;label</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"checkbox-inline"</span><span class="tag">&gt;</span></li><li class="L7"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"checkbox"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"inlineCheckbox3"</span><span class="pln"> </span><span class="atn">value</span><span class="pun">=</span><span class="atv">"option3"</span><span class="tag">&gt;</span><span class="pln"> 3</span></li><li class="L8"><span class="tag">&lt;/label&gt;</span></li></ol></pre>

				<h3>Selects</h3>
				<p>Use the default option or specify a <code>multiple="multiple"</code> to show multiple options at once.</p>
				<form class="bs-docs-example">
					<select class="form-control">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
					<br>
					<select class="form-control" multiple="multiple">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;select</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-control"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;option&gt;</span><span class="pln">1</span><span class="tag">&lt;/option&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;option&gt;</span><span class="pln">2</span><span class="tag">&lt;/option&gt;</span></li><li class="L3"><span class="pln">  </span><span class="tag">&lt;option&gt;</span><span class="pln">3</span><span class="tag">&lt;/option&gt;</span></li><li class="L4"><span class="pln">  </span><span class="tag">&lt;option&gt;</span><span class="pln">4</span><span class="tag">&lt;/option&gt;</span></li><li class="L5"><span class="pln">  </span><span class="tag">&lt;option&gt;</span><span class="pln">5</span><span class="tag">&lt;/option&gt;</span></li><li class="L6"><span class="tag">&lt;/select&gt;</span></li><li class="L7"><span class="pln">&nbsp;</span></li><li class="L8"><span class="tag">&lt;select</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-control"</span><span class="pln"> </span><span class="atn">multiple</span><span class="pun">=</span><span class="atv">"multiple"</span><span class="tag">&gt;</span></li><li class="L9"><span class="pln">  </span><span class="tag">&lt;option&gt;</span><span class="pln">1</span><span class="tag">&lt;/option&gt;</span></li><li class="L0"><span class="pln">  </span><span class="tag">&lt;option&gt;</span><span class="pln">2</span><span class="tag">&lt;/option&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;option&gt;</span><span class="pln">3</span><span class="tag">&lt;/option&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;option&gt;</span><span class="pln">4</span><span class="tag">&lt;/option&gt;</span></li><li class="L3"><span class="pln">  </span><span class="tag">&lt;option&gt;</span><span class="pln">5</span><span class="tag">&lt;/option&gt;</span></li><li class="L4"><span class="tag">&lt;/select&gt;</span></li></ol></pre>

				<h3>Static control</h3>
				<p>When you need to place plain text next to a form label within a horizontal form, use the <code>.form-control-static</code> class on a <code>&lt;p&gt;</code>.</p>
				<div class="bs-example">
			    <form role="form" class="form-horizontal">
			      <div class="form-group">
			        <label class="col-sm-2 control-label">Email</label>
			        <div class="col-sm-10">
			          <p class="form-control-static">email@example.com</p>
			        </div>
			      </div>
			      <div class="form-group">
			        <label class="col-sm-2 control-label" for="inputPassword">Password</label>
			        <div class="col-sm-10">
			          <input type="password" placeholder="Password" id="inputPassword" class="form-control">
			        </div>
			      </div>
			    </form>
			  </div>
      	<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;form</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-horizontal"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-group"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">    </span><span class="tag">&lt;label</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"control-label col-sm-2"</span><span class="tag">&gt;</span>Email<span class="tag">&lt;/label&gt;</li><li class="L3"><span class="pln">    </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"col-sm-10"</span><span class="tag">&gt;</span></li><li class="L4"><span class="pln">    </span><span class="tag">&lt;p</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-control-static"</span><span class="tag">&gt;</span>email@example.com<span class="tag">&lt;/p&gt;</li><li class="L5"><span class="pln">  </span><span class="tag">&lt;/div&gt;</li><li class="L6"><span class="tag">&lt;/form&gt;</li></ol></pre>

				<hr class="bs-docs-separator">


				<h2>Extending form controls</h2>
				<p>Extend form controls by adding text or buttons before, after, or on both sides of any text-based input. Use <code>.input-group</code> with an <code>.input-group-addon</code> to prepend or append elements to a single <code>.form-control</code>.</p>

				<h3>Input groups</h3>
				<p>Avoid using <code>select</code> elements here as they cannot be fully styled in WebKit browsers.</p>

				<h4>Single sided</h4>
				<p>Wrap an add-on or button on either side of an input. You may also place one on both sides of an input.</p>
				<form class="bs-docs-example">
					<div class="input-group col-xs-6">
						<span class="input-group-addon">@</span>
						<input class="form-control" id="prependedInput" type="text" placeholder="Username">
					</div>
					<br>
					<div class="input-group col-xs-6">
						<input class="form-control" id="appendedInput" type="text">
						<span class="input-group-addon">.00</span>
					</div>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group  col-xs-6"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group-addon"</span><span class="tag">&gt;</span><span class="pln">@</span><span class="tag">&lt;/span&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-control"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"prependedInput"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">placeholder</span><span class="pun">=</span><span class="atv">"Username"</span><span class="tag">&gt;</span></li><li class="L3"><span class="tag">&lt;/div&gt;</span></li><li class="L4"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group col-xs-6"</span><span class="tag">&gt;</span></li><li class="L5"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-control"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"appendedInput"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="tag">&gt;</span></li><li class="L6"><span class="pln">  </span><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group-addon"</span><span class="tag">&gt;</span><span class="pln">.00</span><span class="tag">&lt;/span&gt;</span></li><li class="L7"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<h4>Combined</h4>
				<form class="bs-docs-example form-inline">
					<div class="input-group col-xs-6">
						<span class="input-group-addon">$</span>
						<input class="form-control" id="appendedPrependedInput" type="text">
						<span class="input-group-addon">.00</span>
					</div>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group col-xs-6"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group-addon"</span><span class="tag">&gt;</span><span class="pln">$</span><span class="tag">&lt;/span&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-control"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"appendedPrependedInput"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="tag">&gt;</span></li><li class="L3"><span class="pln">  </span><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group-addon"</span><span class="tag">&gt;</span><span class="pln">.00</span><span class="tag">&lt;/span&gt;</span></li><li class="L4"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<h4>Buttons add-ons</h4>
				<p>Buttons in input groups are a bit different and require one extra level of nesting. Instead of <code>.input-group-addon</code>, you'll need to use <code>.input-group-btn</code> to wrap the buttons. This is required due to default browser styles that cannot be overridden.</p>
				<form class="bs-docs-example">
					<div class="input-group col-xs-6">
						<input class="form-control" id="appendedInputButton" type="text">
						<span class="input-group-btn">
							<button class="btn" type="button">Go!</button>
						</span>
					</div>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group col-xs-6"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-control"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"appendedInputButton"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group-btn"</span><span class="pln"> </span><span class="tag">&gt;</span></li><li class="L3"><span class="pln">    </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"button"</span><span class="tag">&gt;</span><span class="pln">Go!</span><span class="tag">&lt;/button&gt;</span></li><li class="L4"><span class="pln">  </span><span class="tag">&lt;/span&gt;</span></li><li class="L5"><span class="tag">&lt;/div&gt;</span></li></ol></pre>
				<form class="bs-docs-example">
					<div class="input-group col-xs-6">
						<input class="form-control" id="appendedInputButtons" type="text">
						<div class="input-group-btn">
							<button class="btn" type="button">Search</button>
							<button class="btn" type="button">Options</button>
						</div>
					</div>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group col-xs-6"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-control"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"appendedInputButtons"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group-btn"</span><span class="pln"> </span><span class="tag">&gt;</span></li><li class="L3"><span class="pln">    </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"button"</span><span class="tag">&gt;</span><span class="pln">Search</span><span class="tag">&lt;/button&gt;</span></li><li class="L4"><span class="pln">    </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"button"</span><span class="tag">&gt;</span><span class="pln">Options</span><span class="tag">&lt;/button&gt;</span></li><li class="L5"><span class="pln">  </span><span class="tag">&lt;/span&gt;</span></li><li class="L5"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<h4>Button dropdowns</h4>
				<p></p>
				<form class="bs-docs-example">
					<div class="input-group col-xs-6">
						<input class="form-control" id="appendedDropdownButton" type="text">
						<div class="input-group-btn">
							<button class="btn dropdown-toggle" data-toggle="dropdown">Action <span class="caret"></span></button>
							<ul class="dropdown-menu dropdown-menu-right">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li><a href="#">Separated link</a></li>
							</ul>
						</div><!-- /btn-group -->
					</div><!-- /input-append -->
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group col-xs-6"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-control"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"appendedDropdownButton"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group-btn"</span><span class="tag">&gt;</span></li><li class="L3"><span class="pln">    </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn dropdown-toggle"</span><span class="pln"> </span><span class="atn">data-toggle</span><span class="pun">=</span><span class="atv">"dropdown"</span><span class="tag">&gt;</span></li><li class="L4"><span class="pln">      Action</span></li><li class="L5"><span class="pln">      </span><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"caret"</span><span class="tag">&gt;&lt;/span&gt;</span></li><li class="L6"><span class="pln">    </span><span class="tag">&lt;/button&gt;</span></li><li class="L7"><span class="pln">    </span><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"dropdown-menu dropdown-menu-right"</span><span class="tag">&gt;</span></li><li class="L8"><span class="pln">      ...</span></li><li class="L9"><span class="pln">    </span><span class="tag">&lt;/ul&gt;</span></li><li class="L0"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L1"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<form class="bs-docs-example">
					<div class="input-group col-xs-6">
						<div class="input-group-btn">
							<button class="btn dropdown-toggle" data-toggle="dropdown">Action <span class="caret"></span></button>
							<ul class="dropdown-menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li><a href="#">Separated link</a></li>
							</ul>
						</div><!-- /btn-group -->
						<input class="form-control" id="prependedDropdownButton" type="text">
					</div><!-- /input-prepend -->
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group col-xs-6"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group-btn"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">    </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn dropdown-toggle"</span><span class="pln"> </span><span class="atn">data-toggle</span><span class="pun">=</span><span class="atv">"dropdown"</span><span class="tag">&gt;</span></li><li class="L3"><span class="pln">      Action</span></li><li class="L4"><span class="pln">      </span><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"caret"</span><span class="tag">&gt;&lt;/span&gt;</span></li><li class="L5"><span class="pln">    </span><span class="tag">&lt;/button&gt;</span></li><li class="L6"><span class="pln">    </span><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"dropdown-menu"</span><span class="tag">&gt;</span></li><li class="L7"><span class="pln">      ...</span></li><li class="L8"><span class="pln">    </span><span class="tag">&lt;/ul&gt;</span></li><li class="L9"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L0"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-control"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"prependedDropdownButton"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="tag">&gt;</span></li><li class="L1"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<form class="bs-docs-example">
					<div class="input-group col-xs-6">
						<div class="input-group-btn">
							<button class="btn dropdown-toggle" data-toggle="dropdown">Action <span class="caret"></span></button>
							<ul class="dropdown-menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li><a href="#">Separated link</a></li>
							</ul>
						</div><!-- /btn-group -->
						<input class="form-control" id="appendedPrependedDropdownButton" type="text">
						<div class="input-group-btn">
							<button class="btn dropdown-toggle" data-toggle="dropdown">Action <span class="caret"></span></button>
							<ul class="dropdown-menu dropdown-menu-right">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li><a href="#">Separated link</a></li>
							</ul>
						</div><!-- /btn-group -->
					</div><!-- /input-prepend input-append -->
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group col-xs-6"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group-btn"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">    </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn dropdown-toggle"</span><span class="pln"> </span><span class="atn">data-toggle</span><span class="pun">=</span><span class="atv">"dropdown"</span><span class="tag">&gt;</span></li><li class="L3"><span class="pln">      Action</span></li><li class="L4"><span class="pln">      </span><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"caret"</span><span class="tag">&gt;&lt;/span&gt;</span></li><li class="L5"><span class="pln">    </span><span class="tag">&lt;/button&gt;</span></li><li class="L6"><span class="pln">    </span><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"dropdown-menu"</span><span class="tag">&gt;</span></li><li class="L7"><span class="pln">      ...</span></li><li class="L8"><span class="pln">    </span><span class="tag">&lt;/ul&gt;</span></li><li class="L9"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L0"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"forn-control"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"appendedPrependedDropdownButton"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group-btn"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">    </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn dropdown-toggle"</span><span class="pln"> </span><span class="atn">data-toggle</span><span class="pun">=</span><span class="atv">"dropdown"</span><span class="tag">&gt;</span></li><li class="L3"><span class="pln">      Action</span></li><li class="L4"><span class="pln">      </span><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"caret"</span><span class="tag">&gt;&lt;/span&gt;</span></li><li class="L5"><span class="pln">    </span><span class="tag">&lt;/button&gt;</span></li><li class="L6"><span class="pln">    </span><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"dropdown-menu dropdown-menu-right"</span><span class="tag">&gt;</span></li><li class="L7"><span class="pln">      ...</span></li><li class="L8"><span class="pln">    </span><span class="tag">&lt;/ul&gt;</span></li><li class="L9"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L0"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<h4>Segmented dropdown groups</h4>
				<form class="bs-docs-example">
					<div class="input-group">
						<div class="input-group-btn">
							<button class="btn" tabindex="-1">Action</button>
							<button class="btn dropdown-toggle" data-toggle="dropdown" tabindex="-1">
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li><a href="#">Separated link</a></li>
							</ul>
						</div>
						<input type="text" class="form-control">
					</div>
					<div class="input-group">
						<input type="text" class="form-control">
						<div class="input-group-btn">
							<button class="btn" tabindex="-1">Action</button>
							<button class="btn dropdown-toggle" data-toggle="dropdown" tabindex="-1">
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu dropdown-menu-right">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li><a href="#">Separated link</a></li>
							</ul>
						</div>
					</div>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;form&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">    </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group-btn"</span><span class="tag">&gt;</span><span class="pln">...</span><span class="tag">&lt;/div&gt;</span></li><li class="L3"><span class="pln">    </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-control"</span><span class="tag">&gt;</span></li><li class="L4"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L5"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group"</span><span class="tag">&gt;</span></li><li class="L6"><span class="pln">    </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-control"</span><span class="tag">&gt;</span></li><li class="L7"><span class="pln">    </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group-btn"</span><span class="tag">&gt;</span><span class="pln">...</span><span class="tag">&lt;/div&gt;</span></li><li class="L8"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L9"><span class="tag">&lt;/form&gt;</span></li></ol></pre>

				<h4>Search form</h4>
				<form class="bs-docs-example form-search">
					<div class="input-group col-xs-6">
						<input type="text" class="form-control search-query">
						<div class="input-group-btn">
							<button type="submit" class="btn">Search</button>
						</div>
					</div>
					<div class="input-group col-xs-6">
						<div class="input-group-btn">
							<button type="submit" class="btn">Search</button>
						</div>
						<input type="text" class="form-control search-query">
					</div>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;form</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-search"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group col-xs-6"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">    </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-control search-query"</span><span class="tag">&gt;</span></li><li class="L3"><span class="pln">    </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group-btn"</span><span class="tag">&gt;</span></li><li class="L4"><span class="pln">      </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"submit"</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn"</span><span class="tag">&gt;</span><span class="pln">Search</span><span class="tag">&lt;/button&gt;</span></li><li class="L5"><span class="pln">    </span><span class="tag">&lt;/div&gt;</span></li><li class="L6"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L7"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group col-xs-6"</span><span class="tag">&gt;</span></li><li class="L8"><span class="pln">    </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group-btn"</span><span class="tag">&gt;</span></li><li class="L9"><span class="pln">      </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"submit"</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn"</span><span class="tag">&gt;</span><span class="pln">Search</span><span class="tag">&lt;/button&gt;</span></li><li class="L10"><span class="pln">    </span><span class="tag">&lt;/div&gt;</span></li><li class="L11"><span class="pln">    </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-control search-query"</span><span class="tag">&gt;</span></li><li class="L13"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L14"><span class="tag">&lt;/form&gt;</span></li></ol></pre>

				<h3>Control sizing</h3>
				<p>Set heights using classes like <code>.input-lg</code>, and set widths using grid column classes like <code>.col-lg-*</code>.</p>

				<h4>Relative sizing</h4>
				<form class="bs-docs-example" style="padding-bottom: 15px;">
					<input class="form-control input-sm" type="text" placeholder=".input-sm">
					<input class="form-control" type="text" placeholder=".form-control">
					<input class="form-control input-lg" type="text" placeholder=".input-lg">
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-control input-sm"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">placeholder</span><span class="pun">=</span><span class="atv">".input-sm"</span><span class="tag">&gt;</span></li><li class="L1"><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-control"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">placeholder</span><span class="pun">=</span><span class="atv">".form-control"</span><span class="tag">&gt;</span></li><li class="L2"><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-control input-lg"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">placeholder</span><span class="pun">=</span><span class="atv">".input-lg"</span><span class="tag">&gt;</span></li></ol></pre>
				<p>
					<span class="label label-info">Heads up!</span> In future versions, we'll be altering the use of these relative input classes to match our button sizes. For example, <code>.input-lg</code> will increase the padding and font-size of an input.
				</p>

				<h4>Grid sizing</h4>
				<p>Wrap inputs in grid columns, or any custom parent element, to easily enforce desired widths.</p>
				<form class="bs-docs-example" style="padding-bottom: 15px;">
					<div class="row">
						<div class="col-xs-2">
							<input class="form-control" type="text" placeholder=".col-xs-2">
							<select class="form-control">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</select>
						</div>
						<div class="col-xs-3">
							<input class="form-control" type="text" placeholder=".col-xs-3">
							<select class="form-control">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</select>
						</div>
						<div class="col-xs-4">
							<input class="form-control" type="text" placeholder=".col-xs-4">
							<select class="form-control">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</select>
						</div>
					</div>
				</form>

				<h3>Form actions</h3>
				<p>End a form with a group of actions (buttons). When placed within a <code>.form-actions</code>, the buttons will automatically indent to line up with the form controls.</p>
				<form class="bs-docs-example">
					<div class="form-actions">
						<button type="submit" class="btn btn-primary">Save changes</button>
						<button type="button" class="btn">Cancel</button>
					</div>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-actions"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"submit"</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn btn-primary"</span><span class="tag">&gt;</span><span class="pln">Save changes</span><span class="tag">&lt;/button&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"button"</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn"</span><span class="tag">&gt;</span><span class="pln">Cancel</span><span class="tag">&lt;/button&gt;</span></li><li class="L3"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<h3>Help text</h3>
				<p>Block level help text for form controls.</p>
				<form class="bs-docs-example" role="form">
					<input type="text">
					<span class="help-block">A longer block of help text that breaks onto a new line and may extend beyond one line.</span>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="tag">&gt;&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"help-block"</span><span class="tag">&gt;</span><span class="pln">A longer block of help text that breaks onto a new line and may extend beyond one line.</span><span class="tag">&lt;/span&gt;</span></li></ol></pre>


				<hr class="bs-docs-separator">


				<h2>Form control states</h2>
				<p>Provide feedback to users or visitors with basic feedback states on form controls and labels.</p>

				<h3>Input focus</h3>
				<p>We remove the default <code>outline</code> styles on some form controls and apply a <code>box-shadow</code> in its place for <code>:focus</code>.</p>
				<form class="bs-docs-example form-inline">
					<input class="form-control" id="focusedInput" type="text" value="This is focused...">
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-control"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"focusedInput"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">value</span><span class="pun">=</span><span class="atv">"This is focused..."</span><span class="tag">&gt;</span></li></ol></pre>

				<h3>Invalid inputs</h3>
				<p>Style inputs via default browser functionality with <code>:invalid</code>. Specify a <code>type</code>, add the <code>required</code> attribute if the field is not optional, and (if applicable) specify a <code>pattern</code>.</p>
				<p>This is not available in versions of Internet Explorer 7-9 due to lack of support for CSS pseudo selectors.</p>
				<form class="bs-docs-example form-inline">
					<input class="span3" type="email" placeholder="test@example.com" required="">
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"span3"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"email"</span><span class="pln"> </span><span class="atn">required</span><span class="tag">&gt;</span></li></ol></pre>

				<h3>Disabled inputs</h3>
				<p>Add the <code>disabled</code> attribute on an input to prevent user input and trigger a slightly different look.</p>
				<form class="bs-docs-example form-inline">
					<input class="form-control" id="disabledInput" type="text" placeholder="Disabled input here…" disabled>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-control"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"disabledInput"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">placeholder</span><span class="pun">=</span><span class="atv">"Disabled input here..."</span><span class="pln"> </span><span class="atn">disabled</span><span class="tag">&gt;</span></li></ol></pre>

				<h3>Validation states</h3>
				<p>Bootstrap includes validation styles for error, warning, and success states on form controls. To use, add <code>.has-warning</code>, <code>.has-error</code>, or <code>.has-success</code> to the parent element. Any <code>.control-label</code>, <code>.form-control</code>, and <code>.help-block</code> within that element will receive the validation styles.</p>

				<form class="bs-docs-example form-horizontal">
					<div class="form-group has-warning">
						<label class="control-label" for="inputWarning">Input with warning</label>
						<input class="form-control" type="text" id="inputWarning">
					</div>
					<div class="form-group has-error">
						<label class="control-label" for="inputError">Input with error</label>
						<input class="form-control" type="text" id="inputError">
					</div>
					<div class="form-group has-info">
						<label class="control-label" for="inputInfo">Input with info</label>
						<input class="form-control" type="text" id="inputInfo">
					</div>
					<div class="form-group has-success">
						<label class="control-label" for="inputSuccess">Input with success</label>
						<input class="form-control" type="text" id="inputSuccess">
					</div>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"control-group warning"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;label</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"control-label"</span><span class="pln"> </span><span class="atn">for</span><span class="pun">=</span><span class="atv">"inputWarning"</span><span class="tag">&gt;</span><span class="pln">Input with warning</span><span class="tag">&lt;/label&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"controls"</span><span class="tag">&gt;</span></li><li class="L3"><span class="pln">    </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"inputWarning"</span><span class="tag">&gt;</span></li><li class="L4"><span class="pln">    </span><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"help-inline"</span><span class="tag">&gt;</span><span class="pln">Something may have gone wrong</span><span class="tag">&lt;/span&gt;</span></li><li class="L5"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L6"><span class="tag">&lt;/div&gt;</span></li><li class="L7"><span class="pln">&nbsp;</span></li><li class="L8"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"control-group error"</span><span class="tag">&gt;</span></li><li class="L9"><span class="pln">  </span><span class="tag">&lt;label</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"control-label"</span><span class="pln"> </span><span class="atn">for</span><span class="pun">=</span><span class="atv">"inputError"</span><span class="tag">&gt;</span><span class="pln">Input with error</span><span class="tag">&lt;/label&gt;</span></li><li class="L0"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"controls"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">    </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"inputError"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">    </span><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"help-inline"</span><span class="tag">&gt;</span><span class="pln">Please correct the error</span><span class="tag">&lt;/span&gt;</span></li><li class="L3"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L4"><span class="tag">&lt;/div&gt;</span></li><li class="L5"><span class="pln">&nbsp;</span></li><li class="L6"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"control-group info"</span><span class="tag">&gt;</span></li><li class="L7"><span class="pln">  </span><span class="tag">&lt;label</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"control-label"</span><span class="pln"> </span><span class="atn">for</span><span class="pun">=</span><span class="atv">"inputInfo"</span><span class="tag">&gt;</span><span class="pln">Input with info</span><span class="tag">&lt;/label&gt;</span></li><li class="L8"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"controls"</span><span class="tag">&gt;</span></li><li class="L9"><span class="pln">    </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"inputInfo"</span><span class="tag">&gt;</span></li><li class="L0"><span class="pln">    </span><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"help-inline"</span><span class="tag">&gt;</span><span class="pln">Username is already taken</span><span class="tag">&lt;/span&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L2"><span class="tag">&lt;/div&gt;</span></li><li class="L3"><span class="pln">&nbsp;</span></li><li class="L4"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"control-group success"</span><span class="tag">&gt;</span></li><li class="L5"><span class="pln">  </span><span class="tag">&lt;label</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"control-label"</span><span class="pln"> </span><span class="atn">for</span><span class="pun">=</span><span class="atv">"inputSuccess"</span><span class="tag">&gt;</span><span class="pln">Input with success</span><span class="tag">&lt;/label&gt;</span></li><li class="L6"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"controls"</span><span class="tag">&gt;</span></li><li class="L7"><span class="pln">    </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"inputSuccess"</span><span class="tag">&gt;</span></li><li class="L8"><span class="pln">    </span><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"help-inline"</span><span class="tag">&gt;</span><span class="pln">Woohoo!</span><span class="tag">&lt;/span&gt;</span></li><li class="L9"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L0"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<h4>with optional icons</h4>
				<p>You can also add optional feedback icons with the addition of an extra class and the right icon.</p>

				<form class="bs-docs-example form-horizontal">
					<div class="form-group has-warning has-feedback">
						<label class="control-label col-xs-3" for="inputWarning">Input with warning</label>
						<div class="col-xs-9">
							<input class="form-control" type="text" id="inputWarning">
							<span class="glyphicon glyphicon-warning-sign form-control-feedback"></span>
						</div>
					</div>
					<div class="form-group has-error has-feedback">
						<label class="control-label col-xs-3" for="inputError">Input with error</label>
						<div class="col-xs-9">
							<input class="form-control" type="text" id="inputError">
							<span class="glyphicon glyphicon-remove form-control-feedback"></span>
						</div>
					</div>
					<div class="form-group has-success has-feedback">
						<label class="control-label col-xs-3" for="inputSuccess">Input with success</label>
						<div class="col-xs-9">
							<input class="form-control" type="text" id="inputSuccess">
							<span class="glyphicon glyphicon-ok form-control-feedback"></span>
						</div>
					</div>
				</form>
			</div>
		</section>
	</div>
</div>

{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
