// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {

  $('#new-tag-form').on ('submit', function(event) {
    event.preventDefault();
    var $target = $(event.target);

    var reqObj = $.ajax({
      url: $target.attr('action'),
      method: $target.attr('method'),
      data: $target.serialize(),
      dataType: 'html'
    });

      reqObj.done(function(response){
    debugger
      $target.parent().parent().find('.all-tags').append(response),
      $target[0].reset()
    });

      reqObj.fail(function(response){
        console.log("Something went wrong")
      });

  });

});