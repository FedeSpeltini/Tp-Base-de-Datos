SELECT t1.Mes, ( SELECT QueDias FROM tuTabla t2 WHERE t1.Mes = t2.Mes ORDER BY t1.Mes FOR XML PATH('') ) AS Dias 
FROM tuTabla t1 GROUP BY t1.Mes ;


SELECT QueDias FROM tuTabla t2 WHERE t1.Mes = t2.Mes ORDER BY t1.Mes FOR XML PATH('')


(select carrera.nombre from carrera where carrera_usuario.id_carrera = carrera.id ORDER BY carrera_usuario.id_carrera FOR XML PATH(''))

(select carrera.nombre from carrera where carrera_usuario.id_carrera = carrera.id ORDER BY carrera_usuario.id_carrera  string_agg(''))

																																  
(select carrera.nombre from carrera where carrera_usuario.id_carrera = carrera.id ORDER BY carrera_usuario.id_carrera  string_agg(''))																																  
(select	string_agg(carrera.nombre, ',')																														  
-- vInactivo.nombre, apellido, username, email,
 
 
select vInactivo.id, vInactivo.nombre, apellido, username, email, ((select string_agg(carrera.nombre, '') where carrera_usuario.id_carrera = carrera.id) from vInactivo
INNER JOIN carrera_usuario ON vInactivo.id = carrera_usuario.id_usuario
INNER JOIN carrera ON carrera_usuario.id_carrera = carrera.id
group by vInactivo.id;
																   
																   
select vInactivo.id, vInactivo.nombre, apellido, username, array_agg(carrera.nombre), email from vInactivo
INNER JOIN carrera_usuario ON vInactivo.id = carrera_usuario.id_usuario
INNER JOIN carrera ON carrera_usuario.id_carrera = carrera.id
  group by vInactivo.id, vInactivo.nombre,  apellido, username, email;
