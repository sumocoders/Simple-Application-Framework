class Locale
  isInitialized: false
  data: null

  initialize: ->
    $.ajax '/cache/locale/' + Data.get('core.language') + '.json',
      type: 'GET'
      dataType: 'json'
      async: false,
      success: (data) =>
        @data = data
        @isInitialized = true
      error: (jqXHR, textStatus, errorThrown) ->
        throw Error('Regenerate your locale-files.')
  false

  exists: (key) ->
    @get(key)?

  get: (type, key) ->
    @initialize() if not @isInitialized
    return '{$' + type + key + '}' if not @data[type][key]?
    @data[type][key]

  act: (key) ->
    @get('act', key)

  err: (key) ->
    @get('err', key)

  lbl: (key) ->
    @get('lbl', key)

  loc: (key) ->
    @get('loc', key)

  msg: (key) ->
    @get('msg', key)

window.Locale = new Locale