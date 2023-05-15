DROP DATABASE IF EXISTS ANTICLIMATICOS;
CREATE DATABASE ANTICLIMATICOS;
USE ANTICLIMATICOS;
CREATE TABLE TIPOS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
);

CREATE TABLE USUARIOS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    contrasenia VARCHAR(100) NOT NULL, 
    idTipo INT NOT NULL,
    FOREIGN KEY (idTipo) REFERENCES TIPOS(id),
	UNIQUE (correo)
);
CREATE TABLE JUEGOS(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(100) NOT NULL
);
CREATE TABLE Sesiones (
idSesion INT AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT,
    idJuego INT,
    puntuacion INT,
    fecha DATETIME,
    FOREIGN KEY (idUsuario) REFERENCES USUARIOS(id) on delete cascade,
    FOREIGN KEY (idJuego) REFERENCES JUEGOS(id),
    CONSTRAINT UK_Sesion UNIQUE (idUsuario, idJuego)
);

INSERT INTO TIPOS (nombre, descripcion) VALUES ("superadimin","");
INSERT INTO TIPOS (nombre, descripcion) VALUES ("admin","");
INSERT INTO TIPOS (nombre, descripcion) VALUES ("user","");

INSERT INTO anticlimaticos.usuarios (nombre, correo, contrasenia, idTipo) VALUES ("Marc", "marc@gmail.com", "$2y$10$EUZozhWcO.UHHAAEhf92g.9Pd4NQ2LHXrE7YBziNsvo5VCLkbhiB.", 3);
INSERT INTO anticlimaticos.usuarios (nombre, correo, contrasenia, idTipo) VALUES ("Oriol", "oriol@gmail.com", "$2y$10$EUZozhWcO.UHHAAEhf92g.9Pd4NQ2LHXrE7YBziNsvo5VCLkbhiB.", 3);
INSERT INTO anticlimaticos.usuarios (nombre, correo, contrasenia, idTipo) VALUES ("Alex", "alex@gmail.com", "$2y$10$EUZozhWcO.UHHAAEhf92g.9Pd4NQ2LHXrE7YBziNsvo5VCLkbhiB.", 3);
INSERT INTO anticlimaticos.usuarios (nombre, correo, contrasenia, idTipo) VALUES ("Francesc", "francesc@gmail.com", "$2y$10$EUZozhWcO.UHHAAEhf92g.9Pd4NQ2LHXrE7YBziNsvo5VCLkbhiB.", 3);
INSERT INTO anticlimaticos.usuarios (nombre, correo, contrasenia, idTipo) VALUES ("root", "root@gmail.com", "$2y$10$3lW1nNEz706QvDUAx9VYL.altGJGjGchL0RhBYwvf6wmMnmhzu4b6", 1);
INSERT INTO anticlimaticos.usuarios (nombre, correo, contrasenia, idTipo) VALUES ("admin", "admin@gmail.com", "$2y$10$SR47mN3eVFzobK6EJR3lIuL1yrc2IN.8yCMeqRGcoTOUsqrHa2AUu", 2);

INSERT INTO anticlimaticos.usuarios (nombre, correo, contrasenia, idTipo) VALUES ("Victor", "victor@gmail.com", "$2y$10$EUZozhWcO.UHHAAEhf92g.9Pd4NQ2LHXrE7YBziNsvo5VCLkbhiB.", 3);
INSERT INTO anticlimaticos.usuarios (nombre, correo, contrasenia, idTipo) VALUES ("Manolo", "manolo@gmail.com", "$2y$10$EUZozhWcO.UHHAAEhf92g.9Pd4NQ2LHXrE7YBziNsvo5VCLkbhiB.", 3);
INSERT INTO anticlimaticos.usuarios (nombre, correo, contrasenia, idTipo) VALUES ("Eva", "eva@gmail.com", "$2y$10$EUZozhWcO.UHHAAEhf92g.9Pd4NQ2LHXrE7YBziNsvo5VCLkbhiB.", 3);
INSERT INTO anticlimaticos.usuarios (nombre, correo, contrasenia, idTipo) VALUES ("Marta", "marta@gmail.com", "$2y$10$EUZozhWcO.UHHAAEhf92g.9Pd4NQ2LHXrE7YBziNsvo5VCLkbhiB.", 3);
INSERT INTO anticlimaticos.usuarios (nombre, correo, contrasenia, idTipo) VALUES ("Mar", "mar@gmail.com", "$2y$10$EUZozhWcO.UHHAAEhf92g.9Pd4NQ2LHXrE7YBziNsvo5VCLkbhiB.", 3);
INSERT INTO anticlimaticos.usuarios (nombre, correo, contrasenia, idTipo) VALUES ("Mario", "mario@gmail.com", "$2y$10$EUZozhWcO.UHHAAEhf92g.9Pd4NQ2LHXrE7YBziNsvo5VCLkbhiB.", 3);

