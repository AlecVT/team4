<button id="back-button" name="<?= $post->get('subject') ?>" class="btn btn-default">Back</button>

<!-- Only the author of a post can edit that post. -->
<?php
	if($_SESSION['author'] == $post->get('author')) {
		echo '<button class="btn btn-warning" data-toggle="modal" data-target="#edit-topic-modal" style="float:left;margin-left:16px;">Edit Topic</button>';
		echo '<button id="delete-post-button" class="btn btn-danger" type="submit" style="float:left;margin-left:16px;">Delete</button>';
	}
?>
<br>

<h1><?= $post->get('title') ?></h1>
<h2><u><b>Topic:</b></u> <?= $post->get('description') ?></h2>
<h2>Here, if you want to, you can contribute by commenting your own response below.</h2>

<!-- If there are no posts under this subject, display a message. -->
<?php
	if (sizeof($comments) == 0) echo '<b><p style="margin-top:32px;">There are no comments for this post.</p></b>';
?>

<!-- For each comment under the specific post ID, output it. -->
<div class="panel-group">
	<?php foreach($comments as $comment => $comment_value) { ?>
		<div name="<?= $comment_value->get('id') ?>" class="comment panel panel-primary">
			<div class="panel-heading"><b>By: <?= $comment_value->get('author') ?></b></div>
			<div class="panel-body"><?= $comment_value->get('description') ?></div>
		</div>
	<?php } ?>
</div>

<button class="btn btn-default" data-toggle="modal" data-target="#add-comment-modal">Add Comment</button>

<!-- This modal is for the user to add a comment. -->
<!-- I'm using the Bootstrap standard format. -->
<div id="add-comment-modal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Add Comment</h4>
			</div>
			<div class="modal-body">
				<!-- This is a standard login form for Bootstrap. Using it here for styling purposes. -->
				<form class="form-login" action="<?= BASE_URL ?>/comment" method="POST">
					<input name="post" type="text" value="<?= $post->get('id') ?>" style="visibility:hidden;">
					<label for="inputDescription" class="sr-only">Comment Text</label>
					<textarea id="inputDescription" name="description" type="text" class="form-control" placeholder="Comment Text" style="resize:none;" required autofocus></textarea>
					<!-- Include the session author. -->
					<input id="inputAuthor" name="author" type="text" class="form-control" placeholder="Author" value="<?= $_SESSION['author'] ?>" style="visibility:hidden;">
					<button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<!-- This modal is for the user to edit a post. -->
<!-- I'm using the Bootstrap standard format. -->
<div id="edit-topic-modal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Edit Topic</h4>
			</div>
			<div class="modal-body">
				<!-- This is a standard login form for Bootstrap. Using it here for styling purposes. -->
				<form class="form-login" action="<?= BASE_URL ?>/post/edit/<?= $post->get('id') ?>" method="POST">
					<label for="inputTitle" class="sr-only">Topic Title</label>
					<input id="inputTitle" name="title" type="text" class="form-control" placeholder="Topic Title" value="<?= $post->get('title') ?>" required autofocus>
					<label for="inputDescription" class="sr-only">Topic Description</label>
					<textarea id="inputDescription" name="description" type="text" class="form-control" placeholder="Topic Description" style="resize:none;" required autofocus><?= $post->get('description') ?></textarea>
					<button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
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
	/* Delete the post when this button is clicked. */
	/* This can't go in a separate file because it requires PHP. */
	$("#delete-post-button").click(function() {
		window.location.href = "<?= BASE_URL ?>/post/delete/<?= $post->get('id') ?>";
	});
	/* This is a 'listener' function to be triggered when a panel is clicked. */
	$("#back-button").click(function() {
		var id = $(this).attr('name');
		/* We want to go to the specific subject's page based on ID. */
		window.location.href = "<?= BASE_URL ?>/subject/"+id;
	});
</script>