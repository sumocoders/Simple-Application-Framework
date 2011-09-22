<?php

/**
 * This is our extended version of SpoonDatagrid
 *
 * This class will handle a lot of stuff for you, for example:
 * 	- it will set debugmode
 *	- it will set the compile-directory
 * 	- ...
 *
 * @package		backend
 * @subpackage	core
 *
 * @author		Davy Hellemans <davy@netlash.com>
 * @author		Tijs Verkoyen <tijs@sumocoders.be>
 * @author		Dieter Vanden Eynde <dieter@dieterve.be>
 * @since		2.0
 */
class SiteDataGrid extends SpoonDataGrid
{
	/**
	 * Default constructor
	 *
	 * @return	void
	 * @param	SpoonDataGridSource $source	The datasource.
	 */
	public function __construct(SpoonDataGridSource $source)
	{
		// call parent constructor
		parent::__construct($source);

		// set debugmode, this will force the recompile for the used templates
		$this->setDebug(SPOON_DEBUG);

		// set the compile-directory, so compiled templates will be in a folder that is writable
		$this->setCompileDirectory(CACHE_PATH . '/compiled');

		// set attributes for the datagrid
		$this->setAttributes(array('class' => 'datagrid'));

		// hide the id by default
		if(in_array('id', $this->getColumns())) $this->setColumnsHidden('id');

		// the labels
		$labels = array();

		// add classes on headers
		foreach($this->getColumns() as $column)
		{
			// class
			$this->setColumnHeaderAttributes($column, array('class' => $column));

			// build labels
			$labels[$column] = ucfirst(SiteLocale::lbl(SpoonFilter::toCamelCase($column)));
		}

		$this->setHeaderLabels($labels);

		// set paging class
		$this->setPagingClass('SiteDatagridPaging');
		$this->setPagingLimit(25);

		// disable paging
		$this->setPaging(false);

		// set default template
		$this->setTemplate(PATH_WWW . '/core/layout/templates/datagrid.tpl');
	}


	/**
	 * Retrieve the parsed output.
	 *
	 * @return	string
	 */
	public function getContent()
	{
		// mass action was set
		if($this->tpl->getAssignedValue('massAction') !== null) $this->tpl->assign('footer', true);

		// has paging & more than 1 page
		elseif($this->getPaging() && $this->getNumResults() > $this->getPagingLimit()) $this->tpl->assign('footer', true);

		// execute parent
		return parent::getContent();
	}


	/**
	 * Defines the default URL.
	 *
	 * @return	void
	 * @param	string $URL		The URL to use.
	 */
	public function setURL($URL)
	{
		// redefine
		$URL = (string) $URL;

		// append sort stuff
		if(strpos($URL, '?') > 0) $URL .= '&offset=[offset]&order=[order]&sort=[sort]';
		else $URL .= '?offset=[offset]&order=[order]&sort=[sort]';

		// store
		parent::setURL($URL);
	}

}


/**
 * This is our implementation of iSpoonDatagridPaging
 *
 * @package		backend
 * @subpackage	core
 *
 * @author		Tijs Verkoyen <tijs@sumocoders.be>
 * @author		Davy Hellemans <davy@netlash.com>
 * @since		2.0
 */
