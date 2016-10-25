<?php

include_once '../global.php';

// Get the identifier for the page we want to load.
$action = $_GET['action'];

// Instantiate a SiteController and route it.
$pc = new SiteController();
$pc->route($action);

class SiteController {

	// Route us to the appropriate class method for this action.
	public function route($action) {
		session_start();
		switch($action) {
			case 'home':
				$this->home();
				break;
			case 'login':
				$email = $_POST['email'];
				$password = $_POST['password'];
				$this->login($email, $password);
				break;
			case 'logout':
				$this->logout();
				break;

			default:
				header('Location: '.BASE_URL);
				exit();
		}

	}

	public function home() {
		$pageName = 'Home';

		// Get all of the schools from the database.
		$connection = mysql_connect(DB_HOST, DB_USER, DB_PASS) or die ('Error: Could not connect to MySql database');
		mysql_select_db(DB_DATABASE);
		$query = "SELECT * FROM subject; ";
		$result = mysql_query($query);

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/home.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function login($email, $password) {
		$adminEmail = 'admin@admin.com';
		$adminPassword = 'admin';
		if (($email == $adminEmail) && ($password == $adminPassword)) {
			$_SESSION['user'] = $email;
			header('Location: '.BASE_URL);
			exit();
		} else {
			header('Location: '.BASE_URL);
			exit();
		}
	}

	public function logout() {
		session_destroy();
		header('Location: '.BASE_URL);
		exit();
	}

}