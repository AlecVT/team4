<?php

class Post extends DbObject {
	const DB_TABLE = 'post';

	protected $id;
	protected $subject;
	protected $title;
	protected $description;
	protected $author;

	// This constructor will create our Post object for later manipulation.
	public function __construct($args = array()) {
		$defaultArgs = array('id' => null, 'subject' => 0, 'title' => '', 'description' => '', 'author' => '');

		$args += $defaultArgs;

		// Set the properties of our Post object.
		$this->id = $args['id'];
		$this->subject = $args['subject'];
		$this->title = $args['title'];
		$this->description = $args['description'];
		$this->author = $args['author'];
	}

	// This function will either insert or update a Post entry in the database.
	public function save() {
		$db = Db::instance();
		$db_properties = array('subject' => $this->subject, 'title' => $this->title, 'description' => $this->description, 'author' => $this->author);
		$db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
	}

	// This function will remove a Post entry from the database. Specifically one with the passed in ID.
	public function delete($id) {
		$db = Db::instance();
		$db->delete($this, __CLASS__, self::DB_TABLE, $id);
	}

	// Load from the database, the Post object of the specified provided ID.
	public static function loadById($id) {
		$db = Db::instance();
		$obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
		return $obj;
	}

	// Load from the database, all of the Post entries that fall under a specific Subject entry, by the specified ID.
	public static function loadBySubjectId($id) {
		$query = sprintf(" SELECT id from post WHERE subject = %d ", $id);
		$db = Db::instance();
		$result = $db->lookup($query);
		if (!mysql_num_rows($result)) return null;
		else {
			$objects = array();
			while ($row = mysql_fetch_assoc($result)) {
				$objects[] = self::loadById($row['id']);
			}
			return ($objects);
		}
	}

	// Load from the database, the Post entry that matches the provided title.
	public static function loadByTitle($title=null) {
		if ($title === null) return null;

		$query = sprintf(" SELECT id FROM %s WHERE title = '%s' ", self::DB_TABLE, $title);
		$db = Db::instance();
		$result = $db->lookup($query);
		if (!mysql_num_rows($result)) return null;
		else {
			$row = mysql_fetch_assoc($result);
			$obj = self::loadById($row['id']);
			return ($obj);
		}
	}

}