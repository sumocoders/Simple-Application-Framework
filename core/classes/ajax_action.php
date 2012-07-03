<?php

/**
 * AjaxAction
 *
 * This class handles an AJAX action
 *
 * @package		site
 * @subpackage	core
 *
 * @author Tijs Verkoyen <tijs@sumocoders.be>
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
	 * @param	string $action	The action.
	 * @param	string $module	The module.
	 * @return void
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
	 * @return void
	 */
	public function execute()
	{
		// build action-class-name
		$actionClassName = SpoonFilter::toCamelCase('ajax_' . $this->getModule() . '_' . $this->getAction());

		if($this->getModule() == 'core') $path = PATH_WWW . '/core/ajax/' . $this->getAction() . '.php';
		else $path = PATH_WWW . '/modules/' . $this->getModule() . '/ajax/' . $this->getAction() . '.php';

		// check if this is a possible action
		if(!SpoonFile::exists($path))
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
		require_once $path;

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
	 * @return string
	 */
	public function getAction()
	{
		return (string) $this->action;
	}

	/**
	 * Get the current module
	 * REMARK: You should not use this method from your code, but it has to be public so we can access it later on in the core-code
	 *
	 * @return string
	 */
	public function getModule()
	{
		return (string) $this->module;
	}

	/**
	 * Set the action
	 *
	 * @param	string $action	The action.
	 * @return void
	 */
	private function setAction($action)
	{
		$this->action = (string) $action;
	}

	/**
	 * Set the module
	 *
	 * @param	string $module	The module.
	 * @return void
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
	const OK = 200;
	const BAD_REQUEST = 400;
	const FORBIDDEN = 403;
	const ERROR = 500;

	/**
	 * Execute the action
	 *
	 * @return void
	 */
	public function execute()
	{
	}

	/**
	 * Output an answer to the browser
	 *
	 * @param int $statusCode The status code for the response, use the available constants. (self::OK, self::BAD_REQUEST, self::FORBIDDEN, self::ERROR).
	 * @param mixed[optional] $data The data to output.
	 * @param string[optional] $message The text-message to send.
	 * @return void
	 */
	public function output($statusCode, $data = null, $message = null)
	{
		// redefine
		$statusCode = (int) $statusCode;
		if($message !== null) $message = (string) $message;

		// create response array
		$response = array('code' => $statusCode, 'data' => $data, 'message' => $message);

		// set correct headers
		SpoonHTTP::setHeadersByCode($statusCode);
		SpoonHTTP::setHeaders('content-type: application/json');

		// output JSON to the browser
		echo json_encode($response);
		exit;
	}
}
