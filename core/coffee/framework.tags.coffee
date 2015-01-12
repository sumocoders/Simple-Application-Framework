class TagBox
  item: null
  initialized: false

  constructor: ($el) ->
    @item = $el

    # The tag fields is added dynamically. This makes sure autocomplete is added
    # on the first time the field gets focussed.
    $(document).on 'focus', '#addValue-' + @item.attr('id'), (e) =>
      @_initAutocomplete() if @initialized == false

  # Autocompletes tags
  _initAutocomplete: =>
    console.log $('#addValue-' + @item.attr('id'))
    @initialized = true
    $('#addValue-' + @item.attr('id')).autocomplete(
      source: (request, response) ->
        $.ajax
          url: '/ajax.php?module=tags&action=autocomplete&language=' + Data.get('core.language')
          data: { term: request.term }
          success: (data) ->
            items = []
            for value in data.data
              items.push(
                  {
                    label: "#{value.name}"
                    value: value
                  }
              )
            response(items)
      select: (e, ui) ->
        e.preventDefault()
        $(e.target).val(ui.item.value.name);

      focus: (e, ui) ->
        e.preventDefault()
        $(e.target).val(ui.item.value.name)
    )

window.TagBox = TagBox
