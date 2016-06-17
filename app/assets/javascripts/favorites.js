// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  $('.bookmark-container').on('click', function(event){
    console.log('clicked')
    // event.preventDefault();
    $('.fave-button').css('background-color', 'green');
  //   $.ajax({
  //     method: $(event.target).attr('method'),
  //     url: $(event.target).attr('action'),
  //     data: $(event.target).serialize()
  //   }).done(function(response){
  //     $(event.target).parent().html(response)
  //   });
   });
});