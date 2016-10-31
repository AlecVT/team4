<!-- Our script for AJAX checking. -->
<script src="<?= BASE_URL ?>/public/js/posting.js"></script>

<button id="back-button" class="btn btn-default">Back</button><br>

<h1><?= $subject->get('name') ?></h1>
<h2>Below are the existing questions and discussions for this subject. You may add your own by signing in.</h2>

<!-- If there are no posts under this subject, display a message. -->
<?php
	if (sizeof($posts) == 0) echo '<b><p style="margin-top:32px;">There are no posts for this subject.</p></b>';
?>

<!-- For each post under the specific subject ID, output it. -->
<div class="panel-group">
	<?php foreach($posts as $post => $post_value) { ?>
		<div name="<?= $post_value->get('id') ?>" class="panel panel-primary">
			<div class="panel-heading"><b><?= $post_value->get('title') ?></b></div>
			<div class="panel-body">
				<h4><u><b>Author:</b></u> <?= $post_value->get('author') ?></h4><br>
				<u><b>Topic</b></u><br>
				<?= $post_value->get('description') ?>
			</div>
		</div>
	<?php } ?>
</div>

<!-- Only allow someone to add a post if they're signed in. -->
<?php
	if(isset($_SESSION['user'])) {
		echo '<button class="btn btn-default" data-toggle="modal" data-target="#add-topic-modal" style="margin-bottom:32px;">Add Topic</button>';
	}
?>

<!-- This modal is for the user to add a post. -->
<!-- I'm using the Bootstrap standard format. -->
<div id="add-topic-modal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Add Topic</h4>
			</div>
			<div class="modal-body">
				<!-- This is a standard login form for Bootstrap. Using it here for styling purposes. -->
				<form class="form-login" action="<?= BASE_URL ?>/post/add/" method="POST">
					<input name="subject" type="text" value="<?= $subject->get('id') ?>" style="visibility:hidden;">
					<label for="inputTitle" class="sr-only">Topic Title</label>
					<input id="inputTitle" name="title" type="text" class="form-control" placeholder="Topic Title" required autofocus>
					<label for="inputDescription" class="sr-only">Topic Description</label>
					<textarea id="inputDescription" name="description" type="text" class="form-control" placeholder="Topic Description" style="resize:none;" required autofocus></textarea>
					<!-- Include the session author. -->
					<input id="inputAuthor" name="author" type="text" class="form-control" placeholder="Author" value="<?= $_SESSION['author'] ?>" style="visibility:hidden;">
					<button id="add-submit-button" class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<!-- This script cannot be in a separate JavaScript file as it requires some PHP -->
<script>
	/* This is a 'listener' function to be triggered when a panel is clicked. */
	$(".panel").click(function() {
		var id = $(this).attr('name');
		/* We want to go to the specific post's page based on ID. */
		window.location.href = "<?= BASE_URL ?>/post/"+id;
	});
	/* This is a 'listener' function to be triggered when a panel is clicked. */
	$("#back-button").click(function() {
		// Just go back to the home page.
		window.location.href = "<?= BASE_URL ?>/";
	});
</script>