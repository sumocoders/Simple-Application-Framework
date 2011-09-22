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
		$tpl = new SiteTemplate();

		// assign selected state
		$tpl->assign(SpoonFilter::toCamelCase($url->getModule() . '_' . $url->getAction()), true);

		// create action
		new SiteAction($url->getAction(), $url->getModule());
	}


	/**
	 * Add a number to the string
	 *
	 * @return	string
	 * @param	string $string	The string where the number will be appended to.
	 */
	public static function addNumber($string)
	{
		// split
		$chunks = explode('-', $string);

		// count the chunks
		$count = count($chunks);

		// get last chunk
		$last = $chunks[$count - 1];

		// is nummeric
		if(SpoonFilter::isNumeric($last))
		{
			// remove last chunk
			array_pop($chunks);

			// join together, and increment the last one
			$string = implode('-', $chunks ) . '-' . ((int) $last + 1);
		}

		// not numeric, so add -2
		else $string .= '-2';

		// return
		return $string;
	}


	/**
	 * Get the database instance
	 *
	 * @return	SpoonDatabase
	 * @param	bool[optional] $write	Should we return the write connection?
	 */
	public static function getDB($write = false)
	{
		// build the name
		$name = ((bool) $write) ? 'database_write' : 'database_read';

		// does it exists?
		if(!Spoon::exists($name))
		{
			// check if neede info is available
			if(!defined('DB_TYPE') || !defined('DB_HOSTNAME') || !defined('DB_USERNAME') || !defined('DB_PASSWORD') || !defined('DB_DATABASE')) throw new Exception('No DB-credentials available');

			// create database instance
			$db = new SpoonDatabase(DB_TYPE, DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);

			// make sure we are using UTF-8
			$db->execute('SET CHARACTER SET utf8, NAMES utf8, time_zone = "+0:00";');

			// store
			Spoon::set($name, $db);
		}

		// return the instance
		return Spoon::get($name);
	}


	/**
	 * Get the available languages
	 *
	 * @return	array
	 */
	public static function getLanguages()
	{
		return array(
			'nl' => ucfirst(SiteLocale::lbl('Dutch')),
			'en' => ucfirst(SiteLocale::lbl('English')),
			'fr' => ucfirst(SiteLocale::lbl('French'))
		);
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
		if(!$date->isValid() || ($time !== null && !$time->isValid())) throw new Exception('You need to provide two objects that actaully contain valid data.');

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