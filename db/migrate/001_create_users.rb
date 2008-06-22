class CreateUsers < ActiveRecord::Migration
  def self.up
    create= <<END_OF_STRING
  CREATE TABLE 'users' (
    id INTEGER PRIMARY KEY,
    login VARCHAR(80) NOT NULL,
    email VARCHAR(256) NOT NULL,
    salted_password VARCHAR(40) NOT NULL,
    firstname VARCHAR(40),
    lastname VARCHAR(40),
    salt CHAR(40) NOT NULL,
    verified INT default 0,
    role VARCHAR(40) default NULL,
    security_token CHAR(40) default NULL,
    token_expiry DATETIME default NULL,
    deleted INT default 0,
    delete_after DATETIME default NULL
  );
END_OF_STRING
      execute create
  end
  
  def self.down
    drop_table :users
  end
end
