$( document ).on('turbolinks:load', function() {
  // $('#search-result-submit-button').hide();
  $('.code-submit-btn').click(gatherCodes);
  // $('.search-btn').click(showAddCodeButton);



  $('input#q').autocomplete({
    source: "/code_lists/autocomplete",
    minLength: 2});
})

function showAddCodeButton() {
  $('#search-result-submit-button').show();
}

function gatherCodes() {
  var codes_searched = $('.code-search-result').text();
  var codes_checked = $( "input:checked" );

  if (codes_searched.length > 0) {
    var code_system = $('.code-system-search-result').text().trim();
  }
  var codes = [];

  for(var i = 0; i < codes_checked.length; i++) {
    codes.push(codes_checked[i].name);
  }
  $.ajax({
    method: "POST",
    url: "/gather_codes",
    data: {checked_codes: codes, codes_searched: codes_searched, code_system: code_system},
    success: function(data) {
    }
  });
}
