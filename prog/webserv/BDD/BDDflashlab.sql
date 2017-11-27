DROP DATABASE IF EXISTS flashlab;

CREATE DATABASE flashlab;
USE flashlab;

CREATE TABLE users (
idUti SMALLINT PRIMARY KEY AUTO_INCREMENT,
prenom VARCHAR(30) NOT NULL,
nom VARCHAR(30) NOT NULL,
mail VARCHAR(30) NOT NULL,
password CHAR(70) NOT NULL);

CREATE TABLE secret (
id SMALLINT PRIMARY KEY AUTO_INCREMENT,
element VARCHAR(30) NOT NULL,
colonne VARCHAR(30) NOT NULL,
ligne VARCHAR(30) NOT NULL);

INSERT INTO users VALUES ('1','Henri','Thomas','admin@flashlab.itinet.fr','0a92fab3230134cca6eadd9898325b9b2ae67998');
INSERT INTO users VALUES ('2','Cisco','Ramon','ramon@flashlab.itinet.fr','b63d059742278fce88c69bdb9b7dc909e5376d12');
INSERT INTO users VALUES ('3','Barry','Allen','flash@flashlab.itinet.fr','126f1b0a71786d796e6f91336c59ea84039eaa80');

INSERT INTO secret VALUES ('1','poseidon','dieu_de_la_mer','192.168.26.2');
INSERT INTO secret VALUES ('2','username','password','ip');