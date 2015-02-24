<?php

/**
 * AjaxTagsAutocomplete
 *
 * @package     tags
 * @subpackage  autocomplete
 *
 * @author      Wouter Sioen <wouter@sucomoders.be>
 */
class AjaxTagsAutocomplete extends AjaxBaseAction
{
    /**
     * Execute the action
     */
    public function execute()
    {
        // get the term
        $term = SpoonFilter::getPostValue('term', null, '');
        $response = array();

        if ($term == '') {
            SpoonHTTP::setHeadersByCode(400);

            // bad request
            $response['code'] = 400;
            $response['message'] = SiteLocale::err('FieldIsRequired');
        } else {
            $tags = Tag::getStartsWith($term);
            foreach ($tags as &$tag) {
                $tag = $tag->toArray();
            }

            // return
            $response['code'] = 200;
            $response['message'] = 'ok';
            $response['data'] = $tags;
        }

        // output
        echo json_encode($response);
        exit;
    }
}
