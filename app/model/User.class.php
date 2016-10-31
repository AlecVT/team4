<?php

class User extends DbObject {
	const DB_TABLE = 'user';

	protected $id;
	protected $name;
	protected $email;
	protected $password;

	// This constructor will create our User object for later manipulation.
	public function __construct($args = array()) {
		$defaultArgs = array('id' => null, 'name' => '', 'email' => '', 'password' => '');

		$args += $defaultArgs;

		// Set the properties of our Post object.
		$this->id = $args['id'];
		$this->name = $args['name'];
		$this->email = $args['email'];
		$this->password = $args['password'];
	}

	// This function will either insert or update a User entry in the database.
	public function save() {
		$db = Db::instance();
		$db_properties = array('name' => $this->name, 'email' => $this->email, 'password' => $this->password);
		$db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
	}

	// Load from the database, the Post object of the specified provided ID.
	public static function loadById($id) {
		$db = Db::instance();
		$obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
		return $obj;
	}

	// Load from the database, the Post entry that matches the provided title.
	public static function loadByEmail($email=null) {
		if ($email === null) return null;

		$query = sprintf(" SELECT id FROM %s WHERE email = '%s' ", self::DB_TABLE, $email);
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