<?php

/**
 * SiteURL
 *
 * This class will handle the incoming url.
 *
 * @package		site
 * @subpackage	url
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class SiteURL
{
	/**
	 * The current action
	 *
	 * @var	string
	 */
	private $action;


	/**
	 * The host, will be used for cookies
	 *
	 * @var	string
	 */
	private $host;


	/**
	 * The current language
	 *
	 * @var	string
	 */
	private $language;


	/**
	 * The current module
	 *
	 * @var	string
	 */
	private $module;


	/**
	 * The parameters
	 *
	 * @var	array
	 */
	private $parameters = array();


	/**
	 * The query string
	 *
	 * @var	string
	 */
	private $queryString;


	/**
	 * Default constructor
	 */
	public function __construct()
	{
		// add our self to the reference so other classes can retrieve us
		Spoon::set('url', $this);

		// set query-string for later use
		$this->setQueryString($_SERVER['REQUEST_URI']);

		// set host for later use
		$this->setHost($_SERVER['HTTP_HOST']);

		$isAjax = (substr($this->getQueryString(), 0, 8) == 'ajax.php');

		// process url
		if($isAjax)
		{
			$language = SpoonFilter::getGetValue('language', SiteLocale::$possibleLanguages, '');
			$this->setLanguage($language);
		}
		else $this->processQueryString();
	}

	/**
	 * Add a parameter
	 *
	 * @param	string $value			The value to add.
	 * @param	string[optional] $key	The key to add the value for.
	 * @return void
	 */
	private function addParameter($value, $key = null)
	{
		// key provided?
		if($key !== null) $this->parameters[$key] = $value;

		// fallback
		else $this->parameters[] = $value;
	}

	/**
	 * Build an url
	 *
	 * @param	string[optional] $action		The action.
	 * @param	string[optional] $module		The module.
	 * @param	string[optional] $append		String that will be appended.
	 * @param	array[optional] $parameters		GET-parameters.
	 * @param	bool[optional] $ignorePaging	Should we ignore the existing paging parameters?
	 * @return string
	 */
	public function buildUrl($action = null, $module = null, $append = '', $parameters = null, $ignorePaging = false)
	{
		// redefine
		$action = ($action !== null) ? (string) $action : $this->getAction();
		$module = ($module !== null) ? (string) $module : $this->getModule();
		$append = (string) $append;
		$parameters = ($parameters !== null) ? (array) $parameters : null;
		$ignorePaging = (bool) $ignorePaging;

		if(!$ignorePaging)
		{
			// paging stuff?
			if(isset($_GET['offset'])) $parameters['offset'] = (int) $_GET['offset'];
			if(isset($_GET['order'])) $parameters['order'] = (string) $_GET['order'];
			if(isset($_GET['sort'])) $parameters['sort'] = SpoonFilter::getGetValue('sort', array('asc', 'desc'), 'asc');
		}

		// replace underscores with dashes for nice urls
		$action = str_replace('_', '-', $action);

		// build urls
		$url = '/' . $this->getLanguage() . '/' . $module . '/' . $action;

		// append stuff
		if($append != '') $url .= '/' . $append;

		if($parameters != null)
		{
			if(strpos($url, '?') > 0) $url .= '&' . http_build_query($parameters);
			else $url .= '?' . http_build_query($parameters);
		}

		// return
		return $url;
	}

	/**
	 * Get the current action found in the url
	 *
	 * @return string
	 */
	public function getAction()
	{
		return str_replace('-', '_', $this->action);
	}

	/**
	 * Get the host
	 *
	 * @return string
	 */
	public function getHost()
	{
		return $this->host;
	}

	/**
	 * Get the language
	 *
	 * @return string
	 */
	public function getLanguage()
	{
		return $this->language;
	}

	/**
	 * Get the current module found in the url
	 *
	 * @return string
	 */
	public function getModule()
	{
		return $this->module;
	}

	/**
	 * Get a parameter for a given key
	 * The function will return null if the key is not available
	 *
	 * By default we will cast the return value into a string, if you want something else specify it by passing the wanted type.
	 * Possible values are: bool, boolean, int, integer, float, double, string, array
	 *
	 * @param	string $key					The index/name of the parameter.
	 * @param	string[optional] $type		The type we should cast to, default is string.
	 * @return mixed
	 */
	public function getParameter($key, $type = 'string')
	{
		// init var
		$aAllowedTypes = array('bool', 'boolean',
								'int', 'integer',
								'float', 'double',
								'string',
								'array');

		// redefine
		$key = (string) $key;
		$type = (string) $type;

		// is this parameter available
		if(isset($this->parameters[$key]))
		{
			// cast it
			switch($type)
			{
				// boolean
				case 'bool':
				case 'boolean':
					return (bool) $this->parameters[$key];

				// integer
				case 'int':
				case 'integer':
					return (int) $this->parameters[$key];

				// float
				case 'float':
				case 'double':
					return (float) $this->parameters[$key];

				// string
				case 'string':
					return (string) $this->parameters[$key];

				// array
				case 'array':
					return (array) $this->parameters[$key];

				// invalid type
				default:
					throw new Exception('Invalid type (' . $type . '). Possible values are: ' . implode(', ', $aAllowedTypes) . '.');
			}
		}

		// fallback
		return null;
	}

	/**
	 * Get the parameters
	 *
	 * @return array
	 */
	public function getParameters()
	{
		return $this->parameters;
	}

	/**
	 * Get the full query string
	 *
	 * @return string
	 */
	public function getQueryString()
	{
		return $this->queryString;
	}

	/**
	 * Process the query string
	 *
	 * @return void
	 */
	private function processQueryString()
	{
		// store the query string local, so we don't alter it.
		$queryString = $this->getQueryString();

		// fix GET-parameters
		$chunks = explode('?', $queryString);

		// are there GET-parameters
		if(isset($chunks[1]))
		{
			foreach($_GET as $key => $value) $this->addParameter($value, $key);
		}

		// split into chunks, a url will always look like /<language>/<module>/<action>(?GET)
		if(!isset($chunks[0]) || $chunks[0] == '') $chunks = array();
		else $chunks = (array) explode('/', $chunks[0]);

		// nothing provided
		if(empty($chunks)) SpoonHTTP::redirect('/' . SiteLocale::getPreferredLanguage(), 301);

		// get the language,
		$this->setLanguage((isset($chunks[0]) && $chunks[0] != '') ? $chunks[0] : SiteLocale::getPreferredLanguage());

		// get the module, null will be the default
		$this->setModule((isset($chunks[1]) && $chunks[1] != '') ? $chunks[1] : 'example'); // @todo

		// get the requested action, index will be our default action
		$this->setAction((isset($chunks[2]) && $chunks[2] != '') ? $chunks[2] : 'index');

		// loop chunks and add them to the parameter list
		foreach($chunks as $key => $value)
		{
			if($key != 0 && $key != 1) $this->addParameter($value);
		}
	}

	/**
	 * Set the current action
	 *
	 * @param	string $action	The action.
	 * @return void
	 */
	private function setAction($action)
	{
		$this->action = (string) $action;
	}

	/**
	 * Set the host
	 *
	 * @param	string $host	The host.
	 * @return void
	 */
	private function setHost($host)
	{
		$this->host = (string) $host;
	}

	/**
	 * Set the language
	 *
	 * @param	string $language	The language.
	 * @return void
	 */
	public function setLanguage($language)
	{
		// validate language
		if(!in_array($language, SiteLocale::$possibleLanguages)) SpoonHTTP::redirect('/' . SiteLocale::getPreferredLanguage() . '/' . $this->getQueryString());

		// store language
		$this->language = (string) $language;

		// set locale
		SiteLocale::setLocale($language);
	}

	/**
	 * Set the current module
	 *
	 * @param	string $module	The module.
	 * @return void
	 */
	public function setModule($module)
	{
		// does the module exists
		if(!SpoonDirectory::exists(PATH_WWW . '/modules/' . $module)) {
			new SiteTemplate();
			$this->module = 'invalid';
			Site::displayError(SiteLocale::err('InvalidModule'), 404);
		}

		$this->module = (string) $module;
	}

	/**
	 * Set the query string
	 *
	 * @param	string $queryString		The full query string.
	 * @return void
	 */
	private function setQueryString($queryString)
	{
		$this->queryString = trim((string) $queryString, '/');
	}
}
