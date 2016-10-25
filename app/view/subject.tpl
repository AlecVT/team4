<button id="back-button" class="btn btn-default">Back</button><br>

<h1><?= $subject['name'] ?></h1>
<h2>Below are the existing questions and discussions for this subject. You may add your own by signing in.</h2>

<!-- If there are no posts under this subject, display a message. -->
<?php
	if ($empty) echo '<b><p style="margin-top:32px;">There are no posts for this subject.</p></b>';
?>

<!-- For each post under the specific subject ID, output it. -->
<div class="panel-group">
	<?php while($row = mysql_fetch_assoc($result)): ?>
		<div name="<?= $row['id'] ?>" class="panel panel-primary">
			<div class="panel-heading"><b><?= $row['title'] ?></b></div>
			<div class="panel-body">
				<h4><u><b>Author:</b></u> <?= $row['author'] ?></h4><br>
				<u><b>Topic</b></u><br>
				<?= $row['description'] ?>
			</div>
		</div>
	<?php endwhile; ?>
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