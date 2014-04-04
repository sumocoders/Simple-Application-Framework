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
				<p>Individual form controls receive styling, but without any required base class on the <code>&lt;form&gt;</code> or large changes in markup. Results in stacked, left-aligned labels on top of form controls.</p>
				<form class="bs-docs-example">
					<fieldset>
						<legend>Legend</legend>
						<label>Label name</label>
						<input type="text" placeholder="Type something…">
						<span class="help-block">Example block-level help text here.</span>
						<label class="checkbox">
							<input type="checkbox"> Check me out
						</label>
						<button type="submit" class="btn">Submit</button>
					</fieldset>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;form&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;fieldset&gt;</span></li><li class="L2"><span class="pln">    </span><span class="tag">&lt;legend&gt;</span><span class="pln">Legend</span><span class="tag">&lt;/legend&gt;</span></li><li class="L3"><span class="pln">    </span><span class="tag">&lt;label&gt;</span><span class="pln">Label name</span><span class="tag">&lt;/label&gt;</span></li><li class="L4"><span class="pln">    </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">placeholder</span><span class="pun">=</span><span class="atv">"Type something…"</span><span class="tag">&gt;</span></li><li class="L5"><span class="pln">    </span><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"help-block"</span><span class="tag">&gt;</span><span class="pln">Example block-level help text here.</span><span class="tag">&lt;/span&gt;</span></li><li class="L6"><span class="pln">    </span><span class="tag">&lt;label</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"checkbox"</span><span class="tag">&gt;</span></li><li class="L7"><span class="pln">      </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"checkbox"</span><span class="tag">&gt;</span><span class="pln"> Check me out</span></li><li class="L8"><span class="pln">    </span><span class="tag">&lt;/label&gt;</span></li><li class="L9"><span class="pln">    </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"submit"</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn"</span><span class="tag">&gt;</span><span class="pln">Submit</span><span class="tag">&lt;/button&gt;</span></li><li class="L0"><span class="pln">  </span><span class="tag">&lt;/fieldset&gt;</span></li><li class="L1"><span class="tag">&lt;/form&gt;</span></li></ol></pre>


				<hr class="bs-docs-separator">


				<h2>Optional layouts</h2>
				<p>Included with Bootstrap are three optional form layouts for common use cases.</p>

				<h3>Search form</h3>
				<p>Add <code>.form-search</code> to the form and <code>.search-query</code> to the <code>&lt;input&gt;</code> for an extra-rounded text input.</p>
				<form class="bs-docs-example form-search">
					<input type="text" class="input-medium search-query">
					<button type="submit" class="btn">Search</button>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;form</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-search"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-medium search-query"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"submit"</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn"</span><span class="tag">&gt;</span><span class="pln">Search</span><span class="tag">&lt;/button&gt;</span></li><li class="L3"><span class="tag">&lt;/form&gt;</span></li></ol></pre>

				<h3>Inline form</h3>
				<p>Add <code>.form-inline</code> for left-aligned labels and inline-block controls for a compact layout.</p>
				<form class="bs-docs-example form-inline">
					<input type="text" class="input-small" placeholder="Email">
					<input type="password" class="input-small" placeholder="Password">
					<label class="checkbox">
						<input type="checkbox"> Remember me
					</label>
					<button type="submit" class="btn">Sign in</button>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;form</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-inline"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-small"</span><span class="pln"> </span><span class="atn">placeholder</span><span class="pun">=</span><span class="atv">"Email"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"password"</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-small"</span><span class="pln"> </span><span class="atn">placeholder</span><span class="pun">=</span><span class="atv">"Password"</span><span class="tag">&gt;</span></li><li class="L3"><span class="pln">  </span><span class="tag">&lt;label</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"checkbox"</span><span class="tag">&gt;</span></li><li class="L4"><span class="pln">    </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"checkbox"</span><span class="tag">&gt;</span><span class="pln"> Remember me</span></li><li class="L5"><span class="pln">  </span><span class="tag">&lt;/label&gt;</span></li><li class="L6"><span class="pln">  </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"submit"</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn"</span><span class="tag">&gt;</span><span class="pln">Sign in</span><span class="tag">&lt;/button&gt;</span></li><li class="L7"><span class="tag">&lt;/form&gt;</span></li></ol></pre>

				<h3>Horizontal form</h3>
				<p>Right align labels and float them to the left to make them appear on the same line as controls. Requires the most markup changes from a default form:</p>
				<ul>
					<li>Add <code>.form-horizontal</code> to the form</li>
					<li>Wrap labels and controls in <code>.control-group</code></li>
					<li>Add <code>.control-label</code> to the label</li>
					<li>Wrap any associated controls in <code>.controls</code> for proper alignment</li>
				</ul>
				<form class="bs-docs-example form-horizontal">
					<div class="control-group">
						<label class="control-label" for="inputEmail">Email</label>
						<div class="controls">
							<input type="text" id="inputEmail" placeholder="Email">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputPassword">Password</label>
						<div class="controls">
							<input type="password" id="inputPassword" placeholder="Password">
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<label class="checkbox">
								<input type="checkbox"> Remember me
							</label>
							<button type="submit" class="btn">Sign in</button>
						</div>
					</div>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;form</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-horizontal"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"control-group"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">    </span><span class="tag">&lt;label</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"control-label"</span><span class="pln"> </span><span class="atn">for</span><span class="pun">=</span><span class="atv">"inputEmail"</span><span class="tag">&gt;</span><span class="pln">Email</span><span class="tag">&lt;/label&gt;</span></li><li class="L3"><span class="pln">    </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"controls"</span><span class="tag">&gt;</span></li><li class="L4"><span class="pln">      </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"inputEmail"</span><span class="pln"> </span><span class="atn">placeholder</span><span class="pun">=</span><span class="atv">"Email"</span><span class="tag">&gt;</span></li><li class="L5"><span class="pln">    </span><span class="tag">&lt;/div&gt;</span></li><li class="L6"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L7"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"control-group"</span><span class="tag">&gt;</span></li><li class="L8"><span class="pln">    </span><span class="tag">&lt;label</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"control-label"</span><span class="pln"> </span><span class="atn">for</span><span class="pun">=</span><span class="atv">"inputPassword"</span><span class="tag">&gt;</span><span class="pln">Password</span><span class="tag">&lt;/label&gt;</span></li><li class="L9"><span class="pln">    </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"controls"</span><span class="tag">&gt;</span></li><li class="L0"><span class="pln">      </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"password"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"inputPassword"</span><span class="pln"> </span><span class="atn">placeholder</span><span class="pun">=</span><span class="atv">"Password"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">    </span><span class="tag">&lt;/div&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L3"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"control-group"</span><span class="tag">&gt;</span></li><li class="L4"><span class="pln">    </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"controls"</span><span class="tag">&gt;</span></li><li class="L5"><span class="pln">      </span><span class="tag">&lt;label</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"checkbox"</span><span class="tag">&gt;</span></li><li class="L6"><span class="pln">        </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"checkbox"</span><span class="tag">&gt;</span><span class="pln"> Remember me</span></li><li class="L7"><span class="pln">      </span><span class="tag">&lt;/label&gt;</span></li><li class="L8"><span class="pln">      </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"submit"</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn"</span><span class="tag">&gt;</span><span class="pln">Sign in</span><span class="tag">&lt;/button&gt;</span></li><li class="L9"><span class="pln">    </span><span class="tag">&lt;/div&gt;</span></li><li class="L0"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L1"><span class="tag">&lt;/form&gt;</span></li></ol></pre>


				<hr class="bs-docs-separator">


				<h2>Supported form controls</h2>
				<p>Examples of standard form controls supported in an example form layout.</p>

				<h3>Inputs</h3>
				<p>Most common form control, text-based input fields. Includes support for all HTML5 types: text, password, datetime, datetime-local, date, month, time, week, number, email, url, search, tel, and color.</p>
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
					<label class="checkbox">
						<input type="checkbox" value="">
						Option one is this and that—be sure to include why it's great
					</label>
					<br>
					<label class="radio">
						<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
						Option one is this and that—be sure to include why it's great
					</label>
					<label class="radio">
						<input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
						Option two can be something else and selecting it will deselect option one
					</label>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;label</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"checkbox"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"checkbox"</span><span class="pln"> </span><span class="atn">value</span><span class="pun">=</span><span class="atv">""</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">  Option one is this and that—be sure to include why it's great</span></li><li class="L3"><span class="tag">&lt;/label&gt;</span></li><li class="L4"><span class="pln">&nbsp;</span></li><li class="L5"><span class="tag">&lt;label</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"radio"</span><span class="tag">&gt;</span></li><li class="L6"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"radio"</span><span class="pln"> </span><span class="atn">name</span><span class="pun">=</span><span class="atv">"optionsRadios"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"optionsRadios1"</span><span class="pln"> </span><span class="atn">value</span><span class="pun">=</span><span class="atv">"option1"</span><span class="pln"> </span><span class="atn">checked</span><span class="tag">&gt;</span></li><li class="L7"><span class="pln">  Option one is this and that—be sure to include why it's great</span></li><li class="L8"><span class="tag">&lt;/label&gt;</span></li><li class="L9"><span class="tag">&lt;label</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"radio"</span><span class="tag">&gt;</span></li><li class="L0"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"radio"</span><span class="pln"> </span><span class="atn">name</span><span class="pun">=</span><span class="atv">"optionsRadios"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"optionsRadios2"</span><span class="pln"> </span><span class="atn">value</span><span class="pun">=</span><span class="atv">"option2"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  Option two can be something else and selecting it will deselect option one</span></li><li class="L2"><span class="tag">&lt;/label&gt;</span></li></ol></pre>

				<h4>Inline checkboxes</h4>
				<p>Add the <code>.inline</code> class to a series of checkboxes or radios for controls appear on the same line.</p>
				<form class="bs-docs-example">
					<label class="checkbox inline">
						<input type="checkbox" id="inlineCheckbox1" value="option1"> 1
					</label>
					<label class="checkbox inline">
						<input type="checkbox" id="inlineCheckbox2" value="option2"> 2
					</label>
					<label class="checkbox inline">
						<input type="checkbox" id="inlineCheckbox3" value="option3"> 3
					</label>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;label</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"checkbox inline"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"checkbox"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"inlineCheckbox1"</span><span class="pln"> </span><span class="atn">value</span><span class="pun">=</span><span class="atv">"option1"</span><span class="tag">&gt;</span><span class="pln"> 1</span></li><li class="L2"><span class="tag">&lt;/label&gt;</span></li><li class="L3"><span class="tag">&lt;label</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"checkbox inline"</span><span class="tag">&gt;</span></li><li class="L4"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"checkbox"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"inlineCheckbox2"</span><span class="pln"> </span><span class="atn">value</span><span class="pun">=</span><span class="atv">"option2"</span><span class="tag">&gt;</span><span class="pln"> 2</span></li><li class="L5"><span class="tag">&lt;/label&gt;</span></li><li class="L6"><span class="tag">&lt;label</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"checkbox inline"</span><span class="tag">&gt;</span></li><li class="L7"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"checkbox"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"inlineCheckbox3"</span><span class="pln"> </span><span class="atn">value</span><span class="pun">=</span><span class="atv">"option3"</span><span class="tag">&gt;</span><span class="pln"> 3</span></li><li class="L8"><span class="tag">&lt;/label&gt;</span></li></ol></pre>

				<h3>Selects</h3>
				<p>Use the default option or specify a <code>multiple="multiple"</code> to show multiple options at once.</p>
				<form class="bs-docs-example">
					<select>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
					<br>
					<select multiple="multiple">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;select&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;option&gt;</span><span class="pln">1</span><span class="tag">&lt;/option&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;option&gt;</span><span class="pln">2</span><span class="tag">&lt;/option&gt;</span></li><li class="L3"><span class="pln">  </span><span class="tag">&lt;option&gt;</span><span class="pln">3</span><span class="tag">&lt;/option&gt;</span></li><li class="L4"><span class="pln">  </span><span class="tag">&lt;option&gt;</span><span class="pln">4</span><span class="tag">&lt;/option&gt;</span></li><li class="L5"><span class="pln">  </span><span class="tag">&lt;option&gt;</span><span class="pln">5</span><span class="tag">&lt;/option&gt;</span></li><li class="L6"><span class="tag">&lt;/select&gt;</span></li><li class="L7"><span class="pln">&nbsp;</span></li><li class="L8"><span class="tag">&lt;select</span><span class="pln"> </span><span class="atn">multiple</span><span class="pun">=</span><span class="atv">"multiple"</span><span class="tag">&gt;</span></li><li class="L9"><span class="pln">  </span><span class="tag">&lt;option&gt;</span><span class="pln">1</span><span class="tag">&lt;/option&gt;</span></li><li class="L0"><span class="pln">  </span><span class="tag">&lt;option&gt;</span><span class="pln">2</span><span class="tag">&lt;/option&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;option&gt;</span><span class="pln">3</span><span class="tag">&lt;/option&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;option&gt;</span><span class="pln">4</span><span class="tag">&lt;/option&gt;</span></li><li class="L3"><span class="pln">  </span><span class="tag">&lt;option&gt;</span><span class="pln">5</span><span class="tag">&lt;/option&gt;</span></li><li class="L4"><span class="tag">&lt;/select&gt;</span></li></ol></pre>


				<hr class="bs-docs-separator">


				<h2>Extending form controls</h2>
				<p>Extend form controls by adding text or buttons before, after, or on both sides of any text-based input. Use <code>.input-group</code> with an <code>.input-group-addon</code> to prepend or append elements to a single <code>.form-control</code>.</p>

				<h3>Input groups</h3>
				<p>Avoid using <code>select</code> elements here as they cannot be fully styled in WebKit browsers.</p>

				<h4>Single sided</h4>
				<p>Wrap an add-on or button on either side of an input. You may also place one on both sides of an input.</p>
				<form class="bs-docs-example">
					<div class="input-group col-xs-6 col-md-2">
						<span class="input-group-addon">@</span>
						<input class="form-control" id="prependedInput" type="text" placeholder="Username">
					</div>
					<br>
					<div class="input-group col-xs-6 col-md-2">
						<input class="form-control" id="appendedInput" type="text">
						<span class="input-group-addon">.00</span>
					</div>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group  col-xs-6 col-md-2"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group-addon"</span><span class="tag">&gt;</span><span class="pln">@</span><span class="tag">&lt;/span&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-control"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"prependedInput"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">placeholder</span><span class="pun">=</span><span class="atv">"Username"</span><span class="tag">&gt;</span></li><li class="L3"><span class="tag">&lt;/div&gt;</span></li><li class="L4"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group col-xs-6 col-md-2"</span><span class="tag">&gt;</span></li><li class="L5"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-control"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"appendedInput"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="tag">&gt;</span></li><li class="L6"><span class="pln">  </span><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group-addon"</span><span class="tag">&gt;</span><span class="pln">.00</span><span class="tag">&lt;/span&gt;</span></li><li class="L7"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<h4>Combined</h4>
				<form class="bs-docs-example form-inline">
					<div class="input-group col-xs-6 col-md-2">
						<span class="input-group-addon">$</span>
						<input class="form-control" id="appendedPrependedInput" type="text">
						<span class="input-group-addon">.00</span>
					</div>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group col-xs-6 col-md-2"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group-addon"</span><span class="tag">&gt;</span><span class="pln">$</span><span class="tag">&lt;/span&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-control"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"appendedPrependedInput"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="tag">&gt;</span></li><li class="L3"><span class="pln">  </span><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group-addon"</span><span class="tag">&gt;</span><span class="pln">.00</span><span class="tag">&lt;/span&gt;</span></li><li class="L4"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<h4>Buttons add-ons</h4>
				<p>Buttons in input groups are a bit different and require one extra level of nesting. Instead of <code>.input-group-addon</code>, you'll need to use <code>.input-group-btn</code> to wrap the buttons. This is required due to default browser styles that cannot be overridden.</p>
				<form class="bs-docs-example">
					<div class="input-group col-xs-6 col-md-2">
						<input class="form-control" id="appendedInputButton" type="text">
						<span class="input-group-btn">
							<button class="btn" type="button">Go!</button>
						</span>
					</div>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group col-xs-6 col-md-2"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-control"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"appendedInputButton"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group-btn"</span><span class="pln"> </span><span class="tag">&gt;</span></li><li class="L3"><span class="pln">    </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"button"</span><span class="tag">&gt;</span><span class="pln">Go!</span><span class="tag">&lt;/button&gt;</span></li><li class="L4"><span class="pln">  </span><span class="tag">&lt;/span&gt;</span></li><li class="L5"><span class="tag">&lt;/div&gt;</span></li></ol></pre>
				<form class="bs-docs-example">
					<div class="input-group col-xs-6 col-md-2">
						<input class="form-control" id="appendedInputButtons" type="text">
						<div class="input-group-btn">
							<button class="btn" type="button">Search</button>
							<button class="btn" type="button">Options</button>
						</div>
					</div>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group col-xs-6 col-md-2"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-control"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"appendedInputButtons"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group-btn"</span><span class="pln"> </span><span class="tag">&gt;</span></li><li class="L3"><span class="pln">    </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"button"</span><span class="tag">&gt;</span><span class="pln">Search</span><span class="tag">&lt;/button&gt;</span></li><li class="L4"><span class="pln">    </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"button"</span><span class="tag">&gt;</span><span class="pln">Options</span><span class="tag">&lt;/button&gt;</span></li><li class="L5"><span class="pln">  </span><span class="tag">&lt;/span&gt;</span></li><li class="L5"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<h4>Button dropdowns</h4>
				<p></p>
				<form class="bs-docs-example">
					<div class="input-group col-xs-6 col-md-2">
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
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group col-xs-6 col-md-2"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-control"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"appendedDropdownButton"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group-btn"</span><span class="tag">&gt;</span></li><li class="L3"><span class="pln">    </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn dropdown-toggle"</span><span class="pln"> </span><span class="atn">data-toggle</span><span class="pun">=</span><span class="atv">"dropdown"</span><span class="tag">&gt;</span></li><li class="L4"><span class="pln">      Action</span></li><li class="L5"><span class="pln">      </span><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"caret"</span><span class="tag">&gt;&lt;/span&gt;</span></li><li class="L6"><span class="pln">    </span><span class="tag">&lt;/button&gt;</span></li><li class="L7"><span class="pln">    </span><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"dropdown-menu dropdown-menu-right"</span><span class="tag">&gt;</span></li><li class="L8"><span class="pln">      ...</span></li><li class="L9"><span class="pln">    </span><span class="tag">&lt;/ul&gt;</span></li><li class="L0"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L1"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<form class="bs-docs-example">
					<div class="input-group col-xs-6 col-md-2">
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
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group col-xs-6 col-md-2"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group-btn"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">    </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn dropdown-toggle"</span><span class="pln"> </span><span class="atn">data-toggle</span><span class="pun">=</span><span class="atv">"dropdown"</span><span class="tag">&gt;</span></li><li class="L3"><span class="pln">      Action</span></li><li class="L4"><span class="pln">      </span><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"caret"</span><span class="tag">&gt;&lt;/span&gt;</span></li><li class="L5"><span class="pln">    </span><span class="tag">&lt;/button&gt;</span></li><li class="L6"><span class="pln">    </span><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"dropdown-menu"</span><span class="tag">&gt;</span></li><li class="L7"><span class="pln">      ...</span></li><li class="L8"><span class="pln">    </span><span class="tag">&lt;/ul&gt;</span></li><li class="L9"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L0"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-control"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"prependedDropdownButton"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="tag">&gt;</span></li><li class="L1"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

				<form class="bs-docs-example">
					<div class="input-group col-xs-6 col-md-2">
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
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group col-xs-6 col-md-2"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group-btn"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">    </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn dropdown-toggle"</span><span class="pln"> </span><span class="atn">data-toggle</span><span class="pun">=</span><span class="atv">"dropdown"</span><span class="tag">&gt;</span></li><li class="L3"><span class="pln">      Action</span></li><li class="L4"><span class="pln">      </span><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"caret"</span><span class="tag">&gt;&lt;/span&gt;</span></li><li class="L5"><span class="pln">    </span><span class="tag">&lt;/button&gt;</span></li><li class="L6"><span class="pln">    </span><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"dropdown-menu"</span><span class="tag">&gt;</span></li><li class="L7"><span class="pln">      ...</span></li><li class="L8"><span class="pln">    </span><span class="tag">&lt;/ul&gt;</span></li><li class="L9"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L0"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"forn-control"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"appendedPrependedDropdownButton"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group-btn"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">    </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn dropdown-toggle"</span><span class="pln"> </span><span class="atn">data-toggle</span><span class="pun">=</span><span class="atv">"dropdown"</span><span class="tag">&gt;</span></li><li class="L3"><span class="pln">      Action</span></li><li class="L4"><span class="pln">      </span><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"caret"</span><span class="tag">&gt;&lt;/span&gt;</span></li><li class="L5"><span class="pln">    </span><span class="tag">&lt;/button&gt;</span></li><li class="L6"><span class="pln">    </span><span class="tag">&lt;ul</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"dropdown-menu dropdown-menu-right"</span><span class="tag">&gt;</span></li><li class="L7"><span class="pln">      ...</span></li><li class="L8"><span class="pln">    </span><span class="tag">&lt;/ul&gt;</span></li><li class="L9"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L0"><span class="tag">&lt;/div&gt;</span></li></ol></pre>

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
					<div class="input-group col-xs-6 col-md-2">
						<input type="text" class="form-control search-query">
						<div class="input-group-btn">
							<button type="submit" class="btn">Search</button>
						</div>
					</div>
					<div class="input-group col-xs-6 col-md-2">
						<div class="input-group-btn">
							<button type="submit" class="btn">Search</button>
						</div>
						<input type="text" class="form-control search-query">
					</div>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;form</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-search"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group col-xs-6 col-md-2"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">    </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-control search-query"</span><span class="tag">&gt;</span></li><li class="L3"><span class="pln">    </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group-btn"</span><span class="tag">&gt;</span></li><li class="L4"><span class="pln">      </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"submit"</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn"</span><span class="tag">&gt;</span><span class="pln">Search</span><span class="tag">&lt;/button&gt;</span></li><li class="L5"><span class="pln">    </span><span class="tag">&lt;/div&gt;</span></li><li class="L6"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L7"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group col-xs-6 col-md-2"</span><span class="tag">&gt;</span></li><li class="L8"><span class="pln">    </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-group-btn"</span><span class="tag">&gt;</span></li><li class="L9"><span class="pln">      </span><span class="tag">&lt;button</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"submit"</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"btn"</span><span class="tag">&gt;</span><span class="pln">Search</span><span class="tag">&lt;/button&gt;</span></li><li class="L10"><span class="pln">    </span><span class="tag">&lt;/div&gt;</span></li><li class="L11"><span class="pln">    </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"form-control search-query"</span><span class="tag">&gt;</span></li><li class="L13"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L14"><span class="tag">&lt;/form&gt;</span></li></ol></pre>

				<h3>Control sizing</h3>
				<p>Use relative sizing classes like <code>.input-large</code> or match your inputs to the grid column sizes using <code>.span*</code> classes.</p>

				<h4>Block level inputs</h4>
				<p>Make any <code>&lt;input&gt;</code> or <code>&lt;textarea&gt;</code> element behave like a block level element.</p>
				<form class="bs-docs-example" style="padding-bottom: 15px;">
					<div class="controls">
						<input class="input-block-level" type="text" placeholder=".input-block-level">
					</div>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-block-level"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">placeholder</span><span class="pun">=</span><span class="atv">".input-block-level"</span><span class="tag">&gt;</span></li></ol></pre>

				<h4>Relative sizing</h4>
				<form class="bs-docs-example" style="padding-bottom: 15px;">
					<div class="controls docs-input-sizes">
						<input class="input-xs" type="text" placeholder=".input-xs">
						<input class="input-sm" type="text" placeholder=".input-sm">
						<input type="text" placeholder="Default input">
						<input class="input-lg" type="text" placeholder=".input-lg">
						<input class="input-xlg" type="text" placeholder=".input-xlg">
						<input class="input-xxlg" type="text" placeholder=".input-xxlg">
					</div>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-mini"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">placeholder</span><span class="pun">=</span><span class="atv">".input-mini"</span><span class="tag">&gt;</span></li><li class="L1"><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-small"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">placeholder</span><span class="pun">=</span><span class="atv">".input-small"</span><span class="tag">&gt;</span></li><li class="L2"><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-medium"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">placeholder</span><span class="pun">=</span><span class="atv">".input-medium"</span><span class="tag">&gt;</span></li><li class="L3"><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-large"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">placeholder</span><span class="pun">=</span><span class="atv">".input-large"</span><span class="tag">&gt;</span></li><li class="L4"><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-xlarge"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">placeholder</span><span class="pun">=</span><span class="atv">".input-xlarge"</span><span class="tag">&gt;</span></li><li class="L5"><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-xxlarge"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">placeholder</span><span class="pun">=</span><span class="atv">".input-xxlarge"</span><span class="tag">&gt;</span></li></ol></pre>
				<p>
					<span class="label label-info">Heads up!</span> In future versions, we'll be altering the use of these relative input classes to match our button sizes. For example, <code>.input-large</code> will increase the padding and font-size of an input.
				</p>

				<h4>Grid sizing</h4>
				<p>Use <code>.span1</code> to <code>.span12</code> for inputs that match the same sizes of the grid columns.</p>
				<form class="bs-docs-example" style="padding-bottom: 15px;">
					<div class="controls docs-input-sizes">
						<input class="span1" type="text" placeholder=".span1">
						<input class="span2" type="text" placeholder=".span2">
						<input class="span3" type="text" placeholder=".span3">
						<select class="span1">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
						</select>
						<select class="span2">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
						</select>
						<select class="span3">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
						</select>
					</div>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"span1"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">placeholder</span><span class="pun">=</span><span class="atv">".span1"</span><span class="tag">&gt;</span></li><li class="L1"><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"span2"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">placeholder</span><span class="pun">=</span><span class="atv">".span2"</span><span class="tag">&gt;</span></li><li class="L2"><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"span3"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">placeholder</span><span class="pun">=</span><span class="atv">".span3"</span><span class="tag">&gt;</span></li><li class="L3"><span class="tag">&lt;select</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"span1"</span><span class="tag">&gt;</span></li><li class="L4"><span class="pln">  ...</span></li><li class="L5"><span class="tag">&lt;/select&gt;</span></li><li class="L6"><span class="tag">&lt;select</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"span2"</span><span class="tag">&gt;</span></li><li class="L7"><span class="pln">  ...</span></li><li class="L8"><span class="tag">&lt;/select&gt;</span></li><li class="L9"><span class="tag">&lt;select</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"span3"</span><span class="tag">&gt;</span></li><li class="L0"><span class="pln">  ...</span></li><li class="L1"><span class="tag">&lt;/select&gt;</span></li></ol></pre>

				<p>For multiple grid inputs per line, <strong>use the <code>.controls-row</code> modifier class for proper spacing</strong>. It floats the inputs to collapse white-space, sets the proper margins, and clears the float.</p>
				<form class="bs-docs-example" style="padding-bottom: 15px;">
					<div class="controls">
						<input class="span5" type="text" placeholder=".span5">
					</div>
					<div class="controls controls-row">
						<input class="span4" type="text" placeholder=".span4">
						<input class="span1" type="text" placeholder=".span1">
					</div>
					<div class="controls controls-row">
						<input class="span3" type="text" placeholder=".span3">
						<input class="span2" type="text" placeholder=".span2">
					</div>
					<div class="controls controls-row">
						<input class="span2" type="text" placeholder=".span2">
						<input class="span3" type="text" placeholder=".span3">
					</div>
					<div class="controls controls-row">
						<input class="span1" type="text" placeholder=".span1">
						<input class="span4" type="text" placeholder=".span4">
					</div>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"controls"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"span5"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">placeholder</span><span class="pun">=</span><span class="atv">".span5"</span><span class="tag">&gt;</span></li><li class="L2"><span class="tag">&lt;/div&gt;</span></li><li class="L3"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"controls controls-row"</span><span class="tag">&gt;</span></li><li class="L4"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"span4"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">placeholder</span><span class="pun">=</span><span class="atv">".span4"</span><span class="tag">&gt;</span></li><li class="L5"><span class="pln">  </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"span1"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">placeholder</span><span class="pun">=</span><span class="atv">".span1"</span><span class="tag">&gt;</span></li><li class="L6"><span class="tag">&lt;/div&gt;</span></li><li class="L7"><span class="pln">...</span></li></ol></pre>

				<h3>Uneditable inputs</h3>
				<p>Present data in a form that's not editable without using actual form markup.</p>
				<form class="bs-docs-example">
					<span class="input-xlarge uneditable-input">Some value here</span>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-xlarge uneditable-input"</span><span class="tag">&gt;</span><span class="pln">Some value here</span><span class="tag">&lt;/span&gt;</span></li></ol></pre>

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
				<p>Inline and block level support for help text that appears around form controls.</p>
				<h4>Inline help</h4>
				<form class="bs-docs-example form-inline">
					<input type="text"> <span class="help-inline">Inline help text</span>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="tag">&gt;&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"help-inline"</span><span class="tag">&gt;</span><span class="pln">Inline help text</span><span class="tag">&lt;/span&gt;</span></li></ol></pre>

				<h4>Block help</h4>
				<form class="bs-docs-example form-inline">
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
					<input class="input-xlarge focused" id="focusedInput" type="text" value="This is focused...">
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-xlarge"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"focusedInput"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">value</span><span class="pun">=</span><span class="atv">"This is focused..."</span><span class="tag">&gt;</span></li></ol></pre>

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
					<input class="input-xlarge" id="disabledInput" type="text" placeholder="Disabled input here…" disabled="">
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"input-xlarge"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"disabledInput"</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">placeholder</span><span class="pun">=</span><span class="atv">"Disabled input here..."</span><span class="pln"> </span><span class="atn">disabled</span><span class="tag">&gt;</span></li></ol></pre>

				<h3>Validation states</h3>
				<p>Bootstrap includes validation styles for error, warning, info, and success messages. To use, add the appropriate class to the surrounding <code>.control-group</code>.</p>

				<form class="bs-docs-example form-horizontal">
					<div class="control-group warning">
						<label class="control-label" for="inputWarning">Input with warning</label>
						<div class="controls">
							<input type="text" id="inputWarning">
							<span class="help-inline">Something may have gone wrong</span>
						</div>
					</div>
					<div class="control-group error">
						<label class="control-label" for="inputError">Input with error</label>
						<div class="controls">
							<input type="text" id="inputError">
							<span class="help-inline">Please correct the error</span>
						</div>
					</div>
					<div class="control-group info">
						<label class="control-label" for="inputInfo">Input with info</label>
						<div class="controls">
							<input type="text" id="inputInfo">
							<span class="help-inline">Username is taken</span>
						</div>
					</div>
					<div class="control-group success">
						<label class="control-label" for="inputSuccess">Input with success</label>
						<div class="controls">
							<input type="text" id="inputSuccess">
							<span class="help-inline">Woohoo!</span>
						</div>
					</div>
				</form>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"control-group warning"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;label</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"control-label"</span><span class="pln"> </span><span class="atn">for</span><span class="pun">=</span><span class="atv">"inputWarning"</span><span class="tag">&gt;</span><span class="pln">Input with warning</span><span class="tag">&lt;/label&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"controls"</span><span class="tag">&gt;</span></li><li class="L3"><span class="pln">    </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"inputWarning"</span><span class="tag">&gt;</span></li><li class="L4"><span class="pln">    </span><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"help-inline"</span><span class="tag">&gt;</span><span class="pln">Something may have gone wrong</span><span class="tag">&lt;/span&gt;</span></li><li class="L5"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L6"><span class="tag">&lt;/div&gt;</span></li><li class="L7"><span class="pln">&nbsp;</span></li><li class="L8"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"control-group error"</span><span class="tag">&gt;</span></li><li class="L9"><span class="pln">  </span><span class="tag">&lt;label</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"control-label"</span><span class="pln"> </span><span class="atn">for</span><span class="pun">=</span><span class="atv">"inputError"</span><span class="tag">&gt;</span><span class="pln">Input with error</span><span class="tag">&lt;/label&gt;</span></li><li class="L0"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"controls"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">    </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"inputError"</span><span class="tag">&gt;</span></li><li class="L2"><span class="pln">    </span><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"help-inline"</span><span class="tag">&gt;</span><span class="pln">Please correct the error</span><span class="tag">&lt;/span&gt;</span></li><li class="L3"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L4"><span class="tag">&lt;/div&gt;</span></li><li class="L5"><span class="pln">&nbsp;</span></li><li class="L6"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"control-group info"</span><span class="tag">&gt;</span></li><li class="L7"><span class="pln">  </span><span class="tag">&lt;label</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"control-label"</span><span class="pln"> </span><span class="atn">for</span><span class="pun">=</span><span class="atv">"inputInfo"</span><span class="tag">&gt;</span><span class="pln">Input with info</span><span class="tag">&lt;/label&gt;</span></li><li class="L8"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"controls"</span><span class="tag">&gt;</span></li><li class="L9"><span class="pln">    </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"inputInfo"</span><span class="tag">&gt;</span></li><li class="L0"><span class="pln">    </span><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"help-inline"</span><span class="tag">&gt;</span><span class="pln">Username is already taken</span><span class="tag">&lt;/span&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L2"><span class="tag">&lt;/div&gt;</span></li><li class="L3"><span class="pln">&nbsp;</span></li><li class="L4"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"control-group success"</span><span class="tag">&gt;</span></li><li class="L5"><span class="pln">  </span><span class="tag">&lt;label</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"control-label"</span><span class="pln"> </span><span class="atn">for</span><span class="pun">=</span><span class="atv">"inputSuccess"</span><span class="tag">&gt;</span><span class="pln">Input with success</span><span class="tag">&lt;/label&gt;</span></li><li class="L6"><span class="pln">  </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"controls"</span><span class="tag">&gt;</span></li><li class="L7"><span class="pln">    </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"inputSuccess"</span><span class="tag">&gt;</span></li><li class="L8"><span class="pln">    </span><span class="tag">&lt;span</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"help-inline"</span><span class="tag">&gt;</span><span class="pln">Woohoo!</span><span class="tag">&lt;/span&gt;</span></li><li class="L9"><span class="pln">  </span><span class="tag">&lt;/div&gt;</span></li><li class="L0"><span class="tag">&lt;/div&gt;</span></li></ol></pre>
			</div>
		</section>
	</div>
</div>

{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
