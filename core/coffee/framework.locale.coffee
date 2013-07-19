class Locale
  isInitialized: false
  data: null

  initialize: ->
    $.ajax '/cache/locale/' + Data.get('core.language') + '.json',
      type: 'GET'
      dataType: 'json'
      async: false,
      success: (data) ->
        Locale.current.data = data
        Locale.current.isInitialized = true
      error: (jqXHR, textStatus, errorThrown) ->
        throw Error('Regenerate your locale-files.')
  false

  exists: (key) ->
    this.get(key)?

  get: (type, key) ->
    this.initialize() if not this.isInitialized
    return '{$' + type + key + '}' if not this.data[type][key]?
    this.data[type][key]

  act: (key) ->
    this.get('act', key)

  err: (key) ->
    this.get('err', key)

  lbl: (key) ->
    this.get('lbl', key)

  loc: (key) ->
    this.get('loc', key)

  msg: (key) ->
    this.get('msg', key)

Locale.current = new Locale

window.Locale = Locale.current