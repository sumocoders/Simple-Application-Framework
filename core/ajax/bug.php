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
		$screenShot = SpoonFilter::getPostValue('screenshot', null, '');
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
			// remove screen shot from POST
			unset($_POST['screenshot']);

			if(SPOON_DEBUG_EMAIL != '') $to = SPOON_DEBUG_EMAIL;
			else $to = 'bugs@sumocoders.be';


			$message = Swift_Message::newInstance(SITE_DEFAULT_TITLE . ': bug report');
			$message->setFrom('no-reply@sumocoders.be', SITE_DEFAULT_TITLE);
			$message->setTo($to);
			if(isset($currentUser['name']) && isset($currentUser['email']))
			{
				$message->setReplyTo($currentUser['email'], $currentUser['name']);
			}

			// screen shot provided?
			if($screenShot != '')
			{
				$screenShot = base64_decode(substr($screenShot, strpos($screenShot, ',') + 1));
				$filename = tempnam(sys_get_temp_dir(), 'screenshot') . '.png';
				file_put_contents($filename, $screenShot);
				$message->attach(Swift_Attachment::fromPath($filename));
			}

			// generate output
			$output = '<html>
							<head>
								<title></title>
							</head>
							<body style="background-color: #F2F2F2; color: #0000000, font-family: Verdana, Tahoma, Arial; font-size 10px; margin: 0; padding: 0;">
								<table width="100%">
									<tr>
										<td style="vertical-align: top; font-family: Verdana, Tahoma, Arial; font-size: 10px; color: #000000;">&nbsp;</td>
										<td style="width: 550px">
											<table width="550px;">
												<tr>
													<td style="background-color: #EEEEEE; border: 1px solid #B2B2B2;">
														<h1 style="font-size: 12px; margin: 5px 5px 12px 5px; padding: 0 0 5px 0; color: #000000; font-family: Verdana, Tahoma, Arial; border-bottom: 1px solid #999999;">Feedback</h1>
														<table width="550px">
															<tr>
																<th width="110px" style="vertical-align: top; text-align: left; font-weight: 700; padding: 0 0 0 10px; font-family: Verdana, Tahoma, Arial; font-size: 10px; color: #000000;">Message</th>
																<td style="vertical-align: top; font-family: Verdana, Tahoma, Arial; font-size: 10px; color: #000000;">' . nl2br($description) . '</td>
															</tr>
															<tr>
																<th width="110px" style="vertical-align: top; text-align: left; font-weight: 700; padding: 0 0 0 10px; font-family: Verdana, Tahoma, Arial; font-size: 10px; color: #000000;">Date</th>
																<td style="vertical-align: top; font-family: Verdana, Tahoma, Arial; font-size: 10px; color: #000000;">' . date('r') . '</td>
															</tr>
															<tr>
																<th width="110px" style="vertical-align: top; text-align: left; font-weight: 700; padding: 0 0 0 10px; font-family: Verdana, Tahoma, Arial; font-size: 10px; color: #000000;">URL</th>
																<td style="vertical-align: top; font-family: Verdana, Tahoma, Arial; font-size: 10px; color: #000000;">' . "\n";
			// request URL
			$output .= '											<a href="' . $data['url'] . '">' . $data['url'] . '</a>' . "\n";
			$output .= '										</td>
															</tr>
															<tr>
																<th width="110px" style="vertical-align: top; text-align: left; font-weight: 700; padding: 0 0 0 10px; font-family: Verdana, Tahoma, Arial; font-size: 10px; color: #000000;">Referring URL</th>
																<td style="vertical-align: top; font-family: Verdana, Tahoma, Arial; font-size: 10px; color: #000000;">' . "\n";
			// referring URL
			if(isset($_SERVER['HTTP_REFERER']) && $_SERVER['HTTP_REFERER'] != '')
			{
				$output .= '										<a href="' . $_SERVER['HTTP_REFERER'] . '">' . $_SERVER['HTTP_REFERER'] . '</a>' . "\n";
			}
			else $output .= '										<i>(Unknown)</i>' . "\n";

			$output .= '										</td>
															</tr>';
			// we know about the last error
			if(error_get_last() !== null)
			{
				// define message
				$error = error_get_last();

				// show output
				$output .= '								<tr>
																<th width="110px" style="vertical-align: top; text-align: left; font-weight: 700; padding: 0 0 0 10px; font-family: Verdana, Tahoma, Arial; font-size: 10px; color: #000000;">PHP error</th>
																<td style="vertical-align: top; font-family: Verdana, Tahoma, Arial; font-size: 10px; color: #000000;">' . $error['message'] . '</td>
															</tr>';
			}

			$output .= '								</table>
													</td>
												</tr>' . "\n";


			// output the super global variables, if any
			$hasVars = false;
			foreach(array('GET', 'POST', 'COOKIE', 'FILES') as $superGlobal)
			{
				$hasVars |= count($GLOBALS['_' . $superGlobal]);
			}

			if($hasVars)
			{
				$output .= '					<tr>
													<td style="vertical-align: top; font-family: Verdana, Tahoma, Arial; font-size: 10px; color: #000000;">&nbsp;</td>
												</tr>
												<tr>
													<td style="background-color: #EEEEEE; border: 1px solid #B2B2B2;">
														<h1 style="font-size: 12px; margin: 5px 5px 12px 5px; padding: 0 0 5px 0; color: #000000; font-family: Verdana, Tahoma, Arial; border-bottom: 1px solid #999999;">Variables</h1>
														<table width="550px;">' . "\n";

				foreach(array('GET', 'POST', 'COOKIE', 'FILES') as $superGlobal)
				{
					if(!empty($GLOBALS['_' . $superGlobal]))
					{
						$output .= '						<tr>
																<th width="110px" style="vertical-align: top; text-align: left; font-weight: 700; padding: 0 10px 0 10px; font-family: Verdana, Tahoma, Arial; font-size: 10px; color: #000000;">$_' . $superGlobal . '</th>
																<td style="vertical-align: top; font-family: Verdana, Tahoma, Arial; font-size: 10px; color: #000000;">
																	<pre style="font-family: Courier; margin-bottom: 10px;">' . exceptionHandlerDumper($GLOBALS['_' . $superGlobal]) . '</pre>
																</td>
															</tr>' . "\n";
					}
				}
			}

			// continue output generation
			$output .= '								</table>
													</td>
												</tr>
												<tr>
													<td style="vertical-align: top; font-family: Verdana, Tahoma, Arial; font-size: 10px; color: #000000;">&nbsp;</td>
												</tr>
												<tr>
													<td style="background-color: #EEEEEE; border: 1px solid #B2B2B2;">
														<h1 style="font-size: 12px; margin: 5px 5px 12px 5px; padding: 0 0 5px 0; color: #000000; font-family: Verdana, Tahoma, Arial; border-bottom: 1px solid #999999;">Passed data</h1>
														<table width="550px;">' . "\n";

			foreach($data as $key => $value);
			{
				$output .= '						<tr>
																<th width="110px" style="vertical-align: top; text-align: left; font-weight: 700; padding: 0 10px 0 10px; font-family: Verdana, Tahoma, Arial; font-size: 10px; color: #000000;">' . $key . '</th>
																<td style="vertical-align: top; font-family: Verdana, Tahoma, Arial; font-size: 10px; color: #000000;">
																	<pre style="font-family: Courier; margin-bottom: 10px;">' . exceptionHandlerDumper($value) . '</pre>
																</td>
															</tr>' . "\n";
			}

			$output .= '								</table>
													</td>
												</tr>
											</table>
										</td>
										<td style="vertical-align: top; font-family: Verdana, Tahoma, Arial; font-size: 10px; color: #000000;">&nbsp;</td>
									</tr>
								</table>
							</body>
						</html>';

			$message->setBody($output, 'text/html');

			// return
			$response['code'] = 200;
			$response['data'] = Site::sendMail($message);
			$response['message'] = 'ok';
		}

		// output
		echo json_encode($response);
		exit;
	}
}
