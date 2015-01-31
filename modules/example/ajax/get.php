<?php

/**
 * AjaxExampleGet
 *
 * @package		example
 * @subpackage	get
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class AjaxExampleGet extends AjaxBaseAction
{
    /**
     * Execute the action
     */
    public function execute()
    {
        // get the term
        $id = SpoonFilter::getPostValue('id', null, '');

        sleep(2);

        if ($id == '') {
            SpoonHTTP::setHeadersByCode(400);

            // return
            $response['code'] = 400;
            $response['message'] = SiteLocale::err('FieldIsRequired');
        } else {
            // return
            $response['code'] = 200;
            $response['message'] = 'ok';
            $response['data'] = array('foo' => 'bar');
        }

        // output
        echo json_encode($response);
        exit;
    }
}
