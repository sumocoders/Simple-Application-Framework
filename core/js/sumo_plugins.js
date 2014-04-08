/**
 * Multiple select box
 *
 * @author	Tijs Verkoyen <tijs@sumocoders.be>
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

			if($('#elementList-' + id).length > 0) { $('#elementList-' + id).parent('.multipleSelectWrapper').remove(); }
			var html =	'<div class="multipleSelectWrapper">' +
			              '	<div id="elementList-' + id + '" class="multipleSelectList">' + '	</div>' +
			              '	<div class="input-append">' +
			              '		<select id="addValue-' + id + '" name="addValue-' + id + '">';
			for(var i = 0; i < possibleOptions.length; i++) {
				html +=	'			<option value="' + $(possibleOptions[i]).attr('value') + '">' + $(possibleOptions[i]).html() + '</option>';
			}
			html +=		'		</select>' +
			               '		<a href="#" id="addButton-' + id + '" class="btn">';
			html += 	'               <i class="icon-plus"></i>';
			if(options.showIconOnly) html += '<span>' + options.addLabel + '</span>';
			else html += '<span class="hidden">' + options.addLabel + '</span>';
			html += 	'			</a>' +
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

			$('.deleteButton-' + id).live('click', function(e) {
				e.preventDefault();
				e.stopPropagation();
				remove($(this).data('id'));
			});

			function add() {
				blockSubmit = false;
				var value = $('#addValue-' + id).val();
				var inElements = false;
				$('#addValue-' + id).focus();
				if(value != null && value != '')
				{
					for(var i in elements) {
						if(value == elements[i]) inElements = true;
					}
					if(!inElements) {
						elements.push(value);
						$('#' + id).val(elements);
						build();
					}
				}
			}
			function build() {
				var html = '';
				if(elements.length == 0 && options.emptyMessage != '') html = '<span class="text-muted">' + options.emptyMessage + '</span>';
				else {
					for(var i in elements) {
						html += '<span class="badge">' +
						        '	' + $('#' + id + ' option[value=' + elements[i] + ']').html() +
						        '	<a href="#" class="deleteButton-' + id + '" data-id="' + elements[i] + '" title="' + options.removeLabel + '"><i class="icon-remove icon-white"></i><span class="hidden">' + options.removeLabel + '</span></a>' +
						        '</span>';
						$('#addValue-' + id + ' option[value=' + elements[i] + ']').prop('disabled', true);
					}
				}

				$('#elementList-' + id).html(html);
				$('#addValue-' + id).prop('disabled', false);
				if($('#addValue-' + id + ' option:enabled').length == 0)
				{
					$('#addValue-' + id).prop('disabled', true);
				}
				$('#addValue-' + id).val($('#addValue-'+ id +' option:enabled:first').attr('value'));

				// call callback if specified
				if(options.afterBuild != null) { options.afterBuild(id); }
			}
			function get() {
				var chunks = $('#' + id).val();
				var elements = [];
				for(var i in chunks) {
					value = chunks[i].replace(/^\s+|\s+$/g, '');
					if(value != '') elements.push(value);
				}
				return elements;
			}
			function remove(value) {
				var index = $.inArray(value.toString(), elements);
				if(index > -1) elements.splice(index, 1);
				$('#' + id).val(elements.join(options.splitChar));
				$('#addValue-' + id + ' option[value=' + value + ']').prop('disabled', false);
				build();
			}
		});
	};
})(jQuery);

/**
 * Tag-box
 *
 * @author	Tijs Verkoyen <tijs@sumocoders.be>
 * @author	Dieter Vanden Eynde <dieter@netlash.com>
 */
(function($)
{
  $.fn.tagBox = function(options)
  {
    // define defaults
    var defaults =
    {
      splitChar: '|',
      emptyMessage: '',
      errorMessage: 'Add the tag before submitting',
      addLabel: 'add',
      removeLabel: 'delete',
      params: {},
      canAddNew: false,
      showIconOnly: true,
      multiple: true
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
        $('#errorMessage-'+ id).remove();

        if(blockSubmit && $('#addValue-' + id).val().replace(/^\s+|\s+$/g, '') != '')
        {
          // show warning
          $('#addValue-'+ id).parents('.oneLiner').append('<span style="display: none;" id="errorMessage-'+ id +'" class="formError">'+ options.errorMessage +'</span>');

          // clear other timers
          clearTimeout(timer);

          // we need the timeout otherwise the error is show every time the user presses enter in the tagbox
          timer = setTimeout(function() { $('#errorMessage-'+ id).show(); }, 200);
        }

        return !blockSubmit;
      });

      // build replace html
      var html = '<div class="tagsWrapper">' +
          '	<div class="input-group">' +
          '		<input class="form-control dontSubmit" id="addValue-' + id + '" name="addValue-' + id + '" type="text" autocomplete="off" />' +
          '		<span class="input-group-btn"><a href="#" id="addButton-' + id + '" class="btn btn-success">';
      html += 	'               <i class="fa fa-plus-circle"></i> ';
      if(options.showIconOnly) html += '<span>' + options.addLabel + '</span>';
      else html += '<span class="hidden">' + options.addLabel + '</span>';
      html += 	'		</a></span>' +
          '   </div>' +
          '	<div id="elementList-' + id + '" class="tagList multipleSelectList"></div>' +
          '</div>';

      $(this).css('visibility', 'hidden').css('position', 'absolute').css('top', '-9000px').css('left', '-9000px').attr('tabindex', '-1');
      $(this).before(html);

      // add elements list
      build();

      // bind autocomplete if needed
      if(options.url != '') {
        var ajaxSource = function(query, cb) {

          var data = $.extend(options.params, { term: query });
          $.ajax({
            url: options.url,
            data: data,
            success: function(data, textStatus, jqXHR) {
              return cb(data.data);
            }
          });
        };

        $('#addValue-' + id).typeahead(null, {
          displayKey: 'tag',
          source: ajaxSource
        });
      }

      // bind keypress on value-field
      $(document).on('keypress', '#addValue-' + id, function(e) {
        blockSubmit = true;
        var code = e.which;
        $('#errorMessage-'+ id).remove();
        if(code == 13 || $(this).val().indexOf(options.splitChar) != -1) {
          $('#errorMessage-'+ id).remove();
          e.stopPropagation();
          e.preventDefault();
          add();
        }
        if($(this).val().replace(/^\s+|\s+$/g, '') == '') {
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
        if(!options.multiple) elements = [];
        $('#addValue-' + id).val('').focus();
        $('#addButton-' + id).addClass('disabledButton');
        $('#errorMessage-'+ id).remove();
        if(value != '') {
          for(var i in elements) {
            if(value == elements[i]) inElements = true;
          }
          if(!inElements) {
            elements.push(value);
            $('#' + id).val(elements.join(options.splitChar));
            build();
          }
        }
      }

      // build the list
      function build() {
        var html = '';
        if(elements.length == 0 && options.emptyMessage != '') html = '<span class="muted">' + options.emptyMessage + '</span>';
        else {
          for(var i in elements) {
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
        for(var i in chunks) {
          value = chunks[i].replace(/^\s+|\s+$/g, '');
          if(value != '') elements.push(value);
        }
        return elements;
      }

      // remove an item
      function remove(value) {
        var index = $.inArray(String(value), elements);
        if(index > -1) elements.splice(index, 1);
        $('#' + id).val(elements.join(options.splitChar));
        build();
      }
    });
  };
})(jQuery);
