<?php

/**
 * ExampleIndex
 *
 * @package		example
 * @subpackage	index
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class ExampleIndex extends SiteBaseAction
{
	/**
	 * Execute the action
	 */
	public function execute()
	{
		$this->parseReports();
		$this->display();
	}
}
