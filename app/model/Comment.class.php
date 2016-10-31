<?php

class Comment extends DbObject {
	const DB_TABLE = 'comment';

	protected $id;
	protected $post;
	protected $description;
	protected $author;

	public function __construct($args = array()) {
		$defaultArgs = array('id' => null, 'post' => 0, 'description' => '', 'author' => '');

		$args += $defaultArgs;

		$this->id = $args['id'];
		$this->post = $args['post'];
		$this->description = $args['description'];
		$this->author = $args['author'];
	}

	public function save() {
		$db = Db::instance();
		$db_properties = array('post' => $this->post, 'description' => $this->description, 'author' => $this->author);
		$db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
	}

	public static function loadById($id) {
		$db = Db::instance();
		$obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
		return $obj;
	}

	public static function loadByPostId($id) {
		$query = sprintf(" SELECT id from comment WHERE post = %d ", $id);
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

}