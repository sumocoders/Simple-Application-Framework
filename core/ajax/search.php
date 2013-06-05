<?php

/**
 * AjaxCoreBug
 *
 * @package		core
 * @subpackage	search
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class AjaxCoreSearch extends AjaxBaseAction
{
	/**
	 * Execute the action
	 *
	 * @return void
	 */
	public function execute()
	{
		$q = SpoonFilter::getPostValue('q', null, '');

		if($q != '')
		{
			// get all modules
			$modules = SpoonDirectory::getList(PATH_WWW . '/modules');
			$items = array();

			// loop modules
			foreach($modules as $module)
			{
				$path = PATH_WWW . '/modules/' . $module . '/model/model.php';

				if(SpoonFile::exists($path))
				{
					// require the class
					require_once $path;

					// build class name
					$className = SpoonFilter::toCamelCase($module) . 'Helper';

					// check if search method exists
					if(is_callable(array($className, 'search')))
					{
						$return = (array) call_user_func(array($className, 'search'), $q);

						foreach($return as $row)
						{
							if(!isset($row['module'])) $row['module'] = $module;
							$items[] = $row;
						}
					}
				}
			}

			// return
			$response['code'] = 200;
			$response['message'] = 'ok';
			$response['data'] = $items;
		}
		else
		{
			// return
			$response['code'] = 400;
			$response['message'] = 'no query';
		}

		// output
		SpoonHTTP::setHeaders(array('Content-Type: application/json'));
		echo json_encode($response);
		exit;
	}
}
