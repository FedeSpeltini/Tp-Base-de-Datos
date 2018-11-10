select usuario.id, username from usuario
inner join publicacion on publicacion.id_user = usuario.id
inner join like_publicacion on like_publicacion.id_public = publicacion.id
inner join carrera_usuario on carrera_usuario.id_usuario <> publicacion.id_user
group by usuario.id
UNION
select usuario.id, username from usuario
inner join comentario on comentario.id_user = usuario.id
inner join like_comentario on like_comentario.id_coment = comentario.id
inner join carrera_usuario on carrera_usuario.id_usuario <> comentario.id_user
group by usuario.id;
