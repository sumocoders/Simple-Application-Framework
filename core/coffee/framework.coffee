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

window.DefaultObject = DefaultObject

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
    'a[href*="#"]': click : 'scrollTo'

    # link methods
    'a.confirm': click : 'askConfirmation'
    'a.confirmPostForm': click : 'askConfirmationAndPostAsAForm'
  @onDomReady [
#    'functionname'
  ]

# Menu methods
  _setClassesBasedOnSubNavigation: () =>
    # we can't use toggle class as we don't know what the current state is
    if($('#navbar .nav ul.open').length == 0)
      $('#toggleTabletNavbar, #navbar, #content, .alert').removeClass('subnav')
    else
      $('#toggleTabletNavbar, #navbar, #content, .alert').addClass('subnav')

  toggleSubNavigation: (e) =>
    @subNavOpen
    $this = $(e.currentTarget)
    $subNav = $this.next('ul')

    if $subNav.length > 0
      e.preventDefault()
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
      false

  toggleMediumMenu: (e) ->
    e.preventDefault()

    $('#navbar').toggleClass('open')
    $(e.currentTarget).toggleClass('open')

  toggleSmallMenu: (e) ->
    e.preventDefault()

    $('#content').toggleClass('open')

  toggleDropdown: (e) ->
    e.preventDefault()

    $this = $(e.currentTarget)
    $this.toggleClass('open')
    $this.next('ul').slideToggle()

# Animated scroll methods
  scrollTo: (e) ->
    $anchor = $(e.currentTarget)
    href = $anchor.attr('href')
    url = href.substr(0, href.indexOf('#'))
    hash = href.substr(href.indexOf('#'))

    # check if we have an url, and if it is on the current page and
    # the element exists
    if  (url == '' or url.indexOf(document.location.pathname) >= 0) and
    not $anchor.is('[data-no-scroll]') and $(hash).length > 0
      $('html, body').stop().animate({
        scrollTop: $(hash).offset().top
      }, 500)
    false

  scrollToTop: (e) ->
    e.preventDefault()

    $('html, body').stop().animate({
      scrollTop: $('#content').offset().top
    }, 500)

# Link methods
  askConfirmation: (e) ->
    e.preventDefault()
    $this = $(e.currentTarget)

    $('#confirmModalOk').attr('href', $this.attr('href'))
    $('#confirmModalMessage').html($this.data('message'))
    $('#confirmModal').modal('show')
  false

  _postAsForm: (e) =>
    # @defv gij een idee wrm dit twee keer wordt aangeroepen
    # build the form
    # we can't use an single-style tag, because IE can't handle this
    $form = $('<form></form>')
      .attr('style', 'display: none;')
      .attr('action', e.attr('href'))
      .attr('method', 'POST')
      .append(
        $('<input type="hidden">').attr('name', 'form_token')
          .attr('value', Data.get('core.form_token'))
      )

    # append the data
    for name, value of e.data()
      if name.substr(0, 5) == 'field'
        $element = $('<input>').attr('type', 'hidden')
          .attr('name', name.substr(5).toLowerCase())
          .attr('value', value)
        $form.append($element)

    $('#confirmModal').modal('hide')
    $('body').append($form)
    $form.submit()
  false

  askConfirmationAndPostAsAForm: (e) =>
    e.preventDefault()
    $this = $(e.currentTarget)
    $modal = $('#confirmModal')

    $('#confirmModalMessage').html($this.data('message'))
    $modal.on('click', '#confirmModalOk', (e) =>
      e.preventDefault()
      this._postAsForm($this)
    )
      .modal('show')
      .on('hide', (e) =>
        $modal.off('click', '#confirmModalOk')
      )
  false

Framework.current = new Framework

$ ->
  Framework.current.domReady()

window.Framework = Framework
