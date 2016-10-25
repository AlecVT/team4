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
			case 'post':
				$postID = $_GET['pid'];
				$this->viewPost($postID);
				break;
			case 'comment':
				$this->addComment();
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
		// Do it again to get the size.
		$resultSize = mysql_query($query);

		// If there are no posts for a subject, we need to display a message to the user.
		$empty = false;
		if (sizeof(mysql_fetch_assoc($resultSize)) == 1) $empty = true;

		// Get the subject's information.
		$query = sprintf("SELECT * FROM subject WHERE id = %d;", $id);
		$resultTwo = mysql_query($query);
		while($row = mysql_fetch_assoc($resultTwo)) {
			$subject['name'] = $row['name'];
		}

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/subject.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	// View the specific post by a post ID.
	public function viewPost($id) {
		session_start();
		$pageName = 'Post';

		// Connect to the database.
		$connection = mysql_connect(DB_HOST, DB_USER, DB_PASS) or die ('Error: Could not connect to MySql database');
		mysql_select_db(DB_DATABASE);

		// This query will get all of the items under a certain school
		$query = sprintf("SELECT * FROM comment WHERE post = %d;", $id);
		$result = mysql_query($query);
		// Do it again to get the size.
		$resultSize = mysql_query($query);

		// If there are no posts for a subject, we need to display a message to the user.
		$empty = false;
		if (sizeof(mysql_fetch_assoc($resultSize)) == 1) $empty = true;

		// Get the posts's information.
		$query = sprintf("SELECT * FROM post WHERE id = %d;", $id);
		$resultTwo = mysql_query($query);
		while($row = mysql_fetch_assoc($resultTwo)) {
			$post['id'] = $row['id'];
			$post['title'] = $row['title'];
			$post['subject'] = $row['subject'];
		}

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/post.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	// This function will add the comment to the specific post's ID.
	public function addComment() {
		// Get the information for the comment.
		$post = $_POST['post'];
		$description = $_POST['description'];
		$author = $_POST['author'];

		// Connect to the database.
		$connection = mysql_connect(DB_HOST, DB_USER, DB_PASS) or die ('Error: Could not connect to MySql database');
		mysql_select_db(DB_DATABASE);

		// Query to the database the new information.
		$query = sprintf("INSERT INTO `comment` (`post`, `description`, `author`) VALUES ('%d', '%s', '%s')", $post, $description, $author);
		mysql_query($query);

		// Redirect home.
		session_start();
		header('Location: '.BASE_URL.'/post/'.$post);
	}

}