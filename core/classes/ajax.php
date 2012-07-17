<?php

/**
 * Ajax
 *
 * This class defines an ajax action.
 *
 * @package		site
 * @subpackage	core
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class Ajax
{
	/**
	 * Default constructor
	 *
	 * @return void
	 */
	public function __construct()
	{
		// get stuff from url
		$module = SpoonFilter::getGetValue('module', null, false);
		$action = SpoonFilter::getGetValue('action', null, false);
		$language = SpoonFilter::getGetValue('language', null, false);

		// validate incoming parameters
		if($module == '' || $action == '' || $language == '')
		{
			// set headers
			SpoonHTTP::setHeadersByCode(400);

			// build correct array
			$response['code'] = 400;
			$response['message'] = 'Invalid parameters';

			// output
			echo json_encode($response);
			exit;
		}

		// set locale
		SiteLocale::setLocale($language);

		try
		{
			// create new instance
			new AjaxAction($action, $module);
		}

		catch(Exception $e)
		{
			// set headers
			SpoonHTTP::setHeadersByCode(400);

			// build correct array
			$response['code'] = 400;
			$response['message'] = $e->getMessage();

			// output
			echo json_encode($response);
			exit;
		}
	}
}
