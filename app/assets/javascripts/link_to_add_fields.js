(function() {
  $(document).on('click', '[data-link-to-remove-field]', function(e) {
    var $field, target;
    e.preventDefault();
    $(this).prev('input[type=hidden]').val('1');
    target = $(this).data('link-to-remove-field');
    $field = $(this).closest(target);
    var ret = $field.hide();
    // 削除時に再計算する為にイベントを発火
    $(this).trigger('hide');
    return ret;
  });

  $(document).on('click', '[data-link-to-add-field]', function(e) {
    var fields_html, regexp, time;
    e.preventDefault();
    time = new Date().getTime();
    regexp = new RegExp($(this).data('link-to-add-field-id'), 'g');
    fields_html = $(this).data('link-to-add-field').replace(regexp, time);
    return $(this).before(fields_html);
  });

}).call(this);