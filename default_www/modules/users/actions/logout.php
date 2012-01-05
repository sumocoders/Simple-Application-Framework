<?php

/**
 * UsersLogout
 *
 * @package		users
 * @subpackage	logout
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class UsersLogout extends SiteBaseAction
{
	/**
	 * Execute the action
	 *
	 * @return void
	 */
	public function execute()
	{
		// logout
		Authentication::logout();

		// redirect
		$this->redirect($this->url->buildUrl('login', 'users', null, array('report' => 'logged-out')));
	}
}
