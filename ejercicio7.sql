CREATE VIEW vComentario AS
(select * from comentario) EXCEPT 
(select id, id_public, comentario.id_user, contenido, fecha_comentario from comentario 
INNER JOIN like_comentario ON like_comentario.id_coment = comentario.id where like_comentario.positivo = false) 




CREATE VIEW vPublicacionVip AS
select usuario.id, username, nombre, apellido, email from usuario 
INNER JOIN publicacion ON usuario.id = publicacion.id_user
INNER JOIN like_publicacion ON publicacion.id = like_publicacion.id_public
GROUP BY usuario.id
having (count(like_publicacion.positivo = true) > 9)	


CREATE VIEW vInfluencerVip AS 
select vPublicacionVip.id, username, nombre, apellido, email from vPublicacionVip
INNER JOIN vComentario ON vPublicacionVip.id = vComentario.id


CREATE VIEW vLikePub AS														
select id, count (positivo) as like from publicacion
INNER JOIN like_publicacion ON publicacion.id = like_publicacion.id_public
where positivo = true														
GROUP BY publicacion.id													   
														
CREATE VIEW vDisLikePub AS														
select id, count (positivo) as dislike from publicacion
INNER JOIN like_publicacion ON publicacion.id = like_publicacion.id_public
where positivo = false														
GROUP BY publicacion.id			
														
CREATE VIEW vMoreLikeLessDislike AS															
select vLikePub.id, vLikePub.like, vDisLikePub.dislike from vLikePub														
INNER JOIN vDisLikePub ON vLikePub.id = vDisLikePub.id														
where 	vLikePub.like > vDisLikePub.dislike													
														
select username, nombre, apellido, email from 	vInfluencerVip													
INNER JOIN vMoreLikeLessDislike ON vInfluencerVip.id = vMoreLikeLessDislike.id		
