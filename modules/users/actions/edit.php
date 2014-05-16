<?php

/**
 * UsersEdit
 *
 * @package        users
 * @subpackage     edit
 *
 * @author         Tijs Verkoyen <tijs@sumocoders.be>
 * @since          1.0
 */
class UsersEdit extends SiteBaseAction
{
    /**
     * The form
     *
     * @var    SiteForm
     */
    private $frm;

    /**
     * The current id
     *
     * @var    int
     */
    private $id;

    /**
     * The item
     *
     * @var    User
     */
    private $item;

    /**
     * Execute the action
     */
    public function execute()
    {
        $this->showErrorIfRequiredUrlParametersNotProvided(
            array(
                'id'
            )
        );

        $this->id = $this->url->getParameter(1, 'int');
        // check if admin or editing yourself
        if (!$this->currentUser->isAdmin() && $this->currentUser->getId() != $this->id) {
            Site::displayError('Forbidden', 403);
        }

        // get item
        try {
            $this->item = User::get($this->id);
        } catch (Exception $e) {
            Site::displayError('Page not found', 404);
        }

        $this->loadForm();
        $this->validateForm();
        $this->parse();
        $this->display();
    }

    /**
     * Load the form
     */
    private function loadForm()
    {
        // create form
        $this->frm = new SiteForm('edit');

        // create elements
        $this->frm->addText('email', $this->item->getEmail())->setAttributes(
            array('type' => 'email', 'required' => null)
        );
        $this->frm->addText('name', $this->item->getName())->setAttributes(array('required' => null));
        $this->frm->addPassword('password')->setAttributes(array('autocomplete' => 'off'));
        $this->frm->addDropdown('type', User::getPossibleTypesForDropdown(), $this->item->getType());

        if ($this->currentUser->isAdmin()) {
            $this->frm->addCheckbox('blocked', ($this->item->isBlocked()));
            if ($this->item->getId() == $this->currentUser->getId()) {
                $this->frm->getField('blocked')->setAttributes(array('disabled' => 'disabled'));
            }
        }
    }

    /**
     * Parse the form
     */
    private function parse()
    {
        $this->frm->parse($this->tpl);
        $this->tpl->assign('item', $this->item->toArray());
        $this->tpl->assign('isAdmin', $this->currentUser->isAdmin());
    }

    /**
     * Validate the form
     */
    private function validateForm()
    {
        // submitted?
        if ($this->frm->isSubmitted()) {
            // validate required fields
            $this->frm->getField('email')->isEmail(SiteLocale::err('EmailIsInvalid'));
            $this->frm->getField('name')->isFilled(SiteLocale::err('FieldIsRequired'));

            // no errors?
            if ($this->frm->isCorrect()) {
                // set properties
                $this->item->setName($this->frm->getField('name')->getValue());
                $this->item->setEmail($this->frm->getField('email')->getValue());

                if ($this->frm->getField('password')->isFilled()) {
                    $this->item->setSecret(md5(uniqid()));
                    $this->item->setRawPassword($this->frm->getField('password')->getValue());
                }

                if ($this->currentUser->isAdmin()) {
                    $this->item->setType($this->frm->getField('type')->getValue());
                    $this->item->setBlocked($this->frm->getField('blocked')->getChecked());

                    if ($this->item->isBlocked() && $this->item->getBlockedOn() === null) {
                        $this->item->setBlockedOn(new DateTime());
                    }
                }

                // save
                $this->item->save();

                if ($this->currentUser->isAdmin()) {
                    // redirect
                    $this->redirect(
                        $this->url->buildUrl(
                            'index',
                            null,
                            null,
                            array('report' => 'edited', 'var' => $this->item->getName(), 'id' => $this->item->getId())
                        )
                    );
                }

                // redirect
                $this->redirect(
                    $this->url->buildUrl(
                        'edit',
                        null,
                        $this->item->getId(),
                        array('report' => 'edited', 'var' => $this->item->getName(), 'id' => $this->item->getId())
                    )
                );
            }
        }
    }
}
