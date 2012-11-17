<?php

/**
 * UsersEdit
 *
 * @package		users
 * @subpackage	edit
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class UsersEdit extends SiteBaseAction
{
	/**
	 * The form
	 *
	 * @var	SiteForm
	 */
	private $frm;


	/**
	 * The current id
	 *
	 * @var	int
	 */
	private $id;


	/**
	 * The item
	 *
	 * @var	User
	 */
	private $item;


	/**
	 * Execute the action
	 *
	 * @return void
	 */
	public function execute()
	{
		// check if admin
		if(!$this->currentUser->isAdmin)
		{
			$this->redirect(
				$this->url->buildUrl('index', 'error', null, array('code' => 403, 'message' => 'forbidden')),
				403
			);
		}

		// id availabe
		$this->id = $this->url->getParameter(1, 'int');

		// no id?
		if($this->id == '')
		{
			$this->redirect(
				$this->url->buildUrl('index', null, null, array('error' => 'invalid-record'))
			);
		}

		// get item
		$this->item = User::get($this->id);

		// validate
		if($this->item === false)
		{
			$this->redirect(
				$this->url->buildUrl('index', null, null, array('error' => 'invalid-record'))
			);
		}

		// load the form
		$this->loadForm();

		// validate the form
		$this->validateForm();

		// parse
		$this->frm->parse($this->tpl);

		// assign
		$this->tpl->assign('item', $this->item->toArray());

		// display the page
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
		$this->frm = new SiteForm('edit');

		// create elements
		$this->frm->addText('email', $this->item->email)->setAttributes(array('type' => 'email', 'required' => null));
		$this->frm->addText('name', $this->item->name)->setAttributes(array('required' => null));
		$this->frm->addPassword('password')->setAttributes(array('autocomplete' => 'off'));
		$this->frm->addDropdown('type', array('user' => 'user', 'admin' => 'admin'), $this->item->type);
	}

	/**
	 * Validate the form
	 *
	 * @return void
	 */
	private function validateForm()
	{
		// submitted?
		if($this->frm->isSubmitted())
		{
			// validate required fields
			$this->frm->getField('email')->isEmail(SiteLocale::err('EmailIsInvalid'));
			$this->frm->getField('name')->isFilled(SiteLocale::err('FieldIsRequired'));

			// no errors?
			if($this->frm->isCorrect())
			{
				// set properties
				$this->item->name = $this->frm->getField('name')->getValue();
				$this->item->email = $this->frm->getField('email')->getValue();
				$this->item->type = $this->frm->getField('type')->getValue();

				if($this->frm->getField('password')->isFilled())
				{
					$this->item->secret = md5(uniqid());
					$this->item->rawPassword = $this->frm->getField('password')->getValue();
				}

				// save
				$this->item->save();

				// redirect
				$this->redirect(
					$this->url->buildUrl(
						'index', null, null,
						array('report' => 'edited', 'var' => $this->item->name, 'id' => $this->item->id)
					)
				);
			}

			// show general error
			else $this->tpl->assign('form' . SpoonFilter::toCamelCase($this->frm->getName()) . 'HasError', true);
		}
	}
}
