select usuario.id, usuario.username, contenido, fecha_publicacion 
from   publicacion p 
INNER JOIN usuario ON usuario.id = p.id_user
where  fecha_publicacion = (select max(fecha_publicacion) from publicacion where publicacion.id_user = p.id_user)
order by usuario.id, fecha_publicacion desc







create view vUltimaPublicacionUsuario as
select usuario.username, contenido, fecha_publicacion 
from   publicacion p 
INNER JOIN usuario ON usuario.id = p.id_user
where  fecha_publicacion = (select max(fecha_publicacion) from publicacion where publicacion.id_user = p.id_user)
order by usuario.id, fecha_publicacion desc
