
CREATE EXTENSION pgcrypto;

CREATE OR REPLACE FUNCTION registrar (_nombre text,  _correo TEXT, _contrasena TEXT)    
    RETURNS json   
    LANGUAGE plpgsql  
    AS   
    $$  
    DECLARE    
    frasemd5 TEXT := (SELECT md5(random()::text));
    login text ;
    BEGIN    

    login := (select id FROM USUARIOS WHERE correo = _correo limit 1);
    IF (login is null) THEN
            INSERT INTO USUARIOS(nombre,correo,contrasena,md5)
            values(_nombre,_correo,PGP_SYM_ENCRYPT(_contrasena,frasemd5),frasemd5);
            RETURN'{"respuesta" : 8000}';
        END IF;
    

    RETURN '{"respuesta" : 7000}';


    END;   
    $$  
CREATE OR REPLACE FUNCTION cambiaContrasena (_correo text,_contrasena text,_nueva text)    
    RETURNS json   
    LANGUAGE plpgsql  
    AS   
    $$  
    DECLARE    
        frasemd5 TEXT := (SELECT md5(random()::text));
        login text ;
    BEGIN    
    login :=( select (select PGP_SYM_DECRYPT(contrasena::bytea, md5) FROM USUARIOS WHERE correo = _correo )like _contrasena);

    IF (login is null) THEN
            return '{"respuesta" : 6000}';
        END IF;
    IF login then
            update Usuarios set contrasena = PGP_SYM_ENCRYPT(_nueva,frasemd5), md5 = frasemd5 WHERE correo = _correo;
            return '{"respuesta" : "Actualizado"}';
        END if;

    RETURN '{"respuesta" : 5000}';
    END;   
    $$  ;


CREATE OR REPLACE FUNCTION actualizarUsuario (_correo text,_contrasena text,_nuevoCorreo text default '',_nuevoNombre text default '')    
    RETURNS json   
    LANGUAGE plpgsql  
    AS   
    $$  
    DECLARE    
        frasemd5 TEXT := (SELECT md5(random()::text));
        login text ;
    BEGIN    
    login :=( select (select PGP_SYM_DECRYPT(contrasena::bytea, md5) FROM USUARIOS WHERE correo = _correo )like _contrasena);

    IF (login is null) THEN
            return '{"respuesta" : 6000}';
        END IF;
    IF ( (_nuevoCorreo <> '' OR _nuevoCorreo <> '')) then
            IF (_nuevoCorreo = '') then
                _nuevoCorreo:= _correo;
            END if;
            IF (_nuevoNombre = '') then
                _nuevoNombre:= (select nombre from usuarios where correo = _correo);
            END if;
            update Usuarios set correo = _nuevoCorreo, nombre = _nuevoNombre WHERE correo = _correo;
            return '{"respuesta" :'||(SELECT getusuario(_nuevoCorreo))||'}';
        END if;

    RETURN '{"respuesta" : 5000}';
    END;   
    $$  ;


CREATE OR REPLACE FUNCTION Inicio_Secion(_correo text, _contrasena TEXT,isWEB int DEFAULT 0)    
    RETURNS json   
    LANGUAGE plpgsql  
    AS   
    $$  
    DECLARE    
    login text ;
    BEGIN    
        IF (isWEB = 1 ) THEN
            login :=( select (select PGP_SYM_DECRYPT(contrasena::bytea, md5) FROM USUARIOS WHERE correo = _correo AND ADMIN = TRUE )like _contrasena);
        ELSE
            login :=( select (select PGP_SYM_DECRYPT(contrasena::bytea, md5) FROM USUARIOS WHERE correo = _correo)like _contrasena);

        END IF;
        IF (login is null) THEN
                return '{"respuesta" : 6000}';
            END IF;
        IF login then
                return '{"respuesta" :'||(SELECT getusuario(_correo))||'}';
            END if;

        RETURN '{"respuesta" : 5000}';
    END;   
    $$  


CREATE OR REPLACE FUNCTION public.getusuario(_correo text)
    RETURNS json
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    AS $BODY$
    Declare
        Usuario text;
        
    BEGIN
    usuario:=(select json_build_object('id', c.id,'nombre', c.nombre,'Correo', c.correo) 
        from Usuarios c WHERE correo = _correo);
    usuario:=(select replace(usuario,'""','"'));
    usuario:=(select replace(usuario,'("{','{'));
    usuario:=(select replace(usuario,'}")','}'));
    usuario:=(select replace(usuario,'}},]}','}}]}'));
    
    RETURN Usuario;
    END; 
    $BODY$;




    