class SiteDatagridPaging implements iSpoonDataGridPaging
{
	/**
	 * Builds & returns the pagination
	 *
	 * @return	string
	 * @param	string $URL								The URL.
	 * @param	int $offset								The calculated offset.
	 * @param	string $order							The name of the column to sort on.
	 * @param	string $sort							The sorting method, possible values are: asc, desc.
	 * @param	int $numResults							The number of results.
	 * @param	int $numPerPage							The items per page.
	 * @param	bool[optional] $debug					Should debugging be enabled?
	 * @param	string[optional] $compileDirectory		The director for compiled templates.
	 */
	public static function getContent($URL, $offset, $order, $sort, $numResults, $numPerPage, $debug = true, $compileDirectory = null)
	{
		// if there is just one page we don't need paging
		if($numResults < $numPerPage) return '';

		// load template
		$tpl = new SpoonTemplate();

		// compile directory
		if($compileDirectory !== null) $tpl->setCompileDirectory($compileDirectory);
		else $tpl->setCompileDirectory(dirname(__FILE__));

		// force compiling
		$tpl->setForceCompile((bool) $debug);

		// init vars
		$pagination = null;
		$showFirstPages = false;
		$showLastPages = false;

		// current page
		$currentPage = ceil($offset / $numPerPage) + 1;

		// number of pages
		$numPages = ceil($numResults / $numPerPage);

		// populate count fields
		$pagination['num_pages'] = $numPages;
		$pagination['current_page'] = $currentPage;

		// as long as we are below page 7 we should show all pages starting from 1
		if($currentPage < 8)
		{
			// init vars
			$pagesStart = 1;
			$pagesEnd = ($numPages >= 7) ? 7 : $numPages;

			// show last pages
			if($numPages > 8) $showLastPages = true;
		}

		// as long as we are 7 pages from the end we should show all pages till the end
		elseif($currentPage > ($numPages - 7))
		{
			// init vars
			$pagesStart = ($numPages == 9) ? ($numPages - 6) : ($numPages - 7);
			$pagesEnd = $numPages;

			// show first pages
			$showFirstPages = true;
		}

		// page 7
		else
		{
			// init vars
			$pagesStart = $currentPage - 2;
			$pagesEnd = $currentPage + 2;
			$showFirstPages = true;
			$showLastPages = true;
		}

		// show previous
		if($currentPage > 1)
		{
			// set
			$pagination['show_previous'] = true;
			$pagination['previous_url'] = str_replace(array('[offset]', '[order]', '[sort]'), array(($offset - $numPerPage), $order, $sort), $URL);
		}

		// show first pages?
		if($showFirstPages)
		{
			// init var
			$pagesFirstStart = 1;
			$pagesFirstEnd = 2;

			// loop pages
			for($i = $pagesFirstStart; $i <= $pagesFirstEnd; $i++)
			{
				// add
				$pagination['first'][] = array('url' => str_replace(array('[offset]', '[order]', '[sort]'), array((($numPerPage * $i) - $numPerPage), $order, $sort), $URL),
												'label' => $i);
			}
		}

		// build array
		for($i = $pagesStart; $i <= $pagesEnd; $i++)
		{
			// init var
			$current = ($i == $currentPage);

			// add
			$pagination['pages'][] = array('url' => str_replace(array('[offset]', '[order]', '[sort]'), array((($numPerPage * $i) - $numPerPage), $order, $sort), $URL),
											'label' => $i, 'current' => $current);
		}

		// show last pages?
		if($showLastPages)
		{
			// init var
			$pagesLastStart = $numPages - 1;
			$pagesLastEnd = $numPages;

			// loop pages
			for($i = $pagesLastStart; $i <= $pagesLastEnd; $i++)
			{
				// add
				$pagination['last'][] = array('url' => str_replace(array('[offset]', '[order]', '[sort]'), array((($numPerPage * $i) - $numPerPage), $order, $sort), $URL),
												'label' => $i);
			}
		}

		// show next
		if($currentPage < $numPages)
		{
			// set
			$pagination['show_next'] = true;
			$pagination['next_url'] = str_replace(array('[offset]', '[order]', '[sort]'), array(($offset + $numPerPage), $order, $sort), $URL);
		}

		// multiple pages
		$pagination['multiple_pages'] = ($numPages == 1) ? false : true;

		// assign pagination
		$tpl->assign('pagination', $pagination);

		// assign labels
		$tpl->assign('previousLabel', SiteLocale::lbl('PreviousPage'));
		$tpl->assign('nextLabel', SiteLocale::lbl('NextPage'));
		$tpl->assign('goToLabel', SiteLocale::lbl('GoToPage'));

		// cough it up
		return $tpl->getContent(PATH_WWW . '/core/layout/templates/datagrid_paging.tpl');
	}
}


/**
 * A datagrid with an array as source
 *
 * @package		backend
 * @subpackage	core
 *
 * @author		Davy Hellemans <davy@netlash.com>
 * @since		2.0
 */
class SiteDataGridArray extends SiteDataGrid
{
	/**
	 * Default constructor
	 *
	 * @return	void
	 * @param	array $array	The data.
	 */
	public function __construct(array $array)
	{
		// create a new source-object
		$source = new SpoonDataGridSourceArray($array);

		// call the parent, as in create a new datagrid with the created source
		parent::__construct($source);
	}
}


/**
 * A datagrid with a DB-connection as source
 *
 * @package		backend
 * @subpackage	core
 *
 * @author		Davy Hellemans <davy@netlash.com>
 * @since		2.0
 */