INSERT INTO anticlimaticos.juegos (nombre, descripcion) VALUES ("Astral Runner", "");
INSERT INTO anticlimaticos.juegos (nombre, descripcion) VALUES ("Garbage Rush", "");
INSERT INTO anticlimaticos.juegos (nombre, descripcion) VALUES ("Oil Platform Pipe Game", "");
INSERT INTO anticlimaticos.juegos (nombre, descripcion) VALUES ("Fire Canoneer", "");


INSERT INTO anticlimaticos.sesiones (idUsuario, idJuego, puntuacion, fecha) VALUES (1, 2,66,"18/12/10 11:54:20");
INSERT INTO anticlimaticos.sesiones (idUsuario, idJuego, puntuacion, fecha) VALUES (4, 3,200,"18/12/10 11:55:20");
INSERT INTO anticlimaticos.sesiones (idUsuario, idJuego, puntuacion, fecha) VALUES (6, 4,35,"18/12/10 11:56:20");
INSERT INTO anticlimaticos.sesiones (idUsuario, idJuego, puntuacion, fecha) VALUES (5, 1,17,"18/12/10 11:57:20");

INSERT INTO anticlimaticos.sesiones (idUsuario, idJuego, puntuacion, fecha) VALUES (7, 1,10,"18/12/10 11:54:20");
INSERT INTO anticlimaticos.sesiones (idUsuario, idJuego, puntuacion, fecha) VALUES (7, 2,5,"18/12/10 11:55:20");
INSERT INTO anticlimaticos.sesiones (idUsuario, idJuego, puntuacion, fecha) VALUES (7, 3,100,"18/12/10 11:56:20");
INSERT INTO anticlimaticos.sesiones (idUsuario, idJuego, puntuacion, fecha) VALUES (7, 4,15,"18/12/10 11:57:20");

INSERT INTO anticlimaticos.sesiones (idUsuario, idJuego, puntuacion, fecha) VALUES (8, 1,20,"18/12/10 11:54:20");
INSERT INTO anticlimaticos.sesiones (idUsuario, idJuego, puntuacion, fecha) VALUES (8, 2,20,"18/12/10 11:55:20");
INSERT INTO anticlimaticos.sesiones (idUsuario, idJuego, puntuacion, fecha) VALUES (8, 3,300,"18/12/10 11:56:20");
INSERT INTO anticlimaticos.sesiones (idUsuario, idJuego, puntuacion, fecha) VALUES (8, 4,25,"18/12/10 11:57:20");

INSERT INTO anticlimaticos.sesiones (idUsuario, idJuego, puntuacion, fecha) VALUES (9, 1,15,"18/12/10 11:54:20");
INSERT INTO anticlimaticos.sesiones (idUsuario, idJuego, puntuacion, fecha) VALUES (9, 2,12,"18/12/10 11:55:20");
INSERT INTO anticlimaticos.sesiones (idUsuario, idJuego, puntuacion, fecha) VALUES (9, 3,400,"18/12/10 11:56:20");
INSERT INTO anticlimaticos.sesiones (idUsuario, idJuego, puntuacion, fecha) VALUES (9, 4,40,"18/12/10 11:57:20");

INSERT INTO anticlimaticos.sesiones (idUsuario, idJuego, puntuacion, fecha) VALUES (10, 1,16,"18/12/10 11:54:20");
INSERT INTO anticlimaticos.sesiones (idUsuario, idJuego, puntuacion, fecha) VALUES (10, 2,51,"18/12/10 11:55:20");
INSERT INTO anticlimaticos.sesiones (idUsuario, idJuego, puntuacion, fecha) VALUES (10, 3,600,"18/12/10 11:56:20");
INSERT INTO anticlimaticos.sesiones (idUsuario, idJuego, puntuacion, fecha) VALUES (10, 4,8,"18/12/10 11:57:20");


INSERT INTO anticlimaticos.sesiones (idUsuario, idJuego, puntuacion, fecha) VALUES (11, 1,28,"18/12/10 11:54:20");
INSERT INTO anticlimaticos.sesiones (idUsuario, idJuego, puntuacion, fecha) VALUES (11, 2,32,"18/12/10 11:55:20");
INSERT INTO anticlimaticos.sesiones (idUsuario, idJuego, puntuacion, fecha) VALUES (11, 3,300,"18/12/10 11:56:20");
INSERT INTO anticlimaticos.sesiones (idUsuario, idJuego, puntuacion, fecha) VALUES (11, 4,40,"18/12/10 11:57:20");

INSERT INTO anticlimaticos.sesiones (idUsuario, idJuego, puntuacion, fecha) VALUES (12, 1,28,"18/12/10 11:54:20");
INSERT INTO anticlimaticos.sesiones (idUsuario, idJuego, puntuacion, fecha) VALUES (12, 2,32,"18/12/10 11:55:20");
INSERT INTO anticlimaticos.sesiones (idUsuario, idJuego, puntuacion, fecha) VALUES (12, 3,300,"18/12/10 11:56:20");
INSERT INTO anticlimaticos.sesiones (idUsuario, idJuego, puntuacion, fecha) VALUES (12, 4,40,"18/12/10 11:57:20");