<?php

/**
 * This class is extended by the models to make logging easier
 *
 * @package        defaultObject
 * @subpackage     core
 *
 * @author         Jelmer Prins <jelmer@sumocoders.be>
 * @since          1.0
 */
class DefaultObject
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
			$this->createdBy = (int) $data['created_by'];
		}
		if (isset($data['created_on'])) {
			$this->createdOn = new DateTime('@' . $data['created_on']);
		}
		if (isset($data['edited_on'])) {
			$this->editedOn = new DateTime('@' . $data['edited_on']);
		}
	}

	/**
	 * saves the log data
	 * @return array
	 */
	public function save()
	{
        $this->editedOn = new DateTime();
        if ($this->createdOn === null) {
            $this->createdOn = new DateTime();
            $this->createdBy = Authentication::getLoggedInUser()->id;
        }
        $item = $this->toArray();
        $item['created_on'] = Site::getUTCDate('Y-m-d H:i:s', $item['created_on']);
        $item['edited_on'] = Site::getUTCDate('Y-m-d H:i:s', $item['edited_on']);

        $this->log('save');
		return $item;
	}

	/**
	 * Return the object as an array
	 * @return array
	 */
	public function toArray()
	{
		$item = array();
		foreach ($this as $key => $val) {
			//convert php to mysql name
			$key = self::camelToUnderscore($key);
			$item[$key] = $val;
		}
		//convert time
        $item['created_on'] = ($item['created_on'] !== null) ? $item['created_on']->getTimestamp() : null;
        $item['edited_on'] = ($item['edited_on'] !== null) ? $item['edited_on']->getTimestamp() : null;
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