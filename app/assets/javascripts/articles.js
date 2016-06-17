// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
	
	$(".publish").on("click", "#published_true", function(event){
		event.preventDefault();
		var $target = $(event.target)
		var request = $.ajax({
			method: "put",
			url: $target.parent().attr("action"),
			data: $target.parent().serialize(),
		});

		request.done(function( msg ){
			$(".article-published").append(msg)
			$target.parent().parent().remove()
		});

	});
}); 