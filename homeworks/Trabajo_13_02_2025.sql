--Nombre: José Emanuel Figueroa
--Fecha: 13 de Febrero del 2025

--Cambiar el nombre de la tabla.
RENAME eventos TO fiestas;

--Borra el contenido de la tabla
TRUNCATE TABLE fiestas;

--Documentar las columnas de la tabla 
COMMENT ON COLUMN fiestas.id
IS 'Identificaci�n de la actividad';

DESCRIBE regions;

INSERT INTO regions (id,name)
VALUES (10,'Africa');

INSERT INTO regions (id,name)
VALUES (11,'Asia');

SELECT* 
FROM regions;

SELECT name
FROM regions;

--Modifica el objeto
ALTER TABLE regions
ADD poblacion NUMBER(20);

--Inserto un nulo implicitmanete en la columna poblacion.
INSERT INTO regions (id,name)
VALUES (12,'America');

--Inserto un nulo explicitamente 
INSERT INTO regions (id,name,poblacion)
VALUES(13,'Oceania',null);

--Modifica mi tabla
COMMIT;
UPDATE regions
SET poblacion=4000000;

SELECT *
FROM regions;

--Se devuelve a la ultima vez que se guardo.
ROLLBACK;
SELECT *
FROM regions;

--Modifica unicamente en 
UPDATE regions
SET poblacion=4000000
WHERE id=10;

UPDATE regions
SET poblacion=44408052
WHERE id=11;


SELECT *
FROM regions;

--Punto de salvamento 
SAVEPOINT juan;

DELETE regions;

SELECT *
FROM regions;

--Se devuelve al punto de salvamento con nombre juan.
ROLLBACK TO juan;

--Eliminar segun id y no la tabla
DELETE regions
WHERE id=12 
OR id=13;

INSERT INTO regions (id, name, poblacion)
VALUES (&codigo,'&nombre', &poblacion);

UPDATE regions
SET name='Australia', poblacion=300000
WHERE id=10;

SELECT * 
FROM user_objects;