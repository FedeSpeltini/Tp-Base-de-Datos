CREATE TABLE log_publicacion(
	id_log SERIAL PRIMARY KEY, fecha_log TIMESTAMP, accion_log CHAR(1),id int REFERENCES  publicacion(id),
	id_user int REFERENCES  usuario(id), id_grupo int REFERENCES  grupo(id),
	titulo VARCHAR(300), contenido VARCHAR(300),
	fecha_publicacion TIMESTAMP)
	--CONSTRAINT id_carrera FOREIGN KEY (id_carrera) REFERENCES carrera(id));
	
drop table log_publicacion
		
CREATE OR REPLACE FUNCTION publicacion_audit_I()
   RETURNS TRIGGER
    SET SCHEMA 'public'
    LANGUAGE plpgsql
    AS $$
    BEGIN
    IF LENGTH(NEW.titulo) = 0 THEN
        RAISE EXCEPTION 'Es obligatirio contar con el titulo.';
    END IF;
 
    INSERT INTO log_publicacion (fecha_log, accion_log, id, id_user, id_grupo, titulo, contenido, fecha_publicacion ) 
  select(now(), 'I', NEW.id, NEW.id_user, NEW.id_grupo, NEW.titulo, NEW.contenido, NEW.fecha_publicacion );
 
    RETURN NEW;
    END;
    $$;
	
CREATE OR REPLACE FUNCTION publicacion_audit_U()
   RETURNS TRIGGER
    SET SCHEMA 'public'
    LANGUAGE plpgsql
    AS $$
    BEGIN
    IF LENGTH(NEW.titulo) = 0 THEN
        RAISE EXCEPTION 'Es obligatirio contar con el titulo.';
    END IF;
 
    INSERT INTO log_publicacion (fecha_log, accion_log, id, id_user, id_grupo, titulo, contenido, fecha_publicacion ) 
  select(now(), 'U', OLD.id, OLD.id_user, OLD.id_grupo, OLD.titulo, OLD.contenido, OLD.fecha_publicacion );
 
    RETURN NEW;
    END;
    $$;



CREATE OR REPLACE FUNCTION publicacion_audit_D()
   RETURNS TRIGGER
    SET SCHEMA 'public'
    LANGUAGE plpgsql
    AS $$
    BEGIN
    IF LENGTH(NEW.titulo) = 0 THEN
        RAISE EXCEPTION 'Es obligatirio contar con el titulo.';
    END IF;
 
    INSERT INTO log_publicacion (fecha_log, accion_log, id, id_user, id_grupo, titulo, contenido, fecha_publicacion ) 
  select(now(), 'D', OLD.id, OLD.id_user, OLD.id_grupo, OLD.titulo, OLD.contenido, OLD.fecha_publicacion );
 
    RETURN NEW;
    END;
    $$;









DROP TRIGGER tr_publicacion_I ON publicacion;
 
CREATE TRIGGER tr_publicacion_I BEFORE INSERT ON publicacion
    FOR EACH ROW EXECUTE PROCEDURE publicacion_audit_I();

	
	
DROP TRIGGER tr_publicacion_U ON publicacion;
 
CREATE TRIGGER tr_publicacion_U BEFORE UPDATE ON publicacion
    FOR EACH ROW EXECUTE PROCEDURE publicacion_audit_U();


DROP TRIGGER tr_publicacion_D ON publicacion;
 
CREATE TRIGGER tr_publicacion_D BEFORE UPDATE ON publicacion
    FOR EACH ROW EXECUTE PROCEDURE publicacion_audit_D();

	'2018-03-21 06:49:10'
	
select * from publicacion	

insert into publicacion 
values(1000, 38, 3,	'Prueba titulo.', 'PRUEBA contido tium.', to_date('09112015','DDMMYYYY'))

INSERT INTO publicacion(id, id_user, id_grupo, titulo, contenido, fecha_publicacion) VALUES (1000, 30, 9, 'Prueba titulo', 'PRUEBA contido tium.', '2017-03-21');
													  
2017-03-21 06:49:10															  
UPDATE publicacion
SET contenido = 'holi'
WHERE id = 1;																	  

delete from publicacion where id = 1
	
	
	
	
CREATE TRIGGER tr_publicacion
AFTER INSERT
   ON publicacion FOR EACH ROW
--INSTEAD OF INSERT ON publicacion
--FOR EACH ROW
EXECUTE PROCEDURE publicacion_audit();
  INSERT INTO log_publicacion(fecha_log, accion_log, id, id_user, id_grupo, titulo, contenido, fecha_publicacion ) 
  select(current_date(), 'I', id, id_user, id_grupo, titulo, contenido, fecha_publicacion );
   --WHERE cust_id=NEW.cust_id;



INSTEAD OF UPDATE OF publicacion 
BEGIN
 
  INSERT INTO log_publicacion(fecha_log, accion_log, id, id_user, id_grupo, titulo, contenido, fecha_publicacion ) 
  select(current_date(), 'U', id, id_user, id_grupo, titulo, contenido, fecha_publicacion )
   
END;

INSTEAD OF DELETE OF publicacion 
BEGIN
 
  INSERT INTO log_publicacion(fecha_log, accion_log, id, id_user, id_grupo, titulo, contenido, fecha_publicacion ) 
  select(current_date(), 'D', id, id_user, id_grupo, titulo, contenido, fecha_publicacion )
   
END;

  INSERT INTO log_publicacion(fecha_log, accion_log, id, id_user, id_grupo, titulo, contenido, fecha_publicacion ) 
  select(now(), 'I', id, id_user, id_grupo, titulo, contenido, fecha_publicacion );
																	  
																	  
																	  
  INSERT INTO log_publicacion(fecha_log, accion_log, id, id_user, id_grupo, titulo, contenido, fecha_publicacion ) 
  values('2017-03-21 06:49:10', 'I', 3, 30, 30, 'titulo', 'contenido', '2017-03-21 06:49:10');																	  
--SET column1 = value1, column2 = value2, ...
--WHERE condition;

 --UPDATE log_publicacion SET fecha_log=current_date(), accion_log = 'U', id = id, id_user = id_user,
  --id_grupo = id_grupo, titulo = titulo, contenido = contenido, fecha_publicacion = fecha_publicacion
