<?php

/**
 * AjaxCoreBug
 *
 * @package		core
 * @subpackage	bug
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class AjaxCoreBug extends AjaxBaseAction
{
	/**
	 * Execute the action
	 *
	 * @return void
	 */
	public function execute()
	{
		// get the term
		$description = SpoonFilter::getPostValue('description', null, '');
		$screenshot = SpoonFilter::getPostValue('screenshot', null, '');
		$currentUser = SpoonFilter::getPostValue('currentUser', null, '', 'array');
		$data = (array) SpoonFilter::getPostValue('data', null, '', 'array');

		if($description == '')
		{
			SpoonHTTP::setHeadersByCode(400);

			// return
			$response['code'] = 400;
			$response['message'] = SiteLocale::err('FieldIsRequired');
		}

		else
		{
			// build mail
			$email = new SpoonEmail();
			$email->setTemplateCompileDirectory(PATH_WWW . '/cache/compiled_templates');
			$email->setFrom('no-reply@sumocoders.be', SITE_DEFAULT_TITLE);
			$email->addRecipient('feedback@verkoyen.eu', 'SumoCoders');
			$email->setSubject(SITE_DEFAULT_TITLE . ': bugreport');

 			// add current user info if provided
 			if(isset($currentUser['name']) && isset($currentUser['email']))
 			{
 				$email->setReplyTo($currentUser['email'], $currentUser['name']);
 			}

			// screenshot provided?
			if($screenshot != '')
			{
				$screenshot = base64_decode(substr($screenshot, strpos($screenshot, ',') + 1));

				// store in tempfile
				$filename = tempnam(sys_get_temp_dir(), 'screenshot');
				file_put_contents($filename, $screenshot);

				$email->addAttachment($filename, date('YmdHis') . '.png');
			}

			// add some data
			$html = '<dl>';
			$html .= '	<dt>Omschrijving</dt><dd>' . $description . '</dd>';
			$html .= '</dl>';

			// add some data about the website
			$html .= '<h3>Website data</h3>';
			$html .= '<dl>';

			// User agent
			if(isset($_SERVER['HTTP_USER_AGENT']))
			{
				$html .= '<dt>' . $key . '</dt><dd><pre>'. var_export($_SERVER['HTTP_USER_AGENT'], true)  .'</pre></dd>';
			}

			// loop the data that was passes
			foreach($data as $key => $value)
			{
				$html .= '<dt>' . $key . '</dt><dd><pre>'. var_export($value, true)  .'</pre></dd>';
			}

			$html .= '</dl>';

			// add some data about some global variables
			$html .= '<h3>Variables</h3>';
			$html .= '<dl>';

			$html .= '	<dt>$_COOKIE</dt><dd><pre>';
			if(isset($_COOKIE) && !empty($_COOKIE)) $html .= var_export($_COOKIE, true);
			$html .= '</pre></dd>';

			$html .= '	<dt>$_SESSION</dt><dd><pre>';
			if(isset($_SESSION) && !empty($_SESSION)) $html .= var_export($_SESSION, true);
			$html .= '</pre></dd>';

			$html .= '</dl>';

			// set the HTML-content
			$email->setHTMLContent($html);

			// send the email
			$email->send();

			// return
			$response['code'] = 200;
			$response['message'] = 'ok';
		}

		// output
		echo json_encode($response);
		exit;
	}
}
