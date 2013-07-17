class DefaultObject
  # Class methods
  @events: (events) ->
    @::events ?= {}
    @::events = $.extend({}, @::events) unless @::hasOwnProperty "events"
    @::events = $.extend(true, {}, @::events, events)

  @onDomReady: (initializers) ->
    @::onDomReady ?= []
    @::onDomReady = @::onDomReady[..] unless @::hasOwnProperty "onDomReady"
    @::onDomReady.push initializer for initializer in initializers

  constructor: ->
    @_setupEventListeners()

  domReady: ->
    @_loadOnDomReadyMethods()

  _loadOnDomReadyMethods: ->
    for callback in @onDomReady
      @[callback]()

  _setupEventListeners: =>
    $document = $(document)
    for selector, actions of @events
      for action, callback of actions
        $document.on(action, selector, @[callback])

class Framework extends DefaultObject
  @events
    # toggle menu on full size
    '#navbar .nav li a' : click : 'toggleSubNavigation'

    # togle menu on ipad-size
    '#toggleTabletNavbar' : click : 'toggleMediumMenu'

    # toggle menu on iphone-size
    '#toggleMenu' : click : 'toggleSmallMenu'
    '#content.open' : touchend : 'toggleSmallMenu'

    # show action-list on iphone-size
    '.dropdownToggle' : click : 'toggleDropdown'

    # animate scrolling
    'a.backToTop': click : 'scrollToTop'
#    'a[href*="#"]': click : 'scrollTo'



  @onDomReady [
#    'functionname'
  ]

# Menu methods
  _setClassesBasedOnSubNavigation: () =>
    if($('#navbar .nav ul.open').length == 0)
      $('#toggleTabletNavbar, #navbar, #content, .alert').removeClass('subnav')
    else
      $('#toggleTabletNavbar, #navbar, #content, .alert').addClass('subnav')

  toggleSubNavigation: (e) =>
    @subNavOpen
    $this = $(e.currentTarget)
    $subNav = $this.next('ul')

    # not open
    if !@subNavOpen
      $this.addClass('active')
      $subNav.addClass('open').slideDown()
      this._setClassesBasedOnSubNavigation()
      @subNavOpen = true
    else
      # already open, so close
      if $subNav.is('.open')
        $this.removeClass('active')
        $subNav.removeClass('open').slideUp()
        this._setClassesBasedOnSubNavigation()
        @subNavOpen = false

      # replace the current subnavigation
      else
        $('#navbar .nav li a.active').removeClass('active')
        $('.subNavigation.open').removeClass('open')
        $this.addClass('active')
        $subNav.addClass('open').slideDown()
        this._setClassesBasedOnSubNavigation()


  toggleMediumMenu: (e) ->
    e.preventDefault()
    $('#navbar').toggleClass('open');
    $(e.currentTarget).toggleClass('open');

  toggleSmallMenu: (e) ->
    e.preventDefault()
    $('#content').toggleClass('open');

  toggleDropdown: (e) ->
    e.preventDefault()
    $this = $(e.currentTarget)
    $this.toggleClass('open');
    $this.next('ul').slideToggle()

# Scroll methods
  scrollTo: (e) ->
    $anchor = $(e.currentTarget)
    href = $anchor.attr('href')
    url = href.substr(0, href.indexOf('#'))
    hash = href.substr(href.indexOf('#'))

    # check if we have an url, and if it is on the current page and the element exists
    if  (url == '' or url.indexOf(document.location.pathname) >= 0) and
    not $anchor.is('[data-no-scroll]') and
    $(hash).length > 0
      $('html, body').stop().animate({
        scrollTop: $(hash).offset().top
      }, 500);
      false

  scrollToTop: (e) ->
    e.preventDefault()
    $('html, body').stop().animate({
      scrollTop: $('#content').offset().top
    }, 500);

Framework.current = new Framework()

$ ->
  Framework.current.domReady()

window.Framework = Framework