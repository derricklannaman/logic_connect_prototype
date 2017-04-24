$(document).on('turbolinks:load', function(){
  $('.content-title').on('click', showList);
  $('.content-title').hover(selectIndication, deselectIndication);
})

function showList() {
  $(this).next().slideToggle(200);
}

function selectIndication() {
  $(this).addClass('content-title-highlighter');
}

function deselectIndication() {
  $(this).removeClass('content-title-highlighter');
}