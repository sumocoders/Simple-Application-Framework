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
	 */
	public function __construct()
	{
		// set a default timezone if no one was set by PHP.ini
		if(ini_get('date.timezone') == '') date_default_timezone_set('Europe/Brussels');

		// require globals
		require_once './library/globals.php';

		// define constants
		define('CACHE_PATH', PATH_WWW . '/cache');
		define('CORE_PATH', PATH_WWW . '/core');

		// set include path
		set_include_path(realpath(PATH_WWW . '/vendor/spoon/library') . PATH_SEPARATOR . PATH_WWW . PATH_SEPARATOR . get_include_path());

		// set debugging
		if(SPOON_DEBUG)
		{
			error_reporting(E_ALL | E_STRICT);
			ini_set('display_errors', 'On');
			define('LAST_MODIFIED', microtime(true));
		}
		else
		{
			error_reporting(0);
			ini_set('display_errors', 'Off');
			define('LAST_MODIFIED', filemtime(__DIR__ . '/library/globals.php'));
		}

		// require Spoon
		require_once 'spoon/spoon.php';

		/**
		 * @remark only for SumoCoders
		 *
		 * Here we initialize our Sumo class, which will add some Sumo specific stuff
		 * into this Fork instance.
		 */
		$sumo = new SumoCoders\SumoForkClass\SumoForkClass();
		$sumo->setErrbitApiKey(ERRBIT_API_KEY);
		$sumo->setDebug(SPOON_DEBUG);
		$sumo->init();

		// require frontend-classes
		spl_autoload_register(array('Init', 'autoLoader'));

		// disable magic quotes
		SpoonFilter::disableMagicQuotes();
	}

	/**
	 * AutoLoader
	 *
	 * @param	string $class	The class that should be loaded.
	 * @return void
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

		$path = PATH_WWW . '/core/classes/' . $filename;
		if(file_exists($path))
		{
			require_once $path;
			return;
		}

		$path = PATH_WWW . '/modules/' . $class . 's/model/model.php';
		if(file_exists($path))
		{
			require_once $path;
			return;
		}

		$path = PATH_LIBRARY . '/external/' . $filename;
		if(file_exists($path))
		{
			require_once $path;
			return;
		}
	}
}
