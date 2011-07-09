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
		$data = Site::getDB()->getRecord('SELECT i.id, i.name, i.email, i.secret, i.type
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

		// new password?
		if($this->rawPassword != null) $item['password'] = sha1(md5($this->rawPassword) . $this->secret);

		// non existing
		if($this->id === null) $this->id = Site::getDB(true)->insert('users', $item);
		else Site::getDB(true)->update('users', $item, 'id = ?', $this->id);

		// return
		return true;
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