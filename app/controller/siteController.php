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
		switch($action) {

			case 'home':
				$this->home();
				break;
			case 'about':
				$this->about();
				break;
			case 'login':
				$this->login();
				break;
			case 'logout':
				$this->logout();
				break;

			default:
				header('Location: '.BASE_URL.'/');
				exit();
		}

	}

	public function home() {
		$pageName = 'Home';

		// Get all of the subjects from the database.
		$result = Subject::getAllSubjects();

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/home.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function about() {
		$pageName = 'About';

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/about.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function login() {

		// Get the login information from the POST call.
		$email = $_POST['email'];
		$password = $_POST['password'];
		
		// Try to find an existing email on the database of users.
		$user = User::loadByEmail($email);

		// Make sure there was a matching email and that the passwords match before starting the session.
		if (!is_null($user) && $user->get('password') == $password) {
			session_start();
			$_SESSION['user'] = $user->get('email');
			$_SESSION['author'] = $user->get('name');
			header('Location: '.BASE_URL.'/');
			exit();
		} else {
			header('Location: '.BASE_URL.'/');
			exit();
		}
	}

	public function logout() {
		session_destroy();
		header('Location: '.BASE_URL.'/about');
		exit();
	}

}