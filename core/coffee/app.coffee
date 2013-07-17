class App extends Framework
  @events
#    '#element' : event : 'functionName'
    '.nav-tabs a' : click : 'initTabs'

  @onDomReady [
#    'functionName'
    'initCarousel'
    'initTabs'
  ]

  initCarousel: ->
    $('.carousel').carousel()

  initTabs: (e) ->
    $(e.currentTarget).tab('show')
    false


