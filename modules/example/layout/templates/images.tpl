{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

<div id="contentWrap">
	<div id="content">
		<header id="header" role="banner">
			<div class="container bar">
				<div class="title">
					<a id="toggleMenu" class="visible-phone iconLink" href="#">{$lblMenu|uppercase}</a>
					<h2>Images</h2>
				</div>
			</div>
		</header>

      	{include:'{$CORE_PATH}/layout/templates/notifications.tpl'}

		<section id="main" role="main">
			<div class="container">
				<h2>Responsive images</h2>
				<p>Images in Bootstrap 3 can be made responsive-friendly via the addition of the <code>.img-responsive</code> class. This applies <code>max-width: 100%;</code> and <code>height: auto;</code> to the image so that it scales nicely to the parent element.</p>
				<pre class="prettyprint linenums"><span>&lt;img src="..." class="img-responsive" alt="Responsive image"&gt;</span></pre>
				<h2>Image shapes</h2>
				<p>Add classes to an <code>&lt;img&gt;</code> element to easily style images in any project.</p>
				<div class="bs-docs-example bs-docs-example-images">
					<img data-src="holder.js/140x140" class="img-rounded" alt="140x140" style="width: 140px; height: 140px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIwAAACMCAYAAACuwEE+AAAFjklEQVR4Xu3Xx0skfRDG8TJnFEXEg4oJvIgZxYT/ujmsIgZEwXgUdRRzdqmGEfUg1rulOPV++za7ZfXUUx9+3ZOVSqVehIsEvphAFmC+mBRlSQKAAYIpAcCY4qIYMBgwJQAYU1wUAwYDpgQAY4qLYsBgwJQAYExxUQwYDJgSAIwpLooBgwFTAoAxxUUxYDBgSgAwprgoBgwGTAkAxhQXxYDBgCkBwJjiohgwGDAlABhTXBQDBgOmBABjiotiwGDAlABgTHFRDBgMmBIAjCkuigGDAVMCgDHFRTFgMGBKADCmuCgGDAZMCQDGFBfFgMGAKQHAmOKiGDAYMCUAGFNcFAMGA6YEAGOKi2LAYMCUAGBMcVEMGAyYEgCMKS6KAYMBUwKAMcVFMWAwYEoAMKa4KAYMBkwJAMYUF8WAwYApAcCY4qIYMBgwJQAYU1wUAwYDpgQAY4qLYsBgwJQAYExxUQwYDJgSAIwpLooBgwFTAoAxxUUxYDBgSgAwprgoBgwGTAlkPJi9vT05ODiQgYEBKSwsfDd8KpWSjY0NKS4ulq6uLsnKypKXlxdZX1+X4+Pj5HNTU5PU19d/ObSfvt+Xv9gPFWYsmLOzM1EQu7u7SVRDQ0NSVFT0GpvCGB8fl8fHR8nPz5fh4WHJzs6WlZUVOTo6kry8vOT/tK69vV1qamo+jfyn7/dD+zffJmPBTExMyP39/evACuLtCbO9vS37+/vJ/+u/K6inpyfRv1M4IyMjCTgFVFFRIW1tbbK6uio5OTnS3d0tl5eXsrm5KQUFBdLZ2SlTU1Ou9+vt7TUv6zf8QcaC0dNBHylzc3Nyc3OTnCBpMPp5eno6edScn5/L9fV1AuTh4SFZfG5ubvI5DUg/j46OytLSkpyenkplZaXc3t4mf9fa2ioNDQ3JaeR9v98AwPodMhZMelAFo6fBWzC6eIUyNjYmCwsLcnd393qiLC8vS1VVVfJOowj0xEk/svTEUlDPz89J+/Lycunr63uXqef9rMv6DfXhwOi7xuLiopSUlEhdXZ3s7OwkAFpaWqS6ujo5efQx8/YRlT5hdCH6Uqt/o1d/f7+UlZV9CuZf7/cbEFi+QzgwJycnoqfIx0vfW/SxoyeKAtETSU8mPYH0V9Tg4GDyiJqcnExOHr0UWEdHx6dg/uV+lkX9ltqMBzM7OytXV1evjyQ9TdIvw4rkz58/CQA9LfQdZ2ZmJnk3qa2tlYuLiwRNc3OzNDY2ytramhweHkppaWlSo70+/oLyvN9vQWD5HhkPRk8IfV/5+Cvp7TuOgtFHkL60Kq75+fl37yk9PT0JHsWlNfpCrHC2trZeX5D115NeXvdTzJl4ZTyY/xK6nhx6guilp8l3Xz99v++c538J5jsDjd4bMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd7uL9AOPbX2neNIAAAAAElFTkSuQmCC">
					<img data-src="holder.js/140x140" class="img-circle" alt="140x140" style="width: 140px; height: 140px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIwAAACMCAYAAACuwEE+AAAFjklEQVR4Xu3Xx0skfRDG8TJnFEXEg4oJvIgZxYT/ujmsIgZEwXgUdRRzdqmGEfUg1rulOPV++za7ZfXUUx9+3ZOVSqVehIsEvphAFmC+mBRlSQKAAYIpAcCY4qIYMBgwJQAYU1wUAwYDpgQAY4qLYsBgwJQAYExxUQwYDJgSAIwpLooBgwFTAoAxxUUxYDBgSgAwprgoBgwGTAkAxhQXxYDBgCkBwJjiohgwGDAlABhTXBQDBgOmBABjiotiwGDAlABgTHFRDBgMmBIAjCkuigGDAVMCgDHFRTFgMGBKADCmuCgGDAZMCQDGFBfFgMGAKQHAmOKiGDAYMCUAGFNcFAMGA6YEAGOKi2LAYMCUAGBMcVEMGAyYEgCMKS6KAYMBUwKAMcVFMWAwYEoAMKa4KAYMBkwJAMYUF8WAwYApAcCY4qIYMBgwJQAYU1wUAwYDpgQAY4qLYsBgwJQAYExxUQwYDJgSAIwpLooBgwFTAoAxxUUxYDBgSgAwprgoBgwGTAlkPJi9vT05ODiQgYEBKSwsfDd8KpWSjY0NKS4ulq6uLsnKypKXlxdZX1+X4+Pj5HNTU5PU19d/ObSfvt+Xv9gPFWYsmLOzM1EQu7u7SVRDQ0NSVFT0GpvCGB8fl8fHR8nPz5fh4WHJzs6WlZUVOTo6kry8vOT/tK69vV1qamo+jfyn7/dD+zffJmPBTExMyP39/evACuLtCbO9vS37+/vJ/+u/K6inpyfRv1M4IyMjCTgFVFFRIW1tbbK6uio5OTnS3d0tl5eXsrm5KQUFBdLZ2SlTU1Ou9+vt7TUv6zf8QcaC0dNBHylzc3Nyc3OTnCBpMPp5eno6edScn5/L9fV1AuTh4SFZfG5ubvI5DUg/j46OytLSkpyenkplZaXc3t4mf9fa2ioNDQ3JaeR9v98AwPodMhZMelAFo6fBWzC6eIUyNjYmCwsLcnd393qiLC8vS1VVVfJOowj0xEk/svTEUlDPz89J+/Lycunr63uXqef9rMv6DfXhwOi7xuLiopSUlEhdXZ3s7OwkAFpaWqS6ujo5efQx8/YRlT5hdCH6Uqt/o1d/f7+UlZV9CuZf7/cbEFi+QzgwJycnoqfIx0vfW/SxoyeKAtETSU8mPYH0V9Tg4GDyiJqcnExOHr0UWEdHx6dg/uV+lkX9ltqMBzM7OytXV1evjyQ9TdIvw4rkz58/CQA9LfQdZ2ZmJnk3qa2tlYuLiwRNc3OzNDY2ytramhweHkppaWlSo70+/oLyvN9vQWD5HhkPRk8IfV/5+Cvp7TuOgtFHkL60Kq75+fl37yk9PT0JHsWlNfpCrHC2trZeX5D115NeXvdTzJl4ZTyY/xK6nhx6guilp8l3Xz99v++c538J5jsDjd4bMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd7uL9AOPbX2neNIAAAAAElFTkSuQmCC">
					<img data-src="holder.js/140x140" class="img-polaroid" alt="140x140" style="width: 140px; height: 140px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIwAAACMCAYAAACuwEE+AAAFjklEQVR4Xu3Xx0skfRDG8TJnFEXEg4oJvIgZxYT/ujmsIgZEwXgUdRRzdqmGEfUg1rulOPV++za7ZfXUUx9+3ZOVSqVehIsEvphAFmC+mBRlSQKAAYIpAcCY4qIYMBgwJQAYU1wUAwYDpgQAY4qLYsBgwJQAYExxUQwYDJgSAIwpLooBgwFTAoAxxUUxYDBgSgAwprgoBgwGTAkAxhQXxYDBgCkBwJjiohgwGDAlABhTXBQDBgOmBABjiotiwGDAlABgTHFRDBgMmBIAjCkuigGDAVMCgDHFRTFgMGBKADCmuCgGDAZMCQDGFBfFgMGAKQHAmOKiGDAYMCUAGFNcFAMGA6YEAGOKi2LAYMCUAGBMcVEMGAyYEgCMKS6KAYMBUwKAMcVFMWAwYEoAMKa4KAYMBkwJAMYUF8WAwYApAcCY4qIYMBgwJQAYU1wUAwYDpgQAY4qLYsBgwJQAYExxUQwYDJgSAIwpLooBgwFTAoAxxUUxYDBgSgAwprgoBgwGTAlkPJi9vT05ODiQgYEBKSwsfDd8KpWSjY0NKS4ulq6uLsnKypKXlxdZX1+X4+Pj5HNTU5PU19d/ObSfvt+Xv9gPFWYsmLOzM1EQu7u7SVRDQ0NSVFT0GpvCGB8fl8fHR8nPz5fh4WHJzs6WlZUVOTo6kry8vOT/tK69vV1qamo+jfyn7/dD+zffJmPBTExMyP39/evACuLtCbO9vS37+/vJ/+u/K6inpyfRv1M4IyMjCTgFVFFRIW1tbbK6uio5OTnS3d0tl5eXsrm5KQUFBdLZ2SlTU1Ou9+vt7TUv6zf8QcaC0dNBHylzc3Nyc3OTnCBpMPp5eno6edScn5/L9fV1AuTh4SFZfG5ubvI5DUg/j46OytLSkpyenkplZaXc3t4mf9fa2ioNDQ3JaeR9v98AwPodMhZMelAFo6fBWzC6eIUyNjYmCwsLcnd393qiLC8vS1VVVfJOowj0xEk/svTEUlDPz89J+/Lycunr63uXqef9rMv6DfXhwOi7xuLiopSUlEhdXZ3s7OwkAFpaWqS6ujo5efQx8/YRlT5hdCH6Uqt/o1d/f7+UlZV9CuZf7/cbEFi+QzgwJycnoqfIx0vfW/SxoyeKAtETSU8mPYH0V9Tg4GDyiJqcnExOHr0UWEdHx6dg/uV+lkX9ltqMBzM7OytXV1evjyQ9TdIvw4rkz58/CQA9LfQdZ2ZmJnk3qa2tlYuLiwRNc3OzNDY2ytramhweHkppaWlSo70+/oLyvN9vQWD5HhkPRk8IfV/5+Cvp7TuOgtFHkL60Kq75+fl37yk9PT0JHsWlNfpCrHC2trZeX5D115NeXvdTzJl4ZTyY/xK6nhx6guilp8l3Xz99v++c538J5jsDjd4bMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd4OMNE37DwfYJwDjd7uL9AOPbX2neNIAAAAAElFTkSuQmCC">
				</div>
				<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;img</span><span class="pln"> </span><span class="atn">src</span><span class="pun">=</span><span class="atv">"..."</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"img-rounded"</span><span class="tag">&gt;</span></li><li class="L1"><span class="tag">&lt;img</span><span class="pln"> </span><span class="atn">src</span><span class="pun">=</span><span class="atv">"..."</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"img-circle"</span><span class="tag">&gt;</span></li><li class="L2"><span class="tag">&lt;img</span><span class="pln"> </span><span class="atn">src</span><span class="pun">=</span><span class="atv">"..."</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"img-polaroid"</span><span class="tag">&gt;</span></li></ol></pre>
				<p><span class="label label-info">Heads up!</span> <code>.img-rounded</code> and <code>.img-circle</code> do not work in IE7-8 due to lack of <code>border-radius</code> support.</p>
			</div>
		</section>
	</div>
</div>

{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
