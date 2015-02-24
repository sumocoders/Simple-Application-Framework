<?php

/**
 * This is our extended version of SpoonForm
 *
 * @package        site
 * @subpackage     core
 *
 * @author         Tijs Verkoyen <tijs@sumocoders.be>
 * @since          2.0
 */
class SiteForm extends SpoonForm
{
    /**
     * Class constructor.
     *
     * @param    string $name  Name of the form.
     * @param           string [optional] $action    The action (URL) whereto the form will be submitted, if not provided it will be generated.
     * @param           string [optional] $method    The method to use when submitting the form, default is POST.
     * @param           bool   [optional] $useToken    Should we automagically add a form token?
     */
    public function __construct($name, $action = null, $method = 'post', $useToken = false)
    {
        $action = ($action === null) ? '/' . trim((string) $_SERVER['REQUEST_URI'], '/') : (string) $action;
        parent::__construct($name, $action, $method, $useToken);
    }

    /**
     * Adds a datefield fields made out of three dropdowns. This makes it
     * easier for a user to select a date in the past. Note that you still have to
     * fetch values from these three dropdowns to save the date.
     *
     * For a field with the name date_of_birth, you can create a DateTime object like this:
     * $fields = $this->frm->getFields();
     * $date = DateTime::createFromFormat(
     *      'j-n-Y',
     *     $fields['date_of_birth_day']->getValue() . '-'
     *     . $fields['date_of_birth_month']->getValue() . '-'
     *     . $fields['date_of_birth_year']->getValue()
     * );
     *
     * @param  string   $name       The name.
     * @param  DateTime $value      The initial value.
     * @param  string   $class      The CSS-class to be used.
     * @param  string   $classError The CSS-class to be used when there is an error.
     * @return array
     */
    public function addBirthDate(
        $name,
        $value = null,
        $class = 'inputDatefieldNormal form-control',
        $classError = 'inputDateError'
    ) {
        // birthdate dropdown values
        $days = range(1, 31);
        $months = \SpoonLocale::getMonths(SiteLocale::getLanguage());
        $years = range(date('Y'), 1900);

        // default: no birth date setting
        $birthDay = '';
        $birthMonth = '';
        $birthYear = '';

        // get day, month and year
        if ($value !== null) {
            $birthDay = $value->format('j');
            $birthMonth = $value->format('n');
            $birthYear = $value->format('Y');
        }

        $this->addDropdown($name . '_day', array_combine($days, $days), $birthDay);
        $this->addDropdown($name . '_month', $months, $birthMonth);
        $this->addDropdown($name . '_year', array_combine($years, $years), (int) $birthYear);

        return array(
            'day' => $this->getField($name . '_day'),
            'month' => $this->getField($name . '_month'),
            'year' => $this->getField($name . '_year'),
        );
    }

    /**
     * Adds a single button.
     *
     * @param string $name  The name of the button.
     * @param string $value The text that should appear on the button.
     * @param        string [optional] $type        The type of button.
     * @param        string [optional] $class        The CSS-class for the button.
     * @return SpoonFormButton
     */
    public function addButton($name, $value, $type = null, $class = 'inputButton btn')
    {
        $this->add(new SpoonFormButton($name, $value, $type, $class));

        return $this->getField($name);
    }

    /**
     * Adds a single colourSelector.
     *
     * @return    SiteFormColour
     * @param    string $name  The name.
     * @param           string [optional] $value            The initial value.
     * @param           string [optional] $class            The CSS-class to be used.
     * @param           string [optional] $classError    The CSS-class to be used when there is an error.
     */
    public function addColour(
        $name,
        $value = '#',
        $class = 'inputColour form-control',
        $classError = 'inputColourError'
    ) {
        // add element
        $this->add(new SiteFormColour($name, $value, 7, $class, $classError, false));
        $this->getField($name)->setAttributes(
            array('pattern' => '^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$')
        );

        return $this->getField($name);
    }

