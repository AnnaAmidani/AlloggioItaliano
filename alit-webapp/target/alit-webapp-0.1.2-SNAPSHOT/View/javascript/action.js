function action(value) {
  var value = '<input type="hidden" name="action" id="action" value="' + value + '"/>';
  document.getElementById('actionDrop').innerHTML = value;
}