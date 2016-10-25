<button id="back-button" name="<?= $post['subject'] ?>" class="btn btn-default">Back</button><br>

<h1><?= $post['title'] ?></h1>
<h2>Here, if you want to, you can contribute by commenting your own response below.</h2>

<!-- If there are no posts under this subject, display a message. -->
<?php
	if ($empty) echo '<b><p style="margin-top:32px;">There are no comments for this post.</p></b>';
?>

<!-- For each comment under the specific post ID, output it. -->
<div class="panel-group">
	<?php while($row = mysql_fetch_assoc($result)): ?>
		<div name="<?= $row['id'] ?>" class="panel panel-primary" style="cursor:default;">
			<div class="panel-heading"><b>By: <?= $row['author'] ?></b></div>
			<div class="panel-body"><?= $row['description'] ?></div>
		</div>
	<?php endwhile; ?>
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
					<input name="post" type="text" value="<?= $post['id'] ?>" style="visibility:hidden;">
					<label for="inputDescription" class="sr-only">Comment Text</label>
					<textarea id="inputDescription" name="description" type="text" class="form-control" placeholder="Comment Text" style="resize:none;" required autofocus></textarea>
					<label for="inputAuthor" class="sr-only">Author</label>
					<input id="inputAuthor" name="author" type="text" class="form-control" placeholder="Author" required>
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
	/* This is a 'listener' function to be triggered when a panel is clicked. */
	$("#back-button").click(function() {
		var id = $(this).attr('name');
		/* We want to go to the specific subject's page based on ID. */
		window.location.href = "<?= BASE_URL ?>/subject/"+id;
	});
</script>