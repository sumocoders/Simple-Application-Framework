<?php

/**
 * AjaxAction
 *
 * This class handles an AJAX action
 *
 * @package		site
 * @subpackage	core
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class AjaxAction
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
	 * Default constructor
	 * You have to specify the action and module so we know what to do with this instance
	 *
	 * @return	void
	 * @param	string $action	The action.
	 * @param	string $module	The module.
	 */
	public function __construct($action, $module)
	{
		// set properties
		$this->setModule((string) $module);
		$this->setAction((string) $action);

		// require the model if it exists
		if(SpoonFile::exists(PATH_WWW . '/modules/' . $this->getModule() . '/model/model.php')) require_once PATH_WWW . '/modules/' . $this->getModule() . '/model/model.php';

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
		$actionClassName = SpoonFilter::toCamelCase('ajax_' . $this->getModule() . '_' . $this->getAction());

		// check if this is a possible action
		if(!SpoonFile::exists(PATH_WWW . '/modules/' . $this->getModule() . '/ajax/' . $this->getAction() . '.php'))
		{
			// set headers
			SpoonHTTP::setHeadersByCode(404);

			// return
			$response['code'] = 500;
			$response['message'] = 'file not found';

			// output
			echo json_encode($response);
			exit;
		}

		// require the config file, we know it is there because we validated it before (possible actions are defined by existance off the file).
		require_once PATH_WWW . '/modules/' . $this->getModule() . '/ajax/' . $this->getAction() . '.php';

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
class AjaxBaseAction
{
	/**
	 * Execute the action
	 *
	 * @return	void
	 */
	public function execute()
	{
	}
}

?>