<?php

/**
 * SiteTemplate, this is our extended version of SpoonTemplate
 *
 * This class will handle a lot of stuff for you, for example:
 *    - it will map some modifiers
 *  - it will assign a lot of constants
 *    - ...
 *
 * @package        site
 * @subpackage     template
 *
 * @author         Tijs Verkoyen <tijs@sumocoders.be>
 * @since          1.0
 */
class SiteTemplate extends SpoonTemplate
{
    /**
     * The CSS files
     *
     * @var    array
     */
    private $cssFiles = array();

    /**
     * The JS files
     *
     * @var    array
     */
    private $javascriptFiles = array();

    /**
     * Data to pass to js
     *
     * @var mixed
     */
    private $javascriptData;

    /**
     * Default constructor
     * The constructor will store the instance in the reference, preset some settings and map the custom modifiers.
     */
    public function __construct()
    {
        // store in reference so we can access it from everywhere
        Spoon::set('template', $this);

        // set cache directory
        $this->setCacheDirectory(CACHE_PATH . '/cached');

        // set compile directory
        $this->setCompileDirectory(CACHE_PATH . '/compiled_templates');

        // when debugging the template should be recompiled every time
        $this->setForceCompile(SPOON_DEBUG);

        // map custom modifiers
        $this->mapCustomModifiers();
    }

    /**
     * Add a css-file
     *
     * @param    string $url The url of the css-file.
     */
    public function addCssFile($url)
    {
        // redefine
        $url = (string) $url;

        // append timestamp
        if (substr_count($url, '?') > 0) {
            $url .= '&t=' . LAST_MODIFIED;
        } else {
            $url .= '?t=' . LAST_MODIFIED;
        }

        // add if needed
        if (!in_array($url, $this->cssFiles)) {
            $this->cssFiles[] = $url;
        }
    }

    /**
     * Make data available for javascript
     *
     * @param string $module
     * @param string $key
     * @param mixed  $value
     */
    public function addJavascriptData($module, $key, $value)
    {
        $this->javascriptData[$module][$key] = $value;
    }

    /**
     * Add a javascript file
     *
     * @param    string $url The url of the js-file.
     */
    public function addJavascriptFile($url)
    {
        // redefine
        $url = (string) $url;

        // append timestamp if it isn't a parsed file
        if (substr_count($url, '/js.php') == 0) {
            if (substr_count($url, '?') > 0) {
                $url .= '&t=' . LAST_MODIFIED;
            } else {
                $url .= '?t=' . LAST_MODIFIED;
            }
        }

        // add if needed
        if (!in_array($url, $this->javascriptFiles)) {
            $this->javascriptFiles[] = $url;
        }
    }

    /**
     * Output the template into the browser
     * Will also assign the interface labels and all user-defined constants.
     *
     * @param    string $template The template to display.
     */
    public function display($template)
    {
        // set headers
        SpoonHTTP::setHeaders('content-type: text/html;charset=utf-8');

        // debug info
        if (SPOON_DEBUG) {
            $this->assign('debug', true);
        }

        // parse constants
        $this->parseConstants();

        // parse locale
        $this->parseLocale();

        // parse Javascript & css
        $this->parseExternalFiles();

        // parse javascript data
        $this->parseJavascriptData();

        // call the parent
        parent::display($template);
    }

    /**
     * Map the fork-specific modifiers
     */
    private function mapCustomModifiers()
    {
        $this->mapModifier('buildurl', array('SiteTemplateModifiers', 'buildurl'));
        $this->mapModifier('cleanupplaintext', array('SiteTemplateModifiers', 'cleanupPlainText'));
        $this->mapModifier('dump', array('SiteTemplateModifiers', 'dump'));
        $this->mapModifier('formatdate', array('SiteTemplateModifiers', 'formatDate'));
        $this->mapModifier('formatfloat', array('SiteTemplateModifiers', 'formatFloat'));
        $this->mapModifier('timeago', array('SiteTemplateModifiers', 'timeAgo'));
        $this->mapModifier('truncate', array('SiteTemplateModifiers', 'truncate'));
        $this->mapModifier('url', array('SiteTemplateModifiers', 'buildUrl'));
        $this->mapModifier('sprintf', 'sprintf');
        $this->mapModifier('urlise', array('SpoonFilter', 'urlise'));
    }

    /**
     * Parse all user-defined constants
     */
    private function parseConstants()
    {
        // constants that should be protected from usage in the template
        $aNotPublicConstants = array();

        // get all defined constants
        $aConstants = get_defined_constants(true);

        // init var
        $aRealConstants = array();

        // remove protected constants aka constants that should not be used in the template
        foreach ($aConstants['user'] as $key => $value) {
            if (!in_array($key, $aNotPublicConstants)) {
                $aRealConstants[$key] = $value;
            }
        }

        // we should only assign constants if there are constants to assign
        if (!empty($aRealConstants)) {
            $this->assign($aRealConstants);
        }

        // get the url object, we need this for some template-constants
        if (Spoon::exists('url')) {
            $url = Spoon::get('url');

            // assign the current module
            $this->assign('MODULE', $url->getModule());

            // assign the current action
            $this->assign('ACTION', $url->getAction());

            $this->assign('LANGUAGE', $url->getLanguage());
        }

        $this->assign('timestamp', time());
        $this->assign('var', '');
    }

    /**
     * Parse the external loaded files into the header
     */
    private function parseExternalFiles()
    {
        // any JS-files?
        if (!empty($this->javascriptFiles)) {
            // init var
            $js = array();

            // loop and add
            foreach ($this->javascriptFiles as $url) {
                $js[] = array('url' => $url);
            }

            // assign
            $this->assign('javascript', $js);
        }

        // any CSS-files?
        if (!empty($this->cssFiles)) {
            // init var
            $css = array();

            // loop and add
            foreach ($this->cssFiles as $url) {
                $css[] = array('url' => $url);
            }

            // assign
            $this->assign('css', $css);
        }
    }

