/**
 * Multiple select box
 *
 * @author  Tijs Verkoyen <tijs@sumocoders.be>
 * @author  Jelmer Prins <jelmer@sumocoders.be>
 */
(function($) {
  $.fn.multipleSelectbox = function(options) {
    var defaults = { splitChar: ',', emptyMessage: '', addLabel: 'add', removeLabel: 'delete', showIconOnly: false, afterBuild: null };
    var options = $.extend(defaults, options);

    return this.each(function() {
      var id = $(this).attr('id');
      var possibleOptions = $(this).find('option');
      var elements = get();
      var blockSubmit = false;

      $(this.form).submit(function() { return !blockSubmit; });

      if ($('#elementList-' + id).length > 0) { $('#elementList-' + id).parent('.multipleSelectWrapper').remove(); }
      var html = '<div class="multipleSelectWrapper">' +
          '	<div id="elementList-' + id + '" class="multipleSelectList">' + '	</div>' +
          '	<div class="input-append">' +
          '		<select id="addValue-' + id + '" name="addValue-' + id + '">';
      for (var i = 0; i < possibleOptions.length; i++) {
        html += '			<option value="' + $(possibleOptions[i]).attr('value') + '">' + $(possibleOptions[i]).html() + '</option>';
      }
      html += '		</select>' +
          '		<a href="#" id="addButton-' + id + '" class="btn btn-small">';
      html += '               <i class="icon-plus"></i>';
      if (options.showIconOnly) {
        html += '<span>' + options.addLabel + '</span>';
      }
      else {
        html += '<span class="hidden">' + options.addLabel + '</span>';
      }
      html += '			</a>' +
          '      </div>' +
          '</div>';

      $(this).css('visibility', 'hidden').css('position', 'absolute').css('top', '-9000px').css('left', '-9000px').attr('tabindex', '-1');
      $(this).before(html);

      build();

      $('#addButton-' + id).bind('click', function(e) {
        e.preventDefault();
        e.stopPropagation();
        add();
      });

      $('.multipleSelectWrapper').delegate('.deleteButton-' + id, 'click', function(e) {
        e.preventDefault();
        e.stopPropagation();
        remove($(this).data('id'));
      });

      function add() {
        blockSubmit = false;
        var value = $('#addValue-' + id).val();
        var inElements = false;
        $('#addValue-' + id).focus();
        if (value != null && value != '') {
          for (var i in elements) {
            if (value == elements[i]) inElements = true;
          }
          if (!inElements) {
            elements.push(value);
            $('#' + id).val(elements);
            build();
          }
        }
      }

      function build() {
        var html = '';
        if (elements.length == 0 && options.emptyMessage != '') {
          html = '<span class="text-muted">' + options.emptyMessage + '</span>';
        }
        else {
          for (var i in elements) {
            html += '<span class="badge">' +
                '	' + $('#' + id + ' option[value=' + elements[i] + ']').html() +
                '	<a href="#" class="deleteButton-' + id + '" data-id="' + elements[i] + '" title="' + options.removeLabel + '"><i class="icon-remove glyphicon glyphicon-remove"></i><span class="hidden">' + options.removeLabel + '</span></a>' +
                '</span>';
            $('#addValue-' + id + ' option[value=' + elements[i] + ']').prop('disabled', true);
          }
        }

        $('#elementList-' + id).html(html);
        $('#addValue-' + id).prop('disabled', false);
        if ($('#addValue-' + id + ' option:enabled').length == 0) {
          $('#addValue-' + id).prop('disabled', true);
        }
        $('#addValue-' + id).val($('#addValue-' + id + ' option:enabled:first').attr('value'));

        // call callback if specified
        if (options.afterBuild != null) { options.afterBuild(id); }
      }

      function get() {
        var chunks = $('#' + id).val();
        var elements = [];
        for (var i in chunks) {
          value = chunks[i].replace(/^\s+|\s+$/g, '');
          if (value != '') elements.push(value);
        }
        return elements;
      }

      function remove(value) {
        var index = $.inArray(value.toString(), elements);
        if (index > -1) elements.splice(index, 1);
        $('#' + id).val(elements.join(options.splitChar));
        $('#addValue-' + id + ' option[value=' + value + ']').prop('disabled', false);
        build();
      }
    });
  };
})(jQuery);

/*
 * jQuery MiniColors: A tiny color picker built on jQuery
 *
 * Copyright Cory LaViska for A Beautiful Site, LLC. (http://www.abeautifulsite.net/)
 *
 * Licensed under the MIT license: http://opensource.org/licenses/MIT
 *
 */
