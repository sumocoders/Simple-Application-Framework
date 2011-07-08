<?php

/**
 * SiteURL
 *
 * This class will handle the incomming url.
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
	 * The querystring
	 *
	 * @var	string
	 */
	private $queryString;


	/**
	 * Default constructor
	 *
	 * @return	void
	 */
	public function __construct()
	{
		// add ourself to the reference so other classes can retrieve us
		Spoon::set('url', $this);

		// set query-string for later use
		$this->setQueryString($_SERVER['REQUEST_URI']);

		// set host for later use
		$this->setHost($_SERVER['HTTP_HOST']);

		// process url
		$this->processQueryString();
	}


	/**
	 * Add a parameter
	 *
	 * @return	void
	 * @param	string $value			The value to add.
	 * @param	string[optional] $key	The key to add the value for.
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
	 * @return	string
	 * @param	string[optional] $action		The action.
	 * @param	string[optional] $module		The module.
	 * @param	string[optional] $append		String that will be appended.
	 * @param	array[optional] $parameters		GET-parameters.
	 * @param	bool[optional] $ignorePaging	Should we ignore the existing paging parameters?
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
	 * @return	string
	 */
	public function getAction()
	{
		return str_replace('-', '_', $this->action);
	}


	/**
	 * Get the host
	 *
	 * @return	string
	 */
	public function getHost()
	{
		return $this->host;
	}


	/**
	 * Get the language
	 *
	 * @return	void
	 */
	public function getLanguage()
	{
		return $this->language;
	}


	/**
	 * Get the current module found in the url
	 *
	 * @return	string
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
	 * @return	mixed
	 * @param	string $key					The index/name of the parameter.
	 * @param	string[optional] $type		The type we should cast to, default is string.
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
					return (string) $this->parameters[$key];

				// invalid type
				default:
					throw new Exception('Invalid type (' . $type . '). Possible values are: ' . implode(', ', $aAllowedTypes)) . '.';
			}
		}

		// fallback
		return null;
	}


	/**
	 * Get the parameters
	 *
	 * @return	array
	 */
	public function getParameters()
	{
		return $this->parameters;
	}


	/**
	 * Get the full querystring
	 *
	 * @return	string
	 */
	public function getQueryString()
	{
		return $this->queryString;
	}


	/**
	 * Process the querystring
	 *
	 * @return	void
	 */
	private function processQueryString()
	{
		// store the querystring local, so we don't alter it.
		$queryString = $this->getQueryString();

		// fix GET-parameters
		$chunks = explode('?', $queryString);

		// are there GET-parameters
		if(isset($chunks[1]))
		{
			// remove from querystring
			$queryString = str_replace('?' . $chunks[1], '', $this->getQueryString());

			// add parameters
			foreach($_GET as $key => $value) $this->addParameter($value, $key);
		}

		$queryString = trim($queryString, '/');

		// split into chunks, a url will always look like /<language>/<module>/<action>(?GET)
		if($queryString == '') $aChunks = array();
		else $chunks = (array) explode('/', $queryString);

		// nothing provided
		if(empty($chunks)) SpoonHTTP::redirect('/' . SiteLocale::getPreferedLanguage(), 301);

		// get the language,
		$this->setLanguage((isset($chunks[0]) && $chunks[0] != '') ? $chunks[0] : SiteLocale::getPreferedLanguage());

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
	 * @return	void
	 * @param	string $action	The action.
	 */
	private function setAction($action)
	{
		$this->action = (string) $action;
	}


	/**
	 * Set the host
	 *
	 * @return	void
	 * @param	string $host	The host.
	 */
	private function setHost($host)
	{
		$this->host = (string) $host;
	}


	/**
	 * Set the language
	 *
	 * @return	void
	 * @param	string $language	The language.
	 */
	public function setLanguage($language)
	{
		// validate language
		if(!in_array($language, SiteLocale::$possibleLanguages)) SpoonHTTP::redirect('/' . SiteLocale::getPreferedLanguage() . '/' . $this->getQueryString());

		// store language
		$this->language = (string) $language;

		// set locale
		SiteLocale::setLocale($language);
	}


	/**
	 * Set the current module
	 *
	 * @return	void
	 * @param	string $module	The module.
	 */
	public function setModule($module)
	{
		// does the module exists
		if(!SpoonDirectory::exists(PATH_WWW . '/modules/' . $module)) SpoonHTTP::redirect('/' . $this->getLanguage() . '/error?msg=invalid-module', 404);

		$this->module = (string) $module;
	}


	/**
	 * Set the querystring
	 *
	 * @return	void
	 * @param	string $queryString		The full querystring.
	 */
	private function setQueryString($queryString)
	{
		$this->queryString = trim((string) $queryString, '/');
	}
}

?>