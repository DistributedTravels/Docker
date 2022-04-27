Drop USER IF EXISTS Transport;
CREATE USER 'Transport'@localhost IDENTIFIED BY PASSWORD('transport');
CREATE DATABASE 'Transport';
GRANT ALL PRIVILAGES ON 'Transport'.* TO 'Transport'@localhost;

Drop USER IF EXISTS Reservation;
CREATE USER 'Reservation'@localhost IDENTIFIED BY PASSWORD('reservation');
CREATE DATABASE 'Reservation';
GRANT ALL PRIVILAGES ON 'Reservation'.* TO 'Reservation'@localhost;