select nombre, apellido, titulo, contenido, fecha_publicacion from publicacion
INNER JOIN vDisLikePub ON publicacion.id = vDisLikePub.id
INNER JOIN usuario ON publicacion.id_user = usuario.id