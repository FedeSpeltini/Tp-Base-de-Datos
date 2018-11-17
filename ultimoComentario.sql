select usuario.id, usuario.username, contenido, fecha_comentario 
from   comentario c 
INNER JOIN usuario ON usuario.id = c.id_user
where  fecha_comentario = (select max(fecha_comentario) from comentario where comentario.id_user = c.id_user)
order by usuario.id, fecha_comentario desc
