<?php

/**
 * User
 *
 * @package		users
 * @subpackage	model
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class User
{
	/**
	 * The id of the user.
	 *
	 * @var	string
	 */
	public $id;


	/**
	 * Textual properties
	 *
	 * @var	string
	 */
	public $name, $email, $secret, $rawPassword, $type;


	/**
	 * Boolean properties
	 */
	public $isAdmin = false;


	/**
	 * Array properties
	 *
	 * @var	array
	 */
	private $settings = array();


	/**
	 * Get a user
	 *
	 * @return	User
	 * @param	int $id		The id of the user.
	 */
	public static function get($id)
	{
		// redefine
		$id = (int) $id;

		// get data
		$data = Site::getDB()->getRecord('SELECT i.id, i.name, i.email, i.secret, i.type, i.data
											FROM users AS i
											WHERE i.id = ?',
											array($id));

		// validate
		if($data === null) return false;

		// create instance
		$item = new User();

		// initialize
		$item->initialize($data);

		// return
		return $item;
	}


	/**
	 * Get all users for usage in a dropdown
	 *
	 * @return	array
	 */
	public static function getForDropdown()
	{
		return Site::getDB()->getPairs('SELECT i.id, i.name
										FROM users AS i
										ORDER BY i.name');
	}


	/**
	 * Get a setting
	 *
	 * @return	mixed
	 * @param	string $key		The key whereunder the value is stored.
	 */
	public function getSetting($key)
	{
		if(!isset($this->settings[$key])) return null;
		else return $this->settings[$key];
	}


	/**
	 * Initialize the object.
	 *
	 * @return	User
	 * @param	array $data		The data in an array.
	 */
	public function initialize($data)
	{
		if(isset($data['id'])) $this->id = (int) $data['id'];
		if(isset($data['name'])) $this->name = (string) $data['name'];
		if(isset($data['email'])) $this->email = (string) $data['email'];
		if(isset($data['secret'])) $this->secret = (string) $data['secret'];
		if(isset($data['type'])) $this->type = (string) $data['type'];
		if(isset($data['data']))
		{
			$data['data'] = unserialize($data['data']);
			if(isset($data['data']['settings'])) $this->settings = $data['data']['settings'];
		}
		if($this->type == 'admin') $this->isAdmin = true;
	}


	/**
	 * Save the user
	 *
	 * @return	bool
	 */
	public function save()
	{
		// build record
		$item['name'] = $this->name;
		$item['email'] = $this->email;
		$item['secret'] = $this->secret;
		$item['type'] = $this->type;
		$item['data'] = serialize(array('settings' => $this->settings));

		// new password?
		if($this->rawPassword != null) $item['password'] = sha1(md5($this->rawPassword) . $this->secret);

		// non existing
		if($this->id === null) $this->id = Site::getDB(true)->insert('users', $item);
		else Site::getDB(true)->update('users', $item, 'id = ?', $this->id);

		// return
		return true;
	}


	/**
	 * Store a setting
	 *
	 * @return	void
	 * @param	string $key		The key whereunder the value will be stored.
	 * @param	mixed $value	The value to store.
	 */
	public function setSetting($key, $value)
	{
		$this->settings[(string) $key] = $value;
	}


	/**
	 * Return the object as an array
	 *
	 * @return	array
	 */
	public function toArray()
	{
		// build array
		$item['id'] = $this->id;
		$item['name'] = $this->name;
		$item['email'] = $this->email;
		$item['type'] = $this->type;
		$item['isAdmin'] = $this->isAdmin;

		return $item;
	}
}

?>