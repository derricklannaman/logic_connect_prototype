$( document ).on('turbolinks:load', function() {
  $('.new-code-list-pane').hide();
  $('.new-code-list').click(showNewCodeListForm);
});

function showNewCodeListForm() {
  $('.new-code-list-pane').toggle();
}
