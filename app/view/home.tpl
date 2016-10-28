<h1 class="mdl-cell mdl-cell--12-col" style="text-align:center;">Welcome</h1>
<?php while($row = mysql_fetch_assoc($result)): ?>

	<?php
		$queryTwo = sprintf("SELECT * FROM post WHERE subject = %d;", $row['id']);
		$resultTwo = mysql_query($queryTwo);
		$mostRecent = mysql_fetch_assoc($resultTwo);
	?>

	<div class="mdl-cellcustom-card-square mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col">
		<div class="mdl-card__title mdl-card--expand" style="background-color:#FFA322;">
			<h2 class="mdl-card__title-text"><b><?= $row['name'] ?></b></h2>
		</div>
		<div class="mdl-card__supporting-text">
			<u><b>Most Recent Topic</b></u><br>
			<?= $mostRecent['title'] ?>
		</div>
		<div class="mdl-card__actions mdl-card--border">
			<a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
				View Subject
			</a>
		</div>
	</div>
	<div class="mdl-cellcustom-card-square mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col">
		<div class="mdl-card__title mdl-card--expand">
			<h2 class="mdl-card__title-text"><b><?= $row['name'] ?></b></h2>
		</div>
		<div class="mdl-card__supporting-text">
			<u><b>Most Recent Topic</b></u><br>
			<?= $mostRecent['title'] ?>
		</div>
		<div class="mdl-card__actions mdl-card--border">
			<a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
				View Subject
			</a>
		</div>
	</div>

<?php endwhile; ?>
</div>
<style>
	.custom-card-square.mdl-card {
		height: 256px;
		width: 256px;
	}
</style>

<!--

<h1><b>Welcome!</b></h1>

<h2>This website should be used to post questions or topics of discussion in a specific subject matter. You may also contribute to existing questions or discussions.</h2>

<div class="panel-group">
	<?php while($row = mysql_fetch_assoc($result)): ?>
		<?php
			$queryTwo = sprintf("SELECT * FROM post WHERE subject = %d;", $row['id']);
			$resultTwo = mysql_query($queryTwo);
			$mostRecent = mysql_fetch_assoc($resultTwo);
		?>
		<div name="<?= $row['id'] ?>" class="panel panel-primary">
			<div class="panel-heading"><b><?= $row['name'] ?></b></div>
			<div class="panel-body">
				<u><b>Most Recent Topic</b></u><br>
				<?= $mostRecent['title'] ?>
			</div>
		</div>
	<?php endwhile; ?>
</div>

<!- This script cannot be in a separate JavaScript file as it requires some PHP ->
<script>
	/* This is a 'listener' function to be triggered when a panel is clicked. */
	$(".panel").click(function() {
		var id = $(this).attr('name');
		/* We want to go to the specific subject's page based on ID. */
		window.location.href = "<?= BASE_URL ?>/subject/"+id;
	});
</script>

-->