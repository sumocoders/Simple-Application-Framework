if(!jsSite) { var jsSite = new Object(); }

/**
 * Site related objects
 *
 * @author	Tijs Verkoyen <tijs@sumocoders.be>
 */
jsSite =
{
	// datamembers
	debug: false,
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
		jsSite.bugs.init();
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

				// show message
				$('#generalError').html('<p>'+ textStatus + '</p>').slideDown();
			}
		});

		// spinner stuff
		$(document).ajaxStart(function() { $('#ajaxSpinner').show(); });
		$(document).ajaxStop(function() { $('#ajaxSpinner').hide(); });
	},


	// end
	eoo: true
}

jsSite.bugs = 
{
	options: {},
	screenshot: null,
		
	init: function()
	{
		jsSite.bugs.options = 
		{ 
			complete: jsSite.bugs.onCompletePreload,
			elements: $('body'),
			flashcanvas: '/core/js/external/flashcanvas.js'
		};
		
		$('#reportBug').on('click', jsSite.bugs.click);
		$('#reportBugNext').on('click', jsSite.bugs.next);
		$('#reportBugPrevious').on('click', jsSite.bugs.previous);
		$('#reportBugSubmit').on('click', jsSite.bugs.save);
		$('#reportBugBox a.close').on('click', jsSite.bugs.close);
	},
	
	click: function(e)
	{
		$('#reportBugBox .step1').show();
		$('#reportBugBox .step2').hide();
		$('#reportBugBox .step3').hide();

		$('#reportBugNext').show();

		// show box for description
		$('#reportBugBox').fadeIn();
	},
	
	close: function(e)
	{
		// prevent default behaviour
		e.preventDefault();
		
		// hide box
		$('#reportBugBox').fadeOut();
	},
	
	next: function(e)
	{
		// prevent default behaviour
		e.preventDefault();
		
		// hide previous errors
		$('#reportBugDescriptionError').hide();
		
		// init var
		var noErrors = true;
		
		// validate
		if($('#reportBugDescription').val().length == 0) 
		{
			noErrors = false;
			$('#reportBugDescriptionError').show();
		}
		
		// no errors
		if(noErrors)
		{
			// enable submit
			$('#reportBugSubmit').removeClass('disabled').prop('disabled', false);
			
			// show spinner
			$('#reportBugSubmitSpinner').show();
		
			$('#reportBugBox .step1').hide();
			$('#reportBugBox .step2').show();
			$('#reportBugBox .step3').hide();
			$('#reportBugNext').hide();
			$('#reportBugPrevious').show();
			
			// create screenshot
			$('#reportBugHolder').hide();
			html2canvas.Preload($('body')[0], jsSite.bugs.options);
		}
		else $('#reportBugSubmit').addClass('disabled').prop('disabled', true);
		
	},
	
	onCompletePreload: function(images)
	{
		// init var
		var queue = html2canvas.Parse($('body')[0], images, jsSite.bugs.options);
		if(queue.backgroundColor == 'transparent') queue.backgroundColor = '#FFF';
		var $canvas = $(html2canvas.Renderer(queue, jsSite.bugs.options));
		$('#reportBugHolder').show();
		jsSite.bugs.screenshot = $canvas[0].toDataURL();
		
		// hide spinner
		$('#reportBugSubmitSpinner').hide();

		// show highlight button
		$('#reportBugSubmit').show();
		
		// @todo	enable highlight
		
	},
	
	previous: function(e) 
	{
		// prevent default behaviour
		e.preventDefault();
		
		$('#reportBugBox .step1').show();
		$('#reportBugBox .step2').hide();
		$('#reportBugBox .step3').hide();
		$('#reportBugNext').show();
		$('#reportBugPrevious').hide();
		$('#reportBugSubmit').hide();
	},
	
	save: function(e)
	{
		// build data
		var data = {
			description: $('#reportBugDescription').val(),
			screenshot: jsSite.bugs.screenshot,
			currentUser: currentUser,
			data: {
				url: document.location.href
			}
		};
		
		$.ajax({
			url: '/ajax.php?module=core&action=bug&language=' + jsSite.current.language,
			data: data,
			success: function(data, textStatus, jqXHR)
			{
				if(data.code == 200)
				{
					$('#reportBugBox .step1').hide();
					$('#reportBugBox .step2').hide();
					$('#reportBugBox .step3').show();
					$('#reportBugNext').hide();
					$('#reportBugPrevious').hide();
					$('#reportBugSubmit').hide();

					// clear info
					$('#reportBugDescription').val('');
				}

				else alert(data.message);
			}
		});
		
		
		// send to ajax
	}
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