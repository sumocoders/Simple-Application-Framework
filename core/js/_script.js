/**
 * Frontend related objects
 *
 * @author	Tijs Verkoyen <tijs@sumocoders.be>
 */
var jsSite = {
	debug: false,
	init: function() {
		jsSite.forms.init();
		jsSite.search.init();

		try {
			var method = 'jsSite.'+ jsSite.current.module +'.init()';
			eval(method);
		} catch(e) {
			if(jsSite.debug) console.log(e);
		}
	},
}
jsSite.forms = {
	init: function() {
		$('form').on('submit', function() { $('#ajaxSpinner').show(); });
		jsSite.forms.datefields();
		jsSite.forms.placeholders();
	},
	datefields: function() {
		// the default, nothing special
		if($('.inputDatefieldNormal').length > 0) {
			$('.inputDatefieldNormal').each(function() {
				var data = $(this).data();
				$(this).datepicker({
					dateFormat: 'dd/mm/yy',
					dayNames: [
						jsSite.locale.msg('DatePickerFullSunday'),
						jsSite.locale.msg('DatePickerFullMonday'),
						jsSite.locale.msg('DatePickerFullTuesday'),
						jsSite.locale.msg('DatePickerFullWednesday'),
						jsSite.locale.msg('DatePickerFullThursday'),
						jsSite.locale.msg('DatePickerFullFriday'),
						jsSite.locale.msg('DatePickerFullSaturday')
					],
					dayNamesMin: [
						jsSite.locale.msg('DatePickerMinimalSunday'),
						jsSite.locale.msg('DatePickerMinimalMonday'),
						jsSite.locale.msg('DatePickerMinimalTuesday'),
						jsSite.locale.msg('DatePickerMinimalWednesday'),
						jsSite.locale.msg('DatePickerMinimalThursday'),
						jsSite.locale.msg('DatePickerMinimalFriday'),
						jsSite.locale.msg('DatePickerMinimalSaturday')
					],
					dayNamesShort: [
						jsSite.locale.msg('DatePickerShortSunday'),
						jsSite.locale.msg('DatePickerShortMonday'),
						jsSite.locale.msg('DatePickerShortTuesday'),
						jsSite.locale.msg('DatePickerShortWednesday'),
						jsSite.locale.msg('DatePickerShortThursday'),
						jsSite.locale.msg('DatePickerShortFriday'),
						jsSite.locale.msg('DatePickerShortSaturday')
					],
					firstDay: 1,
					hideIfNoPrevNext: true,
					monthNames: [
						jsSite.locale.msg('DatePickerFullJanuary'),
						jsSite.locale.msg('DatePickerFullFebruary'),
						jsSite.locale.msg('DatePickerFullMarch'),
						jsSite.locale.msg('DatePickerFullApril'),
						jsSite.locale.msg('DatePickerFullMay'),
						jsSite.locale.msg('DatePickerFullJune'),
						jsSite.locale.msg('DatePickerFullJuly'),
						jsSite.locale.msg('DatePickerFullAugust'),
						jsSite.locale.msg('DatePickerFullSeptember'),
						jsSite.locale.msg('DatePickerFullOctober'),
						jsSite.locale.msg('DatePickerFullNovember'),
						jsSite.locale.msg('DatePickerFullDecember')
					],
					monthNamesShort: [
						jsSite.locale.msg('DatePickerShortJanuary'),
						jsSite.locale.msg('DatePickerShortFebruary'),
						jsSite.locale.msg('DatePickerShortMarch'),
						jsSite.locale.msg('DatePickerShortApril'),
						jsSite.locale.msg('DatePickerShortMay'),
						jsSite.locale.msg('DatePickerShortJune'),
						jsSite.locale.msg('DatePickerShortJuly'),
						jsSite.locale.msg('DatePickerShortAugust'),
						jsSite.locale.msg('DatePickerShortSeptember'),
						jsSite.locale.msg('DatePickerShortOctober'),
						jsSite.locale.msg('DatePickerShortNovember'),
						jsSite.locale.msg('DatePickerShortDecember')
					],
					nextText: jsSite.locale.lbl('Next'),
					prevText: jsSite.locale.lbl('Previous'),
					showAnim: 'slideDown'
				});
			});
		}

		// datefields that have a certain start date
		if($('.inputDatefieldFrom').length > 0) {
			$('.inputDatefieldFrom').each(function() {
				var data = $(this).data();
				$(this).datepicker({
					dateFormat: 'dd/mm/yy',
					dayNames: [
						jsSite.locale.msg('DatePickerFullSunday'),
						jsSite.locale.msg('DatePickerFullMonday'),
						jsSite.locale.msg('DatePickerFullTuesday'),
						jsSite.locale.msg('DatePickerFullWednesday'),
						jsSite.locale.msg('DatePickerFullThursday'),
						jsSite.locale.msg('DatePickerFullFriday'),
						jsSite.locale.msg('DatePickerFullSaturday')
					],
					dayNamesMin: [
						jsSite.locale.msg('DatePickerMinimalSunday'),
						jsSite.locale.msg('DatePickerMinimalMonday'),
						jsSite.locale.msg('DatePickerMinimalTuesday'),
						jsSite.locale.msg('DatePickerMinimalWednesday'),
						jsSite.locale.msg('DatePickerMinimalThursday'),
						jsSite.locale.msg('DatePickerMinimalFriday'),
						jsSite.locale.msg('DatePickerMinimalSaturday')
					],
					dayNamesShort: [
						jsSite.locale.msg('DatePickerShortSunday'),
						jsSite.locale.msg('DatePickerShortMonday'),
						jsSite.locale.msg('DatePickerShortTuesday'),
						jsSite.locale.msg('DatePickerShortWednesday'),
						jsSite.locale.msg('DatePickerShortThursday'),
						jsSite.locale.msg('DatePickerShortFriday'),
						jsSite.locale.msg('DatePickerShortSaturday')
					],
					firstDay: 1,
					hideIfNoPrevNext: true,
					monthNames: [
						jsSite.locale.msg('DatePickerFullJanuary'),
						jsSite.locale.msg('DatePickerFullFebruary'),
						jsSite.locale.msg('DatePickerFullMarch'),
						jsSite.locale.msg('DatePickerFullApril'),
						jsSite.locale.msg('DatePickerFullMay'),
						jsSite.locale.msg('DatePickerFullJune'),
						jsSite.locale.msg('DatePickerFullJuly'),
						jsSite.locale.msg('DatePickerFullAugust'),
						jsSite.locale.msg('DatePickerFullSeptember'),
						jsSite.locale.msg('DatePickerFullOctober'),
						jsSite.locale.msg('DatePickerFullNovember'),
						jsSite.locale.msg('DatePickerFullDecember')
					],
					monthNamesShort: [
						jsSite.locale.msg('DatePickerShortJanuary'),
						jsSite.locale.msg('DatePickerShortFebruary'),
						jsSite.locale.msg('DatePickerShortMarch'),
						jsSite.locale.msg('DatePickerShortApril'),
						jsSite.locale.msg('DatePickerShortMay'),
						jsSite.locale.msg('DatePickerShortJune'),
						jsSite.locale.msg('DatePickerShortJuly'),
						jsSite.locale.msg('DatePickerShortAugust'),
						jsSite.locale.msg('DatePickerShortSeptember'),
						jsSite.locale.msg('DatePickerShortOctober'),
						jsSite.locale.msg('DatePickerShortNovember'),
						jsSite.locale.msg('DatePickerShortDecember')
					],
					nextText: jsSite.locale.lbl('Next'),
					prevText: jsSite.locale.lbl('Previous'),
					minDate: new Date(parseInt(data.startdate.split('-')[0], 10), parseInt(data.startdate.split('-')[1], 10) - 1, parseInt(data.startdate.split('-')[2], 10)),
					showAnim: 'slideDown'
				});
			});
		}

		// datefields that have a certain end date
		if($('.inputDatefieldTill').length > 0) {
			$('.inputDatefieldTill').each(function() {
				var data = $(this).data();
				$(this).datepicker({
					dateFormat: 'dd/mm/yy',
					dayNames: [
						jsSite.locale.msg('DatePickerFullSunday'),
						jsSite.locale.msg('DatePickerFullMonday'),
						jsSite.locale.msg('DatePickerFullTuesday'),
						jsSite.locale.msg('DatePickerFullWednesday'),
						jsSite.locale.msg('DatePickerFullThursday'),
						jsSite.locale.msg('DatePickerFullFriday'),
						jsSite.locale.msg('DatePickerFullSaturday')
					],
					dayNamesMin: [
						jsSite.locale.msg('DatePickerMinimalSunday'),
						jsSite.locale.msg('DatePickerMinimalMonday'),
						jsSite.locale.msg('DatePickerMinimalTuesday'),
						jsSite.locale.msg('DatePickerMinimalWednesday'),
						jsSite.locale.msg('DatePickerMinimalThursday'),
						jsSite.locale.msg('DatePickerMinimalFriday'),
						jsSite.locale.msg('DatePickerMinimalSaturday')
					],
					dayNamesShort: [
						jsSite.locale.msg('DatePickerShortSunday'),
						jsSite.locale.msg('DatePickerShortMonday'),
						jsSite.locale.msg('DatePickerShortTuesday'),
						jsSite.locale.msg('DatePickerShortWednesday'),
						jsSite.locale.msg('DatePickerShortThursday'),
						jsSite.locale.msg('DatePickerShortFriday'),
						jsSite.locale.msg('DatePickerShortSaturday')
					],
					firstDay: 1,
					hideIfNoPrevNext: true,
					monthNames: [
						jsSite.locale.msg('DatePickerFullJanuary'),
						jsSite.locale.msg('DatePickerFullFebruary'),
						jsSite.locale.msg('DatePickerFullMarch'),
						jsSite.locale.msg('DatePickerFullApril'),
						jsSite.locale.msg('DatePickerFullMay'),
						jsSite.locale.msg('DatePickerFullJune'),
						jsSite.locale.msg('DatePickerFullJuly'),
						jsSite.locale.msg('DatePickerFullAugust'),
						jsSite.locale.msg('DatePickerFullSeptember'),
						jsSite.locale.msg('DatePickerFullOctober'),
						jsSite.locale.msg('DatePickerFullNovember'),
						jsSite.locale.msg('DatePickerFullDecember')
					],
					monthNamesShort: [
						jsSite.locale.msg('DatePickerShortJanuary'),
						jsSite.locale.msg('DatePickerShortFebruary'),
						jsSite.locale.msg('DatePickerShortMarch'),
						jsSite.locale.msg('DatePickerShortApril'),
						jsSite.locale.msg('DatePickerShortMay'),
						jsSite.locale.msg('DatePickerShortJune'),
						jsSite.locale.msg('DatePickerShortJuly'),
						jsSite.locale.msg('DatePickerShortAugust'),
						jsSite.locale.msg('DatePickerShortSeptember'),
						jsSite.locale.msg('DatePickerShortOctober'),
						jsSite.locale.msg('DatePickerShortNovember'),
						jsSite.locale.msg('DatePickerShortDecember')
					],
					nextText: jsSite.locale.lbl('Next'),
					prevText: jsSite.locale.lbl('Previous'),
					maxDate: new Date(parseInt(data.enddate.split('-')[0], 10), parseInt(data.enddate.split('-')[1], 10) -1, parseInt(data.enddate.split('-')[2], 10)),
					showAnim: 'slideDown'
				});
			});
		}

		// datefields that have a certain range
		if($('.inputDatefieldRange').length > 0) {
			$('.inputDatefieldRange').each(function() {
				var data = $(this).data();
				$(this).datepicker({
					dateFormat: 'dd/mm/yy',
					dayNames: [
						jsSite.locale.msg('DatePickerFullSunday'),
						jsSite.locale.msg('DatePickerFullMonday'),
						jsSite.locale.msg('DatePickerFullTuesday'),
						jsSite.locale.msg('DatePickerFullWednesday'),
						jsSite.locale.msg('DatePickerFullThursday'),
						jsSite.locale.msg('DatePickerFullFriday'),
						jsSite.locale.msg('DatePickerFullSaturday')
					],
					dayNamesMin: [
						jsSite.locale.msg('DatePickerMinimalSunday'),
						jsSite.locale.msg('DatePickerMinimalMonday'),
						jsSite.locale.msg('DatePickerMinimalTuesday'),
						jsSite.locale.msg('DatePickerMinimalWednesday'),
						jsSite.locale.msg('DatePickerMinimalThursday'),
						jsSite.locale.msg('DatePickerMinimalFriday'),
						jsSite.locale.msg('DatePickerMinimalSaturday')
					],
					dayNamesShort: [
						jsSite.locale.msg('DatePickerShortSunday'),
						jsSite.locale.msg('DatePickerShortMonday'),
						jsSite.locale.msg('DatePickerShortTuesday'),
						jsSite.locale.msg('DatePickerShortWednesday'),
						jsSite.locale.msg('DatePickerShortThursday'),
						jsSite.locale.msg('DatePickerShortFriday'),
						jsSite.locale.msg('DatePickerShortSaturday')
					],
					firstDay: 1,
					hideIfNoPrevNext: true,
					monthNames: [
						jsSite.locale.msg('DatePickerFullJanuary'),
						jsSite.locale.msg('DatePickerFullFebruary'),
						jsSite.locale.msg('DatePickerFullMarch'),
						jsSite.locale.msg('DatePickerFullApril'),
						jsSite.locale.msg('DatePickerFullMay'),
						jsSite.locale.msg('DatePickerFullJune'),
						jsSite.locale.msg('DatePickerFullJuly'),
						jsSite.locale.msg('DatePickerFullAugust'),
						jsSite.locale.msg('DatePickerFullSeptember'),
						jsSite.locale.msg('DatePickerFullOctober'),
						jsSite.locale.msg('DatePickerFullNovember'),
						jsSite.locale.msg('DatePickerFullDecember')
					],
					monthNamesShort: [
						jsSite.locale.msg('DatePickerShortJanuary'),
						jsSite.locale.msg('DatePickerShortFebruary'),
						jsSite.locale.msg('DatePickerShortMarch'),
						jsSite.locale.msg('DatePickerShortApril'),
						jsSite.locale.msg('DatePickerShortMay'),
						jsSite.locale.msg('DatePickerShortJune'),
						jsSite.locale.msg('DatePickerShortJuly'),
						jsSite.locale.msg('DatePickerShortAugust'),
						jsSite.locale.msg('DatePickerShortSeptember'),
						jsSite.locale.msg('DatePickerShortOctober'),
						jsSite.locale.msg('DatePickerShortNovember'),
						jsSite.locale.msg('DatePickerShortDecember')
					],
					nextText: jsSite.locale.lbl('Next'),
					prevText: jsSite.locale.lbl('Previous'),
					minDate: new Date(parseInt(data.startdate.split('-')[0], 10), parseInt(data.startdate.split('-')[1], 10) - 1, parseInt(data.startdate.split('-')[2], 10), 0, 0, 0, 0),
					maxDate: new Date(parseInt(data.enddate.split('-')[0], 10), parseInt(data.enddate.split('-')[1], 10) - 1, parseInt(data.enddate.split('-')[2], 10), 23, 59, 59),
					showAnim: 'slideDown'
				});
			});
		}
	},
	placeholders: function() {
		// detect if placeholder-attribute is supported
		jQuery.support.placeholder = ('placeholder' in document.createElement('input'));
		if(!jQuery.support.placeholder) {
			var $input = $('input[placeholder]');
			// bind focus
			$input.focus(function() {
				var input = $(this);
				if(input.val() == input.attr('placeholder')) {
					input.val('');
					input.removeClass('placeholder');
				}
			});
			$input.blur(function() {
				var input = $(this);
				if(input.val() == '' || input.val() == input.attr('placeholder')) {
					input.val(input.attr('placeholder'));
					input.addClass('placeholder');
				}
			});
			$input.blur();
			$input.parents('form').submit(function() {
				$(this).find('input[placeholder]').each(function() {
					var input = $(this);
					if(input.val() == input.attr('placeholder')) input.val('');
				});
			});
		}
	}
}

jsSite.search = {
	results: [],
	init: function() {
		$('#searchQuery').typeahead({
			source: jsSite.search.autocomplete,
			matcher: function(item) { return true },
			updater: jsSite.search.updater,
			highlighter: function(items) { return items; }
		});
	},
	autocomplete: function(query, process) {
		$.ajax({
			url: '/ajax.php?module=core&action=search&language=' + jsSite.current.language,
			data: { q: query },
			success: function(data, textStatus, jqXHR) {
				jsSite.search.results = [];
				if(data.code == 200) {
					var items = [];
					for(var i in data.data) {
						var key = data.data[i].label + ' <small class="muted">(' + data.data[i].module + ')</small>';
						items.push(key);
						jsSite.search.results[key] = data.data[i]
					}
					process(items);
				}
				else alert(data.message);
			}
		});
	},
	updater: function(item) {
		if(typeof jsSite.search.results[item].url != 'undefined') {
			document.location = jsSite.search.results[item].url;
		} else if(typeof jsSite.search.results[item].value != 'undefined') {
			return jsSite.search.results[item].value;
		} else {
			return item;
		}
	}
}
$(jsSite.init);