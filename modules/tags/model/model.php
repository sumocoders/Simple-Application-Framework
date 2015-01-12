<?php

/**
 * Tag
 *
 * @package    tags
 * @subpackage model
 *
 * @author     Wouter Sioen <wouter@sumocoders.be>
 */
class Tag extends DefaultEntity
{
    /**
     * @var string
     */
    protected $name;

    /**
     * Gets the value of name.
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Sets the value of name.
     *
     * @param  string $name the name
     * @return Tag
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Save the tag
     *
     * @return bool
     */
    public function save()
    {
        $tag = parent::save();

        // build record
        unset($tag['created_by']);
        unset($tag['edited_by']);
        unset($tag['edited_on']);

        // non existing
        if ($this->getId() === null) {
            $this->setId(Site::getDB(true)->insert('tags', $tag));
        } else {
            Site::getDB(true)->update('tags', $tag, 'id = ?', $this->getId());
        }

        // return
        return true;
    }

    /**
     * Get a tag
     *
     * @param  int $id The id of the tag.
     * @throws InvalidArgumentException when no data was found for this id
     * @return Tag
     */
    public static function get($id)
    {
        // get data
        $data = Site::getDB()->getRecord(
            'SELECT t.*, UNIX_TIMESTAMP(t.created_on) AS created_on
             FROM tags AS t
             WHERE t.id = ?',
            array((int) $id)
        );

        if (empty($data)) {
            throw new InvalidArgumentException('A tag with this id could not be found');
        }

        return self::createFromData($data);
    }

    /**
     * Get a tag
     *
     * @param  int $name The name of the tag.
     * @throws InvalidArgumentException when no data was found for this name
     * @return Tag
     */
    public static function getByName($name)
    {
        // get data
        $data = Site::getDB()->getRecord(
            'SELECT t.*, UNIX_TIMESTAMP(t.created_on) AS created_on
             FROM tags AS t
             WHERE t.name = ?',
            array((int) $name)
        );

        if (empty($data)) {
            throw new InvalidArgumentException('A tag with this name could not be found');
        }

        return self::createFromData($data);
    }

    /**
     * Initialize the object.
     *
     * @param  array $data The data in an array.
     * @return Tag
     */
    protected function initialize($data)
    {
        parent::initialize($data);
        if (isset($data['name'])) {
            $this->setName($data['name']);
        }
    }
}