    /**
     * Adds a single datefield.
     *
     * @return    SpoonFormDate
     * @param    string $name  The name.
     * @param           string [optional] $value            The initial value.
     * @param           string [optional] $mask            The mask to use.
     * @param           string [optional] $class            The CSS-class to be used.
     * @param           string [optional] $classError    The CSS-class to be used when there is an error.
     */
    public function addDate(
        $name,
        $value = null,
        $mask = null,
        $class = 'inputDatefieldNormal form-control',
        $classError = 'inputDateError'
    ) {
        // add element
        $this->add(new SpoonFormDate($name, $value, $mask, $class, $classError));

        return $this->getField($name);
    }

    /**
     * Adds a single dropdown.
     *
     * @return    SpoonFormDropdown
     * @param    string $name  The name.
     * @param           array  [optional] $values                The possible values. Each value should have a label and value-key.
     * @param           mixed  [optional] $selected            The selected value.
     * @param           bool   [optional] $multipleSelection    Can multiple elements be selected?
     * @param           string [optional] $class                The CSS-class to be used.
     * @param           string [optional] $classError        The CSS-class to be used when there is an error.
     */
    public function addDropdown(
        $name,
        array $values = null,
        $selected = null,
        $multipleSelection = false,
        $class = 'inputDropdown form-control',
        $classError = 'inputDropdownError'
    ) {
        // add element
        $this->add(new SiteFormDropdown($name, $values, $selected, $multipleSelection, $class, $classError));

        // return element
        return $this->getField($name);
    }

    /**
     * Adds an editor.
     *
     * @param string $name
     * @param string $value
     * @return SpoonFormTextarea
     */
    public function addEditor($name, $value = null)
    {
        $this->add(
            new SiteFormEditor($name, $value, 'form-control inputTextarea editor', 'form-control inputTextareaError editor', true)
        );

        return $this->getField($name);
    }

    /**
     * Adds a image field.
     *
     * @return    SpoonFormImage
     * @param    string $name  The name.
     * @param           string [optional] $class            The CSS-class to be used.
     * @param           string [optional] $classError    The CSS-class to be used when there is an error.
     */
    public function addImage($name, $class = 'inputFile', $classError = 'inputFileError')
    {
        $this->add(new SiteFormImage($name, $class, $classError));
        // only accept pictures
        $this->getField($name)->setAttributes(array('accept' => 'image/*'));

        return $this->getField($name);
    }

    /**
     * Adds Google Maps map with hidden field for location.
     *
     * @return  SiteFormMaps
     * @param   string $name            The base name for the inputfields and id of the mapcontainer
     * @param   array  $center          Coords of the center point
     * @param   int    $zoom            Zoom level
     * @param   array  $markers         Markers to place on the map array(array('lat'=>..., 'lng'=>...), ...)
     * @param   bool   $multipleMarkers Allow multiple markers to be set
     * @param   bool   $centerMarkers   Position the map so that all markers are visible (overwrites zoom and center)
     * @param   int    $width           Width of the map
     * @param   int    $height          Height of the map
     */
    public function addMap(
        $name,
        $center = array('lat' => 51.072102, 'lng' => 3.737269),
        $zoom = 15,
        $markers = array(),
        $multipleMarkers = false,
        $centerMarkers = false,
        $width = 880,
        $height = 440
    ) {
        $this->add(
            new SiteFormMaps($name, $center, $zoom, $markers, $multipleMarkers, $centerMarkers, $width, $height)
        );

        return $this->getField($name);
    }

    /**
     * Adds a single password field.
     *
     * @return    SpoonFormPassword
     * @param    string $name  The name.
     * @param           string [optional] $value            The initial value.
     * @param           int    [optional] $maxlength        The maximum-length the value can be.
     * @param           string [optional] $class            The CSS-class to be used.
     * @param           string [optional] $classError    The CSS-class to be used when there is an error.
     * @param           bool   [optional] $HTML            Is HTML allowed?
     */
    public function addPassword(
        $name,
        $value = null,
        $maxlength = null,
        $class = 'inputPassword form-control',
        $classError = 'inputPasswordError',
        $HTML = false
    ) {
        // add element
        $this->add(new SpoonFormPassword($name, $value, $maxlength, $class, $classError, $HTML));

        // return element
        return $this->getField($name);
    }

