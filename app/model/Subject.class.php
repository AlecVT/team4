<?php

class Subject extends DbObject {
	const DB_TABLE = 'subject';

	protected $id;
	protected $name;

	// This constructor will create our Subject object for later manipulation.
	public function __construct($args = array()) {
		$defaultArgs = array('id' => null, 'name' => '');

		$args += $defaultArgs;

		// Set the properties of our Subject object.
		$this->id = $args['id'];
		$this->name = $args['name'];
	}

	// This function will either insert or update a Subject entry in the database.
	public function save() {
		$db = Db::instance();
		$db_properties = array('name' => $this->name);
		$db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
	}

	// Load from the database, the Subject object of the specified provided ID.
	public static function loadById($id) {
		$db = Db::instance();
		$obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
		return $obj;
	}

	// This function will return an array of all database entries in the Subject table.
	// It will return null if there are none or there was an error.
	public static function getAllSubjects($limit=null) {
		$query = sprintf(" SELECT id FROM %s ORDER BY date_created DESC ", self::DB_TABLE);
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