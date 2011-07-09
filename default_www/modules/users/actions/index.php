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
class UsersIndex extends SiteBaseAction
{
	/**
	 * Execute the action
	 *
	 * @return	void
	 */
	public function execute()
	{
		// show reports
		$this->parseReports();

		// parse
		$this->parse();

		// display the page
		$this->display();
	}


	/**
	 * Parse
	 *
	 * @return	void
	 */
	private function parse()
	{
		// check if admin
		if(!$this->currentUser->isAdmin) $this->redirect($this->url->buildUrl('index', 'error', null, array('code' => 403, 'message' => 'forbidden')), 403);

		// create datagrid
		$datagrid = new SiteDataGridDB('SELECT id, email, name
										FROM users');

		// add columns
		$datagrid->addColumn('edit', '', SiteLocale::lbl('Edit'), $this->url->buildUrl('edit', null, '[id]'));
			$datagrid->setColumnAttributes('edit', array('class' => 'action icon edit'));

		// assign
		if($datagrid->getContent() != '') $this->tpl->assign('datagrid', $datagrid->getContent());
	}
}

?>