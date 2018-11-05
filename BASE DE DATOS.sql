CREATE DATABASE social_network

CREATE TABLE carrera(
	id SERIAL PRIMARY KEY, nombre VARCHAR(200)
	)

	
CREATE TABLE usuario(
	id SERIAL PRIMARY KEY, nombre VARCHAR(100), apellido VARCHAR(100),username VARCHAR(30), contrasenia VARCHAR(30),fecha_nacimiento DATE, email, id_carrera INT,
	CONSTRAINT id_carrera FOREIGN KEY (id_carrera) REFERENCES carrera(id))
		
	
CREATE TABLE grupo(
	id SERIAL PRIMARY KEY, nombre_grupo VARCHAR(100), requiere_invitacion BOOL)
	

	--RELACION entre grupo y usuario
CREATE TABLE grupo_usuario(
	id_grupo INT REFERENCES grupo(id), id_user INT REFERENCES usuario(id),
	PRIMARY KEY (id_grupo, id_user)	)
	

CREATE TABLE publicacion(
	id SERIAL, id_user, id_grupo, titulo, contenido, fecha_publicacion TIMESTAMP)
	
	
	--RELACION entre publicacion y usuario LIKE
CREATE TABLE like_publicacion(
	id_public INT REFERENCES publicacion(id), id_user INT REFERENCES usuario(id), positivo, fecha TIMESTAMP
	PRIMARY KEY (id_public, id_user))
	
	id_carrera
	
	
CREATE TABLE comentario(
	id SERIAL, id_public INT REFERENCES publicacion(id), id_user INT, contenido, fecha_comentario TIMESTAMP,
	PRIMARY KEY(id, id_public))


	--RELACION entre comentario y usuario LIKE
CREATE TABLE like_comentario(
	id_coment INT REFERENCES comentario(id), id_user INT REFERENCES usuario(id), positivo BOOL, fecha TIMESTAMP,
	PRIMARY KEY(id_coment, id_user))

---------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE usuario 
	ADD COLUMN cursa text[],
	--DROP COLUMN id_carrera DUDOSO



CREATE TABLE cursa(
	id_usuario INT REFERENCES usuario(id), id_carrera INT REFERENCES carrera(id)
	PRIMARY KEY(id, id_carrera))
	

	

	
----------------------------------------------------------------------------------------------------------------------------------------
INSERT TABLE cursa
	
-------------------------------------------------------------------------------------------------------------------------------------------
3


INSERT INTO usuario (nombre, apellido, username, contrasenia, fecha_nacimiento)
VALUES ('Matias', 'Silvestre', 'canapedemondongo', 'Dal41lama', to_date('09112000','DDMMYYYY')); 

IF select * from COUNT(carrera) where nombre ='Tecnicatura en Programacion' == 0 THEN
	INSERT INTO carrera (id, nombre)
	VALUES (default, 'Tecnicatura en Programacion');    

END IF; 

INSERT INTO carrera (id, nombre)
VALUES (select id from usuario where username = 'canapedemondongo'    select id from carrera where nombre = 'Tecnicatura en Programacion' 

-----------------------------------------------------------------------------------------------------------------------------	
canapedemondongo con nombre y apellido “Matias Silvestre”, password “Dal41lama”,
nacido el 9/11/2000 y que cursa la carrera “Tecnicatura en Programación”

SELECT to_date('09112000','DDMMYYYY')


like_publicacion<id_public INT, id_user INT, positivo, fecha TIMESTAMP>


---------------------------------------------------------------------

5


SELECT nombre.carrera, count(id_usuario.cursa)
FROM
 carrera
INNER JOIN cursa ON carrera.id = cursa.id_carrera;
GROUP BY nombre.carrera
ORDER BY length(nombre.carrera) DESC

SELECT cursa
FROM cursa
WHERE [ conditions ]
GROUP BY column1, column2....columnN
ORDER BY column1, column2....columnN


----------------------------------------------------------------------


6

SELECT username
FROM
 usuario
INNER JOIN 
(SELECT id_user
FROM
 publicacion
INNER JOIN like_publicacion ON publicacion.id = like_publicacion.id_public;) as 'tablaPublicaciones'

ON usuario.id = tablaPublicaciones.id_user;

where CantidadLikes.tablaPublicaciones >= 10



SELECT id_user, (count(id_public)) as 'CantidadLikes'
FROM
 publicacion
INNER JOIN like_publicacion ON publicacion.id = like_publicacion.id_public;