    /**
     * Adds a tags field
     *
     * @param  string       $name  The name.
     * @param  array        $value            The initial value.
     * @param  int          $maxlength        The maximum-length the value can be.
     * @param  string       $class            The CSS-class to be used.
     * @param  string       $classError       The CSS-class to be used when there is an error.
     * @param  bool         $HTML             Is HTML allowed?
     * @return SiteFormTags
     */
    public function addTags(
        $name,
        array $tags = null,
        $maxlength = null,
        $class = 'inputText tag-box form-control',
        $classError = 'inputTextError tag-box',
        $HTML = false
    ) {
        $tagsString = '';

        foreach ((array) $tags as $tag) {
            $tagsString .= '|' . $tag->getName();
        }

        $tagsString = rtrim($tagsString, '|');

        // add element
        $this->add(new SiteFormTags($name, $tagsString, $maxlength, $class, $classError, $HTML));

        // return element
        return $this->getField($name);
    }

    /**
     * Adds a single textfield.
     *
     * @return    SpoonFormText
     * @param    string $name  The name.
     * @param           string [optional] $value            The initial value.
     * @param           int    [optional] $maxlength        The maximum-length the value can be.
     * @param           string [optional] $class            The CSS-class to be used.
     * @param           string [optional] $classError    The CSS-class to be used when there is an error.
     * @param           bool   [optional] $HTML            Is HTML allowed?
     */
    public function addText(
        $name,
        $value = null,
        $maxlength = null,
        $class = 'inputText form-control',
        $classError = 'inputTextError',
        $HTML = false
    ) {
        // add element
        $this->add(new SpoonFormText($name, $value, $maxlength, $class, $classError, $HTML));

        // return element
        return $this->getField($name);
    }

    /**
     * Adds a single textarea.
     *
     * @return    SpoonFormTextarea
     * @param    string $name  The name.
     * @param           string [optional] $value            The initial value.
     * @param           string [optional] $class            The CSS-class to be used.
     * @param           string [optional] $classError    The CSS-class to be used when there is an error.
     * @param           bool   [optional] $HTML            Is HTML allowed?
     */
    public function addTextarea(
        $name,
        $value = null,
        $class = 'inputTextarea form-control',
        $classError = 'inputTextareaError',
        $HTML = false
    ) {
        // add element
        $this->add(new SpoonFormTextarea($name, $value, $class, $classError, $HTML));

        // return element
        return $this->getField($name);
    }

    /**
     * Adds a single timefield.
     *
     * @return    SpoonFormTime
     * @param    string $name  The name.
     * @param           string [optional] $value            The initial value.
     * @param           string [optional] $class            The CSS-class to be used.
     * @param           string [optional] $classError    The CSS-class to be used when there is an error.
     */
    public function addTime($name, $value = null, $class = 'inputTime form-control', $classError = 'inputTimeError')
    {
        // add element
        $this->add(new SpoonFormTime($name, $value, $class, $classError));

        // return element
        return $this->getField($name);
    }

