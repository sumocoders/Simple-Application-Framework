class App extends Framework
  @events
#    '#element' : event : 'functionName'

  @onDomReady [
#    'functionName'
  ]

App.current = new App()

$ ->
  App.current.domReady()
  $('#type').multipleSelectbox();

window.App = App
