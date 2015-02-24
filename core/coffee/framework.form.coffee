class Form
  form: null,

  constructor: (form) ->
    @form = form
    @_colourPickers()
    @_dateFields()
    @_colourPickers()
    @_editors()
    @_tagBoxes()
    @_fixPlaceholders()
    @_hijackSubmit()

# date fields
  _dateFieldOptions:
    dateFormat: 'dd/mm/yy'
    dayNames: [
      Locale.msg 'DatePickerFullSunday'
      Locale.msg 'DatePickerFullMonday'
      Locale.msg 'DatePickerFullTuesday'
      Locale.msg 'DatePickerFullWednesday'
      Locale.msg 'DatePickerFullThursday'
      Locale.msg 'DatePickerFullFriday'
      Locale.msg 'DatePickerFullSaturday'
    ]
    dayNamesMin: [
      Locale.msg 'DatePickerMinimalSunday'
      Locale.msg 'DatePickerMinimalMonday'
      Locale.msg 'DatePickerMinimalTuesday'
      Locale.msg 'DatePickerMinimalWednesday'
      Locale.msg 'DatePickerMinimalThursday'
      Locale.msg 'DatePickerMinimalFriday'
      Locale.msg 'DatePickerMinimalSaturday'
    ]
    dayNamesShort: [
      Locale.msg 'DatePickerShortSunday'
      Locale.msg 'DatePickerShortMonday'
      Locale.msg 'DatePickerShortTuesday'
      Locale.msg 'DatePickerShortWednesday'
      Locale.msg 'DatePickerShortThursday'
      Locale.msg 'DatePickerShortFriday'
      Locale.msg 'DatePickerShortSaturday'
    ]
    monthNames: [
      Locale.msg 'DatePickerFullJanuary'
      Locale.msg 'DatePickerFullFebruary'
      Locale.msg 'DatePickerFullMarch'
      Locale.msg 'DatePickerFullApril'
      Locale.msg 'DatePickerFullMay'
      Locale.msg 'DatePickerFullJune'
      Locale.msg 'DatePickerFullJuly'
      Locale.msg 'DatePickerFullAugust'
      Locale.msg 'DatePickerFullSeptember'
      Locale.msg 'DatePickerFullOctober'
      Locale.msg 'DatePickerFullNovember'
      Locale.msg 'DatePickerFullDecember'
    ]
    monthNamesShort: [
      Locale.msg 'DatePickerShortJanuary'
      Locale.msg 'DatePickerShortFebruary'
      Locale.msg 'DatePickerShortMarch'
      Locale.msg 'DatePickerShortApril'
      Locale.msg 'DatePickerShortMay'
      Locale.msg 'DatePickerShortJune'
      Locale.msg 'DatePickerShortJuly'
      Locale.msg 'DatePickerShortAugust'
      Locale.msg 'DatePickerShortSeptember'
      Locale.msg 'DatePickerShortOctober'
      Locale.msg 'DatePickerShortNovember'
      Locale.msg 'DatePickerShortDecember'
    ]
    firstDay: 1
    hideIfNoPrevNext: true
    nextText: Locale.lbl 'Next'
    prevText: Locale.lbl 'Previous'
    closeText: Locale.lbl 'Close'
    showAnim: 'slideDown'

  _parseDate: (element, key) ->
    throw Error('No ' + key + ' passed through the data-attributes') if not element.data(key)?
    data = element.data(key).split '-'
    new Date(
      parseInt(data[0], 10),
      parseInt(data[1], 10) - 1,
      parseInt(data[2], 10)
    )

  _colourPickers: ->
    $('.inputColour', @form).each((i, el) =>
      $(el).minicolors({inline: false,theme: 'bootstrap'})
    )
    return

  _dateFields: ->
    $.datepicker.setDefaults @_dateFieldOptions
    @_normalDateFields()
    @_startingFromDateFields()
    @_untilDateFields()
    @_rangeDateFields()
    return
  _editors: ->
    $('textarea.editor', @form).each((i, el) =>
      CKEDITOR.replace($(el).attr('id'));
    )
  _normalDateFields: ->
    $('.inputDatefieldNormal', @form).each((i, el) =>
      $(el).datepicker()
    )
    return

  _startingFromDateFields: =>
    $('.inputDatefieldFrom', @form).each((i, el) =>
      $el = $(el)
      startDate = @_parseDate($el, 'startdate')

      $el.datepicker()
        .datepicker('option', 'minDate', startDate)
      if new Date() < startDate
        $el.datepicker('option', 'defaultDate', startDate)
    )
    return

  _untilDateFields: =>
    $('.inputDatefieldTill', @form).each((i, el) =>
      $el = $(el)
      endDate = @_parseDate($el, 'enddate')

      $el.datepicker()
        .datepicker('option', 'maxDate', endDate)
      if new Date() > endDate
        $el.datepicker('option', 'defaultDate', endDate)
    )
    return

  _rangeDateFields: =>
    $('.inputDatefieldRange', @form).each((i, el) =>
      $el = $(el)
      startDate = @_parseDate($el, 'startdate')
      endDate = @_parseDate($el, 'enddate')

      $el.datepicker()
        .datepicker('option', 'minDate', startDate)
        .datepicker('option', 'maxDate', endDate)

      if new Date() < startDate
        $el.datepicker('option', 'defaultDate', startDate)
      if new Date() > endDate
        $el.datepicker('option', 'defaultDate', endDate)
    )
    return

  # converts tagboxes fields
  _tagBoxes: ->
    $('.tag-box', @form).each((i, el) =>
      $el = $ el
      tagBox = new TagBox $el
    )
    return

  # fixes
  _fixPlaceholders: ->
    # detect if placeholder-attributes is supported
    jQuery.support.placeholder =
      ('placeholder' in document.createElement('input'))

    if !jQuery.support.placeholder
      $input = $(@form).find('input[placeholder]')

      $input.on('focus', ->
        $this = $(this)

        if $this.val() == $this.attr 'placeholder'
          $this.val('')
            .removeClass('placeholder')
      )

      $input.on('blur', ->
        $this = $(this)

        if($this.val() == '' || $this.val() == $this.attr('placeholder'))
          $this.val($this.attr('placeholder'))
            .addClass('placeholder')
      )

      $input.blur

      $input.parents('form').submit ->
        $(this).find('input[placeholder]').each ->
          if $(this).val() == $(this).attr('placeholder')
            $(this).val('')

  _hijackSubmit: ->
    $('form').on('submit', (e) ->
      $(this).trigger('form_submitting')
    )

window.Form = Form