    /**
     * Generates an example template, based on the elements already added.
     *
     * @return string
     */
    public function getTemplateExample()
    {
        $fields = $this->getFields();
        unset($fields['_utf8']);

        // start form
        $value = "\n";
        $value .= '{form:' . $this->getName() . "}\n";
        $value .= '	<div class="form-horizontal">' . "\n";

        /**
         * At first all the hidden fields need to be added to this form, since
         * they're not shown and are best to be put right beneath the start of the form tag.
         */
        foreach ($fields as $object) {
            // is a hidden field
            if (($object instanceof SpoonFormHidden) && $object->getName() != 'form') {
                $value .= "\t" . '{$hid' . str_replace('[]', '', SpoonFilter::toCamelCase($object->getName())) . "}\n";
            }
        }

        /**
         * Add all the objects that are NOT hidden fields. Based on the existence of some methods
         * errors will or will not be shown.
         */
        foreach ($fields as $object) {
            // NOT a hidden field
            if (!($object instanceof SpoonFormHidden)) {
                $name = str_replace('[]', '', SpoonFilter::toCamelCase($object->getName()));

                // buttons
                if ($object instanceof SpoonFormButton) {
                    $value .= '		<div class="control-group">' . "\n";
                    $value .= '			<div class="controls">' . "\n";
                    $value .= '				{$btn' . $name . '}' . "\n";
                    $value .= '			</div>' . "\n";
                    $value .= '		</div>' . "\n";
                } // single checkboxes
                elseif ($object instanceof SpoonFormCheckbox) {
                    $value .= '		<div class="control-group{option:chk' . $name . 'Error} error{/option:chk' . $name . 'Error}">' . "\n";
                    $value .= '			<div class="controls">' . "\n";
                    $value .= '				<label for="' . $object->getAttribute(
                            'id'
                        ) . '" class="checkbox">{$chk' . $name . '} ' . $name . '</label> {$chk' . $name . 'Error}' . "\n";
                    $value .= '			</div>' . "\n";
                    $value .= '		</div>' . "\n";
                } // multi checkboxes
                elseif ($object instanceof SpoonFormMultiCheckbox) {
                    $value .= '		<div class="control-group{option:chk' . $name . 'Error} error{/option:chk' . $name . 'Error}">' . "\n";
                    $value .= '			<label class="control-label">' . $name . '</label>' . "\n";
                    $value .= '			<div class="controls">' . "\n";
                    $value .= '				{iteration:' . $object->getName() . '}' . "\n";
                    $value .= '					<label for="{$' . $object->getName(
                        ) . '.id}" class="checkbox">{$' . $object->getName(
                              ) . '.chk' . $name . '} {$' . $object->getName() . '.label}</label>' . "\n";
                    $value .= '				{/iteration:' . $object->getName() . '}' . "\n";
                    $value .= '				{$chk' . $name . 'Error}' . "\n";
                    $value .= '			</div>' . "\n";
                    $value .= '		</div>' . "\n";
                } // dropdowns
                elseif ($object instanceof SpoonFormDropdown) {
                    $value .= '		<div class="control-group{option:ddm' . $name . 'Error} error{/option:ddm' . $name . 'Error}">' . "\n";
                    $value .= '			<label for="' . $object->getAttribute(
                            'id'
                        ) . '" class="control-label">' . $name;
                    if (in_array('required', array_keys($object->getAttributes()))) {
                        ;
                    }
                    {
                        $value .= '<abbr title="{$msgRequired}">*</abbr>';
                    }
                    $value .= '</label>' . "\n";
                    $value .= '			<div class="controls">' . "\n";
                    $value .= '				{$ddm' . $name . '} {$ddm' . $name . 'Error}' . "\n";
                    $value .= '			</div>' . "\n";
                    $value .= '		</div>' . "\n";
                } // filefields
                elseif ($object instanceof SpoonFormFile) {
                    $value .= '		<div class="control-group{option:file' . $name . 'Error} error{/option:file' . $name . 'Error}">' . "\n";
                    $value .= '			<label for="' . $object->getAttribute(
                            'id'
                        ) . '" class="control-label">' . $name;
                    if (in_array('required', array_keys($object->getAttributes()))) {
                        ;
                    }
                    {
                        $value .= '<abbr title="{$msgRequired}">*</abbr>';
                    }
                    $value .= '</label>' . "\n";
                    $value .= '			<div class="controls">' . "\n";
                    $value .= '				{$file' . $name . '} {$file' . $name . 'Error}' . "\n";
                    $value .= '			</div>' . "\n";
                    $value .= '		</div>' . "\n";
                } // radiobuttons
                elseif ($object instanceof SpoonFormRadiobutton) {
                    $value .= '		<div class="control-group{option:rbt' . $name . 'Error} error{/option:rbt' . $name . 'Error}">' . "\n";
                    $value .= '			<label class="control-label">' . $name . '</label>' . "\n";
                    $value .= '			<div class="controls">' . "\n";
                    $value .= '				{iteration:' . $object->getName() . '}' . "\n";
                    $value .= '					<label for="{$' . $object->getName() . '.id}">{$' . $object->getName(
                        ) . '.rbt' . $name . '} {$' . $object->getName() . '.label}</label>' . "\n";
                    $value .= '				{/iteration:' . $object->getName() . '}' . "\n";
                    $value .= '				{$rbt' . $name . 'Error}' . "\n";
                    $value .= '			</div>' . "\n";
                    $value .= '		</div>' . "\n";
                } // textfields
                elseif (($object instanceof SpoonFormDate) || ($object instanceof SpoonFormPassword) || ($object instanceof SpoonFormTextarea) || ($object instanceof SpoonFormText) || ($object instanceof SpoonFormTime)) {
                    $value .= '		<div class="control-group{option:txt' . $name . 'Error} error{/option:txt' . $name . 'Error}">' . "\n";
                    $value .= '			<label for="' . $object->getAttribute(
                            'id'
                        ) . '" class="control-label">' . $name;
                    if (in_array('required', array_keys($object->getAttributes()))) {
                        ;
                    }
                    {
                        $value .= '<abbr title="{$msgRequired}">*</abbr>';
                    }
                    $value .= '</label>' . "\n";
                    $value .= '			<div class="controls">' . "\n";
                    $value .= '				{$txt' . $name . '} {$txt' . $name . 'Error}' . "\n";
                    $value .= '			</div>' . "\n";
                    $value .= '		</div>' . "\n";
                }
            }
        }

        // close form tag
        $value .= '	</div>' . "\n";
        $value .= '{/form:' . $this->getName() . '}';

        return $value;
    }

