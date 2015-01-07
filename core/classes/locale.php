<?php

/**
 * SiteLocale
 *
 * @package		site
 * @subpackage	locale
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class SiteLocale extends SpoonTemplate
{
    /**
     * The current language
     *
     * @var	string
     */
    public static $language;

    /**
     * The locale
     *
     * @var	array
     */
    public static $act = array(),
                $err = array(),
                $lbl = array(),
                $msg = array();

    /**
     * Possible languages
     *
     * @var	array
     */
    public static $possibleLanguages = array('nl');

    /**
     * Get an action
     *
     * @param	string $key		The key.
     * @return string
     */
    public static function act($key)
    {
        return (isset(self::$act[$key])) ? self::$act[$key] : '{$act' . $key . '}';
    }

    /**
     * Get an error
     *
     * @param	string $key		The key.
     * @return string
     */
    public static function err($key)
    {
        return (isset(self::$err[$key])) ? self::$err[$key] : '{$err' . $key . '}';
    }

    /**
     * Get the current language
     *
     * @return string
     */
    public static function getLanguage()
    {
        return self::$language;
    }

    /**
     * Determine the preferred language
     *
     * @return string
     */
    public static function getPreferredLanguage()
    {
        // init var
        $language = 'nl';   // @remark: this should be the same as the default language.

        if (isset($_SERVER['HTTP_ACCEPT_LANGUAGE'])) {
            // get preferred languages
            $browserLanguages = explode(',', $_SERVER['HTTP_ACCEPT_LANGUAGE']);

            // loop preferred languages
            foreach ($browserLanguages as $browserLanguage) {
                $languageAbbreviation = substr($browserLanguage, 0, 2);

                if (in_array($languageAbbreviation, self::$possibleLanguages)) {
                    $language = $languageAbbreviation;
                    break;
                }
            }
        }

        return $language;
    }

    /**
     * Get a label
     *
     * @param	string $key		The key.
     * @return string
     */
    public static function lbl($key)
    {
        return (isset(self::$lbl[$key])) ? self::$lbl[$key] : '{$lbl' . $key . '}';
    }

    /**
     * Get a message
     *
     * @param	string $key		The key.
     * @return string
     */
    public static function msg($key)
    {
        return (isset(self::$msg[$key])) ? self::$msg[$key] : '{$msg' . $key . '}';
    }

    /**
     * Set the locale
     *
     * @param	string $language	The language.
     */
    public static function setLocale($language)
    {
        self::$language = (string) $language;
        $json = json_decode(
            SpoonFile::getContent(
                CACHE_PATH . '/locale/' . self::$language . '.json'
            ),
            true
        );
        self::$act = $json['act'];
        self::$err = $json['err'];
        self::$lbl = $json['lbl'];
        self::$msg = $json['msg'];
    }
}
