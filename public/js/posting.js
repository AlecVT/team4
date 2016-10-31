$(document).ready(function() {

	// When the user places types a post title, check that it isn't taken.
	$('#inputTitle').blur(function() {
		var title = $(this).val();
		$.get(baseURL+'/post/check', { 'title': title }, function(data) {
			if (data.status == 'available') var avail = true;
			else if (data.status == 'unavailable') var avail = false;
			$('#add-submit-button').prop('disabled', !avail);
		}, "json");
	});
});