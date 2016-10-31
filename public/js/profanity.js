$(document).ready(function() {

	// When the user places types a comment, check for profanity.
	$('#commentInputDescription').blur(function() {
		var text = $(this).val();
		$.get(baseURL+'/comment/check', { 'description': text }, function(data) {
			if (data == 'true') var prof = true;
			else if (data == 'false') var prof = false;
			$('#comment-submit-button').prop('disabled', prof);
		}, "json");
	});
});