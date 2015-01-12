class TagBox
  item: null
  elements: []
  id: ''

  constructor: ($el) ->
    @item = $el
    @elements = $el.val().split(',')
    @id = $el.attr('id')
    @_build()

    # Event handlers on add and delete
    $(document).on 'click', '.js-add-tag[data-id="' + @id + '"]', @_handleAddClick
    $(document).on 'click', '.js-delete-tag[data-id="' + @id + '"]', @_handleDeleteClick

  # Removes empty strings from the elements array
  _cleanUp: ->
    $.each(@elements, (i, el) =>
        @elements.splice i, 1 if el == ""
    )

  # Builds the needed html for tags
  _build: ->
    @_cleanUp()

    html = '<div data-id="' + @id + '" class="js-tags-wrapper">' + "\n"
    html += '    <ul class="js-tags-list">' + "\n"

    $.each(@elements, (i, el) =>
      html += '        <li>' + el + ' <a href="#" data-tag="' + el + '" data-id="' + @id + '" class="js-delete-tag">' + Locale.lbl('Delete') + '</a></li>' + "\n"
    )

    html += '    </ul>' + "\n"
    html += '    <div class="input-group">' + "\n"
    html += '        <input class="form-control" id="' + @id + 'Add" type="text"/>' + "\n"
    html += '        <span class="input-group-btn">' + "\n"
    html += '            <button data-id="' + @id + '" class="js-add-tag btn" type="button">' + Locale.lbl('Add') + '</button>' + "\n"
    html += '    </div>' + "\n"
    html += '</div>'

    # remove old version
    $('.js-tags-wrapper[data-id="' + @id + '"]').remove()
    $('input[id="' + @id + '"]').hide().after(html);

    @_initAutocomplete()
    @_save()

  # Adds a new tag
  _handleAddClick: (e) =>
    @elements.push $('#' + @id + 'Add').val()
    @_build()

  # Deletes a tag
  _handleDeleteClick: (e) =>
    e.preventDefault()
    tag = $(e.target).data('tag')

    $.each(@elements, (i, el) =>
        @elements.splice i, 1 if el == tag
    )

    @_build()

  # Saves the tags in the hidden field
  _save: ->
    @item.val(@elements.join(','))

  # Autocompletes tags
  _initAutocomplete: (e) =>
    $('#' + @id + 'Add').autocomplete(
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
