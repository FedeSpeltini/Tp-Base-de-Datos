CREATE VIEW vLikePub AS
select id, publicacion.id_user, count (positivo) as like from publicacion
INNER JOIN like_publicacion ON publicacion.id = like_publicacion.id_public
where positivo = true														
GROUP BY publicacion.id;

CREATE VIEW vDisLikePub AS
select id, publicacion.id_user, count (positivo) as dislike from publicacion
INNER JOIN like_publicacion ON publicacion.id = like_publicacion.id_public
where positivo = false														
GROUP BY publicacion.id;
--CREO QUE ESTAN EN EL EJERCICIO 7 REVISAR
----------------------------------------------------------------------------------------



CREATE VIEW vLikeComent AS
select id, comentario.id_user, count (positivo) as like from comentario
INNER JOIN like_comentario ON comentario.id = like_comentario.id_coment
where positivo = true														
GROUP BY comentario.id;

CREATE VIEW vDisLikeComent AS
select id, comentario.id_user, count (positivo) as dislike from comentario
INNER JOIN like_comentario ON comentario.id = like_comentario.id_coment
where positivo = false														
GROUP BY comentario.id;





CREATE VIEW vLikeUsuarioPub AS
select vLikePub.id_user, sum(vLikePub.like) from vLikePub 
GROUP BY id_user;

CREATE VIEW vLikeUsuarioComent AS
select vLikeComent.id_user, sum(vLikeComent.like) from vLikeComent 
GROUP BY id_user;


CREATE VIEW vDisLikeUsuarioPub AS
select vDisLikePub.id_user, sum(vDisLikePub.dislike) from vDisLikePub 
GROUP BY id_user;

ALTER VIEW vDisLikeUsuarioComent AS
select vDisLikeComent.id_user, sum(vDisLikeComent.dislike) from vDisLikeComent 
GROUP BY id_user;




select id, username, coalesce(vLikeUsuarioPub.sum, 0) + coalesce(vLikeUsuarioComent.sum, 0) as LikeTotal,
coalesce(vDisLikeUsuarioPub.sum, 0) + coalesce(vDisLikeUsuarioComent.sum, 0) as DisLikeTotal,
(coalesce(vLikeUsuarioPub.sum, 0) + coalesce(vLikeUsuarioComent.sum, 0)) - (coalesce(vDisLikeUsuarioPub.sum, 0) + coalesce(vDisLikeUsuarioComent.sum, 0)) as DiferenciaLike
from usuario
LEFT JOIN vLikeUsuarioPub ON usuario.id = vLikeUsuarioPub.id_user
LEFT JOIN vLikeUsuarioComent ON usuario.id = vLikeUsuarioComent.id_user
LEFT JOIN vDisLikeUsuarioPub ON usuario.id = vDisLikeUsuarioPub.id_user
LEFT JOIN vDisLikeUsuarioComent ON usuario.id = vDisLikeUsuarioComent.id_user

