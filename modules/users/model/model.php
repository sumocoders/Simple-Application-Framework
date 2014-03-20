<?php

/**
 * User
 * @package    users
 * @subpackage model
 * @author     Tijs Verkoyen <tijs@sumocoders.be>
 * @author     Jonas De Keukelaere <jonas@sumocoders.be>
 * @since      1.0
 */
class User extends DefaultEntity
{
    // todo change public to private when getters and setters are implemented
    /**
     * The id of the user.
     *
     * @var string
     */
    public $id;

    /**
     * Textual properties
     *
     * @var string
     */
    public $name;
    /** @var string */
    public $email;
    /** @var string */
    public $secret;
    /** @var string */
    public $rawPassword;
    /** @var string */
    public $password;
    /** @var string */
    public $type;

    /**
     * Boolean properties
     *
     * @var bool
     */
    public $isAdmin = false;
    /** @var bool */
    public $isBlocked = false;
    /** @var bool */
    public $isDeleted = false;

    /**
     * DateTime properties
     *
     * @var DateTime
     */
    public $blockedOn;

    /**
     * Array properties
     *
     * @var array
     */
    private $settings = array();

    /**
     * Get a user
     * @param int $id The id of the user.
     * @return User
     */
    public static function get($id)
    {
        // redefine
        $id = (int) $id;

        // get data
        $data = Site::getDB()->getRecord(
            'SELECT i.*, UNIX_TIMESTAMP(i.created_on) AS created_on,
            UNIX_TIMESTAMP(i.edited_on) AS edited_on,
            UNIX_TIMESTAMP(i.blocked_on) AS blocked_on
            FROM users AS i
            WHERE i.id = ?',
            array($id)
        );

        // validate
        if ($data === null) {
            return false;
        }

        // create instance
        $item = new User();

        // initialize
        $item->initialize($data);

        // return
        return $item;
    }

    /**
     * Get a user by his email
     * @param string $email
     * @return User
     */
    public static function getByEmail($email)
    {
        // redefine
        $email = (string) $email;

        // get data
        $data = Site::getDB()->getRecord(
            'SELECT i.*, UNIX_TIMESTAMP(i.created_on) AS created_on,
            UNIX_TIMESTAMP(i.edited_on) AS edited_on,
            UNIX_TIMESTAMP(i.blocked_on) AS blocked_on
            FROM users AS i
            WHERE i.email = ? AND i.deleted = "N"',
            array($email)
        );

        // validate
        if ($data === null) {
            return false;
        }

        // create instance
        $item = new User();

        // initialize
        $item->initialize($data);

        // return
        return $item;
    }

    /**
     * Get a user by his hash
     * @param string $hash
     * @return User
     */
    public static function getByHash($hash)
    {
        // redefine
        $hash = (string) $hash;

        $data = Site::getDB()->getRecord(
            'SELECT i.*, UNIX_TIMESTAMP(i.created_on) AS created_on,
            UNIX_TIMESTAMP(i.edited_on) AS edited_on,
            UNIX_TIMESTAMP(i.blocked_on) AS blocked_on
            FROM users AS i
            WHERE i.forgot_password = ?',
            array($hash)
        );

        // validate
        if ($data === null) {
            return false;
        }

        // create instance
        $item = new User();

        // initialize
        $item->initialize($data);

        if ($item->isBlocked) {
            return 'blocked';
        }

        // return
        return $item;
    }

    /**
     * Get all users for usage in a dropdown
     * @return array
     */
    public static function getForDropdown()
    {
        return Site::getDB()->getPairs(
            'SELECT i.id, i.name
            FROM users AS i
            ORDER BY i.name'
        );
    }

    /**
     * Get a setting
     * @param    string $key The key whereunder the value is stored.
     * @return mixed
     */
    public function getSetting($key)
    {
        if (!isset($this->settings[$key])) {
            return null;
        } else {
            return $this->settings[$key];
        }
    }

    /**
     * Initialize the object.
     * @param    array $data The data in an array.
     * @return User
     */
    public function initialize($data)
    {
        parent::initialize($data);
        if (isset($data['id'])) {
            $this->id = (int) $data['id'];
        }
        if (isset($data['name'])) {
            $this->name = (string) $data['name'];
        }
        if (isset($data['email'])) {
            $this->email = (string) $data['email'];
        }
        if (isset($data['password'])) {
            $this->password = (string) $data['password'];
        }
        if (isset($data['secret'])) {
            $this->secret = (string) $data['secret'];
        }
        if (isset($data['type'])) {
            $this->type = (string) $data['type'];
        }
        if (isset($data['data'])) {
            $data['data'] = unserialize($data['data']);
            if (isset($data['data']['settings'])) {
                $this->settings = $data['data']['settings'];
            }
        }
        if ($this->type == 'admin') {
            $this->isAdmin = true;
        }
        if (isset($data['blocked'])) {
            $this->isBlocked = ($data['blocked'] == 'Y');
        }
        if (isset($data['deleted'])) {
            $this->isDeleted = ($data['deleted'] == 'Y');
        }
        if (isset($data['blocked_on'])) {
            $this->blockedOn = new DateTime('@' . $data['blocked_on']);
        }
    }

    /**
     * Save the user
     * @return bool
     */
    public function save()
    {
        $item = parent::save();
        // build record
        $item['data'] = serialize(array('settings' => $this->settings));
        $item['blocked'] = ($this->isBlocked) ? 'Y' : 'N';
        $item['deleted'] = ($this->isDeleted) ? 'Y' : 'N';
        $item['blocked_on'] = ($this->isBlocked) ? Site::getUTCDate(
            'Y-m-d H:i:s',
            $this->blockedOn->getTimestamp()
        ) : null;

        // unset what we don't need
        unset($item['is_admin']);
        unset($item['is_blocked']);
        unset($item['is_deleted']);
        unset($item['raw_password']);
        unset($item['created_by']);

        // new password?
        if ($this->rawPassword != null) {
            $item['password'] = sha1(md5($this->rawPassword) . $this->secret);
        }
        // non existing
        if ($this->id === null) {
            $this->id = Site::getDB(true)->insert('users', $item);
        } else {
            Site::getDB(true)->update('users', $item, 'id = ?', $this->id);
        }

        // return
        return true;
    }

    /**
     * Store a setting
     * @param  string $key   The key whereunder the value will be stored.
     * @param  mixed  $value The value to store.
     */
    public function setSetting($key, $value)
    {
        $this->settings[(string) $key] = $value;
    }
}

/**
 * UsersHelper
 * @package     users
 * @subpackage  helper
 * @author      Tijs Verkoyen <tijs@sumocoders.be>
 * @since       1.0
 */
class UsersHelper
{
    /**
     * Search for users
     * @param string $query The data to look for
     * @return array
     */
    public static function search($query)
    {
        if (!Authentication::getLoggedInUser()->isAdmin) {
            return array();
        }

        $return = array();

        $data = Site::getDB()->getRecords(
            'SELECT id, name
             FROM users AS i
             WHERE i.deleted = ? AND (i.name LIKE ? OR i.email LIKE ?)',
            array('N', $query . '%', $query . '%')
        );

        if (!empty($data)) {
            $urlObject = new SiteURL();
            $url = $urlObject->buildUrl('edit', 'users');

            foreach ($data as $row) {
                $return[] = array(
                    'label' => $row['name'],
                    'url' => $url . '/' . $row['id'],
                );
            }
        }

        return $return;
    }
}
