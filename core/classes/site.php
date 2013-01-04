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
     * The settings holder
     *
     * @var array
     */
    private static $settings;

	/**
	 * Default constructor
	 *
	 * @return void
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
	 * @param	string $string	The string where the number will be appended to.
	 * @return string
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
	 * Generate thumbnails based on the folders in the path
	 * Use
	 * - 128x128 as foldername to generate an image where the width will be 128px and the height will be 128px
	 * - 128x as foldername to generate an image where the width will be 128px, the height will be calculated based on the aspect ratio.
	 * - x128 as foldername to generate an image where the height will be 128px, the width will be calculated based on the aspect ratio.
	 *
	 * @param string $path The path wherin the thumbnail-folders will be stored.
	 * @param string $sourceFile The location of the source file.
	 */
	public static function generateThumbnails($path, $sourcefile)
	{
		// get folder listing
		$folders = self::getThumbnailFolders($path);
		$filename = basename($sourcefile);

		// loop folders
		foreach($folders as $folder)
		{
			// generate the thumbnail
			$thumbnail = new SpoonThumbnail($sourcefile, $folder['width'], $folder['height']);
			$thumbnail->setAllowEnlargement(true);

			// if the width & height are specified we should ignore the aspect ratio
			if($folder['width'] !== null && $folder['height'] !== null) $thumbnail->setForceOriginalAspectRatio(false);
			$thumbnail->parseToFile($folder['path'] . '/' . $filename);
		}
	}

	/**
	 * Get the database instance
	 *
	 * @param	bool[optional] $write	Should we return the write connection?
	 * @return SpoonDatabase
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
	 * @return array
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
     * Get a setting
     *
     * @param string $key
     * @param mixed[optional] $defaultValue
     * @return mixed
     */
    public static function getSetting($key, $defaultValue = null)
    {
        if(self::$settings === null)
        {
            $settings = self::getDB()->getPairs(
                'SELECT i.key, i.value
                 FROM settings AS i'
            );

            foreach($settings as $name => &$value)
            {
                $settings[$name] = unserialize($value);
            }

            self::$settings = $settings;
        }

        if(isset(self::$settings[$key])) return self::$settings[$key];

        // fallback
        return $defaultValue;
    }

    /**
     * Store a setting
     *
     * @param string $key
     * @param mixed $value
     */
    public static function setSetting($key, $value)
    {
        Site::getDB(true)->execute(
            'INSERT INTO settings VALUES(:key, :value)
             ON DUPLICATE KEY UPDATE value = :value',
            array(
                'key' => $key,
                'value' => serialize($value)
            )
        );

        self::$settings = null;
    }


	/**
	 * Get the thumbnail folders
	 *
	 * @param string $path The path
	 * @param bool[optional] $includeSource Should the source-folder be included in the return-array.
	 * @return array
	 */
	public static function getThumbnailFolders($path, $includeSource = false)
	{
		$folders = SpoonDirectory::getList((string) $path, false, null, '/^([0-9]*)x([0-9]*)$/');

		if($includeSource && SpoonDirectory::exists($path . '/source')) $folders[] = 'source';

		$return = array();

		foreach($folders as $folder)
		{
			$item = array();
			$chunks = explode('x', $folder, 2);

			// skip invalid items
			if(count($chunks) != 2 && !$includeSource) continue;

			$item['dirname'] = $folder;
			$item['path'] = $path . '/' . $folder;
			if(substr($path, 0, strlen(PATH_WWW)) == PATH_WWW) $item['url'] = substr($path, strlen(PATH_WWW));
			if($folder == 'source')
			{
				$item['width'] = null;
				$item['height'] = null;
			}
			else
			{
				$item['width'] = ($chunks[0] != '') ? (int) $chunks[0] : null;
				$item['height'] = ($chunks[1] != '') ? (int) $chunks[1] : null;
			}

			$return[] = $item;
		}

		return $return;
	}

	/**
	 * Get the UTC date in a specific format. Use this method when inserting dates in the database!
	 *
	 * @param	string[optional] $format	The format to return the timestamp in. Default is MySQL datetime format.
	 * @param	int[optional] $timestamp	The timestamp to use, if not provided the current time will be used.
	 * @return string
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
	 * @param	SpoonFormDate $date					An instance of SpoonFormDate.
	 * @param	SpoonFormTime[optional] $time		An instance of SpoonFormTime.
	 * @return int
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
