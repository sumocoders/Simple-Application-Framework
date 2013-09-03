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
	 * @return User
	 */
    public static function getLoggedInUser()
	{
		// get db
		$db = Site::getDB(true);

		// delete old sessions
		$db->delete('users_sessions', 'edited_on < ?', array(Site::getUTCDate(null, (time() - (2 * 60 * 60)))));

		// search for session
		$data = $db->getRecord('SELECT u.*, UNIX_TIMESTAMP(u.created_on) AS created_on, UNIX_TIMESTAMP(u.edited_on) AS edited_on
								FROM users_sessions AS i
								INNER JOIN users AS u ON i.user_id = u.id
								WHERE i.session_id = ? AND i.edited_on > ?',
								array(SpoonSession::getSessionId(), Site::getUTCDate(null, (time() - (2 * 60 * 60)))));

		// any data?
		if($data !== null)
		{
			// create instance
			$user = new User();

			// initialize
			$user->initialize($data);

			// login again, so we stay logged in
			self::login($user);

			// return
			return $user;
		}

		// no data, so redirect to login
		else
		{
			// reset session
			SpoonSession::destroy();
			session_regenerate_id(true);

			$url = Spoon::get('url');

			// not login page
			if($url->getModule() != 'users') SpoonHTTP::redirect($url->buildUrl('login', 'users', null, array('redirect' => '/' . $url->getQueryString())), 403);

			// not logout
			elseif(!in_array($url->getAction(), array('logout', 'login', 'forgot_password', 'reset_password')))
			{
				SpoonHTTP::redirect(
					$url->buildUrl(
						'login', 'users', null,
						array(
						     'redirect' => '/' . $url->getQueryString()
						)
					),
					403
				);
			}
		}
	}

	/**
	 * Login a given user
	 *
	 * @param User $user
	 */
	public static function login(User $user)
	{
		// build item
		$item['session_id'] = SpoonSession::getSessionId();
		$item['user_id'] = $user->id;
		$item['edited_on'] = Site::getUTCDate();

		// insert new session
		Site::getDB(true)->execute(
			'INSERT INTO users_sessions(session_id, user_id, edited_on)
			 VALUES(:session_id, :user_id, :edited_on)
			 ON DUPLICATE KEY UPDATE edited_on = :edited_on',
			$item
		);
	}

	/**
	 * Log out the user
	 */
	public static function logout()
	{
		// delete session
		Site::getDB(true)->delete('users_sessions', 'session_id = ?', SpoonSession::getSessionId());

		// destroy
		SpoonSession::destroy();
		session_regenerate_id(true);
	}

	/**
	 * Validate the given credentials
	 *
	 * @param string $email
	 * @param string $password
	 * @return User|bool
	 */
	public static function validateLogin($email, $password)
	{
		// init vars
		$return = false;
		$user = User::getByEmail($email);

		if($user !== false)
		{
			// check if given password match
			if(!$user->isBlocked && $user->password == sha1(md5($password) . $user->secret))
			{
				// reset the login-attempts
				Site::getDB(true)->delete('users_login_attempts', 'login = ?', $email);

				$return = $user;
			}
		}

		// should we log?
		if(!$return)
		{
			// get current number of attempts
			$attempts = (int) Site::getDB()->getVar('SELECT attempts FROM users_login_attempts WHERE login = ?', $email);

			// log in the db
			Site::getDB(true)->execute(
				'INSERT INTO users_login_attempts
				 VALUES(:email, :attempts, :date)
				 ON DUPLICATE KEY UPDATE attempts = :attempts, last_attempt = :date',
				array(
				     'email' => $email,
				     'attempts' => $attempts + 1,
				     'date' => Site::getUTCDate('Y-m-d H:i:s'),
				)
			);

			$message = 'failed login attempt';
			if($return && $user->isBlocked) $message .= ' from blocked user';

			// log
			Site::getLogger()->warning(
				$message,
				array(
				     'email' => $email,
				     'server' => $_SERVER,
				)
			);

			// when someone has attempted to login for 7 times we will block the user.
			if($user && $attempts >= 7)
			{
				$user->isBlocked = true;
				if($user->blockedOn === null) $user->blockedOn = new DateTime();
				$user->save();

				// log
				Site::getLogger()->error(
					'blocked user after 7 failed attempts',
					array(
					     'object' => $user,
					     'attempts' => $attempts,
					)
				);
			}

			// if there are multiple attempts we will slow down the user
			if($attempts >= 3)
			{
				sleep(($attempts - 3) * 5);
			}
		}

		return $return;
	}
}
