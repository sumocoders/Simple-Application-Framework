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
     * User id of the creator
     * @var int
     */
    public $createdBy;

    /**
     * Time of creation
     * @var DateTime
     */
    public $createdOn;

    /**
     * User id of the editor
     *
     * @var int
     */
    public $editedBy;

    /**
     * Time of the last update
     * @var DateTime
     */
    public $editedOn;

    /**
     * initialized the log data
     * @param array $data
     */
    public function initialize($data)
    {
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
        $this->setEditedBy(Authentication::getLoggedInUser()->getId());
        if ($this->getCreatedOn() === null) {
            $this->setCreatedOn(new DateTime());
            $this->setCreatedBy(Authentication::getLoggedInUser()->getId());
        }
        $item = array();
        foreach ($this->toArray() as $key => $value) {
            $item[self::camelToUnderscore($key)] = $value;
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
     * Converts camelCase to camel_case
     * @param   string $string
     * @return  string
     */
    public static function camelToUnderscore($string)
    {
        return strtolower(preg_replace('/([a-z])([A-Z])/', '$1_$2', $string));
    }

    /**
     * @param string $action The action that just happened
     */
    protected function log($action)
    {
        Site::getLogger()->notice(
            get_class($this) . ' ' . (string)$action,
            array(
                'object' => $this,
                'by' => Authentication::getLoggedInUser()
            )
        );
    }
}
