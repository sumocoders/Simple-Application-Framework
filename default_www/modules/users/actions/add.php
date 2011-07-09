<?php

/**
 * UsersAdd
 *
 * @package		users
 * @subpackage	add
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class UsersAdd extends SiteBaseAction
{
	/**
	 * The form
	 *
	 * @var	SpoonForm
	 */
	private $frm;


	/**
	 * Execute the action
	 *
	 * @return	void
	 */
	public function execute()
	{
		// check if admin
		if(!$this->currentUser->isAdmin) $this->redirect($this->url->buildUrl('index', 'error', null, array('code' => 403, 'message' => 'forbidden')), 403);

		// load the form
		$this->loadForm();

		// validate the form
		$this->validateForm();

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
		$this->frm = new SpoonForm('add');

		// create elements
		$this->frm->addText('email')->setAttributes(array('type' => 'email', 'required' => null));
		$this->frm->addText('name')->setAttributes(array('required' => null));
		$this->frm->addPassword('password')->setAttributes(array('autocomplete' => 'off', 'required' => null));
		$this->frm->addDropdown('type', array('user' => 'user', 'admin' => 'admin'))->setAttributes(array('required' => null));
	}


	/**
	 * Validate the form
	 *
	 * @return	void
	 */
	private function validateForm()
	{
		// submitted?
		if($this->frm->isSubmitted())
		{
			// validate required fields
			$this->frm->getField('email')->isEmail(SiteLocale::err('EmailIsInvalid'));
			$this->frm->getField('name')->isFilled(SiteLocale::err('FieldIsRequired'));
			$this->frm->getField('password')->isFilled(SiteLocale::err('FieldIsRequired'));

			// no errors?
			if($this->frm->isCorrect())
			{
				// create new user
				$item = new User();

				// set properties
				$item->name = $this->frm->getField('name')->getValue();
				$item->email = $this->frm->getField('email')->getValue();
				$item->secret = md5(uniqid());
				$item->rawPassword = $this->frm->getField('password')->getValue();
				$item->type = $this->frm->getField('type')->getValue();

				// save
				$item->save();

				// redirect
				$this->redirect($this->url->buildUrl('index', null, null, array('report' => 'added', 'var' => $item->name, 'id' => $item->id)));
			}

			// show general error
			else $this->tpl->assign('form' . SpoonFilter::toCamelCase($this->frm->getName()) . 'HasError', true);
		}
	}
}

?>