select nombre_grupo, count(positivo) from grupo
INNER JOIN grupo_usuario ON grupo_usuario.id_grupo = grupo.id
INNER JOIN usuario ON grupo_usuario.id_user = usuario.id
INNER JOIN publicacion ON grupo.id = publicacion.id_grupo
INNER JOIN like_publicacion ON publicacion.id = like_publicacion.id_public
where EXTRACT(year FROM  age(fecha_nacimiento)) > 15 and positivo = true
GROUP BY nombre_grupo
ORDER BY count(positivo) DESC
LIMIT 6;
