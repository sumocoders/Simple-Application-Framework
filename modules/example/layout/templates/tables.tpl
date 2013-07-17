{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

<div id="contentWrap">
	<div id="content">
		<header id="header" role="banner">
			<div class="container">
				<div class="title">
					<a id="toggleMenu" class="visible-phone" href="#">{$lblMenu|uppercase}</a>
					<h2>Tables</h2>
				</div>
			</div>
		</header>

      	{include:'{$CORE_PATH}/layout/templates/notifications.tpl'}

		<main id="main" role="main">
			<div class="container">
				<h2>Default styles</h2>
				<p>For basic styling—light padding and only horizontal dividers—add the base class <code>.table</code> to any <code>&lt;table&gt;</code>.</p>
				<div class="bs-docs-example">
					<table class="table">
						<thead>
						<tr>
							<th>#</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Username</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td>1</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
						</tr>
						<tr>
							<td>2</td>
							<td>Jacob</td>
							<td>Thornton</td>
							<td>@fat</td>
						</tr>
						<tr>
							<td>3</td>
							<td>Larry</td>
							<td>the Bird</td>
							<td>@twitter</td>
						</tr>
						</tbody>
					</table>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;table</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"table"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  …</span></li><li class="L2"><span class="tag">&lt;/table&gt;</span></li></ol></pre>


				<hr class="bs-docs-separator">


				<h2>Optional classes</h2>
				<p>Add any of the following classes to the <code>.table</code> base class.</p>

				<h3><code>.table-striped</code></h3>
				<p>Adds zebra-striping to any table row within the <code>&lt;tbody&gt;</code> via the <code>:nth-child</code> CSS selector (not available in IE7-8).</p>
				<div class="bs-docs-example">
					<table class="table table-striped">
						<thead>
						<tr>
							<th>#</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Username</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td>1</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
						</tr>
						<tr>
							<td>2</td>
							<td>Jacob</td>
							<td>Thornton</td>
							<td>@fat</td>
						</tr>
						<tr>
							<td>3</td>
							<td>Larry</td>
							<td>the Bird</td>
							<td>@twitter</td>
						</tr>
						</tbody>
					</table>
				</div>
				<pre class="prettyprint linenums" style="margin-bottom: 18px;"><ol class="linenums"><li class="L0"><span class="tag">&lt;table</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"table table-striped"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  …</span></li><li class="L2"><span class="tag">&lt;/table&gt;</span></li></ol></pre>

				<h3><code>.table-bordered</code></h3>
				<p>Add borders and rounded corners to the table.</p>
				<div class="bs-docs-example">
					<table class="table table-bordered">
						<thead>
						<tr>
							<th>#</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Username</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td rowspan="2">1</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
						</tr>
						<tr>
							<td>Mark</td>
							<td>Otto</td>
							<td>@TwBootstrap</td>
						</tr>
						<tr>
							<td>2</td>
							<td>Jacob</td>
							<td>Thornton</td>
							<td>@fat</td>
						</tr>
						<tr>
							<td>3</td>
							<td colspan="2">Larry the Bird</td>
							<td>@twitter</td>
						</tr>
						</tbody>
					</table>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;table</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"table table-bordered"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  …</span></li><li class="L2"><span class="tag">&lt;/table&gt;</span></li></ol></pre>

				<h3><code>.table-hover</code></h3>
				<p>Enable a hover state on table rows within a <code>&lt;tbody&gt;</code>.</p>
				<div class="bs-docs-example">
					<table class="table table-hover">
						<thead>
						<tr>
							<th>#</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Username</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td>1</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
						</tr>
						<tr>
							<td>2</td>
							<td>Jacob</td>
							<td>Thornton</td>
							<td>@fat</td>
						</tr>
						<tr>
							<td>3</td>
							<td colspan="2">Larry the Bird</td>
							<td>@twitter</td>
						</tr>
						</tbody>
					</table>
				</div>
				<pre class="prettyprint linenums" style="margin-bottom: 18px;"><ol class="linenums"><li class="L0"><span class="tag">&lt;table</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"table table-hover"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  …</span></li><li class="L2"><span class="tag">&lt;/table&gt;</span></li></ol></pre>

				<h3><code>.table-condensed</code></h3>
				<p>Makes tables more compact by cutting cell padding in half.</p>
				<div class="bs-docs-example">
					<table class="table table-condensed">
						<thead>
						<tr>
							<th>#</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Username</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td>1</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
						</tr>
						<tr>
							<td>2</td>
							<td>Jacob</td>
							<td>Thornton</td>
							<td>@fat</td>
						</tr>
						<tr>
							<td>3</td>
							<td colspan="2">Larry the Bird</td>
							<td>@twitter</td>
						</tr>
						</tbody>
					</table>
				</div>
				<pre class="prettyprint linenums" style="margin-bottom: 18px;"><ol class="linenums"><li class="L0"><span class="tag">&lt;table</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"table table-condensed"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">  …</span></li><li class="L2"><span class="tag">&lt;/table&gt;</span></li></ol></pre>


				<hr class="bs-docs-separator">


				<h2>Optional row classes</h2>
				<p>Use contextual classes to color table rows.</p>
				<table class="table table-bordered table-striped">
					<colgroup>
						<col class="span1">
						<col class="span7">
					</colgroup>
					<thead>
					<tr>
						<th>Class</th>
						<th>Description</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td>
							<code>.success</code>
						</td>
						<td>Indicates a successful or positive action.</td>
					</tr>
					<tr>
						<td>
							<code>.error</code>
						</td>
						<td>Indicates a dangerous or potentially negative action.</td>
					</tr>
					<tr>
						<td>
							<code>.warning</code>
						</td>
						<td>Indicates a warning that might need attention.</td>
					</tr>
					<tr>
						<td>
							<code>.info</code>
						</td>
						<td>Used as an alternative to the default styles.</td>
					</tr>
					</tbody>
				</table>
				<div class="bs-docs-example">
					<table class="table">
						<thead>
						<tr>
							<th>#</th>
							<th>Product</th>
							<th>Payment Taken</th>
							<th>Status</th>
						</tr>
						</thead>
						<tbody>
						<tr class="success">
							<td>1</td>
							<td>TB - Monthly</td>
							<td>01/04/2012</td>
							<td>Approved</td>
						</tr>
						<tr class="error">
							<td>2</td>
							<td>TB - Monthly</td>
							<td>02/04/2012</td>
							<td>Declined</td>
						</tr>
						<tr class="warning">
							<td>3</td>
							<td>TB - Monthly</td>
							<td>03/04/2012</td>
							<td>Pending</td>
						</tr>
						<tr class="info">
							<td>4</td>
							<td>TB - Monthly</td>
							<td>04/04/2012</td>
							<td>Call in to confirm</td>
						</tr>
						</tbody>
					</table>
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="pun">...</span></li><li class="L1"><span class="pln">  </span><span class="pun">&lt;</span><span class="pln">tr </span><span class="kwd">class</span><span class="pun">=</span><span class="str">"success"</span><span class="pun">&gt;</span></li><li class="L2"><span class="pln">    </span><span class="str">&lt;td&gt;</span><span class="lit">1</span><span class="pun">&lt;</span><span class="str">/td&gt;</span></li><li class="L3"><span class="str">    &lt;td&gt;TB - Monthly&lt;/</span><span class="pln">td</span><span class="pun">&gt;</span></li><li class="L4"><span class="pln">    </span><span class="str">&lt;td&gt;</span><span class="lit">01</span><span class="pun">/</span><span class="lit">04</span><span class="pun">/</span><span class="lit">2012</span><span class="pun">&lt;</span><span class="str">/td&gt;</span></li><li class="L5"><span class="str">    &lt;td&gt;Approved&lt;/</span><span class="pln">td</span><span class="pun">&gt;</span></li><li class="L6"><span class="pln">  </span><span class="pun">&lt;/</span><span class="pln">tr</span><span class="pun">&gt;</span></li><li class="L7"><span class="pun">...</span></li></ol></pre>


				<hr class="bs-docs-separator">


				<h2>Supported table markup</h2>
				<p>List of supported table HTML elements and how they should be used.</p>
				<table class="table table-bordered table-striped">
					<colgroup>
						<col class="span1">
						<col class="span7">
					</colgroup>
					<thead>
					<tr>
						<th>Tag</th>
						<th>Description</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td>
							<code>&lt;table&gt;</code>
						</td>
						<td>
							Wrapping element for displaying data in a tabular format
						</td>
					</tr>
					<tr>
						<td>
							<code>&lt;thead&gt;</code>
						</td>
						<td>
							Container element for table header rows (<code>&lt;tr&gt;</code>) to label table columns
						</td>
					</tr>
					<tr>
						<td>
							<code>&lt;tbody&gt;</code>
						</td>
						<td>
							Container element for table rows (<code>&lt;tr&gt;</code>) in the body of the table
						</td>
					</tr>
					<tr>
						<td>
							<code>&lt;tr&gt;</code>
						</td>
						<td>
							Container element for a set of table cells (<code>&lt;td&gt;</code> or <code>&lt;th&gt;</code>) that appears on a single row
						</td>
					</tr>
					<tr>
						<td>
							<code>&lt;td&gt;</code>
						</td>
						<td>
							Default table cell
						</td>
					</tr>
					<tr>
						<td>
							<code>&lt;th&gt;</code>
						</td>
						<td>
							Special table cell for column (or row, depending on scope and placement) labels
						</td>
					</tr>
					<tr>
						<td>
							<code>&lt;caption&gt;</code>
						</td>
						<td>
							Description or summary of what the table holds, especially useful for screen readers
						</td>
					</tr>
					</tbody>
				</table>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;table&gt;</span></li><li class="L1"><span class="pln">  </span><span class="tag">&lt;caption&gt;</span><span class="pln">...</span><span class="tag">&lt;/caption&gt;</span></li><li class="L2"><span class="pln">  </span><span class="tag">&lt;thead&gt;</span></li><li class="L3"><span class="pln">    </span><span class="tag">&lt;tr&gt;</span></li><li class="L4"><span class="pln">      </span><span class="tag">&lt;th&gt;</span><span class="pln">...</span><span class="tag">&lt;/th&gt;</span></li><li class="L5"><span class="pln">      </span><span class="tag">&lt;th&gt;</span><span class="pln">...</span><span class="tag">&lt;/th&gt;</span></li><li class="L6"><span class="pln">    </span><span class="tag">&lt;/tr&gt;</span></li><li class="L7"><span class="pln">  </span><span class="tag">&lt;/thead&gt;</span></li><li class="L8"><span class="pln">  </span><span class="tag">&lt;tbody&gt;</span></li><li class="L9"><span class="pln">    </span><span class="tag">&lt;tr&gt;</span></li><li class="L0"><span class="pln">      </span><span class="tag">&lt;td&gt;</span><span class="pln">...</span><span class="tag">&lt;/td&gt;</span></li><li class="L1"><span class="pln">      </span><span class="tag">&lt;td&gt;</span><span class="pln">...</span><span class="tag">&lt;/td&gt;</span></li><li class="L2"><span class="pln">    </span><span class="tag">&lt;/tr&gt;</span></li><li class="L3"><span class="pln">  </span><span class="tag">&lt;/tbody&gt;</span></li><li class="L4"><span class="tag">&lt;/table&gt;</span></li></ol></pre>
			</div>
		</main>
	</div>
</div>

{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
</body>
</html>