select nombre_grupo, avg(EXTRACT(year FROM  age(fecha_nacimiento))) as promedio, min(EXTRACT(year FROM  age(fecha_nacimiento))) as menor, max(EXTRACT(year FROM  age(fecha_nacimiento))) as mayor from grupo							 
INNER JOIN grupo_usuario ON grupo_usuario.id_grupo = grupo.id
INNER JOIN usuario ON grupo_usuario.id_user = usuario.id							 
GROUP BY nombre_grupo