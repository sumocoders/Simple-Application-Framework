<?php

/**
 * Site
 *
 * This class defines the site, it is the core. Everything starts here.
 * We create all needed instances and execute the requested action
 *
 * @package		site
 * @subpackage	core
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class Site
{
	/**
	 * Default constructor
	 *
	 * @return	void
	 */
	public function __construct()
	{
		// create url-object to handle the url
		$url = new SiteURL();

		// create new template
		new SiteTemplate();

		// create action
		new SiteAction($url->getAction(), $url->getModule());
	}


	/**
	 * Get the UTC date in a specific format. Use this method when inserting dates in the database!
	 *
	 * @return	string
	 * @param	string[optional] $format	The format to return the timestamp in. Default is MySQL datetime format.
	 * @param	int[optional] $timestamp	The timestamp to use, if not provided the current time will be used.
	 */
	public static function getUTCDate($format = null, $timestamp = null)
	{
		// init var
		$format = ($format !== null) ? (string) $format : 'Y-m-d H:i:s';

		// no timestamp given
		if($timestamp === null) return gmdate($format);

		// timestamp given
		return gmdate($format, (int) $timestamp);
	}


	/**
	 * Get the UTC timestamp for a date/time object combination.
	 *
	 * @return	int
	 * @param	SpoonFormDate $date					An instance of SpoonFormDate.
	 * @param	SpoonFormTime[optional] $time		An instance of SpoonFormTime.
	 */
	public static function getUTCTimestamp(SpoonFormDate $date, SpoonFormTime $time = null)
	{
		// validate date/time object
		if(!$date->isValid() || ($time !== null && !$time->isValid())) throw new BackendException('You need to provide two objects that actaully contain valid data.');

		// init vars
		$year = gmdate('Y', $date->getTimestamp());
		$month = gmdate('m', $date->getTimestamp());
		$day = gmdate('j', $date->getTimestamp());

		// time object was given
		if($time !== null)
		{
			// define hour & minute
			list($hour, $minute) = explode(':', $time->getValue());
		}

		// user default time
		else
		{
			$hour = 0;
			$minute = 0;
		}

		// make and return timestamp
		return mktime($hour, $minute, 0, $month, $day, $year);
	}
}

?>