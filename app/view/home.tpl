<h1><b>Welcome!</b></h1>

<h2>This website should be used to post questions or topics of discussion in a specific subject matter. You may also contribute to existing questions or discussions.</h2>

<!-- Here we show all of the available subejcts. Obtained from the DB. -->
<div class="panel-group">
	<?php foreach($result as $subject => $subject_value) {
		$query = sprintf("SELECT * FROM post WHERE subject = %d;", $subject_value->get('id'));
		$resultTwo = mysql_query($query);
		$mostRecent = mysql_fetch_assoc($resultTwo);
	?>
		<div name="<?= $subject_value->get('id') ?>" class="panel panel-primary">
			<div class="panel-heading"><b><?= $subject_value->get('name') ?></b></div>
			<div class="panel-body">
				<u><b>Most Recent Topic</b></u><br>
				<?= $mostRecent['title'] ?>
			</div>
		</div>
	<?php } ?>
</div>

<!-- This script cannot be in a separate JavaScript file as it requires some PHP -->
<script>
	/* This is a 'listener' function to be triggered when a panel is clicked. */
	$(".panel").click(function() {
		var id = $(this).attr('name');
		/* We want to go to the specific subject's page based on it's ID. */
		window.location.href = "<?= BASE_URL ?>/subject/"+id;
	});
</script>