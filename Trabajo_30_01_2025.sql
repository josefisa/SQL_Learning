-- TRABAJO EN CLASE 30/01/2025 :)
-- NOMBRE: José Emanuel Figueroa

--Instrucci�n DDL para borrar la tabla.
DROP TABLE regions CASCADE CONSTRAINTS;

--Instrucci�n DDL para convertir la entidad en tabla.
CREATE TABLE regions
(id NUMBER(5),
name VARCHAR2 (50));

--Instrucci�n DDL para crear el constraint de Llave Primaria.
ALTER TABLE regions
 ADD CONSTRAINT reg_id_pk PRIMARY KEY (id);

--Instrucci�n DDL para crear el constraint de Llave �nica.
ALTER TABLE regions
 ADD CONSTRAINT reg_nam_uk UNIQUE (name);
 
 --Instrucci�n DDL para crear el constraint de NOT NULL.
 ALTER TABLE regions
 MODIFY name VARCHAR2(50) CONSTRAINT reg_nam_nn NOT NULL;

--Instrucci�n DDL para crear la tabla Departaments.
CREATE TABLE departments
(id NUMBER(5),
 name VARCHAR2(50),
 region_id NUMBER(5)
 );
 
--Instrucci�n DDL para crear el constraint de Llave Primaria.
ALTER TABLE deparments
 ADD CONSTRAINT dep_id_pk PRIMARY KEY (id);
 
--Instrucci�n DDL para crear el constraint de Llave de Not Null.
ALTER TABLE departments
 MODIFY name VARCHAR2(50) CONSTRAINT dep_name_nn NOT NULL;
 
--Instrucci�n DDL para crear el constraint de Llave de Llave Foranea. 
ALTER TABLE departments
 ADD CONSTRAINT dep_region_id_fk FOREIGN KEY(region_id)
     REFERENCES regions(id);
     
-- Consulta al Diccionario de Datos (Ver las tablas creadas)   
SELECT *
FROM user_tables;

--Consulta de las restricciones de las tablas.
SELECT *
FROM user_constraints;

-- Consulta de los indices en el diccionario de datos
SELECT *
FROM user_indexes;

--Sinonimo para la tabla departments
CREATE SYNONYM jasmin FOR departments;

--Consulta de sinonimos en el diccionario de datos
SELECT *
FROM user_synonyms;
