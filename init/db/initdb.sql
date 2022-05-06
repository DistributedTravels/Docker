DROP USER IF EXISTS transport;
CREATE USER transport WITH PASSWORD 'transport';
DROP DATABASE IF EXISTS transport;
CREATE DATABASE transport;
GRANT ALL PRIVILEGES ON DATABASE transport TO transport;

DROP USER IF EXISTS reservation;
CREATE USER reservation WITH PASSWORD 'reservation';
DROP DATABASE IF EXISTS reservation;
CREATE DATABASE reservation;
GRANT ALL PRIVILEGES ON DATABASE reservation TO reservation;

DROP USER IF EXISTS offers;
CREATE USER offers WITH PASSWORD 'offers';
DROP DATABASE IF EXISTS offers;
CREATE DATABASE offers;
GRANT ALL PRIVILEGES ON DATABASE offers TO offers;

DROP USER IF EXISTS hotels;
CREATE USER hotels WITH PASSWORD 'hotels';
DROP DATABASE IF EXISTS hotels;
CREATE DATABASE hotels;
GRANT ALL PRIVILEGES ON DATABASE hotels TO hotels;

\connect hotels

CREATE TABLE countries (
	id SERIAL PRIMARY KEY,
	name VARCHAR (64) UNIQUE NOT NULL
);
ALTER TABLE countries OWNER TO hotels;

CREATE TABLE hotels (
	id SERIAL PRIMARY KEY,
	name VARCHAR (64) NOT NULL,
	country_id INT NOT NULL,
	FOREIGN KEY (country_id)
		REFERENCES countries (id)
);
ALTER TABLE hotels OWNER TO hotels;

CREATE TABLE attractions (
	id SERIAL PRIMARY KEY,
	name VARCHAR (64) UNIQUE NOT NULL
);
ALTER TABLE attractions OWNER TO hotels;

CREATE TABLE hotels_attractions (
	id SERIAL PRIMARY KEY,
	hotel_id INT NOT NULL,
	attraction_id INT NOT NULL,
	FOREIGN KEY (hotel_id)
		REFERENCES hotels (id),
	FOREIGN KEY (attraction_id)
		REFERENCES attractions (id)
);
ALTER TABLE hotels_attractions OWNER TO hotels;

INSERT INTO
	countries (name)
VALUES
	('Grecja'),
	('Hiszpania');

INSERT INTO
	hotels (name, country_id)
VALUES
	('Hotel Acharavi Mare',
		(SELECT id from countries WHERE name='Grecja')
	),
	('Hotel Aldemar Royal Olympian',
		(SELECT id from countries WHERE name='Grecja')
	),
	('Hotel Bg Pamplona',
		(SELECT id from countries WHERE name='Hiszpania')
	);
	
INSERT INTO
	attractions (name)
VALUES
	('basen'),
	('spa'),
	('plaża');
	
INSERT INTO
	hotels_attractions (hotel_id, attraction_id)
VALUES
	(
		(SELECT id from hotels WHERE name='Hotel Acharavi Mare'),
		(SELECT id from attractions WHERE name='basen')
	),
	(
		(SELECT id from hotels WHERE name='Hotel Acharavi Mare'),
		(SELECT id from attractions WHERE name='plaża')
	),
	(
		(SELECT id from hotels WHERE name='Hotel Aldemar Royal Olympian'),
		(SELECT id from attractions WHERE name='plaża')
	),
	(
		(SELECT id from hotels WHERE name='Hotel Bg Pamplona'),
		(SELECT id from attractions WHERE name='basen')
	),
	(
		(SELECT id from hotels WHERE name='Hotel Bg Pamplona'),
		(SELECT id from attractions WHERE name='spa')
	);
