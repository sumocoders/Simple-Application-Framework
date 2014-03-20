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
class UsersResetPassword extends SiteBaseAction
{
	/**
	 * Form instance
	 *
	 * @var	SiteForm
	 */
	private $frm;

    /**
     * The current user
     *
     * @var User
     */
    public $user;


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

        $hash = SpoonFilter::getGetValue('token', null, null);
        if($hash == null) Site::displayError(SiteLocale::err('PageNotFound'), 404);

        $this->user = User::getByHash($hash);

        if($this->user === false || $this->user === 'blocked')
        {
            Site::displayError(SiteLocale::err('PageNotFound'), 404);
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
		$this->frm = new SiteForm('resetPassword');

		// create elements
        $this->frm->addPassword('password')->setAttributes(array('autocomplete' => 'off', 'required' => null));
        $this->frm->addPassword('password_confirm')->setAttributes(array('autocomplete' => 'off', 'required' => null));
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
			$this->frm->getField('password')->isFilled(SiteLocale::err('FieldIsRequired'));
			$this->frm->getField('password_confirm')->isFilled(SiteLocale::err('FieldIsRequired'));

			if($this->frm->getField('password')->getValue() != $this->frm->getField('password_confirm')->getValue())
            {
                $this->frm->getField('password_confirm')->addError(SiteLocale::err('PasswordsDontMatch'));
            }

			// no errors
			if($this->frm->isCorrect())
			{
				Authentication::login($this->user);

                $this->user->setSecret(md5(uniqid()));
                $this->user->setRawPassword($this->frm->getField('password')->getValue());

                $this->user->save();

                Site::getDB(true)->update('users', array('forgot_password' => null), 'id = ?', $this->user->getId());

				// redirect
				$this->redirect('/');
			}
		}
	}
}
