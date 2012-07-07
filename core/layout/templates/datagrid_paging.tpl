{option:pagination}
	{* only show the pagination if there is more than one page *}
	{option:pagination.multiple_pages}
		<div class="pagination pagination-centered">
			<ul role="navigation">
				<li{option:!pagination.show_previous} class="disabled"{/option:!pagination.show_previous}>
					<a href="{$pagination.previous_url}" rel="prev nofollow" title="{$previousLabel}">
						«<span class="hide"> {$previousLabel}</span>
					</a>
				</li>

				{option:pagination.first}
					{iteration:pagination.first}
						<li>
							<a href="{$pagination.first.url}" rel="nofollow" title="{$goToLabel|ucfirst} {$pagination.first.label}">
								<span class="hide">{$goToLabel|ucfirst} </span>{$pagination.first.label}
							</a>
						</li>
					{/iteration:pagination.first}

					<li class="ellipsis disabled">
						<a href="#">
							...
						</a>
					</li>
				{/option:pagination.first}

				{iteration:pagination.pages}
					<li{option:pagination.pages.current} class="active"{/option:pagination.pages.current}>
						<a href="{$pagination.pages.url}" rel="nofollow" title="{$goToLabel|ucfirst} {$pagination.pages.label}">
							<span class="hide">{$goToLabel|ucfirst} </span>{$pagination.pages.label}
						</a>
					</li>
				{/iteration:pagination.pages}

				{option:pagination.last}
					<li class="ellipsis disabled">
						<a href="#">
							...
						</a>
					</li>

					{iteration:pagination.last}
						<li>
							<a href="{$pagination.last.url}" rel="nofollow" title="{$goToLabel|ucfirst} {$pagination.last.label}">
								{$pagination.last.label}
							</a>
						</li>
					{/iteration:pagination.last}
				{/option:pagination.last}

				<li{option:!pagination.show_next} class="disabled"{/option:!pagination.show_next}>
					<a href="{$pagination.next_url}" rel="next nofollow" title="{$nextLabel}">
						<span class="hide">{$nextLabel} </span>»
					</a>
				</li>
			</ul>
		</div>
	{/option:pagination.multiple_pages}
{/option:pagination}