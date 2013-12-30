class SearchForm extends Form
  constructor: ->
    @_initSearch()

  _initSearch: ->
    $('.searchBox input[name=q]', @form).autocomplete(
      position:
        using: (position, elements) ->
          newPosition =
            left: position.left
            top: 'auto'
            bottom: elements.target.height
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
                  label: "#{value.label} (#{value.module})"
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

    $('.searchBox input[name=q]', @form).each (idx,element) =>
      $(element).data('ui-autocomplete')._renderItem = @renderItem

    return

  renderItem: (ul, item) ->
    $('<li>')
      .append(
        $('<a>').append(
          item.value.label +
          '<small class="muted"> (' + item.value.module + ')</small>'
        )
      )
      .appendTo(ul)


window.SearchForm = SearchForm
