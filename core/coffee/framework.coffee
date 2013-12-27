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
        throw "#{callback} doesn't exist when trying to bind #{action} on #{selector}" unless @[callback]
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
    'a[href*="#"]': click : 'scrollTo'

    # link methods
    'a.confirm': click : 'askConfirmation'
    'a.confirmPostForm': click : 'askConfirmationAndPostAsAForm'

    # tabs
    '.nav-tabs a' : click : 'changeTab'

  @onDomReady [
#    'functionname'
    '_initAjax'
    '_initSearch'
    '_initForm'
    '_initTabs'
    '_calculateActionsWidths'
    'setContentHeight'
  ]

  _initAjax: ->
    # set some defaults for AJAX-request
    $.ajaxSetup
      cache: false
      type: 'POST'
      dataType: 'json'
      timeout: 5000

    # 403 means we aren't authenticated anymore, so reload the page
    $(document).ajaxError((event, XMLHttpRequest, ajaxOptions) ->
      window.location.reload() if XMLHttpRequest.status == 403

      if ajaxOptions?
        textStatus = Locale.err('GeneralError')

        if XMLHttpRequest.responseText?
          json = $.parseJSON(XMLHttpRequest.responseText)
          if json.message?
            textStatus = json.message
          else
            textStatus = XMLHttpRequest.responseText

        $('#header').after(
          '<div class="alert alert-error" role="alert">' +
          '  <div class="container">' +
          '    <button type="button" class="close" data-dismiss="alert"' +
          '       title="' + Locale.lbl('Close') + '">' + Locale.lbl('Close') +
          '    </button>' +
          '    ' + textStatus +
          '  </div>' +
          '</div>'
        )
      false
    )

    # show spinners
    $(document).ajaxStart(() =>
      @showLoadingBar()
    )
    $(document).ajaxStop(() =>
      @hideLoadingBar()
    )

  _initForm: ->
    $('form').each(() ->
      className = $(this).data('formClass')
      className = "Form" unless className

      if !window[className]
        throw className + ' is not defined'

      new window[className](this)
    );

  _initTabs: ->
    url = document.location.toString()
    if url.match('#')
      anchor = '#' + url.split('#')[1]

      if $('.nav-tabs a[href='+anchor+']').length > 0
        $('.nav-tabs a[href='+anchor+']').tab('show')

    $('.tab-content .tab-pane').each(() ->
      if($(this).find('.error').length > 0)
        $('.nav-tabs a[href="#' + $(this).attr('id') + '"]')
          .parent()
          .addClass('error')
    )

  changeTab: (e) ->
    # if the browser supports history.pushState(), use it to update the URL
    # with the fragment identifier, without triggering a scroll/jump
    if window.history && window.history.pushState
      # an empty state object for now — either we implement a proper
      # popstate handler ourselves, or wait for jQuery UI upstream
      window.history.pushState({}, document.title, this.getAttribute('href'))
    else
      scrolled = $(window).scrollTop()
      window.location.hash = '#'+ this.getAttribute('href').split('#')[1]
      $(window).scrollTop(scrolled)

    $(this).tab('show')

  _calculateActionsWidths: ->
    $('.actions li a').each(->
      $this = $(@)
      $this.attr('data-width', $this.width())
      $this.width(0)
      $this.hover(->
        $this.width($this.data('width') + 20)
      ,->
        $this.width(-20)
      )
    )

  showLoadingBar: ->
    $('#header').addClass('progress progress-striped active')

  hideLoadingBar: ->
    $('#header').removeClass('progress progress-striped active')

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
        @_setClassesBasedOnSubNavigation()
        @subNavOpen = true
      else
        # already open, so close
        if $subNav.is('.open')
          $this.removeClass('active')
          $subNav.removeClass('open').slideUp()
          @_setClassesBasedOnSubNavigation()
          @subNavOpen = false

        # replace the current subnavigation
        else
          $('#navbar .nav li a.active').removeClass('active')
          $('.subNavigation.open').removeClass('open')
          $this.addClass('active')
          $subNav.addClass('open').slideDown()
          @_setClassesBasedOnSubNavigation()
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
    # disabled for nav-tabs
    if  (url == '' or url.indexOf(document.location.pathname) >= 0) and
    not $anchor.is('[data-no-scroll]') and $(hash).length > 0 and
    not $anchor.parents().is('.nav-tabs')
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
    @showLoadingBar()
    $form.submit()
  false

  askConfirmationAndPostAsAForm: (e) =>
    e.preventDefault()
    $this = $(e.currentTarget)
    $modal = $('#confirmModal')

    $('#confirmModalMessage').html($this.data('message'))
    $modal.on('click', '#confirmModalOk', (e) =>
      e.preventDefault()
      @_postAsForm($this)
    )
      .modal('show')
      .on('hide', (e) =>
        $modal.off('click', '#confirmModalOk')
      )
  false

# search
  _initSearch: ->
    $('.searchBox input[name=q]').autocomplete(
      position:
        using: (position, elements) ->
          newPosition =
            left: position.left
            top: 'auto'
            bottom: elements.target.height,
            margin: 0
          elements.element.element.css(newPosition)
      source: (request, response) ->
        $.ajax
          url: '/ajax.php?module=core&action=search&language=' + Data.get('core.language')
          data: { q: request.term }
          success: (data) ->
            items = []
            for value in data.data
              items.push(
                {
                  label: value.label + ' (' + value.module + ')'
                  value: value
                }
              )
            response(items)
      select: (e, ui) ->
        e.preventDefault()
        if ui.item.value.url?
          document.location = ui.item.value.url
        else if ui.item.value.value?
          return ui.item.value.value
        else
          return ui.item.label
      focus: (e, ui) ->
        e.preventDefault()
        $(e.target).val(ui.item.value.label)
    )

    $('.searchBox input[name=q]').each ->
      $(this).data('ui-autocomplete')._renderItem = App.current.renderItem

  renderItem: (ul, item) ->
    $('<li>')
      .append(
        $('<a>').append(
          item.value.label +
          '<small class="muted"> (' + item.value.module + ')</small>'
        )
      )
      .appendTo(ul)

  setContentHeight: =>
    $('#content').css('minHeight', $(window).height())
    timeout = null
    $(window).on('resize', (e) ->
      clearTimeout(timeout)
      timeout = setTimeout( ->
        $('#content').css('minHeight', $(window).height())
      , 200)
    )

window.Framework = Framework
