<?php

/**
 * This class is extended by the models to make logging easier
 *
 * @package        defaultEntity
 * @subpackage     core
 *
 * @author         Jelmer Prins <jelmer@sumocoders.be>
 * @since          1.0
 */
abstract class DefaultEntity
{
    /**
     * The id of the entity.
     *
     * @var int
     */
    protected $id;

    /**
     * User id of the creator
     * @var int
     */
    protected $createdBy;

    /**
     * Time of creation
     * @var DateTime
     */
    protected $createdOn;

    /**
     * User id of the editor
     *
     * @var int
     */
    protected $editedBy;

    /**
     * Time of the last update
     * @var DateTime
     */
    protected $editedOn;

    /**
     * initialized the log data
     * @param array $data
     */
    public function initialize($data)
    {
        if (isset($data['id'])) {
            $this->setId($data['id']);
        }
        if (isset($data['created_by'])) {
            $this->setCreatedBy($data['created_by']);
        }
        if (isset($data['created_on'])) {
            $this->setCreatedOn(new DateTime('@' . $data['created_on']));
        }
        if (isset($data['edited_by'])) {
            $this->setEditedBy($data['edited_by']);
        }
        if (isset($data['edited_on'])) {
            $this->setEditedOn(new DateTime('@' . $data['edited_on']));
        }
    }

    /**
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @return int
     */
    public function getCreatedBy()
    {
        return $this->createdBy;
    }

    /**
     * @return DateTime
     */
    public function getCreatedOn()
    {
        return $this->createdOn;
    }

    /**
     * @return int
     */
    public function getEditedBy()
    {
        return $this->editedBy;
    }

    /**
     * @return DateTime
     */
    public function getEditedOn()
    {
        return $this->editedOn;
    }

    /**
     * saves the log data
     * @return array
     */
    public function save()
    {
        $this->setEditedOn(new DateTime());
        $authenticatedUser = Authentication::getLoggedInUser();
        if ($authenticatedUser) {
            $this->setEditedBy($authenticatedUser->getId());
        }
        if ($this->getCreatedOn() === null) {
            $this->setCreatedOn(new DateTime());
            if ($authenticatedUser) {
                $this->setCreatedBy($authenticatedUser->getId());
            }
        }
        $item = array();
        foreach ($this->toArray() as $key => $value) {
            $item[Site::camelToUnderscore($key)] = $value;
        }
        $item['created_on'] = Site::getUTCDate('Y-m-d H:i:s', $item['created_on']);
        $item['edited_on'] = Site::getUTCDate('Y-m-d H:i:s', $item['edited_on']);
        $this->log('save');

        return $item;
    }

    /**
     * @param int $createdBy
     */
    public function setCreatedBy($createdBy)
    {
        $this->createdBy = (int) $createdBy;
    }

    /**
     * @param DateTime $createdOn
     */
    public function setCreatedOn(DateTime $createdOn)
    {
        $this->createdOn = $createdOn;
    }

    /**
     * @param int $editedBy
     */
    public function setEditedBy($editedBy)
    {
        $this->editedBy = (int) $editedBy;
    }

    /**
     * @param DateTime $editedOn
     */
    public function setEditedOn(DateTime $editedOn)
    {
        $this->editedOn = $editedOn;
    }

    /**
     * @param int $id
     */
    public function setId($id)
    {
        $this->id = (int) $id;
    }

    /**
     * Return the object as an array
     * @return array
     */
    public function toArray()
    {
        $item = array();
        foreach ($this as $key => $val) {
            $item[$key] = $val;
        }
        //convert time
        $item['createdOn'] = ($item['createdOn'] !== null) ? $item['createdOn']->getTimestamp() : null;
        $item['editedOn'] = ($item['editedOn'] !== null) ? $item['editedOn']->getTimestamp() : null;

        return $item;
    }

    /**
     * @param string $action The action that just happened
     */
    protected function log($action)
    {
        Site::getLogger()->notice(
            get_class($this) . ' ' . (string) $action,
            array(
                'object' => $this,
                'by' => Authentication::getLoggedInUser()
            )
        );
    }
}
