class Data
  isInitialized: false
  data: null

  initialize: ->
    throw Error('jsData is not available') if not jsData?
    @data = jsData
    @isInitialized = true
  false

  exists: (key) ->
    @get(key)?

  get: (key) ->
    @initialize() if not @isInitialized
    chunks = key.split '.'
    module = chunks[0]

    if chunks.length >= 2
      dataKey = chunks.splice(1, 1).join '.'
      value = @data[module][dataKey]
    else
      value = @data[module]
    value

Data.current = new Data

window.Data = Data.current