    /**
     * Parse this form in the given template.
     *
     * @param    SpoonTemplate $template The template to parse the form in.
     */
    public function parse(SpoonTemplate $template)
    {
        parent::parse($template);

        if ($this->isSubmitted() && !$this->isCorrect(true)) {
            $template->assign('formHasError', true);
        }
    }
}

/**
 * This is our extended version of SpoonFormImage
 *
 * @author Tijs Verkoyen <tijs@sumocoders.be>
 */
class SiteFormImage extends SpoonFormImage
{
    /**
     * Generate thumbnails based on the folders in the path
     * Use
     *  - 128x128 as folder name to generate an image that where the width will be 128px and the height will be 128px
     *  - 128x as folder name to generate an image that where the width will be 128px, the height will be calculated based on the aspect ratio.
     *  - x128 as folder name to generate an image that where the width will be 128px, the height will be calculated based on the aspect ratio.
     *
     * @param string $path
     * @param string $filename
     */
    public function generateThumbnails($path, $filename)
    {
        // create folder if needed
        if (!SpoonDirectory::exists($path . '/source')) {
            SpoonDirectory::create($path . '/source');
        }

        // move the source file
        $this->moveFile($path . '/source/' . $filename);

        // generate the thumbnails
        Site::generateThumbnails($path, $path . '/source/' . $filename);
    }

    /**
     * This function will return the errors. It is extended so we can do image checks automatically.
     *
     * @return string
     */
    public function getErrors()
    {
        // do an image validation
        if ($this->isFilled()) {
            $this->isAllowedExtension(array('jpg', 'jpeg', 'gif', 'png'), SiteLocale::err('JPGGIFAndPNGOnly'));
            $this->isAllowedMimeType(
                array('image/jpeg', 'image/gif', 'image/png'),
                SiteLocale::err('JPGGIFAndPNGOnly')
            );
        }

        return $this->errors;
    }
}

/**
 * @author Jelmer Prins <jelmer@sumocoders.be>
 * Class SiteFormColour
 */
class SiteFormColour extends SpoonFormText
{
    /**
     * This function will return the errors. It is extended so we can do text checks automatically.
     *
     * @return string
     */
    public function getErrors()
    {
        // do an colour validation
        if ($this->isFilled()) {
            $this->isValidAgainstRegexp(
                '/#([a-f]|[A-F]|[0-9]){3}(([a-f]|[A-F]|[0-9]){3})?\b/',
                SiteLocale::err('ColourIsInvalid')
            );
        }

        return $this->errors;
    }
}

/**
 * This is our extended version of SpoonFormImage
 *
 * @author Tijs Verkoyen <tijs@sumocoders.be>
 */
