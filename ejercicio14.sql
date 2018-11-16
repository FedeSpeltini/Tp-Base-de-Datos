select DISTINCT(usuario.id), contenido, fecha_comentario from comentario 
INNER JOIN usuario ON usuario.id = comentario.id_user
order by fecha_comentario desc




select usuario.id, usuario.nombre, contenido, fecha_publicacion 
from   publicacion p 
INNER JOIN usuario ON usuario.id = p.id_user
where  fecha_publicacion = (select max(fecha_publicacion) from publicacion where publicacion.id_user = p.id_user)
order by usuario.id, fecha_publicacion desc
