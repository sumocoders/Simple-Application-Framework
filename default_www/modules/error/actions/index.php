<?php

/**
 * ErrorIndex
 *
 * @package		error
 * @subpackage	index
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class ErrorIndex extends SiteBaseAction
{
	/**
	 * Execute the action
	 *
	 * @return	void
	 */
	public function execute()
	{
		// parse
		$this->parse();

		// display the page
		$this->display();
	}


	/**
	 * Parse the page
	 *
	 * @return	void
	 */
	private function parse()
	{
		// build the key
		$key = SpoonFilter::toCamelCase($this->url->getParameter('message'), '-');

		// reset if needed
		if($key == '') $key = 'GeneralError';

		// assign the correct error
		$this->tpl->assign('error', SiteLocale::err($key));

		// set headers
		SpoonHTTP::setHeadersByCode(SpoonFilter::getGetValue('code', null, 500));
	}
}

?>