<button id="back-button" class="btn btn-default" style="float:left;">Back</button>

<h1><?= $subject['name'] ?></h1>
<h2>Temporary text to tell the user what to do.</h2>

<!-- If there are no posts under this subject, display a message. -->
<?php
	if ($empty) echo '<p>There are no posts for this subject.</p>';
?>

<!-- For each post under the specific subject ID, output it. -->
<div class="panel-group">
	<?php while($row = mysql_fetch_assoc($result)): ?>
		<div name="<?= $row['id'] ?>" class="panel panel-primary">
			<div class="panel-heading"><b><?= $row['title'] ?></b></div>
			<div class="panel-body"><?= $row['description'] ?></div>
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