class SiteFormDropdown extends SpoonFormDropdown
{
    /**
     * Retrieves the custom attributes as HTML.
     *
     * @return    string
     * @param    array $variables The variables to get the attributes-HTML for.
     */
    protected function getAttributesHTML(array $variables)
    {
        // because of our layout we have to remove the size attribute if it is 1
        if (isset($this->attributes['size']) && $this->attributes['size'] == 1) {
            unset($this->attributes['size']);
        }

        return parent::getAttributesHTML($variables);
    }
}

/**
 * Adds a map where one or multiple markers can be placed location can be set
 *
 * @author Jelmer Prins <jelmer@sumocoders.be>
 */
class SiteFormMaps extends SpoonFormInput
{
    /**
     * The base id for the inputfields
     * @var string
     */
    private $id;

    /**
     * The base name for the inputfields
     * @var string
     */
    private $name;

    /**
     * Initial location on the map
     * @var array
     */
    private $center;

    /**
     * Initial zoom level of the map
     * @var int
     */
    private $zoom;

    /**
     * Array with markers for on the map
     * @var array
     */
    private $markers;

    /**
     * Array with the latitudes of the markers
     * @var array
     */
    private $lats;

    /**
     * Array with the longitudes of the markers
     * @var array
     */
    private $lngs;

    /**
     * Allow multiple markers to be set
     * @var   bool
     */
    private $multipleMarkers;

    /**
     * this will position the map so that all markers are visible (overwrites zoom and center)
     * @var bool
     */
    private $centerMarkers;

    /**
     * Width of the map
     * @var int
     */
    private $width;
    /**
     * Height of the map
     * @var int
     */
    private $height;

    /**
     * Class constructor.
     * @param string $name
     * @param array  $center
     * @param int    $zoom
     * @param array  $markers Markers to place on the map array(array('lat'=>..., 'lng'=>...), ...)
     * @param bool   $multipleMarkers
     * @param bool   $centerMarkers
     * @param int    $width
     * @param int    $height
     */
    public function __construct(
        $name,
        $center = array('lat' => 51.072102, 'lng' => 3.737269),
        $zoom = 15,
        $markers = array(),
        $multipleMarkers = false,
        $centerMarkers = false,
        $width = 880,
        $height = 440
    ) {
        $this->name = (string) $name;
        $this->center = (array) $center;
        $this->zoom = (int) $zoom;
        $this->markers = (array) $markers;
        $this->multipleMarkers = $multipleMarkers;
        $this->centerMarkers = (bool) $centerMarkers;
        $this->width = (int) $width;
        $this->height = (int) $height;
        $this->id = SpoonFilter::toCamelCase((string) $name, '_', true);

        $this->attributes['id'] = $this->id;
        $this->attributes['name'] = $this->name;

        $this->lats = array();
        $this->lngs = array();
        foreach ($this->markers as $marker) {
            $this->lats[] = $marker['lat'];
            $this->lngs[] = $marker['lng'];
        }

        $this->value = array(
            'lat' => $this->lats,
            'lng' => $this->lngs,
            'zoom' => $this->zoom
        );
    }

    /**
     * @param   SpoonTemplate $template
     * @return  string
     */
    public function parse(SpoonTemplate $template = null)
    {
        // map container
        $mapContainer = '<div class="googleMapsMap" id="' . $this->id . '" ';
        $mapContainer .= 'data-multipleMarkers="' . var_export(
                $this->multipleMarkers,
                true
            ) . '" data-centerMarkers="' . var_export($this->centerMarkers, true) . '" ';
        $mapContainer .= 'style="width:' . $this->width . 'px;height:' . $this->height . 'px"></div>';

        //hidden field for lat
        $hiddenLat = '<input type="hidden" id="' . $this->id . '_lat" name="' . $this->name . '[lat]" value="' . implode(
                ',',
                $this->lats
            ) . '" />';

        //hidden field for lng
        $hiddenLng = '<input type="hidden" id="' . $this->id . '_lng" name="' . $this->name . '[lng]" value="' . implode(
                ',',
                $this->lngs
            ) . '" />';

        //hidden field for zoom
        $hiddenZoom = '<input type="hidden" id="' . $this->id . '_zoom" name="' . $this->name . '[zoom]" value="' . $this->zoom . '" />';

        //hidden field for center
        $hiddenCenter = '<input type="hidden" id="' . $this->id . '_center" name="' . $this->name . '[center]" value="' . implode(
                ',',
                $this->center
            ) . '" />';

        //output
        $output = $mapContainer . $hiddenLat . $hiddenLng . $hiddenZoom . $hiddenCenter;
        // template
        if ($template !== null) {
            $template->addJavascriptFile('/core/js/framework.googlemaps.js');
            $template->assign('map' . SpoonFilter::toCamelCase($this->name), $output);
            $template->assign(
                'map' . SpoonFilter::toCamelCase($this->name) . 'Error',
                ($this->errors != '') ? '<span class="formError">' . $this->errors . '</span>' : ''
            );
        }

        return $output;
    }

