 CREATE VIEW vComentario AS
(select * from comentario) EXCEPT 
(select id, id_public, comentario.id_user, contenido, fecha_comentario from comentario 
INNER JOIN like_comentario ON like_comentario.id_coment = comentario.id where like_comentario.positivo = false) 


CREATE VIEW vPublicacion AS
select usuario.id, username, nombre, apellido from usuario 
INNER JOIN publicacion ON usuario.id = publicacion.id_user
INNER JOIN like_publicacion ON publicacion.id = like_publicacion.id_public
GROUP BY usuario.id
having (count(like_publicacion.positivo = true) > 9)

 
select username, nombre, apellido from vPublicacion
INNER JOIN vComentario ON vPublicacion.id = vComentario.id		

------------------------------------------------------------------------------------------------------------------------------

select username from usuario 
INNER JOIN publicacion ON usuario.id = publicacion.id_user
INNER JOIN like_publicacion ON publicacion.id = like_publicacion.id_public
INNER JOIN comentario ON usuario.id = comentario.id_user 
INNER JOIN comentario ON publicacion.id = comentario.id_public
INNER JOIN like_comentario ON like_comentario.id_coment = comentario.id
GROUP BY username, publicacion.id, comentario.id_user
having (count(like_publicacion.positivo = true) > 9) and (count(like_comentario.positivo = false) = 0)
