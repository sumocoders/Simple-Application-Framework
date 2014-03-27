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
    /**
     * Name of user
     *
     * @var string
     */
    protected $name;

    /**
     * E-mail address of user
     *
     * @var string
     */
    protected $email;

    /**
     * Secret of user his password
     *
     * @var string
     */
    protected $secret;

    /**
     * Raw password to set new password
     *
     * @var string
     */
    protected $rawPassword;

    /**
     * Encrypted password to check login
     *
     * @var string
     */
    protected $password;

    /**
     * User type, "user" or "admin"
     *
     * @var string
     */
    protected $type;

    /**
     * Is user blocked?
     *
     * @var bool
     */
    protected $blocked = false;

    /**
     * Is user deleted?
     *
     * @var bool
     */
    protected $deleted = false;

    /**
     * When was user blocked?
     *
     * @var DateTime
     */
    protected $blockedOn;

    /**
     * User settings
     *
     * @var array
     */
    protected $settings = array();

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
     * @return DateTime
     */
    public function getBlockedOn()
    {
        return $this->blockedOn;
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

        if ($item->isBlocked()) {
            return 'blocked';
        }

        // return
        return $item;
    }

    /**
     * @return string
     */
    public function getEmail()
    {
        return $this->email;
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
     * @return string
     */
    public function getPassword()
    {
        return $this->password;
    }

    /**
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @return string
     */
    public function getRawPassword()
    {
        return $this->rawPassword;
    }

    /**
     * @return string
     */
    public function getSecret()
    {
        return $this->secret;
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
     * @return array
     */
    public function getSettings()
    {
        return $this->settings;
    }

    /**
     * @return string
     */
    public function getType()
    {
        return $this->type;
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
            $this->setId($data['id']);
        }
        if (isset($data['name'])) {
            $this->setName($data['name']);
        }
        if (isset($data['email'])) {
            $this->setEmail($data['email']);
        }
        if (isset($data['password'])) {
            $this->setPassword($data['password']);
        }
        if (isset($data['secret'])) {
            $this->setSecret($data['secret']);
        }
        if (isset($data['type'])) {
            $this->setType($data['type']);
        }
        if (isset($data['data'])) {
            $data['data'] = unserialize($data['data']);
            if (isset($data['data']['settings'])) {
                $this->setSettings($data['data']['settings']);
            }
        }
        if (isset($data['blocked'])) {
            $this->setBlocked($data['blocked'] == 'Y');
        }
        if (isset($data['deleted'])) {
            $this->setDeleted($data['deleted'] == 'Y');
        }
        if (isset($data['blocked_on'])) {
            $this->setBlockedOn(new DateTime('@' . $data['blocked_on']));
        }
    }

    /**
     * @return boolean
     */
    public function isAdmin()
    {
        return $this->getType() == 'admin';
    }

    /**
     * @return boolean
     */
    public function isBlocked()
    {
        return $this->blocked;
    }

    /**
     * @return boolean
     */
    public function isDeleted()
    {
        return $this->deleted;
    }

    /**
     * Save the user
     * @return bool
     */
    public function save()
    {
        $item = parent::save();
        // build record
        $item['data'] = serialize(array('settings' => $this->getSettings()));
        $item['blocked'] = ($this->isBlocked()) ? 'Y' : 'N';
        $item['deleted'] = ($this->isDeleted()) ? 'Y' : 'N';
        $item['blocked_on'] = ($this->isBlocked()) ? Site::getUTCDate(
            'Y-m-d H:i:s',
            $this->getBlockedOn()->getTimestamp()
        ) : null;

        // unset what we don't need
        unset($item['is_admin']);
        unset($item['is_blocked']);
        unset($item['is_deleted']);
        unset($item['raw_password']);
        unset($item['settings']);
        unset($item['created_by']);
        unset($item['edited_by']);

        // new password?
        if ($this->getRawPassword() != null) {
            $item['password'] = sha1(md5($this->getRawPassword()) . $this->getSecret());
        }
        // non existing
        if ($this->getId() === null) {
            $this->setId(Site::getDB(true)->insert('users', $item));
        } else {
            Site::getDB(true)->update('users', $item, 'id = ?', $this->getId());
        }

        // return
        return true;
    }

    /**
     * @param DateTime $blockedOn
     */
    public function setBlockedOn(DateTime $blockedOn)
    {
        $this->blockedOn = $blockedOn;
    }

    /**
     * @param string $email
     */
    public function setEmail($email)
    {
        $this->email = (string) $email;
    }

    /**
     * @param boolean $isBlocked
     */
    public function setBlocked($isBlocked)
    {
        $this->blocked = $isBlocked;
    }

    /**
     * @param boolean $isDeleted
     */
    public function setDeleted($isDeleted)
    {
        $this->deleted = $isDeleted;
    }

    /**
     * @param string $name
     */
    public function setName($name)
    {
        $this->name = (string) $name;
    }

    /**
     * @param string $password
     */
    public function setPassword($password)
    {
        $this->password = (string) $password;
    }

    /**
     * @param string $rawPassword
     */
    public function setRawPassword($rawPassword)
    {
        $this->rawPassword = $rawPassword;
    }

    /**
     * @param string $secret
     */
    public function setSecret($secret)
    {
        $this->secret = (string) $secret;
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

    /**
     * @param array $settings
     */
    public function setSettings(array $settings)
    {
        $this->settings = $settings;
    }

    /**
     * @param string $type
     */
    public function setType($type)
    {
        $this->type = (string) $type;
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
        if (!Authentication::getLoggedInUser()->isAdmin()) {
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
