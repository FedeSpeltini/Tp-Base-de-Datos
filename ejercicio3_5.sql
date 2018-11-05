--Ejercicio 3

INSERT INTO usuario (nombre, apellido, username, contrasenia, fecha_nacimiento)
VALUES ('Matias', 'Silvestre', 'canapedemondongo', 'Dal41lama', to_date('09112000','DDMMYYYY')); 

INSERT INTO carrera
    (nombre)
SELECT 'Tecnicatura en Programacion'
WHERE
    NOT EXISTS (
        SELECT id FROM carrera WHERE nombre = 'Tecnicatura en Programacion'
    );
	
	
--Ejercicio 5
	
SELECT carrera.nombre, length(nombre) as tamano, count(carrera_usuario.id_usuario)
FROM
 carrera
INNER JOIN carrera_usuario ON carrera.id = carrera_usuario.id_carrera
GROUP BY carrera.nombre
ORDER BY length(carrera.nombre) DESC	





select usuario.username, nombre, apellido, count(like_publicacion.positivo = true), count(like_comentario.positivo = false) from usuario 
INNER JOIN publicacion ON usuario.id = publicacion.id_user
INNER JOIN like_publicacion ON publicacion.id = like_publicacion.id_public
INNER JOIN comentario ON usuario.id = comentario.id_user
INNER JOIN like_comentario ON comentario.id = like_comentario.id_coment
GROUP BY usuario.username, nombre, apellido
having count(like_publicacion.positivo = true) > 9 and count(like_publicacion.positivo = true) > count(like_comentario.positivo = false) 