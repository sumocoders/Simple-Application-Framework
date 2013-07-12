<!--
<div id="header" class="container-fluid">
	<div class="row-fluid">
		<div class="span8">
			<h1>
				<a href="/" rel="home">
					{$SITE_DEFAULT_TITLE}
				</a>
				<span id="ajaxSpinner">
					{$lblLoading|ucfirst}…
				</span>
			</h1>
		</div>

		<div class="span4">
			{option:currentUser}
				<div id="user">
					<p>
						{$msgUsersLoggedInAs|sprintf:{$currentUser.name}} |
						<a href="{$var|buildurl:'logout':'users'}">{$lblSignOff}</a>
					</p>
				</div>
			{/option:currentUser}
		</div>
	</div>
</div>
-->


<header id="header">
  <div class="container">
    <div class="title">
      <a id="toggleMenu" class="visible-phone" href="#">MENU</a>
      <h2>Projects</h2>
    </div>
    <div class="actions">
      <a href="#" class="dropdownToggle visible-phone" data-toggle="dropdownItems">Actions</a>
      <ul class="dropdownItems">
        <li><a class="iconList" href="#">List</a></li>
        <li><a class="iconPrint" href="#">Print</a></li>
        <Li><a class="iconAdd" href="#">Add</a></Li>
      </ul>
    </div>
  </div>
</header>
