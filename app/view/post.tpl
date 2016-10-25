<h1><?= $post['title'] ?></h1>
<h2>Temporary text to tell the user what to do.</h2>

<!-- If there are no posts under this subject, display a message. -->
<?php
	if ($empty) echo '<p>There are no comments for this post.</p>';
?>

<!-- For each comment under the specific post ID, output it. -->
<div class="panel-group">
	<?php while($row = mysql_fetch_assoc($result)): ?>
		<div name="<?= $row['id'] ?>" class="panel panel-primary">
			<div class="panel-heading"><b><?= $row['title'] ?></b></div>
			<div class="panel-body"><?= $row['description'] ?></div>
		</div>
	<?php endwhile; ?>
</div>