DROP DATABASE IF EXISTS inquilino_perfecto;
CREATE DATABASE IF NOT EXISTS inquilino_perfecto;

USE inquilino_perfecto;

DROP TABLE IF EXISTS users;
CREATE TABLE users
(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR (255) NOT NULL,
	last_name VARCHAR (255) NOT NULL,
	email VARCHAR (255) UNIQUE NOT NULL,
	bio VARCHAR (255) NOT NULL,
	picture VARCHAR (255) NOT NULL,
	password VARCHAR (255) NOT NULL,
	active BOOLEAN NOT NULL DEFAULT false,
	activation_code VARCHAR (255)
);

DROP TABLE IF EXISTS houses;
CREATE TABLE houses
(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR (255) NOT NULL,
	price INT UNSIGNED NOT NULL,
	rooms INT UNSIGNED NOT NULL,
	description VARCHAR (255) NOT NULL,
	city VARCHAR (255) NOT NULL,
	id_owner INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_owner) REFERENCES users (id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS bookings;
CREATE TABLE bookings
(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	start_date TIMESTAMP NOT NULL,
	end_date TIMESTAMP NOT NULL,
	accepted BOOLEAN,
	id_house INT UNSIGNED NOT NULL,
	id_tenant INT UNSIGNED NOT NULL,
	tenant_rating INT UNSIGNED,
	owner_rating INT UNSIGNED,
	FOREIGN KEY (id_house) REFERENCES houses (id),
	FOREIGN KEY (id_tenant) REFERENCES users (id)
);

DROP TABLE IF EXISTS house_pictures;
CREATE TABLE house_pictures
(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	url VARCHAR (255) NOT NULL,
	id_house INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_house) REFERENCES houses (id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS ratings;
CREATE TABLE ratings
(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	rating INT UNSIGNED NOT NULL,
	rating_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	user_rated_role ENUM("owner", "tenant") NOT NULL,
	id_user_rated INT UNSIGNED NOT NULL,
	id_booking INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_user_rated) REFERENCES users (id) ON DELETE CASCADE,
	FOREIGN KEY (id_booking) REFERENCES bookings (id)
);