    /**
     * Retrieve the initial or submitted value.
     * @return    array
     */
    public function getValue()
    {
        // redefine default value
        $value = $this->value;
        // added to form
        if ($this->isSubmitted()) {
            // post/get data
            $data = $this->getMethod(true);

            // submitted by post/get (may be empty)
            if (isset($data[$this->attributes['name']])) {
                // value
                $value = $data[$this->getName()];
                $value['lat'] = explode(',', $value['lat']);
                $value['lng'] = explode(',', $value['lng']);
                $value['center'] = explode(',', $value['center']);
                $value['markers'] = array();
                if (sizeof($value['lng']) === sizeof($value['lat'])) {
                    for ($i = sizeof($value['lng']) - 1; $i >= 0; $i--) {
                        $value['markers'][] = array(
                            'lat' => $value['lat'][$i],
                            'lng' => $value['lng'][$i]
                        );
                    }
                }
            }
        }

        return $value;
    }

    /**
     * Checks if this field was submitted & filled.
     *
     * @return    bool
     * @param    string [optional] $error        The error message to set.
     */
    public function isFilled($error = null)
    {
        // post/get data
        $data = $this->getMethod(true);
        $value = isset($data[$this->getName()])
            ? $data[$this->getName()]
            : array();
        if (empty($value['lat']) || empty($value['lng']) || empty($value['zoom']) || empty($value['center'])) {
            if ($error !== null) {
                $this->setError($error);
            }

            return false;
        }

        return true;
    }
}

/**
 * Class SiteFormEditor
 * A text area with an WYSIWYG editor
 * @author Jelmer Prins <jelmer@sumocoders.be>
 */
class SiteFormEditor extends SpoonFormTextarea
{
    /**
     * @param   SpoonTemplate $template
     * @return  string
     */
    public function parse(SpoonTemplate $template = null)
    {
        $output = parent::parse($template);
        $template->assign('editor' . SpoonFilter::toCamelCase($this->getName()), $output);
        $template->assign(
            'editor' . SpoonFilter::toCamelCase($this->getName()) . 'Error',
            ($this->errors != '') ? '<span class="formError">' . $this->errors . '</span>' : ''
        );

        return $output;
    }
}

/**
 * @author Wouter Sioen <wouter@sumocoders.be>
 *
 * A Custom textfield containing comma seperated tags
 */
class SiteFormTags extends SpoonFormText
{
    /**
     * Note that the variable name is only allowHTML to be compliant with the parent.
     * It should be named "returnObjects" or something similar.
     *
     * @param bool $allowHTML Will objects be returned?
     */
    public function getValue($allowHTML = null)
    {
        if ($allowHTML === true) {
            $tags = explode('|', parent::getValue());

            // get the existing tag or fallback to a new one
            foreach ($tags as $key => $tag) {
                if (empty($tag)) {
                    unset($tags[$key]);
                }

                try {
                    $tags[$key] = Tag::getByName($tag);
                } catch (InvalidArgumentException $e) {
                    $tagObject = new Tag();
                    $tagObject->setName($tag);

                    $tags[$key] = $tagObject;
                }
            }

            return $tags;
        }

        return parent::getValue();
    }
}
