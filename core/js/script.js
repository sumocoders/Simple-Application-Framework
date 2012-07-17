/**
 * Frontend related objects
 *
 * @author	Tijs Verkoyen <tijs@sumocoders.be>
 */
var jsSite =
{
	debug: true,
	current:
	{
		module: null,
		action: null,
		language: null
	},

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

		// init the ajax-configuration
		jsSite.initAjax();

		jsSite.forms.init();
		jsSite.layout.init();
		jsSite.links.init();

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
				var textStatus = 'General error';

				// get errormessage for AJAX-call
				if(typeof XMLHttpRequest.responseText != 'undefined')
				{
					var json = $.parseJSON(XMLHttpRequest.responseText);
					if(typeof json.message != 'undefined') textStatus = json.message;
					else textStatus = XMLHttpRequest.responseText;
				}

				$('body').prepend('<div class="alert alert-error noMargin"><a href="#" class="close" data-dismiss="alert">x</a>' + textStatus + '</div>');
			}
		});

		// spinner stuff
		$(document).ajaxStart(function() { $('#ajaxSpinner').show(); });
		$(document).ajaxStop(function() { $('#ajaxSpinner').hide(); });
	}
}

jsSite.forms =
{
	init: function() {}
}

jsSite.layout =
{
	init: function()
	{
		if(
			!(navigator.userAgent.match(/iPhone/i)) &&
			!(navigator.userAgent.match(/iPod/i)) &&
			!(navigator.userAgent.match(/iPad/i))
		)
		{
			$(document).on('scroll', jsSite.layout.onScroll);
		}
	},

	onScroll: function(e)
	{
		var $this = $(this);
		var $header = $('#header');
		var $navBar = $('#navBar');

		if($this.scrollTop() >= $header.height()) $navBar.addClass('fixed').css('width', ($('#header').width()));
		if($this.scrollTop() < $header.height()) $navBar.removeClass('fixed').css('width', 'auto');
	}
}

jsSite.links =
{
	init: function()
	{
		$('a.confirm').on('click', jsSite.links.confirm);
		$('#confirmModal').modal({ show: false });
	},

	confirm: function(e)
	{
		e.preventDefault();

		var $this = $(this);

		$('#confirmModalOk').attr('href', $this.attr('href'));
		$('#confirmModalMessage').html($this.data('message'));
		$('#confirmModal').modal('show');
	}
}


$(jsSite.init);