    /**
     * Parse the data that should be passed to javascript
     */
    private function parseJavascriptData()
    {
        $this->addJavascriptData('core', 'debug', SPOON_DEBUG);

        $frm = new SiteForm(time(), null, 'post', true);
        $this->addJavascriptData('core', 'form_token', $frm->getToken());

        // get the url object, so we can pass some stuff to JS
        if (Spoon::exists('url')) {
            $url = Spoon::get('url');
            $this->addJavascriptData('core', 'language', $url->getLanguage());
            $this->addJavascriptData('core', 'module', $url->getModule());
            $this->addJavascriptData('core', 'action', $url->getAction());
        }

        if (Authentication::getLoggedInUser()) {
            $this->addJavascriptData('core', 'currentUser', Authentication::getLoggedInUser()->toArray());
        }
        $this->assign('jsData', json_encode($this->javascriptData));
    }

    /**
     * Parse the locale
     */
    private function parseLocale()
    {
        $this->assignArray(SiteLocale::$act, 'act');
        $this->assignArray(SiteLocale::$err, 'err');
        $this->assignArray(SiteLocale::$lbl, 'lbl');
        $this->assignArray(SiteLocale::$msg, 'msg');
    }
}

/**
 * SiteTemplateModifiers, a collection of modifiers that will be available.
 *
 * @package        site
 * @subpackage     template
 *
 * @author         Tijs Verkoyen <tijs@sumocoders.be>
 * @since          1.0
 */
class SiteTemplateModifiers
{
    /**
     * Build an url
     *
     * @param    string $var   A placeholder.
     * @param           string [optional] $action    The action.
     * @param           string [optional] $module    The module, if not provided the current module will be used.
     * @return string
     */
    public static function buildUrl($var, $action = null, $module = null)
    {
        // reset if needed
        if ($action == '') {
            $action = null;
        }
        if ($module == '') {
            $module = null;
        }

        // get the url instance
        $url = Spoon::get('url');

        // return
        return $url->buildUrl($action, $module);
    }

    /**
     * Formats plain text as HTML, links will be detected, paragraphs will be inserted
     *    syntax: {$var|cleanupPlainText}
     *
     * @param    string $var The text to cleanup.
     * @return string
     */
    public static function cleanupPlainText($var)
    {
        // redefine
        $var = (string) $var;

        // detect links
        $var = SpoonFilter::replaceURLsWithAnchors($var);

        // replace newlines
        $var = str_replace("\r", '', $var);
        $var = preg_replace('/(?<!.)(\r\n|\r|\n){3,}$/m', '', $var);

        // replace br's into p's
        $var = '<p>' . str_replace("\n", '</p><p>', $var) . '</p>';

        // cleanup
        $var = str_replace("\n", '', $var);
        $var = str_replace('<p></p>', '', $var);

        // return
        return $var;
    }

    /**
     * Dumps the data
     *    syntax: {$var|dump}
     *
     * @param    string $var The variable to dump.
     * @return string
     */
    public static function dump($var)
    {
        Spoon::dump($var, false);
    }

    /**
     * Format a UNIX-timestamp as a date
     *    syntax: {$var|formatdate}
     *
     * @param    int $var    The UNIX-timestamp to format.
     * @param    int $format The format to display the date in.
     * @return string
     */
    public static function formatDate($var, $format)
    {
        // format the date
        return SpoonDate::getDate((string) $format, (int) $var, 'nl');
    }

    /**
     * Format a number as a float
     *    syntax: {$var|formatfloat}
     *
     * @param    float $number The number to format.
     * @param          int     [optional] $decimals        The number of decimals.
     * @return string
     */
    public static function formatFloat($number, $decimals = 2)
    {
        // redefine
        $number = (float) $number;
        $decimals = (int) $decimals;

        return number_format($number, $decimals, '.', ' ');
    }

    /**
     * Formats a timestamp as a string that indicates the time ago
     *    syntax: {$var|timeAgo}
     *
     * @param    string [optional] $var        A UNIX-timestamp that will be formated as a time-ago-string.
     * @return string
     */
    public static function timeAgo($var = null)
    {
        $var = (int) $var;
        if ($var == 0) {
            return '';
        }
        $url = Spoon::get('url');

        $date = SpoonDate::getDate('l j F Y H:i:s', $var, $url->getLanguage());
        $timeAgo = SpoonDate::getTimeAgo($var, $url->getLanguage());

        return '<abbr title="' . $date . '">' . $timeAgo . '</abbr>';
    }

    /**
     * Truncate a string
     *    syntax: {$var|truncate:<max-length>[:<append-hellip>]}
     *
     * @param        string  [optional] $var        The string passed from the template.
     * @param    int $length The maximum length of the truncated string.
     * @param        bool    [optional] $useHellip    Should a hellip be appended if the length exceeds the requested length?
     * @return string
     */
    public static function truncate($var = null, $length, $useHellip = true)
    {
        // remove special chars
        $var = htmlspecialchars_decode($var, ENT_QUOTES);

        // remove HTML
        $var = strip_tags($var);

        // less characters
        if (mb_strlen($var) <= $length) {
            return SpoonFilter::htmlspecialchars($var);
        } // more characters
        else {
            // hellip is seen as 1 char, so remove it from length
            if ($useHellip) {
                $length = $length - 1;
            }

            // get the amount of requested characters
            $var = mb_substr($var, 0, $length);

            // add hellip
            if ($useHellip) {
                $var .= '…';
            }

            // return
            return SpoonFilter::htmlspecialchars($var, ENT_QUOTES);
        }
    }
}
