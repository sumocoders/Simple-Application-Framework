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
class UsersForgotPassword extends SiteBaseAction
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


        if(SpoonFilter::getGetValue('sent', null, null) != 'true')
        {
            $this->loadForm();
            $this->validateForm();
            $this->frm->parse($this->tpl);
        }

		$this->parseReports();
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
		$this->frm = new SiteForm('forgotPassword');

		// create elements
		$this->frm->addText('email')->setAttributes(array('type' => 'email', 'required' => null));
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
			$this->frm->getField('email')->isEmail(SiteLocale::err('EmailIsInvalid'));

			try {
				$user = User::getByEmail($this->frm->getField('email')->getValue());

				if ($user->isBlocked()) {
					$this->frm->getField('email')->addError(SiteLocale::err('BlockedUser'));
				}
			} catch (InvalidArgumentException $e) {
                $this->tpl->assign('error', true);
                $this->frm->getField('email')->addError('&nbsp;');
			}

			// no errors
			if($this->frm->isCorrect())
			{
                $hash = Site::generatePassword(64);
                Site::getDB(true)->update('users', array('forgot_password' => $hash), 'id = ?', $user->getId());

                $resetURL = SITE_URL . $this->url->buildUrl('reset_password', 'users', '', array('token' => $hash));

                $message = new Swift_Message(SiteLocale::msg('UsersForgotPasswordSubject'));
                $message->setFrom('noreply@sumocoders.be');
                $message->setTo($this->frm->getField('email')->getValue());
                $message->setBody(SiteLocale::msg('UsersForgotPasswordBody')  . '<br/><br/><a href="' . $resetURL . '">' . $resetURL . '</a>', 'text/html');

                Site::sendMail($message);

				// redirect
				$this->redirect($this->url->buildUrl('forgot_password', null, '', array('sent' => 'true', 'report' => 'forgot-password-email-sent')));
			}
		}
	}
}