if (jQuery) {
  (function($) {
    // Defaults
    $.minicolors = {
      defaults: {
        animationSpeed:  50,
        animationEasing: 'swing',
        change:          null,
        changeDelay:     0,
        control:         'hue',
        defaultValue:    '',
        hide:            null,
        hideSpeed:       100,
        inline:          false,
        letterCase:      'lowercase',
        opacity:         false,
        position:        'bottom left',
        show:            null,
        showSpeed:       100,
        theme:           'default'
      }
    };

    // Public methods
    $.extend($.fn, {
      minicolors: function(method, data) {

        switch (method) {

          // Destroy the control
          case 'destroy':
            $(this).each(function() {
              destroy($(this));
            });
            return $(this);

          // Hide the color picker
          case 'hide':
            hide();
            return $(this);

          // Get/set opacity
          case 'opacity':
            // Getter
            if (data === undefined) {
              // Getter
              return $(this).attr('data-opacity');
            }
            else {
              // Setter
              $(this).each(function() {
                updateFromInput($(this).attr('data-opacity', data));
              });
            }
            return $(this);

          // Get an RGB(A) object based on the current color/opacity
          case 'rgbObject':
            return rgbObject($(this), method === 'rgbaObject');

          // Get an RGB(A) string based on the current color/opacity
          case 'rgbString':
          case 'rgbaString':
            return rgbString($(this), method === 'rgbaString');

          // Get/set settings on the fly
          case 'settings':
            if (data === undefined) {
              return $(this).data('minicolors-settings');
            }
            else {
              // Setter
              $(this).each(function() {
                var settings = $(this).data('minicolors-settings') || {};
                destroy($(this));
                $(this).minicolors($.extend(true, settings, data));
              });
            }
            return $(this);

          // Show the color picker
          case 'show':
            show($(this).eq(0));
            return $(this);

          // Get/set the hex color value
          case 'value':
            if (data === undefined) {
              // Getter
              return $(this).val();
            }
            else {
              // Setter
              $(this).each(function() {
                updateFromInput($(this).val(data));
              });
            }
            return $(this);

          // Initializes the control
          default:
            if (method !== 'create') data = method;
            $(this).each(function() {
              init($(this), data);
            });
            return $(this);

        }

      }
    });

    // Initialize input elements
    function init(input, settings) {

      var minicolors = $('<div class="minicolors" />'),
          defaults = $.minicolors.defaults;

      // Do nothing if already initialized
      if (input.data('minicolors-initialized')) return;

      // Handle settings
      settings = $.extend(true, {}, defaults, settings);

      // The wrapper
      minicolors
          .addClass('minicolors-theme-' + settings.theme)
          .toggleClass('minicolors-with-opacity', settings.opacity);

      // Custom positioning
      if (settings.position !== undefined) {
        $.each(settings.position.split(' '), function() {
          minicolors.addClass('minicolors-position-' + this);
        });
      }

      // The input
      input
          .addClass('minicolors-input')
          .data('minicolors-initialized', false)
          .data('minicolors-settings', settings)
          .prop('size', 7)
          .wrap(minicolors)
          .after(
              '<div class="minicolors-panel minicolors-slider-' + settings.control + '">' +
                  '<div class="minicolors-slider">' +
                  '<div class="minicolors-picker"></div>' +
                  '</div>' +
                  '<div class="minicolors-opacity-slider">' +
                  '<div class="minicolors-picker"></div>' +
                  '</div>' +
                  '<div class="minicolors-grid">' +
                  '<div class="minicolors-grid-inner"></div>' +
                  '<div class="minicolors-picker"><div></div></div>' +
                  '</div>' +
                  '</div>'
          );

      // The swatch
      if (!settings.inline) {
        input.after('<span class="minicolors-swatch"><span class="minicolors-swatch-color"></span></span>');
        input.next('.minicolors-swatch').on('click', function(event) {
          event.preventDefault();
          input.focus();
        });
      }

      // Prevent text selection in IE
      input.parent().find('.minicolors-panel').on('selectstart',function() { return false; }).end();

      // Inline controls
      if (settings.inline) input.parent().addClass('minicolors-inline');

      updateFromInput(input, false);

      input.data('minicolors-initialized', true);

    }

    // Returns the input back to its original state
    function destroy(input) {

      var minicolors = input.parent();

      // Revert the input element
      input
          .removeData('minicolors-initialized')
          .removeData('minicolors-settings')
          .removeProp('size')
          .removeClass('minicolors-input');

      // Remove the wrap and destroy whatever remains
      minicolors.before(input).remove();

    }

    // Shows the specified dropdown panel
    function show(input) {

      var minicolors = input.parent(),
          panel = minicolors.find('.minicolors-panel'),
          settings = input.data('minicolors-settings');

      // Do nothing if uninitialized, disabled, inline, or already open
      if (!input.data('minicolors-initialized') ||
          input.prop('disabled') ||
          minicolors.hasClass('minicolors-inline') ||
          minicolors.hasClass('minicolors-focus')
          ) {
        return;
      }

      hide();

      minicolors.addClass('minicolors-focus');
      panel
          .stop(true, true)
          .fadeIn(settings.showSpeed, function() {
            if (settings.show) settings.show.call(input.get(0));
          });

    }

    // Hides all dropdown panels
    function hide() {

      $('.minicolors-focus').each(function() {

        var minicolors = $(this),
            input = minicolors.find('.minicolors-input'),
            panel = minicolors.find('.minicolors-panel'),
            settings = input.data('minicolors-settings');

        panel.fadeOut(settings.hideSpeed, function() {
          if (settings.hide) settings.hide.call(input.get(0));
          minicolors.removeClass('minicolors-focus');
        });

      });
    }

    // Moves the selected picker
    function move(target, event, animate) {

      var input = target.parents('.minicolors').find('.minicolors-input'),
          settings = input.data('minicolors-settings'),
          picker = target.find('[class$=-picker]'),
          offsetX = target.offset().left,
          offsetY = target.offset().top,
          x = Math.round(event.pageX - offsetX),
          y = Math.round(event.pageY - offsetY),
          duration = animate ? settings.animationSpeed : 0,
          wx, wy, r, phi;

      // Touch support
      if (event.originalEvent.changedTouches) {
        x = event.originalEvent.changedTouches[0].pageX - offsetX;
        y = event.originalEvent.changedTouches[0].pageY - offsetY;
      }

      // Constrain picker to its container
      if (x < 0) x = 0;
      if (y < 0) y = 0;
      if (x > target.width()) x = target.width();
      if (y > target.height()) y = target.height();

      // Constrain color wheel values to the wheel
      if (target.parent().is('.minicolors-slider-wheel') && picker.parent().is('.minicolors-grid')) {
        wx = 75 - x;
        wy = 75 - y;
        r = Math.sqrt(wx * wx + wy * wy);
        phi = Math.atan2(wy, wx);
        if (phi < 0) phi += Math.PI * 2;
        if (r > 75) {
          r = 75;
          x = 75 - (75 * Math.cos(phi));
          y = 75 - (75 * Math.sin(phi));
        }
        x = Math.round(x);
        y = Math.round(y);
      }

      // Move the picker
      if (target.is('.minicolors-grid')) {
        picker
            .stop(true)
            .animate({
              top:  y + 'px',
              left: x + 'px'
            }, duration, settings.animationEasing, function() {
              updateFromControl(input, target);
            });
      }
      else {
        picker
            .stop(true)
            .animate({
              top: y + 'px'
            }, duration, settings.animationEasing, function() {
              updateFromControl(input, target);
            });
      }

    }

    // Sets the input based on the color picker values
    function updateFromControl(input, target) {

      function getCoords(picker, container) {

        var left, top;
        if (!picker.length || !container) return null;
        left = picker.offset().left;
        top = picker.offset().top;

        return {
          x: left - container.offset().left + (picker.outerWidth() / 2),
          y: top - container.offset().top + (picker.outerHeight() / 2)
        };

      }

      var hue, saturation, brightness, x, y, r, phi,

          hex = input.val(),
          opacity = input.attr('data-opacity'),

      // Helpful references
          minicolors = input.parent(),
          settings = input.data('minicolors-settings'),
          swatch = minicolors.find('.minicolors-swatch'),

      // Panel objects
          grid = minicolors.find('.minicolors-grid'),
          slider = minicolors.find('.minicolors-slider'),
          opacitySlider = minicolors.find('.minicolors-opacity-slider'),

      // Picker objects
          gridPicker = grid.find('[class$=-picker]'),
          sliderPicker = slider.find('[class$=-picker]'),
          opacityPicker = opacitySlider.find('[class$=-picker]'),

      // Picker positions
          gridPos = getCoords(gridPicker, grid),
          sliderPos = getCoords(sliderPicker, slider),
          opacityPos = getCoords(opacityPicker, opacitySlider);

      // Handle colors
      if (target.is('.minicolors-grid, .minicolors-slider')) {

        // Determine HSB values
        switch (settings.control) {

          case 'wheel':
            // Calculate hue, saturation, and brightness
            x = (grid.width() / 2) - gridPos.x;
            y = (grid.height() / 2) - gridPos.y;
            r = Math.sqrt(x * x + y * y);
            phi = Math.atan2(y, x);
            if (phi < 0) phi += Math.PI * 2;
            if (r > 75) {
              r = 75;
              gridPos.x = 69 - (75 * Math.cos(phi));
              gridPos.y = 69 - (75 * Math.sin(phi));
            }
            saturation = keepWithin(r / 0.75, 0, 100);
            hue = keepWithin(phi * 180 / Math.PI, 0, 360);
            brightness = keepWithin(100 - Math.floor(sliderPos.y * (100 / slider.height())), 0, 100);
            hex = hsb2hex({
              h: hue,
              s: saturation,
              b: brightness
            });

            // Update UI
            slider.css('backgroundColor', hsb2hex({ h: hue, s: saturation, b: 100 }));
            break;

          case 'saturation':
            // Calculate hue, saturation, and brightness
            hue = keepWithin(parseInt(gridPos.x * (360 / grid.width()), 10), 0, 360);
            saturation = keepWithin(100 - Math.floor(sliderPos.y * (100 / slider.height())), 0, 100);
            brightness = keepWithin(100 - Math.floor(gridPos.y * (100 / grid.height())), 0, 100);
            hex = hsb2hex({
              h: hue,
              s: saturation,
              b: brightness
            });

            // Update UI
            slider.css('backgroundColor', hsb2hex({ h: hue, s: 100, b: brightness }));
            minicolors.find('.minicolors-grid-inner').css('opacity', saturation / 100);
            break;

          case 'brightness':
            // Calculate hue, saturation, and brightness
            hue = keepWithin(parseInt(gridPos.x * (360 / grid.width()), 10), 0, 360);
            saturation = keepWithin(100 - Math.floor(gridPos.y * (100 / grid.height())), 0, 100);
            brightness = keepWithin(100 - Math.floor(sliderPos.y * (100 / slider.height())), 0, 100);
            hex = hsb2hex({
              h: hue,
              s: saturation,
              b: brightness
            });

            // Update UI
            slider.css('backgroundColor', hsb2hex({ h: hue, s: saturation, b: 100 }));
            minicolors.find('.minicolors-grid-inner').css('opacity', 1 - (brightness / 100));
            break;

          default:
            // Calculate hue, saturation, and brightness
            hue = keepWithin(360 - parseInt(sliderPos.y * (360 / slider.height()), 10), 0, 360);
            saturation = keepWithin(Math.floor(gridPos.x * (100 / grid.width())), 0, 100);
            brightness = keepWithin(100 - Math.floor(gridPos.y * (100 / grid.height())), 0, 100);
            hex = hsb2hex({
              h: hue,
              s: saturation,
              b: brightness
            });

            // Update UI
            grid.css('backgroundColor', hsb2hex({ h: hue, s: 100, b: 100 }));
            break;

        }

        // Adjust case
        input.val(convertCase(hex, settings.letterCase));

      }

      // Handle opacity
      if (target.is('.minicolors-opacity-slider')) {
        if (settings.opacity) {
          opacity = parseFloat(1 - (opacityPos.y / opacitySlider.height())).toFixed(2);
        }
        else {
          opacity = 1;
        }
        if (settings.opacity) input.attr('data-opacity', opacity);
      }

      // Set swatch color
      swatch.find('SPAN').css({
        backgroundColor: hex,
        opacity:         opacity
      });

      // Handle change event
      doChange(input, hex, opacity);

    }

    // Sets the color picker values from the input
    function updateFromInput(input, preserveInputValue) {

      var hex,
          hsb,
          opacity,
          x, y, r, phi,

      // Helpful references
          minicolors = input.parent(),
          settings = input.data('minicolors-settings'),
          swatch = minicolors.find('.minicolors-swatch'),

      // Panel objects
          grid = minicolors.find('.minicolors-grid'),
          slider = minicolors.find('.minicolors-slider'),
          opacitySlider = minicolors.find('.minicolors-opacity-slider'),

      // Picker objects
          gridPicker = grid.find('[class$=-picker]'),
          sliderPicker = slider.find('[class$=-picker]'),
          opacityPicker = opacitySlider.find('[class$=-picker]');

      // Determine hex/HSB values
      hex = convertCase(parseHex(input.val(), true), settings.letterCase);
      if (!hex) {
        hex = convertCase(parseHex(settings.defaultValue, true), settings.letterCase);
      }
      hsb = hex2hsb(hex);

      // Update input value
      if (!preserveInputValue) input.val(hex);

      // Determine opacity value
      if (settings.opacity) {
        // Get from data-opacity attribute and keep within 0-1 range
        opacity = input.attr('data-opacity') === '' ? 1 : keepWithin(parseFloat(input.attr('data-opacity')).toFixed(2), 0, 1);
        if (isNaN(opacity)) opacity = 1;
        input.attr('data-opacity', opacity);
        swatch.find('SPAN').css('opacity', opacity);

        // Set opacity picker position
        y = keepWithin(opacitySlider.height() - (opacitySlider.height() * opacity), 0, opacitySlider.height());
        opacityPicker.css('top', y + 'px');
      }

      // Update swatch
      swatch.find('SPAN').css('backgroundColor', hex);

      // Determine picker locations
      switch (settings.control) {

        case 'wheel':
          // Set grid position
          r = keepWithin(Math.ceil(hsb.s * 0.75), 0, grid.height() / 2);
          phi = hsb.h * Math.PI / 180;
          x = keepWithin(75 - Math.cos(phi) * r, 0, grid.width());
          y = keepWithin(75 - Math.sin(phi) * r, 0, grid.height());
          gridPicker.css({
            top:  y + 'px',
            left: x + 'px'
          });

          // Set slider position
          y = 150 - (hsb.b / (100 / grid.height()));
          if (hex === '') y = 0;
          sliderPicker.css('top', y + 'px');

          // Update panel color
          slider.css('backgroundColor', hsb2hex({ h: hsb.h, s: hsb.s, b: 100 }));
          break;

        case 'saturation':
          // Set grid position
          x = keepWithin((5 * hsb.h) / 12, 0, 150);
          y = keepWithin(grid.height() - Math.ceil(hsb.b / (100 / grid.height())), 0, grid.height());
          gridPicker.css({
            top:  y + 'px',
            left: x + 'px'
          });

          // Set slider position
          y = keepWithin(slider.height() - (hsb.s * (slider.height() / 100)), 0, slider.height());
          sliderPicker.css('top', y + 'px');

          // Update UI
          slider.css('backgroundColor', hsb2hex({ h: hsb.h, s: 100, b: hsb.b }));
          minicolors.find('.minicolors-grid-inner').css('opacity', hsb.s / 100);
          break;

        case 'brightness':
          // Set grid position
          x = keepWithin((5 * hsb.h) / 12, 0, 150);
          y = keepWithin(grid.height() - Math.ceil(hsb.s / (100 / grid.height())), 0, grid.height());
          gridPicker.css({
            top:  y + 'px',
            left: x + 'px'
          });

          // Set slider position
          y = keepWithin(slider.height() - (hsb.b * (slider.height() / 100)), 0, slider.height());
          sliderPicker.css('top', y + 'px');

          // Update UI
          slider.css('backgroundColor', hsb2hex({ h: hsb.h, s: hsb.s, b: 100 }));
          minicolors.find('.minicolors-grid-inner').css('opacity', 1 - (hsb.b / 100));
          break;

        default:
          // Set grid position
          x = keepWithin(Math.ceil(hsb.s / (100 / grid.width())), 0, grid.width());
          y = keepWithin(grid.height() - Math.ceil(hsb.b / (100 / grid.height())), 0, grid.height());
          gridPicker.css({
            top:  y + 'px',
            left: x + 'px'
          });

          // Set slider position
          y = keepWithin(slider.height() - (hsb.h / (360 / slider.height())), 0, slider.height());
          sliderPicker.css('top', y + 'px');

          // Update panel color
          grid.css('backgroundColor', hsb2hex({ h: hsb.h, s: 100, b: 100 }));
          break;

      }

      // Fire change event, but only if minicolors is fully initialized
      if (input.data('minicolors-initialized')) {
        doChange(input, hex, opacity);
      }

    }

    // Runs the change and changeDelay callbacks
    function doChange(input, hex, opacity) {

      var settings = input.data('minicolors-settings'),
          lastChange = input.data('minicolors-lastChange');

      // Only run if it actually changed
      if (!lastChange || lastChange.hex !== hex || lastChange.opacity !== opacity) {

        // Remember last-changed value
        input.data('minicolors-lastChange', {
          hex:     hex,
          opacity: opacity
        });

        // Fire change event
        if (settings.change) {
          if (settings.changeDelay) {
            // Call after a delay
            clearTimeout(input.data('minicolors-changeTimeout'));
            input.data('minicolors-changeTimeout', setTimeout(function() {
              settings.change.call(input.get(0), hex, opacity);
            }, settings.changeDelay));
          }
          else {
            // Call immediately
            settings.change.call(input.get(0), hex, opacity);
          }
        }
        input.trigger('change').trigger('input');
      }

    }

    // Generates an RGB(A) object based on the input's value
    function rgbObject(input) {
      var hex = parseHex($(input).val(), true),
          rgb = hex2rgb(hex),
          opacity = $(input).attr('data-opacity');
      if (!rgb) return null;
      if (opacity !== undefined) $.extend(rgb, { a: parseFloat(opacity) });
      return rgb;
    }

    // Genearates an RGB(A) string based on the input's value
    function rgbString(input, alpha) {
      var hex = parseHex($(input).val(), true),
          rgb = hex2rgb(hex),
          opacity = $(input).attr('data-opacity');
      if (!rgb) return null;
      if (opacity === undefined) opacity = 1;
      if (alpha) {
        return 'rgba(' + rgb.r + ', ' + rgb.g + ', ' + rgb.b + ', ' + parseFloat(opacity) + ')';
      }
      else {
        return 'rgb(' + rgb.r + ', ' + rgb.g + ', ' + rgb.b + ')';
      }
    }

    // Converts to the letter case specified in settings
    function convertCase(string, letterCase) {
      return letterCase === 'uppercase' ? string.toUpperCase() : string.toLowerCase();
    }

    // Parses a string and returns a valid hex string when possible
    function parseHex(string, expand) {
      string = string.replace(/[^A-F0-9]/ig, '');
      if (string.length !== 3 && string.length !== 6) return '';
      if (string.length === 3 && expand) {
        string = string[0] + string[0] + string[1] + string[1] + string[2] + string[2];
      }
      return '#' + string;
    }

    // Keeps value within min and max
    function keepWithin(value, min, max) {
      if (value < min) value = min;
      if (value > max) value = max;
      return value;
    }

    // Converts an HSB object to an RGB object
    function hsb2rgb(hsb) {
      var rgb = {};
      var h = Math.round(hsb.h);
      var s = Math.round(hsb.s * 255 / 100);
      var v = Math.round(hsb.b * 255 / 100);
      if (s === 0) {
        rgb.r = rgb.g = rgb.b = v;
      }
      else {
        var t1 = v;
        var t2 = (255 - s) * v / 255;
        var t3 = (t1 - t2) * (h % 60) / 60;
        if (h === 360) h = 0;
        if (h < 60) {
          rgb.r = t1;
          rgb.b = t2;
          rgb.g = t2 + t3;
        }
        else if (h < 120) {
          rgb.g = t1;
          rgb.b = t2;
          rgb.r = t1 - t3;
        }
        else if (h < 180) {
          rgb.g = t1;
          rgb.r = t2;
          rgb.b = t2 + t3;
        }
        else if (h < 240) {
          rgb.b = t1;
          rgb.r = t2;
          rgb.g = t1 - t3;
        }
        else if (h < 300) {
          rgb.b = t1;
          rgb.g = t2;
          rgb.r = t2 + t3;
        }
        else if (h < 360) {
          rgb.r = t1;
          rgb.g = t2;
          rgb.b = t1 - t3;
        }
        else {
          rgb.r = 0;
          rgb.g = 0;
          rgb.b = 0;
        }
      }
      return {
        r: Math.round(rgb.r),
        g: Math.round(rgb.g),
        b: Math.round(rgb.b)
      };
    }

    // Converts an RGB object to a hex string
    function rgb2hex(rgb) {
      var hex = [
        rgb.r.toString(16),
        rgb.g.toString(16),
        rgb.b.toString(16)
      ];
      $.each(hex, function(nr, val) {
        if (val.length === 1) hex[nr] = '0' + val;
      });
      return '#' + hex.join('');
    }

    // Converts an HSB object to a hex string
    function hsb2hex(hsb) {
      return rgb2hex(hsb2rgb(hsb));
    }

    // Converts a hex string to an HSB object
    function hex2hsb(hex) {
      var hsb = rgb2hsb(hex2rgb(hex));
      if (hsb.s === 0) hsb.h = 360;
      return hsb;
    }

    // Converts an RGB object to an HSB object
    function rgb2hsb(rgb) {
      var hsb = { h: 0, s: 0, b: 0 };
      var min = Math.min(rgb.r, rgb.g, rgb.b);
      var max = Math.max(rgb.r, rgb.g, rgb.b);
      var delta = max - min;
      hsb.b = max;
      hsb.s = max !== 0 ? 255 * delta / max : 0;
      if (hsb.s !== 0) {
        if (rgb.r === max) {
          hsb.h = (rgb.g - rgb.b) / delta;
        }
        else if (rgb.g === max) {
          hsb.h = 2 + (rgb.b - rgb.r) / delta;
        }
        else {
          hsb.h = 4 + (rgb.r - rgb.g) / delta;
        }
      }
      else {
        hsb.h = -1;
      }
      hsb.h *= 60;
      if (hsb.h < 0) {
        hsb.h += 360;
      }
      hsb.s *= 100 / 255;
      hsb.b *= 100 / 255;
      return hsb;
    }

    // Converts a hex string to an RGB object
    function hex2rgb(hex) {
      hex = parseInt(((hex.indexOf('#') > -1) ? hex.substring(1) : hex), 16);
      return {
        r: hex >> 16,
        g: (hex & 0x00FF00) >> 8,
        b: (hex & 0x0000FF)
      };
    }

    // Handle events
    $(document)
      // Hide on clicks outside of the control
        .on('mousedown.minicolors touchstart.minicolors', function(event) {
          if (!$(event.target).parents().add(event.target).hasClass('minicolors')) {
            hide();
          }
        })
      // Start moving
        .on('mousedown.minicolors touchstart.minicolors', '.minicolors-grid, .minicolors-slider, .minicolors-opacity-slider', function(event) {
          var target = $(this);
          event.preventDefault();
          $(document).data('minicolors-target', target);
          move(target, event, true);
        })
      // Move pickers
        .on('mousemove.minicolors touchmove.minicolors', function(event) {
          var target = $(document).data('minicolors-target');
          if (target) move(target, event);
        })
      // Stop moving
        .on('mouseup.minicolors touchend.minicolors', function() {
          $(this).removeData('minicolors-target');
        })
      // Show panel when swatch is clicked
        .on('mousedown.minicolors touchstart.minicolors', '.minicolors-swatch', function(event) {
          var input = $(this).parent().find('.minicolors-input');
          event.preventDefault();
          show(input);
        })
      // Show on focus
        .on('focus.minicolors', '.minicolors-input', function() {
          var input = $(this);
          if (!input.data('minicolors-initialized')) return;
          show(input);
        })
      // Fix hex on blur
        .on('blur.minicolors', '.minicolors-input', function() {
          var input = $(this),
              settings = input.data('minicolors-settings');
          if (!input.data('minicolors-initialized')) return;

          // Parse Hex
          input.val(parseHex(input.val(), true));

          // Is it blank?
          if (input.val() === '') input.val(parseHex(settings.defaultValue, true));

          // Adjust case
          input.val(convertCase(input.val(), settings.letterCase));

        })
      // Handle keypresses
        .on('keydown.minicolors', '.minicolors-input', function(event) {
          var input = $(this);
          if (!input.data('minicolors-initialized')) return;
          switch (event.keyCode) {
            case 9: // tab
              hide();
              break;
            case 13: // enter
            case 27: // esc
              hide();
              input.blur();
              break;
          }
        })
      // Update on keyup
        .on('keyup.minicolors', '.minicolors-input', function() {
          var input = $(this);
          if (!input.data('minicolors-initialized')) return;
          updateFromInput(input, true);
        })
      // Update on paste
        .on('paste.minicolors', '.minicolors-input', function() {
          var input = $(this);
          if (!input.data('minicolors-initialized')) return;
          setTimeout(function() {
            updateFromInput(input, true);
          }, 1);
        });
  })(jQuery);
}

