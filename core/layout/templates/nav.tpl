

<div id="navbar">
  <a href="/" class="logo hidden-phone">{$SITE_DEFAULT_TITLE}</a>
  <div id="searchBox" class="mobile">
    <div class="controls">
  		<input id="searchQuery" name="q" type="search" placeholder="{$lblSearch|ucfirst}" class="input-medium">
  		<button type="submit" class="btn">
  			<i class="icon-search"></i>
  			<span class="hide">{$lblSearch|ucfirst}</span>
  		</button>
  	</div>
  </div>
  <div class="container">
    <ul class="nav">
      {option:currentUser}
				<li id="user">
				  <a href="#">{$currentUser.name|uppercase}</a>
				</li>
			{/option:currentUser}
      <li><a href="/" rel="home">{$lblHome|ucfirst}</a></li>
      <li><a href="/" rel="link2">link 2</a></li>
      <li><a href="/" rel="link3">link 3</a></li>
      {option:currentUser.isAdmin}<li><a href="{$var|buildurl:'index':'users'}">{$lblUsers|ucfirst}</a></li>{/option:currentUser.isAdmin}
    </ul>
  </div>
  <div id="searchBox" class="desktop">
    <div class="controls">
  		<input id="searchQuery" name="q" type="search" placeholder="{$lblSearch|ucfirst}" class="input-medium">
  		<button type="submit" class="btn">
  			<i class="icon-search"></i>
  			<span class="hide">{$lblSearch|ucfirst}</span>
  		</button>
  	</div>
  </div>
</div>
<a href="#" id="toggleTabletNavbar">MENU</a>
