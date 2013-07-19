class Form extends DefaultObject
  @onDomReady [
#    'functionname'
    '_dateFields'
    '_normalDateFields'
    '_startingFromDateFields'
    '_untilDateFields'
    '_rangeDateFields'
  ]

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

  _dateFields: ->
    $.datepicker.setDefaults Form.current._dateFieldOptions;

  _normalDateFields: ->
    $('.inputDatefieldNormal').each(() ->
      $(this).datepicker();
    )

  _startingFromDateFields: =>
    $('.inputDatefieldFrom').each(() ->
      $this = $(this)
      startDate = Form.current._parseDate($this, 'startdate')

      $this.datepicker()
        .datepicker('option', 'minDate', startDate)
      if new Date() < startDate
        $this.datepicker('option', 'defaultDate', startDate)
    )

  _untilDateFields: ->
    $('.inputDatefieldTill').each(() ->
      $this = $(this);
      endDate = Form.current._parseDate($this, 'enddate')

      $this.datepicker()
        .datepicker('option', 'maxDate', endDate)
      if new Date() > endDate
        $this.datepicker('option', 'defaultDate', endDate)
    )

  _rangeDateFields: ->
    $('.inputDatefieldRange').each(() ->
      $this = $(this);
      startDate = Form.current._parseDate($this, 'startdate')
      endDate = Form.current._parseDate($this, 'enddate')

      $this.datepicker()
        .datepicker('option', 'minDate', startDate)
        .datepicker('option', 'maxDate', endDate)

      if new Date() < startDate
        $this.datepicker('option', 'defaultDate', startDate)
      if new Date() > endDate
        $this.datepicker('option', 'defaultDate', endDate)
    )


Form.current = new Form

$ ->
  Form.current.domReady()

window.Form = Form.current