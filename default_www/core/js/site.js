if(!jsSite) { var jsSite = new Object(); }

/**
 * Site related objects
 *
 * @author	Tijs Verkoyen <tijs@sumocoders.be>
 */
jsSite =
{
	// datamembers
	debug: true,
	current:
	{
		module: null,
		action: null,
		language: null
	},


	// init, something like a constructor
	init: function()
	{
		// get url and split into chunks
		var chunks = document.location.pathname.split('/');
		if(typeof chunks[1] == 'undefined') chunks[1] = 'nl';		// @todo	fix me
		if(typeof chunks[2] == 'undefined') chunks[2] = 'example';	// @todo	fix me
		if(typeof chunks[3] == 'undefined') chunks[3] = 'index';	// @todo	fix me

		// set some properties
		jsSite.current.module = chunks[2];
		jsSite.current.action = chunks[3];
		jsSite.current.language = chunks[1];

		// init stuff
		jsSite.initAjax();
		jsSite.forms.init();

		try
		{
			// build method
			var method = 'jsSite.'+ jsSite.current.module +'.init()';

			// try to call the method
			eval(method);
		}
		catch(e)
		{
			if(jsSite.debug) console.log(e);
		}
	},


	// init ajax
	initAjax: function()
	{
		// set defaults for AJAX
		$.ajaxSetup(
		{
			cache: false,
			type: 'POST',
			dataType: 'json',
			timeout: 5000
		});

		// global error handler
		$(document).ajaxError(function(event, XMLHttpRequest, ajaxOptions)
		{
			// 403 means we aren't authenticated anymore, so reload the page
			if(XMLHttpRequest.status == 403) window.location.reload();

			// check if a custom errorhandler is used
			if(typeof ajaxOptions.error == 'undefined')
			{
				// init var
				var textStatus = '{$errGeneralError}';

				// get real message
				if(typeof XMLHttpRequest.responseText != 'undefined') textStatus = $.parseJSON(XMLHttpRequest.responseText).message;

				// show message	@todo	find a better way to do this.
				$('#generalError').html('<p>'+ textStatus + '</p>').slideDown();
			}
		});

		// spinner stuff	@todo	find a better way to do this.
		$(document).ajaxStart(function() { $('#ajaxSpinner').show(); });
		$(document).ajaxStop(function() { $('#ajaxSpinner').hide(); });
	},


	// end
	eoo: true
}


/**
 * Forms
 *
 * @author	Tijs Verkoyen <tijs@sumocoders.be>
 */
jsSite.forms =
{
	// init, something like a constructor
	init: function()
	{
		jsSite.forms.placeholders();	// make sure this is done before focussing the first field
		jsSite.forms.datefields();
	},


	datefields: function() {
		$('.inputDate').each(function() {
			if($(this).attr('type') == 'text') {
				var maxDate = $(this).data('maxdate');

				$(this).datepicker({
					closeText: '{$lblClose|ucfirst}',
					dateFormat: 'dd/mm/yy',
					dayNames: [ '{$msgDatepickerFullSunday}', '{$msgDatepickerFullMonday}', '{$msgDatepickerFullTuesday}', '{$msgDatepickerFullWednesday}', '{$msgDatepickerFullThursday}', '{$msgDatepickerFullFriday}', '{$msgDatepickerFullSaterday}' ],
					dayNamesMin: [ '{$msgDatepickerMinimalSunday}', '{$msgDatepickerMinimalMonday}', '{$msgDatepickerMinimalTuesday}', '{$msgDatepickerMinimalWednesday}', '{$msgDatepickerMinimalThursday}', '{$msgDatepickerMinimalFriday}', '{$msgDatepickerMinimalSaterday}' ],
					dayNamesShort: [ '{$msgDatepickerShortSunday}', '{$msgDatepickerShortMonday}', '{$msgDatepickerShortTuesday}', '{$msgDatepickerShortWednesday}', '{$msgDatepickerShortThursday}', '{$msgDatepickerShortFriday}', '{$msgDatepickerShortSaterday}' ],
					firstday: 1,
					monthNames: [ '{$msgDatepickerFullJanuary}', '{$msgDatepickerFullFebruary}', '{$msgDatepickerFullMarch}', '{$msgDatepickerFullApril}', '{$msgDatepickerFullMay}', '{$msgDatepickerFullJune}', '{$msgDatepickerFullJuly}', '{$msgDatepickerFullAugust}', '{$msgDatepickerFullSeptember}', '{$msgDatepickerFullOctober}', '{$msgDatepickerFullNovember}', '{$msgDatepickerFullDecember}' ],
					monthNamesShort: [ '{$msgDatepickerShortJanuary}', '{$msgDatepickerShortFebruary}', '{$msgDatepickerShortMarch}', '{$msgDatepickerShortApril}', '{$msgDatepickerShortMay}', '{$msgDatepickerShortJune}', '{$msgDatepickerShortJuly}', '{$msgDatepickerShortAugust}', '{$msgDatepickerShortSeptember}', '{$msgDatepickerShortOctober}', '{$msgDatepickerShortNovember}', '{$msgDatepickerShortDecember}' ],
					nextText: '{$lblNext}',
					prevText: '{$lblPrevious}',
					maxDate: maxDate
				});
			}
		});
	},


	// set placeholders
	placeholders: function()
	{
		// detect if placeholder-attribute is supported
		jQuery.support.placeholder = ('placeholder' in document.createElement('input'));

		if(!jQuery.support.placeholder)
		{
			// bind focus
			$('input[placeholder]').focus(function()
			{
				// grab element
				var input = $(this);

				// only do something when the current value and the placeholder are the same
				if(input.val() == input.attr('placeholder'))
				{
					// clear
					input.val('');

					// remove class
					input.removeClass('placeholder');
				}
			});

			$('input[placeholder]').blur(function()
			{
				// grab element
				var input = $(this);

				// only do something when the input is empty or the value is the same as the placeholder
				if(input.val() == '' || input.val() == input.attr('placeholder'))
				{
					// set placeholder
					input.val(input.attr('placeholder'));

					// add class
					input.addClass('placeholder');
				}
			});

			// call blur to initialize
			$('input[placeholder]').blur();

			// hijack the form so placeholders aren't submitted as values
			$('input[placeholder]').parents('form').submit(function()
			{
				// find elements with placeholders
				$(this).find('input[placeholder]').each(function()
				{
					// grab element
					var input = $(this);

					// if the value and the placeholder are the same reset the value
					if(input.val() == input.attr('placeholder')) input.val('');
				});
			});
		}
	},


	// end
	eoo: true
}


$(document).ready(jsSite.init);