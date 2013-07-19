class Data
  isInitialized: false
  data: null

  initialize: ->
    throw Error('jsData is not available') if not jsData?
    this.data = jsData
    this.isInitialized = true
  false

  exists: (key) ->
    this.get(key)?

  get: (key) ->
    this.initialize() if not this.isInitialized
    chunks = key.split '.'
    module = chunks[0]

    if chunks.length >= 2
      dataKey = chunks.splice(1).join '.'
      value = this.data[module][dataKey]
    else
      value = this.data[module]
    value

Data.current = new Data

window.Data = Data.current