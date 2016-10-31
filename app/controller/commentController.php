<?php

include_once '../global.php';

// Get the identifier for the page we want to load.
$action = $_GET['action'];

// Instantiate a CommentController and route it.
$pc = new CommentController();
$pc->route($action);

class CommentController {

	// Route us to the appropriate class method for this action.
	public function route($action) {
		switch($action) {

			case 'comment':
				$this->addComment();
				break;
			case 'check':
				$description = $_GET['description'];
				$this->checkProfanity($description);
				break;

			// Redirect to home page if all else fails.
			default:
				header('Location: '.BASE_URL.'/');
				exit();
		}

	}

	// This function will add the comment to the specific post's ID.
	public function addComment() {

		// Get the information for the comment from the POST call.
		$post = $_POST['post'];
		$description = $_POST['description'];
		$author = $_POST['author'];

		// Test if the user isn't logged in. We'll put a replacement author.
		if ($author == '') $author = 'Unknown';

		// Create the Comment class object with all of it's fields.
		$comment = new Comment();
		$comment->set('post', $post);
		$comment->set('description', $description);
		$comment->set('author', $author);

		// Save the new comment to the database.
		$comment->save();

		header('Location: '.BASE_URL.'/post/'.$post);
	}

	public function checkProfanity($description) {
		// AJAX fun.
		$json = file_get_contents("http://www.purgomalum.com/service/containsprofanity?text=".rawurlencode($description));

		// Return the JSON.
		header('Content-Type: application/json');
		echo json_encode($json);
	}

}