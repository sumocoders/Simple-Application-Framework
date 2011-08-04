<?php

/**
 * UsersIndex
 *
 * @package		users
 * @subpackage	index
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class UsersLogin extends SiteBaseAction
{
	/**
	 * Form instance
	 *
	 * @var	SiteForm
	 */
	private $frm;


	/**
	 * Execute the action
	 *
	 * @return	void
	 */
	public function execute()
	{
		// load the form
		$this->loadForm();

		// validate the form
		$this->validateForm();

		// parse reports
		$this->parseReports();

		// parse
		$this->frm->parse($this->tpl);

		// display the page
		$this->display();
	}


	/**
	 * Load the form
	 *
	 * @return	void
	 */
	private function loadForm()
	{
		// create form
		$this->frm = new SiteForm('login');

		// create elements
		$this->frm->addText('login')->setAttributes(array('type' => 'email', 'required' => null));
		$this->frm->addPassword('password')->setAttributes(array('required' => null));
	}


	/**
	 * Validate the form
	 *
	 * @return	void
	 */
	private function validateForm()
	{
		if($this->frm->isSubmitted())
		{
			// validate required fields
			$this->frm->getField('login')->isFilled('Dit veld is verplicht');
			$this->frm->getField('password')->isFilled('Dit veld is verplicht');

			// get db
			$db = Site::getDB(true);

			// get secret
			$user = $db->getRecord('SELECT i.* FROM users AS i WHERE i.email = ?', array($this->frm->getField('login')->getValue()));

			if($user == null)
			{
				$this->tpl->assign('error', true);
				$this->frm->getField('login')->addError('&nbsp;');
			}

			else
			{
				if($user['password'] != sha1(md5($this->frm->getField('password')->getValue()) . $user['secret']))
				{
					$this->tpl->assign('error', true);
					$this->frm->getField('login')->addError('&nbsp;');
				}
			}

			// no errors
			if($this->frm->isCorrect())
			{
				// build item
				$item['session_id'] = SpoonSession::getSessionId();
				$item['user_id'] = $user['id'];
				$item['edited_on'] = Site::getUTCDate();

				// insert new session
				$db->insert('users_sessions', $item);

				// redirect
				$this->redirect(SpoonFilter::getGetValue('redirect', null, '/'));
			}
		}
	}
}

?>