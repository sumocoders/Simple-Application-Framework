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
	 * @return void
	 */
	public function execute()
	{
		// redirect if a user is already logged in
		if($this->currentUser != null)
		{
			// grab the url if provided
			$url = SpoonFilter::getGetValue('redirect', null, '/' . $this->url->getLanguage());

			// add a report
			if(substr_count($url, '?') > 0) $url .= '&report=logged-in';
			else $url .= '?report=logged-in';

			// redirect
			$this->redirect($url);
		}

		$this->loadForm();
		$this->validateForm();
		$this->parseReports();
		$this->frm->parse($this->tpl);
		$this->display();
	}

	/**
	 * Load the form
	 *
	 * @return void
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
	 * @return void
	 */
	private function validateForm()
	{
		if($this->frm->isSubmitted())
		{
			// validate required fields
			$this->frm->getField('login')->isFilled('Dit veld is verplicht');
			$this->frm->getField('password')->isFilled('Dit veld is verplicht');

			$user = Authentication::validateLogin(
				$this->frm->getField('login')->getValue(),
				$this->frm->getField('password')->getValue()
			);

			if(!$user) {
				$this->tpl->assign('error', true);
				$this->frm->getField('login')->addError('&nbsp;');
			}

			// no errors
			if($this->frm->isCorrect())
			{
				Authentication::login($user);

				// grab the url if provided
				$url = SpoonFilter::getGetValue('redirect', null, '/' . $this->url->getLanguage());

				// add a report
				if(substr_count($url, '?') > 0) $url .= '&report=logged-in';
				else $url .= '?report=logged-in';

				// redirect
				$this->redirect($url);
			}
		}
	}
}
