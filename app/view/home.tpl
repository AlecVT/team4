<h1><b>Welcome!</b></h1>

<h2>This website should be used to post questions or topics of discussion in a specific subject matter. You may also contribute to existing questions or discussions.</h2>

<div class="panel-group">
	<?php while($row = mysql_fetch_assoc($result)): ?>
		<div name="<?= $row['id'] ?>" class="panel panel-primary">
			<div class="panel-heading"><b><?= $row['name'] ?></b></div>
			<div class="panel-body">Temp info</div>
		</div>
	<?php endwhile; ?>
</div>

<!-- This script cannot be in a separate JavaScript file as it requires some PHP -->
<script>
	/* This is a 'listener' function to be triggered when a panel is clicked. */
	$(".panel").click(function() {
		var id = $(this).attr('name');
		/* We want to go to the specific subject's page based on ID. */
		window.location.href = "<?= BASE_URL ?>/subject/"+id;
	});
</script>