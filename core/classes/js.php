<?php

/**
 * JS
 *
 * This class defines an js action.
 *
 * @package		site
 * @subpackage	core
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class JS
{
	/**
	 * Default constructor
	 */
	public function __construct()
	{
		$module = SpoonFilter::getGetValue('module', null, false);
		$file = SpoonFilter::getGetValue('file', null, false);
		$language = SpoonFilter::getGetValue('language', null, false);

		// validate incoming parameters
		if($module == '' || $file == '' || $language == '')
		{
			SpoonHTTP::setHeadersByCode(500);
			exit('invalid parameters');
		}

		// init var
		$path = PATH_WWW;

		// build path
		if($module == 'core') $path .='/core/js/' . $file;
		else $path .= '/modules/' . $module . '/js/' . $file;

		// check if the file exists
		if(!SpoonFile::exists($path))
		{
			SpoonHTTP::setHeadersByCode(404);
			exit('invalid file');
		}

		// set locale
		SiteLocale::setLocale($language);

		// create template
		$tpl = new SiteTemplate();

		// output
		$tpl->display($path);
	}
}
