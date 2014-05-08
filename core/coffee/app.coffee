class App extends Framework
  @events
#    '#element' : event : 'functionName'

  @onDomReady [
#    'functionName'
    'heightAutocomplete'
  ]

  # Define functions here
  heightAutocomplete: ->
    ticking = false

    # this will be put in animationFrame
    calculate = ->
      $window = $(window)
      navbarHeight = $('#navbar').height()
      searchBoxHeight = $('#navbar .searchBox').height()
      $autocomplete = $('.ui-autocomplete')
      logoHeight = $('#navbar .logo').height()
      autocompleteHeight = navbarHeight - searchBoxHeight - logoHeight
      autocompleteHeightMobile = navbarHeight - searchBoxHeight - 25

      if($window.width() < 768)
        $autocomplete.css({'max-height' : autocompleteHeightMobile})

      else
        $autocomplete.css({'max-height' : autocompleteHeight})

      return

      # Make your calculations here

      ticking = false

    tick = ->
      if !ticking
        @requestAnimationFrame(calculate)
        ticking = true

    $(window).on 'load', ->
      tick()

    $(window).on 'resize', ->
      tick()

    return

App.current = new App()

$ ->
  App.current.domReady()

window.App = App
