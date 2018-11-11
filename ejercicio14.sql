select DISTINCT(usuario.id), contenido, fecha_comentario from comentario 
INNER JOIN usuario ON usuario.id = comentario.id_user
order by fecha_comentario desc
