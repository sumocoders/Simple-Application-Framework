// Generated by CoffeeScript 1.6.2
(function() {
  var Form, _ref,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Form = (function(_super) {
    __extends(Form, _super);

    function Form() {
      this._startingFromDateFields = __bind(this._startingFromDateFields, this);      _ref = Form.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    Form.onDomReady(['_dateFields', '_normalDateFields', '_startingFromDateFields', '_untilDateFields', '_rangeDateFields']);

    Form.prototype._dateFieldOptions = {
      dateFormat: 'dd/mm/yy',
      dayNames: [Locale.msg('DatePickerFullSunday'), Locale.msg('DatePickerFullMonday'), Locale.msg('DatePickerFullTuesday'), Locale.msg('DatePickerFullWednesday'), Locale.msg('DatePickerFullThursday'), Locale.msg('DatePickerFullFriday'), Locale.msg('DatePickerFullSaturday')],
      dayNamesMin: [Locale.msg('DatePickerMinimalSunday'), Locale.msg('DatePickerMinimalMonday'), Locale.msg('DatePickerMinimalTuesday'), Locale.msg('DatePickerMinimalWednesday'), Locale.msg('DatePickerMinimalThursday'), Locale.msg('DatePickerMinimalFriday'), Locale.msg('DatePickerMinimalSaturday')],
      dayNamesShort: [Locale.msg('DatePickerShortSunday'), Locale.msg('DatePickerShortMonday'), Locale.msg('DatePickerShortTuesday'), Locale.msg('DatePickerShortWednesday'), Locale.msg('DatePickerShortThursday'), Locale.msg('DatePickerShortFriday'), Locale.msg('DatePickerShortSaturday')],
      monthNames: [Locale.msg('DatePickerFullJanuary'), Locale.msg('DatePickerFullFebruary'), Locale.msg('DatePickerFullMarch'), Locale.msg('DatePickerFullApril'), Locale.msg('DatePickerFullMay'), Locale.msg('DatePickerFullJune'), Locale.msg('DatePickerFullJuly'), Locale.msg('DatePickerFullAugust'), Locale.msg('DatePickerFullSeptember'), Locale.msg('DatePickerFullOctober'), Locale.msg('DatePickerFullNovember'), Locale.msg('DatePickerFullDecember')],
      monthNamesShort: [Locale.msg('DatePickerShortJanuary'), Locale.msg('DatePickerShortFebruary'), Locale.msg('DatePickerShortMarch'), Locale.msg('DatePickerShortApril'), Locale.msg('DatePickerShortMay'), Locale.msg('DatePickerShortJune'), Locale.msg('DatePickerShortJuly'), Locale.msg('DatePickerShortAugust'), Locale.msg('DatePickerShortSeptember'), Locale.msg('DatePickerShortOctober'), Locale.msg('DatePickerShortNovember'), Locale.msg('DatePickerShortDecember')],
      firstDay: 1,
      hideIfNoPrevNext: true,
      nextText: Locale.lbl('Next'),
      prevText: Locale.lbl('Previous'),
      closeText: Locale.lbl('Close'),
      showAnim: 'slideDown'
    };

    Form.prototype._parseDate = function(element, key) {
      var data;

      if (element.data(key) == null) {
        throw Error('No ' + key + ' passed through the data-attributes');
      }
      data = element.data(key).split('-');
      return new Date(parseInt(data[0], 10), parseInt(data[1], 10) - 1, parseInt(data[2], 10));
    };

    Form.prototype._dateFields = function() {
      return $.datepicker.setDefaults(Form.current._dateFieldOptions);
    };

    Form.prototype._normalDateFields = function() {
      return $('.inputDatefieldNormal').each(function() {
        return $(this).datepicker();
      });
    };

    Form.prototype._startingFromDateFields = function() {
      return $('.inputDatefieldFrom').each(function() {
        var $this, startDate;

        $this = $(this);
        startDate = Form.current._parseDate($this, 'startdate');
        $this.datepicker().datepicker('option', 'minDate', startDate);
        if (new Date() < startDate) {
          return $this.datepicker('option', 'defaultDate', startDate);
        }
      });
    };

    Form.prototype._untilDateFields = function() {
      return $('.inputDatefieldTill').each(function() {
        var $this, endDate;

        $this = $(this);
        endDate = Form.current._parseDate($this, 'enddate');
        $this.datepicker().datepicker('option', 'maxDate', endDate);
        if (new Date() > endDate) {
          return $this.datepicker('option', 'defaultDate', endDate);
        }
      });
    };

    Form.prototype._rangeDateFields = function() {
      return $('.inputDatefieldRange').each(function() {
        var $this, endDate, startDate;

        $this = $(this);
        startDate = Form.current._parseDate($this, 'startdate');
        endDate = Form.current._parseDate($this, 'enddate');
        $this.datepicker().datepicker('option', 'minDate', startDate).datepicker('option', 'maxDate', endDate);
        if (new Date() < startDate) {
          $this.datepicker('option', 'defaultDate', startDate);
        }
        if (new Date() > endDate) {
          return $this.datepicker('option', 'defaultDate', endDate);
        }
      });
    };

    return Form;

  })(DefaultObject);

  Form.current = new Form;

  $(function() {
    return Form.current.domReady();
  });

  window.Form = Form.current;

}).call(this);
