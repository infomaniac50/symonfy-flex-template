import "bootstrap";
import isObject from "lodash/fp/isObject";
import isNull from "lodash/fp/isNull";
import isString from "lodash/fp/isString";
import 'select2';
import '../../public/bundles/tetranzselect2entity/js/select2entity.js';

// handle custom file inputs
$('body').on('change', 'input.custom-file-input', function (ev) {

  const $input = $(this);
  const $target = $input.next("label");

  if (!$target.length)
    return console.error('Invalid target for custom file', $input);

  // set original content so we can revert if user deselects file
  if (!$target.attr('data-original-content'))
    $target.attr('data-original-content', $target.text());

  const input = $input.get(0);

  let name = isObject(input)
    && isObject(input.files)
    && isObject(input.files[0])
    && isString(input.files[0].name) ? input.files[0].name : $input.val();

  if (isNull(name) || name === '')
    name = $target.attr('data-original-content');

  $target.text(name);

});