/**
 * Tag-box
 *
 * @author  Tijs Verkoyen <tijs@sumocoders.be>
 * @author  Dieter Vanden Eynde <dieter@netlash.com>
 */
(function($)
{
  $.fn.tagBox = function(options)
  {
    // define defaults
    var defaults =
    {
      splitChar:    '|',
      emptyMessage: '',
      errorMessage: 'Add the tag before submitting',
      addLabel:     'add',
      removeLabel:  'delete',
      params:       {},
      canAddNew:    false,
      showIconOnly: true,
      multiple:     true
    };

    // extend options
    var options = $.extend(defaults, options);

    // loop all elements
    return this.each(function()
    {
      var id = $(this).attr('id');
      var elements = get();
      var blockSubmit = false;
      var timer = null;

      // reset label, so it points to the correct item
      $('label[for="' + id + '"]').attr('for', 'addValue-' + id);

      // bind submit
      $(this.form).submit(function(e) {
        // hide before..
        $('#errorMessage-' + id).remove();

        if (blockSubmit && $('#addValue-' + id).val().replace(/^\s+|\s+$/g, '') != '') {
          // show warning
          $('#addValue-' + id).parents('.oneLiner').append('<span style="display: none;" id="errorMessage-' + id + '" class="formError">' + options.errorMessage + '</span>');

          // clear other timers
          clearTimeout(timer);

          // we need the timeout otherwise the error is show every time the user presses enter in the tagbox
          timer = setTimeout(function() { $('#errorMessage-' + id).show(); }, 200);
        }

        return !blockSubmit;
      });

      // build replace html
      var html = '<div class="tagsWrapper">' +
          '	<div class="input-group">' +
          '		<input class="form-control dontSubmit" id="addValue-' + id + '" name="addValue-' + id + '" type="text" autocomplete="off" />' +
          '		<span class="input-group-btn"><a href="#" id="addButton-' + id + '" class="btn btn-success">';
      html += '               <i class="fa fa-plus-circle"></i> ';
      if (options.showIconOnly) html += '<span>' + options.addLabel + '</span>';
      else html += '<span class="hidden">' + options.addLabel + '</span>';
      html += '		</a></span>' +
          '   </div>' +
          '	<div id="elementList-' + id + '" class="tagList multipleSelectList"></div>' +
          '</div>';

      $(this).css('visibility', 'hidden').css('position', 'absolute').css('top', '-9000px').css('left', '-9000px').attr('tabindex', '-1');
      $(this).before(html);

      // add elements list
      build();

      // bind autocomplete if needed
      if (options.url != '') {
        var ajaxSource = function(query, cb) {

          var data = $.extend(options.params, { term: query });
          $.ajax({
            url:     options.url,
            data:    data,
            success: function(data, textStatus, jqXHR) {
              return cb(data.data);
            }
          });
        };

        $('#addValue-' + id).typeahead(null, {
          displayKey: 'tag',
          source:     ajaxSource
        });
      }

      // bind keypress on value-field
      $(document).on('keypress', '#addValue-' + id, function(e) {
        blockSubmit = true;
        var code = e.which;
        $('#errorMessage-' + id).remove();
        if (code == 13 || $(this).val().indexOf(options.splitChar) != -1) {
          $('#errorMessage-' + id).remove();
          e.stopPropagation();
          e.preventDefault();
          add();
        }
        if ($(this).val().replace(/^\s+|\s+$/g, '') == '') {
          blockSubmit = false;
          $('#addButton-' + id).addClass('disabledButton');
        }
        else $('#addButton-' + id).removeClass('disabledButton');
      });

      // bind click on add-button
      $(document).on('click', '#addButton-' + id, function(e) {
        e.preventDefault();
        e.stopPropagation();
        add();
      });

      $(document).on('click', '.deleteButton-' + id, function(e) {
        e.preventDefault();
        e.stopPropagation();
        remove($(this).data('id'));
      });

      // add an element
      function add() {
        blockSubmit = false;
        var value = $('#addValue-' + id).val().replace(/^\s+|\s+$/g, '').replace(options.splitChar, '');
        var inElements = false;
        if (!options.multiple) elements = [];
        $('#addValue-' + id).val('').focus();
        $('#addButton-' + id).addClass('disabledButton');
        $('#errorMessage-' + id).remove();
        if (value != '') {
          for (var i in elements) {
            if (value == elements[i]) inElements = true;
          }
          if (!inElements) {
            elements.push(value);
            $('#' + id).val(elements.join(options.splitChar));
            build();
          }
        }
      }

      // build the list
      function build() {
        var html = '';
        if (elements.length == 0 && options.emptyMessage != '') html = '<span class="text-muted">' + options.emptyMessage + '</span>';
        else {
          for (var i in elements) {
            html += '	<span class="badge">' +
                '      ' + elements[i] +
                '		<a href="#" class="deleteButton-' + id + '" data-id="' + elements[i] + '" title="' + options.removeLabel + '"><i class="fa fa-times-circle"></i><span class="hidden">' + options.removeLabel + '</span></a>' +
                '	</span>';
          }
        }
        $('#elementList-' + id).html(html);
      }

      // get all items
      function get() {
        var chunks = $('#' + id).val().split(options.splitChar);
        var elements = [];
        for (var i in chunks) {
          value = chunks[i].replace(/^\s+|\s+$/g, '');
          if (value != '') elements.push(value);
        }
        return elements;
      }

      // remove an item
      function remove(value) {
        var index = $.inArray(String(value), elements);
        if (index > -1) elements.splice(index, 1);
        $('#' + id).val(elements.join(options.splitChar));
        build();
      }
    });
  };
})(jQuery);
