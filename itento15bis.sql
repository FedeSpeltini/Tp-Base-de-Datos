CREATE VIEW vInactivo AS
((((select id, nombre, apellido, username, email from usuario 
EXCEPT 
select usuario.id, nombre, apellido, username, email from usuario
INNER JOIN publicacion ON usuario.id = publicacion.id_user)
EXCEPT 
select usuario.id, nombre, apellido, username, email from usuario
INNER JOIN comentario ON usuario.id = comentario.id_user)

EXCEPT 
select usuario.id, nombre, apellido, username, email from usuario
INNER JOIN like_comentario ON usuario.id = like_comentario.id_user)

EXCEPT 
select usuario.id, nombre, apellido, username, email from usuario
INNER JOIN like_publicacion ON usuario.id = like_publicacion.id_user)

"canapedemondongo"

INSERT INTO carrera_usuario VALUES (3, 103);

INSERT INTO carrera_usuario VALUES (1, 103);
select * from carrera_usuario
INNER JOIN usuario ON carrera_usuario.id_usuario = usuario.id
where username = 'canapedemondongo'

select usuario.id, nombre, apellido, username from usuario
where username = 'canapedemondongo'

COALESCE
-- vInactivo.nombre, apellido, username, email, 
select vInactivo.id, COALESCE(carrera.nombre) from vInactivo
INNER JOIN carrera_usuario ON vInactivo.id = carrera_usuario.id_usuario
INNER JOIN carrera ON carrera_usuario.id_carrera = carrera.id
group by vInactivo.id

select * from carrera_usuario
INNER JOIN carrera ON carrera_usuario.id_carrera = carrera.id
