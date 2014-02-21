`/**
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
				if(elements.length == 0 && options.emptyMessage != '') html = '<span class="muted">' + options.emptyMessage + '</span>';
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
`
