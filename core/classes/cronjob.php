<?php


/**
 * This class will handle cronjob related stuff
 *
 * @author Sam Tubbax <sam@sumocoders.be>
 */
class Cronjob
{
	/**
	 * The action
	 *
	 * @var	string
	 */
	private $action;

	/**
	 * The id
	 *
	 * @var	int
	 */
	private $id;

	/**
	 * The working language
	 *
	 * @var	string
	 */
	private $language;

	/**
	 * The module
	 *
	 * @var	string
	 */
	private $module;

	public function __construct()
	{
		// because some cronjobs will be run on the command line we should pass parameters
		if(isset($_SERVER['argv']))
		{
			// init var
			$first = true;

			// loop all passes arguments
			foreach($_SERVER['argv'] as $parameter)
			{
				// ignore first, because this is the scripts name.
				if($first)
				{
					// reset
					$first = false;

					// skip
					continue;
				}

				// split into chunks
				$chunks = explode('=', $parameter, 2);

				// valid paramters?
				if(count($chunks) == 2)
				{
					// build key and value
					$key = trim($chunks[0], '--');
					$value = $chunks[1];

					// set in GET
					if($key != '' && $value != '') $_GET[$key] = $value;
				}
			}
		}

		// define the Named Application
		if(!defined('NAMED_APPLICATION')) define('NAMED_APPLICATION', 'backend');

		// set the module
		$this->setModule(SpoonFilter::getGetValue('module', null, ''));

		// set the requested file
		$this->setAction(SpoonFilter::getGetValue('action', null, ''));

		$languages = Site::getLanguages();
		// set the language
		$this->setLanguage(SpoonFilter::getGetValue('language', $languages, SiteLocale::getPreferedLanguage()));

		// create new action
		$action = new CronjobAction($this->getAction(), $this->getModule());
		$action->execute();
	}

	/**
	 * Get the action
	 *
	 * @return string
	 */
	public function getAction()
	{
		return $this->action;
	}

	/**
	 * Get language
	 *
	 * @return string
	 */
	public function getLanguage()
	{
		return $this->language;
	}

	/**
	 * Get module
	 *
	 * @return string
	 */
	public function getModule()
	{
		return $this->module;
	}

	/**
	 * Set action
	 *
	 * @param string $value The action to load.
	 */
	public function setAction($value)
	{
		$value = (string) $value;

		// validate
		if($value == '')
		{
			// set correct headers
			SpoonHTTP::setHeadersByCode(400);

			// throw exceptions
			throw new SpoonException('Action not present.');
		}

		// set property
		$this->action = (string) $value;
	}

	/**
	 * Set language
	 *
	 * @param string $value The language to load.
	 */
	public function setLanguage($value)
	{
		// get the possible languages
		$possibleLanguages = Site::getLanguages();

		// validate
		if(!in_array($value, array_keys($possibleLanguages))) throw new SpoonException('Invalid language.');

		// set property
		$this->language = $value;

		// set the locale (we need this for the labels)
		SiteLocale::setLocale($this->language);
	}

	/**
	 * Set module
	 *
	 * @param string $value The module to use.
	 */
	public function setModule($value)
	{
		$value = (string) $value;

		// validate
		if($value == '')
		{
			// set correct headers
			SpoonHTTP::setHeadersByCode(400);

			// throw exceptions
			throw new SpoonException('Module not present.');
		}

		// set property
		$this->module = $value;
	}
}

/**
 * This class is the real code, it creates an action, ...
 *
 * @author Tijs Verkoyen <tijs@sumocoders.be>
 * @author Sam Tubbax <sam@sumocoders.be>
 */
class CronjobAction
{
	/**
	 * The current action
	 *
	 * @var	string
	 */
	private $action;

	/**
	 * The current module
	 *
	 * @var	string
	 */
	private $module;

	/**
	 * You have to specify the action and module so we know what to do with this instance
	 *
	 * @param string $action The action to load.
	 * @param string $module The module to load.
	 */
	public function __construct($action, $module)
	{
		$this->setModule($module);
		$this->setAction($action);
	}

