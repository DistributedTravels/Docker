Drop USER IF EXISTS Transport;
CREATE USER Transport@'%' IDENTIFIED BY 'transport';
DROP DATABASE IF EXISTS Transport;
CREATE DATABASE Transport;
GRANT ALL PRIVILEGES ON Transport.* TO Transport@'%';

Drop USER IF EXISTS Reservation;
CREATE USER Reservation@'%' IDENTIFIED BY 'reservation';
DROP DATABASE IF EXISTS Reservation;
CREATE DATABASE Reservation;
GRANT ALL PRIVILEGES ON Reservation.* TO Reservation@'%';