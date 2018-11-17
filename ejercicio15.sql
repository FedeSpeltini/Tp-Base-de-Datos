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
INNER JOIN like_publicacion ON usuario.id = like_publicacion.id_user);


select vInactivo.id, vInactivo.nombre, apellido, username, array_agg(carrera.nombre), email from vInactivo
INNER JOIN carrera_usuario ON vInactivo.id = carrera_usuario.id_usuario
INNER JOIN carrera ON carrera_usuario.id_carrera = carrera.id
group by vInactivo.id, vInactivo.nombre,  apellido, username, email;
