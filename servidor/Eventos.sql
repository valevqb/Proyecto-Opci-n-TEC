
CREATE OR REPLACE FUNCTION AgregarEvento (_nombre text, _inicio text, _fin text, _descripcion TEXT,_todoeldia BOOLEAN)    
    RETURNS json   
    LANGUAGE plpgsql  
    AS   
    $$  
    DECLARE    
    BEGIN  
    INSERT INTO eventos (nombre,descripcion,fechainicio,fechafin,estododia)
            values(_nombre,_descripcion,cast(_inicio as DATE),cast(_fin as DATE),_todoeldia);
            RETURN'{"respuesta" : 8000}';
    EXCEPTION
        WHEN check_violation THEN
        RETURN '{"respuesta" : 7000}';
    END;
    $$  

CREATE OR REPLACE FUNCTION ModificarEvento (identificador integer,_nombre text, _inicio text, _fin text, _descripcion TEXT,_todoeldia BOOLEAN)    
    RETURNS json   
    LANGUAGE plpgsql  
    AS   
    $$  
    DECLARE    
    nombreOrg text =(select nombre FROM eventos WHERE id = identificador);
    descripcionOrg text=(select descripcion FROM eventos WHERE id = identificador);
    fechainicioOrg text=(select fechainicio FROM eventos WHERE id = identificador);
    fechafinOrg text=(select fechafin FROM eventos WHERE id = identificador);
    estododiaOrg BOOLEAN=(select estododia FROM eventos WHERE id = identificador);
    BEGIN  
    IF (_nombre=nombreOrg AND descripcionOrg=_descripcion AND fechainicioOrg =_inicio AND fechafinOrg = _fin AND estododiaOrg=_todoeldia) THEN 
        RETURN'{"respuesta" : 7000}';
    ELSE
        update eventos set 
        nombre= _nombre,
        descripcion= _descripcion,
        fechainicio= cast(_inicio as DATE),
        fechafin= cast(_fin as DATE),
        estododia=_todoeldia
        WHERE identificador = id;
            RETURN'{"respuesta" : 8000}';
    END IF;

    EXCEPTION
        WHEN check_violation THEN
        RETURN '{"respuesta" : 7000}';
    END;

    $$  

CREATE OR REPLACE FUNCTION EliminarEvento (identificador int)    
    RETURNS json   
    LANGUAGE plpgsql  
    AS   
    $$  
    DECLARE    
    BEGIN  
    DELETE FROM eventos 
    WHERE eventos.id = identificador;

            RETURN'{"respuesta" : 8000}';
    EXCEPTION
        WHEN check_violation THEN
        RETURN '{"respuesta" : 7000}';
    END;
    

    $$  
