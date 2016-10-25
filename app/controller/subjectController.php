<?php

include_once '../global.php';

// Get the identifier for the page we want to load.
$action = $_GET['action'];

// Instantiate a SubjectController and route it.
$pc = new SchoolController();
$pc->route($action);

class SchoolController {

	// Route us to the appropriate class method for this action.
	public function route($action) {
		switch($action) {

			case 'subject':
				$subjectID = $_GET['pid'];
				$this->viewSubject($subjectID);
				break;

			// Redirect to home page if all else fails.
			default:
				header('Location: '.BASE_URL);
				exit();
		}

	}

	// View this specific subject by a specific ID.
	public function viewSubject($id) {
		session_start();
		$pageName = 'Subject';

		// Connect to the database.
		$connection = mysql_connect(DB_HOST, DB_USER, DB_PASS) or die ('Error: Could not connect to MySql database');
		mysql_select_db(DB_DATABASE);

		// This query will get all of the items under a certain school
		$query = sprintf("SELECT * FROM post WHERE subject = %d;", $id);
		$result = mysql_query($query);

		// If there are no posts for a subject, we need to display a message to the user.
		$empty = false;
		if (sizeof(mysql_fetch_assoc($result)) == 1) $empty = true;

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/subject.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

}