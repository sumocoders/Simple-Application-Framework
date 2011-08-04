<?php

/**
 * This class handles authentication
 *
 * @package		site
 * @subpackage	core
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class Authentication
{
	/**
	 * Get the logged in user.
	 *
	 * @return	User
	 */
	public static function getLoggedInUser()
	{
		// get db
		$db = Site::getDB(true);

		// delete old sessions
		$db->delete('users_sessions', 'edited_on < ?', array(Site::getUTCDate(null, (time() - (2 * 60 * 60)))));

		// search for session
		$data = $db->getRecord('SELECT u.id, u.name, u.email, u.secret, u.type, u.data
								FROM users_sessions AS i
								INNER JOIN users AS u ON i.user_id = u.id
								WHERE i.session_id = ? AND i.edited_on > ?',
								array(SpoonSession::getSessionId(), Site::getUTCDate(null, (time() - (2 * 60 * 60)))));

		// no data, so redirect to login
		if($data !== null)
		{
			// create instance
			$user = new User();

			// initialize
			$user->initialize($data);

			// return
			return $user;
		}

		else
		{
			// reset session
			SpoonSession::destroy();
			session_regenerate_id(true);

			$url = Spoon::get('url');

			// not login page
			if($url->getModule() != 'users') $this->redirect($url->buildUrl('login', 'users', null, array('redirect' => '/' . $url->getQueryString())), 403);

			// not logout
			elseif($url->getAction() != 'logout' && $url->getAction() != 'login')
			{
				SpoonHTTP::redirect($url->buildUrl('login', 'users', null, array('redirect' => '/' . $url->getQueryString())), 403);
			}
		}
	}


	/**
	 * Log out the user
	 *
	 * @return	void
	 */
	public static function logout()
	{
		// delete session
		Site::getDB(true)->delete('users_sessions', 'session_id = ?', SpoonSession::getSessionId());

		// destroy
		SpoonSession::destroy();
		session_regenerate_id(true);
	}
}

?>