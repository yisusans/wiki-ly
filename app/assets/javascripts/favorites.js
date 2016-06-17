// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function{
  $('.favoriting-button').on('click', function(event){
    $('.bookmark').addClass('favorited')
  })
})