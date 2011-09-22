<?php

/**
 * SiteAction
 *
 * This class handles an action
 *
 * @package		site
 * @subpackage	core
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class SiteAction
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
	 * SiteTemplate
	 *
	 * @var	SiteTemplate
	 */
	public $tpl;


	/**
	 * Default constructor
	 * You have to specify the action and module so we know what to do with this instance
	 *
	 * @return	void
	 * @param	string $action		The action.
	 * @param	string $module		The module.
	 */
	public function __construct($action, $module)
	{
		// grab stuff from the reference and store them in this object (for later/easy use)
		$this->tpl = Spoon::get('template');

		// set properties
		$this->setModule((string) $module);
		$this->setAction((string) $action);

		// show module
		$this->tpl->assign('is' . SpoonFilter::toCamelCase($module), true);

		// execute the action
		$this->execute();
	}


	/**
	 * Execute the action
	 * We will build the classname, require the class and call the execute method.
	 *
	 * @return	void
	 */
	public function execute()
	{
		// build action-class-name
		$actionClassName = SpoonFilter::toCamelCase($this->getModule() . '_' . $this->getAction());

		// check if this is a possible action
		if(!SpoonFile::exists(PATH_WWW . '/modules/' . $this->getModule() . '/actions/' . $this->getAction() . '.php'))
		{
			// set headers
			SpoonHTTP::setHeadersByCode(404);

			// show the template
			$this->tpl->display(PATH_WWW . '/core/layout/templates/error.tpl');
			exit();
		}

		// require the config file, we know it is there because we validated it before (possible actions are defined by existance off the file).
		require_once PATH_WWW . '/modules/' . $this->getModule() . '/actions/' . $this->getAction() . '.php';

		// validate if class exists (aka has correct name)
		if(!class_exists($actionClassName)) throw new Exception('The actionfile is present, but the classname should be: ' . $actionClassName . '.');

		// create action-object
		$object = new $actionClassName();

		// call the execute method of the real action (defined in the module)
		$object->execute();
	}


	/**
	 * Get the current action
	 * REMARK: You should not use this method from your code, but it has to be public so we can access it later on in the core-code
	 *
	 * @return	string
	 */
	public function getAction()
	{
		return (string) $this->action;
	}


	/**
	 * Get the current module
	 * REMARK: You should not use this method from your code, but it has to be public so we can access it later on in the core-code
	 *
	 * @return	string
	 */
	public function getModule()
	{
		return (string) $this->module;
	}


	/**
	 * Set the action
	 *
	 * @return	void
	 * @param	string $action	The action.
	 */
	private function setAction($action)
	{
		$this->action = (string) $action;
	}


	/**
	 * Set the module
	 *
	 * @return	void
	 * @param	string $module	The module.
	 */
	private function setModule($module)
	{
		$this->module = (string) $module;
	}
}


/**
 * BaseAction
 *
 * This class implements a lot of functionality that can be extended by a specific action
 *
 * @package		site
 * @subpackage	core
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class SiteBaseAction
{
	/**
	 * The current action
	 *
	 * @var	string
	 */
	protected $action;


	/**
	 * The current user.
	 *
	 * @var	User
	 */
	protected $currentUser;


	/**
	 * The current module
	 *
	 * @var	string
	 */
	protected $module;


	/**
	 * A reference to the current template
	 *
	 * @var	SiteTemplate
	 */
	public $tpl;


	/**
	 * A reference to the url-instance
	 *
	 * @var	SiteURL
	 */
	public $url;


	/**
	 * Default constructor
	 * The constructor will set some properties. It populates the parameter array with urldecoded values for easy-use.
	 *
	 * @return	void
	 */
	public function __construct()
	{
		// get objects from the reference so they are accessable from the action-object
		$this->tpl = Spoon::get('template');
		$this->url = Spoon::get('url');

		// do the login magic
		$this->currentUser = Authentication::getLoggedInUser();

		// assign if there is a valid user
		if($this->currentUser != false)
		{
			// assign
			$this->tpl->assign('currentUser', $this->currentUser->toArray());
		}

		// store the current module and action (we grab them from the url)
		$this->setModule($this->url->getModule());
		$this->setAction($this->url->getAction());

		// assign option
		$this->tpl->assign('is' . SpoonFilter::toCamelCase($this->url->getModule()), true);

		// require the model if it exists
		if(SpoonFile::exists(PATH_WWW . '/modules/' . $this->getModule() . '/model/model.php')) require_once PATH_WWW . '/modules/' . $this->getModule() . '/model/model.php';
	}


	/**
	 * Display, this wil output the template to the browser
	 * If no template is specified we build the path form the current module and action
	 *
	 * @return	void
	 * @param	string[optional] $template	The template to display.
	 */
	public function display($template = null)
	{
		// if no template is specified we have to build the path ourself
		if($template === null) $template = PATH_WWW . '/modules/' . $this->url->getModule() . '/layout/templates/' . $this->url->getAction() . '.tpl';

		// redirect to eror page
		if(!SpoonFile::exists($template)) $this->redirect($this->url->buildUrl('index', 'error'), 301);

		// display
		$this->tpl->display($template);
	}


	/**
	 * Execute the action
	 *
	 * @return	void
	 */
	public function execute()
	{
	}


	/**
	 * Get the action
	 *
	 * @return	string
	 */
	public function getAction()
	{
		return (string) $this->action;
	}


	/**
	 * Get the module
	 *
	 * @return	string
	 */
	public function getModule()
	{
		return (string) $this->module;
	}


	/**
	 * Parse reports
	 *
	 * @return	void
	 */
	public function parseReports()
	{
		// report provided in url?
		$report = SpoonFilter::getGetValue('report', null, '');
		if($report != '')
		{
			// get message
			$message = SiteLocale::msg(SpoonFilter::toCamelCase($this->url->getModule() . '-' . $report , '-'));

			// any vars?
			$var = SpoonFilter::getGetValue('var', null, '');
			if($var != '') $message = vsprintf($message, $var);

			// assign
			$this->tpl->assign('report', $message);
		}
	}


	/**
	 * Redirect to a given url
	 *
	 * @return	void
	 * @param	string $url				The URL to redirect to.
	 * @param	int[optional] $code		The redirect code, default is 307 (temporary), other possibilities are: 301 (permanent), 302 (found).
	 */
	public function redirect($url, $code = 307)
	{
		SpoonHTTP::redirect((string) $url, (int) $code);
	}


	/**
	 * Set the action, for later use
	 *
	 * @return	void
	 * @param	string $action	The action.
	 */
	private function setAction($action)
	{
		$this->action = (string) $action;
	}


	/**
	 * Set the module, for later use
	 *
	 * @return	void
	 * @param	string $module	The module.
	 */
	private function setModule($module)
	{
		$this->module = (string) $module;
	}
}

?>