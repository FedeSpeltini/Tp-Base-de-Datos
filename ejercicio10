create view vLikeComent AS	
select id, contenido, count(positivo) as Like, id_public   from comentario 
INNER JOIN like_comentario ON comentario.id = like_comentario.id_coment
where positivo = true
GROUP BY id--, positivo

CREATE VIEW vDisLikeComent AS
select id, count(positivo) as DisLike   from comentario 
INNER JOIN like_comentario ON comentario.id = like_comentario.id_coment
where positivo = false
GROUP BY id--, positivo

CREATE VIEW vComentLikeDislikeLindo AS
select vLikeComent.id, contenido,id_public , vLikeComent.Like, vDisLikeComent.DisLike  from vLikeComent
INNER JOIN vDisLikeComent ON vLikeComent.id = vDisLikeComent.id
--where vDisLikeComent.DisLike > 2


select vComentLikeDislikeLindo.contenido, publicacion.contenido, 
vComentLikeDislikeLindo.Like, vComentLikeDislikeLindo.Dislike from publicacion
INNER JOIN vComentLikeDislikeLindo ON publicacion.id = vComentLikeDislikeLindo.id_public
ORDER BY Dislike, vComentLikeDislikeLindo.Like --fechaComentario
