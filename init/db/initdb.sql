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