<?php

/**
 * UsersIndex
 *
 * @package        users
 * @subpackage     index
 *
 * @author         Tijs Verkoyen <tijs@sumocoders.be>
 * @since          1.0
 */
class UsersIndex extends SiteBaseAction
{
    /**
     * Execute the action
     */
    public function execute()
    {
        $this->parseReports();
        $this->parse();
        $this->display();
    }

    /**
     * Parse
     */
    private function parse()
    {
        // check if admin
        if (!$this->currentUser->isAdmin()) {
            Site::displayError('Forbidden', 403);
        }

        $dataGrid = new SiteDataGridDB(
            'SELECT id, email, name
             FROM users'
        );
        $dataGrid->addColumn(
            'edit',
            '',
            ucfirst(SiteLocale::lbl('Edit')),
            $this->url->buildUrl('edit', null, '[id]'),
            null,
            null,
            null,
            true
        );

        // assign
        if ($dataGrid->getContent() != '') {
            $this->tpl->assign('dataGrid', $dataGrid->getContent());
        }
    }
}
