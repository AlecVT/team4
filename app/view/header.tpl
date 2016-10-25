<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta name="description" content="This service is for students of all levels to collaborate on school topics and specific problems.">
		<title>Temporary Name</title>

		<link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/common.css">

		<script src="<?= BASE_URL ?>/public/js/fontawesome.js"></script>
		<script type="text/javascript" src="<?= BASE_URL ?>/public/js/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src="<?= BASE_URL ?>/public/js/bootstrap.min.js"></script>

	</head>

	<body>

		<?php
			// This code tests if a current page is active.
			// It will automatically add the 'active' class to the correct navigation element.
			function isSelected($pageName, $link) {
				if($pageName == $link) return ' class="active" ';
			}
		?>

		<!-- The navigation bar will be displayed at the top of each page. -->
		<!-- It has a responsive layout, even on a small window. -->
		<!-- I'm using the Bootstrap standard format with some custom CSS. -->
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<!-- This hamburger button oonly appears when the window gets to small for the navigation menu. -->
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mainNavbar">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="<?= BASE_URL ?>/">Temporary Name</a>
				</div>
				<div id="mainNavbar" class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li <?= isSelected($pageName, 'Home') ?> ><a href="<?= BASE_URL ?>/">Home</a></li>
						<li <?= isSelected($pageName, 'About') ?> ><a href="<?= BASE_URL ?>/about">About</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<!-- We want to filter what elements we have in our navigation bar based on if we are signed in or not. -->
						<?php
							if(isset($_SESSION['user'])) {
								echo '<li id="logout-button"><a href=""><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>';
							} else {
								echo '<li><a href=""><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>';
								echo '<li><a href="" data-toggle="modal" data-target="#login-modal"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>';
							}
						?>
					</ul>
				</div>
			</div>
		</nav>

		<!-- This script cannot be in a separate JavaScript file as it requires some PHP -->
		<script>
			/* This is a 'listener' function to be triggered when the logout button is clicked in the navigation bar. */
			$('#logout-button').click(function() {
				/* We want to POST to the logout URL. This will end our session. */
				$.post('<?= BASE_URL ?>/logout');
			});
		</script>

		<!-- This modal is for the user to login. -->
		<!-- I'm using the Bootstrap standard format. -->
		<div id="login-modal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Login</h4>
					</div>
					<div class="modal-body">
						<!-- This is a standard login form for Bootstrap. -->
						<form class="form-login" action="<?= BASE_URL ?>/login" method="POST">
							<label for="inputEmail" class="sr-only">Email Address</label>
							<input id="inputEmail" name="email" type="email" class="form-control" placeholder="Email Address" required autofocus>
							<label for="inputPassword" class="sr-only">Password</label>
							<input id="inputPassword" name="password" type="password" class="form-control" placeholder="Password" required>
							<div class="checkbox">
								<label>
									<input type="checkbox" value="remember-me">Remember Me
								</label>
							</div>
							<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<!-- I like having padding on the sides of my pages. -->
		<div class="content-wrapper">