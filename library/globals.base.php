<?php

/**
 * Global configuration options and constants
 *
 * @author	Tijs Verkoyen <tijs@sumocoders.be>
 */

/**
 * Spoon configuration
 */
// should the debug information be shown
define('SPOON_DEBUG', true);
// email address where the exceptions will be mailed to
define('SPOON_DEBUG_EMAIL', '');
// message for the visitors when an exception occur
define('SPOON_DEBUG_MESSAGE', 'Internal error.');
// default charset used in spoon.
define('SPOON_CHARSET', 'utf-8');

/**
 * Database configuration
 * @remark remove if you don't need a database
 */
// type of connection
define('DB_TYPE', 'mysql');
// database name
define('DB_DATABASE', '<database_name>');
// database host
define('DB_HOSTNAME', '<database_server>');
// database username
define('DB_USERNAME', '<database_username>');
// database password
define('DB_PASSWORD', '<database_password>');

/**
 * Site configuration
 */
// the domain (without http)
define('SITE_DOMAIN', isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : '<url>');	// @todo provide correct url
// the default title
define('SITE_DEFAULT_TITLE', '<name>'); // @todo	correct title
// the url
define('SITE_URL', 'http://' . SITE_DOMAIN);

/**
 * Mailserver configuration
 */
// mail server
define('MAIL_SERVER', '<mail_server:mail.crsolutions.be>');
// mail port
define('MAIL_PORT', ''<mail_port:587>'');
// mail username
define('MAIL_USERNAME', '<mail_username>');
// mail password
define('MAIL_PASSWORD', '<mail_password>');

/**
 * Path configuration
 *
 * Depends on the server layout
 */
// path to the website itself
define('PATH_WWW', realpath(dirname(__FILE__) . '/../'));
// path to the library
define('PATH_LIBRARY', realpath(dirname(__FILE__)));

/**
 * Errbit configuration
 */
define('ERRBIT_API_KEY', '');