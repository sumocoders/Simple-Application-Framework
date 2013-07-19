/**
 * Frontend related objects
 *
 * @author	Tijs Verkoyen <tijs@sumocoders.be>
 */
var jsSite = {
	init: function() {
		try {
			var method = 'jsSite.'+ jsSite.current.module +'.init()';
			eval(method);
		} catch(e) {
			if(jsSite.debug) console.log(e);
		}
	}
}
$(jsSite.init);