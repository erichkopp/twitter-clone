// $(document).on('turbolinks:load', function() {
// 	$('#unfollow-btn').hover(function() {
// 		$(this).removeClass('btn-primary');
// 		$(this).addClass('btn-danger');
// 		$(this).html("Unfollow");
// 	}, function() {
// 		$(this).removeClass('btn-danger');
// 		$(this).addClass('btn-primary');
// 		$(this).html("Following");
// 	});
// })


$(document).on('turbolinks:load', function() {
	$('#unfollow-btn').hover(function() {
		$(this).html("Unfollow");
	}, function() {

		$(this).html("Following");
	});
})