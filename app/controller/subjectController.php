<?php

include_once '../global.php';

// Get the identifier for the page we want to load.
$action = $_GET['action'];

// Instantiate a SubjectController and route it.
$pc = new SubjectController();
$pc->route($action);

class SubjectController {

	// Route us to the appropriate class method for this action.
	public function route($action) {
		switch($action) {

			case 'subject':
				$subjectID = $_GET['pid'];
				$this->viewSubject($subjectID);
				break;

			// Redirect to home page if all else fails.
			default:
				header('Location: '.BASE_URL.'/');
				exit();
		}

	}

	// View this specific subject by a specific ID.
	public function viewSubject($id) {
		$pageName = 'Subject';

		// Get the subject's information.
		$subject = Subject::loadById($id);
		$posts = Post::loadBySubjectId($id);

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/subject.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

}