	/**
	 * Execute the action
	 * We will build the classname, require the class and call the execute method.
	 */
	public function execute()
	{
		// build action-class-name
		$actionClassName = SpoonFilter::toCamelCase($this->getModule() . '_cronjob_' . $this->getAction());

		if($this->getModule() == 'core')
		{
			// check if the file is present? If it isn't present there is a huge problem, so we will stop our code by throwing an error
			if(!SpoonFile::exists(PATH_WWW . '/core/cronjobs/' . $this->getAction() . '.php'))
			{
				// set correct headers
				SpoonHTTP::setHeadersByCode(500);

				// throw exception
				throw new SpoonException('The cronjobfile for the module (' . $this->getAction() . '.php) can\'t be found.');
			}

			// require the config file, we know it is there because we validated it before (possible actions are defined by existance of the file).
			require_once PATH_WWW . '/core/cronjobs/' . $this->getAction() . '.php';
		}

		else
		{
			// check if the file is present? If it isn't present there is a huge problem, so we will stop our code by throwing an error
			if(!SpoonFile::exists(PATH_WWW . '/modules/' . $this->getModule() . '/cronjobs/' . $this->getAction() . '.php'))
			{
				// set correct headers
				SpoonHTTP::setHeadersByCode(500);

				// throw exception
				throw new SpoonException('The cronjobfile for the module (' . $this->getAction() . '.php) can\'t be found.');
			}

			// require the config file, we know it is there because we validated it before (possible actions are defined by existance of the file).
			require_once PATH_WWW . '/modules/' . $this->getModule() . '/cronjobs/' . $this->getAction() . '.php';
		}

		// validate if class exists (aka has correct name)
		if(!class_exists($actionClassName))
		{
			// set correct headers
			SpoonHTTP::setHeadersByCode(500);

			// throw exception
			throw new SpoonException('The cronjobfile is present, but the classname should be: ' . $actionClassName . '.');
		}

		// create action-object
		$object = new $actionClassName($this->getAction(), $this->getModule());
		$object->execute();
	}

	/**
	 * Get the current action
	 * REMARK: You should not use this method from your code, but it has to be public so we can
	 * access it later on in the core-code
	 *
	 * @return string
	 */
	public function getAction()
	{
		return $this->action;
	}

	/**
	 * Get the current module
	 * REMARK: You should not use this method from your code, but it has to be public so we can
	 * access it later on in the core-code
	 *
	 * @return string
	 */
	public function getModule()
	{
		return $this->module;
	}

	/**
	 * Set the action
	 *
	 * @param string $action The action to load.
	 */
	private function setAction($action)
	{
		$this->action = (string) $action;
	}

	/**
	 * Set the module
	 *
	 * @param string $module The module to load.
	 */
	private function setModule($module)
	{
		$this->module = (string) $module;
	}
}

/**
 * This is the base-object for cronjobs. The module-specific cronjob-files can extend the functionality from this class
 *
 * @author Sam Tubbax <sam@sumocoders.be>
 */
class SiteBaseCronjob
{
	/**
	 * The current action
	 *
	 * @var	string
	 */
	protected $action;

	/**
	 * The current id
	 *
	 * @var	int
	 */
	protected $id;

	/**
	 * The current module
	 *
	 * @var	string
	 */
	protected $module;

	/**
	 * @param string $action The action to load.
	 * @param string $module The module to load.
	 */
	public function __construct($action, $module)
	{
		// store the current module and action (we grab them from the URL)
		$this->setModule($module);
		$this->setAction($action);
	}

	/**
	 * Clear/removed the busy file
	 */
	protected function clearBusyFile()
	{
		// build path
		$path = PATH_WWW . '/cache/cronjobs/' . $this->getId() . '.busy';

		// remove the file
		SpoonFile::delete($path);
	}

	/**
	 * Execute the action
	 */
	public function execute()
	{
		// check if model exists
		if(SpoonFile::exists(PATH_WWW . '/modules/' . $this->getModule() . '/engine/model.php'))
		{
			// the model exists, so we require it
			require_once PATH_WWW . '/modules/' . $this->getModule() . '/engine/model.php';
		}
	}

	/**
	 * Get the action
	 *
	 * @return string
	 */
	public function getAction()
	{
		return $this->action;
	}

	/**
	 * Get the id
	 *
	 * @return int
	 */
	public function getId()
	{
		return strtolower($this->getModule() . '_' . $this->getAction());
	}

	/**
	 * Get the module
	 *
	 * @return string
	 */
	public function getModule()
	{
		return $this->module;
	}

	/**
	 * Set the action, for later use
	 *
	 * @param string $action The action to load.
	 */
	protected function setAction($action)
	{
		$this->action = (string) $action;
	}

	/**
	 * Set the busy file
	 */
	protected function setBusyFile()
	{
		// do not set busy file in debug mode
		if(SPOON_DEBUG) return;

		// build path
		$path = PATH_WWW . '/cache/cronjobs/' . $this->getId() . '.busy';

		// init var
		$isBusy = false;

		// does the busy file already exists.
		if(SpoonFile::exists($path))
		{
			$isBusy = true;

			// grab counter
			$counter = (int) SpoonFile::getContent($path);

			// check the counter
			if($counter > 9)
			{
				// build class name
				$className = 'Backend' . SpoonFilter::toCamelCase($this->getModule() . '_cronjob_' . $this->getAction());

				// notify user
				throw new SpoonException('Cronjob (' . $className . ') is still busy after 10 runs, check it out!');
			}
		}

		// set counter
		else $counter = 0;

		// increment counter
		$counter++;

		// store content
		SpoonFile::setContent($path, $counter, true, false);

		// if the cronjob is busy we should NOT proceed
		if($isBusy) exit;
	}

	/**
	 * Set the module, for later use
	 *
	 * @param string $module The module to load.
	 */
	protected function setModule($module)
	{
		$this->module = (string) $module;
	}
}