class SiteDataGridDB extends SiteDataGrid
{
	/**
	 * Default constructor
	 *
	 * @return	void
	 * @param	string $query						The query to retrieve the data.
	 * @param	array[optional] $parameters			The parameters to be used inside the query.
	 * @param	string[optional] $resultsQuery		The optional count query, used to calculate the number of results.
	 * @param	array[optional] $resultsParameters 	Theh parameters to be used inside the results query.
	 */
	public function __construct($query, $parameters = array(), $resultsQuery = null, $resultsParameters = array())
	{
		// results query?
		$results = ($resultsQuery !== null) ? array($resultsQuery, $resultsParameters) : null;

		// create a new source-object
		$source = new SpoonDataGridSourceDB(Site::getDB(), array($query, (array) $parameters), $results);

		// call the parent, as in create a new datagrid with the created source
		parent::__construct($source);
	}
}


/**
 * A set of common used functions that will be applied on rows or columns
 *
 * @package		backend
 * @subpackage	core
 *
 * @author		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		2.0
 */
class SiteDataGridFunctions
{
	/**
	 * Formats plain text as HTML, links will be detected, paragraphs will be inserted
	 *
	 * @return	string
	 * @param	string $var		The data to cleanup.
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

		// get lines
		$lines = explode("\n", $var);
		$var = '';

		// loop lines
		foreach($lines as $line)
		{
			$firstChar = substr(trim($line), 0, 1);

			if(in_array($firstChar, array('-', '*')))
			{
				$var .= '<ul><li>' . trim(substr(trim($line), 1)) . '</li></ul>';
			}
			else $var .= $line;
		}

		// replace br's into p's
		$var = '<p>' . str_replace("\n", '</p><p>', $var) . '</p>';

		// cleanup
		$var = str_replace("\n", '', $var);
		$var = str_replace(array('<p></p>', '</ul><ul>', '<p><ul>', '</ul></p>'), array('', "\n", '<ul>', '</ul>'), $var);

		// return
		return $var;
	}


	/**
	 * Concat the arguments
	 *
	 * @return	string
	 * @param	string $x	...
	 */
	public static function concat($x)
	{
		// grab the arguments
		$args = func_get_args();

		// concat
		return implode('', $args);
	}


	/**
	 * Format a number as a float
	 *
	 * @return	string
	 * @param	float $number				The number to format.
	 * @param	int[optional] $decimals		The number of decimals.
	 */
	public static function formatFloat($number, $decimals = 2)
	{
		// redefine
		$number = (float) $number;
		$decimals = (int) $decimals;

		return number_format($number, $decimals, '.', ' ');
	}


	/**
	 * Get time ago as a string for use in a datagrid
	 *
	 * @return	string
	 * @param	int $timestamp		The UNIX-timestamp to convert in a time-ago-string.
	 */
	public static function getTimeAgo($timestamp)
	{
		// redefine
		$timestamp = (int) $timestamp;

		// invalid timestamp
		if($timestamp == 0) return '';

		// get url
		$url = Spoon::get('url');

		// return
		return '<abbr title="' . SpoonDate::getDate('l j F Y H:i:s', $timestamp,  $url->getLanguage()) . '"><time datetime="' . SpoonDate::getDate('Y-m-d\TH:i:s') . '">' . SpoonDate::getTimeAgo($timestamp, $url->getLanguage()) . '</time></abbr>';
	}


	/**
	 * Returns an image tag
	 *
	 * @return	string
	 * @param	string $path				The path to the image.
	 * @param	string $image				The filename of the image.
	 * @param	string[optional] $title		The title (will be used as alt).
	 */
	public static function showImage($path, $image, $title = '')
	{
		// redefine
		$path = (string) $path;
		$image = (string) $image;
		$title = (string) $title;

		// return
		return '<img src="' . $path . '/' . $image . '" alt="' . $title . '" />';
	}


	/**
	 * Truncate a string
	 *
	 * @return	string
	 * @param	string[optional] $string	The string to truncate.
	 * @param	int $length					The maximumlength for the string.
	 * @param	bool[optional] $useHellip	Should a hellip be appended?
	 */
	public static function truncate($string = null, $length, $useHellip = true)
	{
		// remove special chars
		$string = htmlspecialchars_decode($string);

		// less characters
		if(mb_strlen($string) <= $length) return SpoonFilter::htmlspecialchars($string);

		// more characters
		else
		{
			// hellip is seen as 1 char, so remove it from length
			if($useHellip) $length = $length - 1;

			// get the amount of requested characters
			$string = mb_substr($string, 0, $length);

			// add hellip
			if($useHellip) $string .= '…';

			// return
			return SpoonFilter::htmlspecialchars($string);
		}
	}
}

?>