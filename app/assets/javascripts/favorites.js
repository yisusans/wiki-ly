// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  $('.bookmark-container').on('click', function(event){
    console.log('clicked')
    $('.fave-button').css('background-color', '#FFD700');
   });
});
