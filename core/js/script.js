/**
 * Frontend related objects
 *
 * @author	Tijs Verkoyen <tijs@sumocoders.be>
 * @author	Thomas Deceuninck <thomasdeceuninck@netlash.com>
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
	}
}

$(jsSite.init);
