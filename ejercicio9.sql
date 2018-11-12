select username, count(id_grupo) from usuario																   
INNER JOIN grupo_usuario ON usuario.id = grupo_usuario.id_user	
group by usuario.id