<?php

include_once '../global.php';

// Get the identifier for the page we want to load.
$action = $_GET['action'];

// Instantiate a PostController and route it.
$pc = new PostController();
$pc->route($action);

class PostController {

	// Route us to the appropriate class method for this action.
	public function route($action) {
		switch($action) {

			case 'post':
				$postID = $_GET['pid'];
				$this->viewPost($postID);
				break;
			case 'addPost':
				$this->addPost();
				break;
			case 'editPost':
				$postID = $_GET['pid'];
				$this->editPost($postID);
				break;
			case 'deletePost':
				$postID = $_GET['pid'];
				$this->deletePost($postID);
				break;
			case 'checkPost':
				$title = $_GET['title'];
				$this->checkPost($title);
				break;

			// Redirect to home page if all else fails.
			default:
				header('Location: '.BASE_URL.'/');
				exit();
		}

	}

	public function viewPost($id) {
		$pageName = 'Post';

		// Get the post from the database based on the specific ID.
		// Also get all of the comments associated with that post.
		$post = Post::loadById($id);
		$comments = Comment::loadByPostId($id);

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/post.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function addPost() {

		// Get the information for the post from the POST.
		$subject = $_POST['subject'];
		$title = $_POST['title'];
		$description = $_POST['description'];
		$author = $_POST['author'];

		// Create the post class object and set it's fields.
		$post = new Post();
		$post->set('subject', $subject);
		$post->set('title', $title);
		$post->set('description', $description);
		$post->set('author', $author);

		// Save the new post to the database.
		$post->save();

		header('Location: '.BASE_URL.'/subject/'.$subject);
	}

	public function editPost($id) {

		// Get the new information for the editted post from the POST information.
		$title = $_POST['title'];
		$description = $_POST['description'];

		// Load the existing post from the database.
		$post = Post::loadById($id);
		// Set the new information. Not guarenteed that anything actually changed.
		$post->set('title', $title);
		$post->set('description', $description);

		// Update the database.
		$post->save();

		header('Location: '.BASE_URL.'/post/'.$id);
	}

	public function deletePost($id) {
		Post::delete($id);
		header('Location: '.BASE_URL.'/');
	}

	public function checkPost($title) {

		// Get if it existed or not already.
		$post = Post::loadByTitle($title);
		if ($post == null) $json = array('status' => 'available');
		else $json = array('status' => 'unavailable');

		// Return the JSON.
		header('Content-Type: application/json');
		echo json_encode($json);
	}

}