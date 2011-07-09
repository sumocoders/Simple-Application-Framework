<?php

/**
 * Init
 *
 * This source file is part of Vodtec.
 *
 * @package			site
 *
 * @author 			Tijs Verkoyen <tijs@sumocoders.be>
 * @since			1.0
 */
class Init
{
	/**
	 * Default constructor
	 *
	 * @return	void
	 */
	public function __construct()
	{
		// set a default timezone if no one was set by PHP.ini
		if(ini_get('date.timezone') == '') date_default_timezone_set('Europe/Brussels');

		// require globals
		require_once '../library/globals.php';

		// define constants
		define('CACHE_PATH', PATH_WWW . '/cache');
		define('CORE_PATH', PATH_WWW . '/core');

		// set include path
		set_include_path(PATH_LIBRARY . PATH_SEPARATOR . PATH_WWW . PATH_SEPARATOR . get_include_path());

		// set debugging
		if(SPOON_DEBUG)
		{
			error_reporting(E_ALL | E_STRICT);
			ini_set('display_errors', 'On');
		}
		else
		{
			error_reporting(0);
			ini_set('display_errors', 'Off');
		}

		// require spoon
		require_once 'spoon/spoon.php';

		// require frontend-classes
		spl_autoload_register(array('Init', 'autoLoader'));

		// disable magic quotes
		SpoonFilter::disableMagicQuotes();
	}


	/**
	 * AutoLoader
	 *
	 * @return	void
	 * @param	string $class	The class that should be loaded.
	 */
	public static function autoLoader($class)
	{
		$exceptions = array(
			'ajaxaction' => 'ajax_action'
		);

		// ignore case
		$class = strtolower($class);

		// an exception?
		if(in_array($class, array_keys($exceptions))) $class = $exceptions[$class];

		// remove prefix
		if($class != 'site' && substr($class, 0, 4) == 'site') $class = substr($class, 4);

		// datagrid
		if(substr($class, 0, 8) == 'datagrid') $class = 'datagrid';

		// rebuild filename
		$filename = $class . '.php';

		// build path
		$path = PATH_WWW . '/core/classes/' . $filename;

		// load the class if it exists
		if(file_exists($path)) require_once $path;

		else
		{
			// build external path
			$path = PATH_LIBRARY . '/external/' . $filename;

			// load the class if it exists
			if(file_exists($path)) require_once $path;

			else
			{
				// build path
				$path = PATH_WWW . '/modules/' . $class . 's/model/model.php';

				// load the class if it exists
				if(file_exists($path)) require_once $path;
			}
		}
	}
}

?>