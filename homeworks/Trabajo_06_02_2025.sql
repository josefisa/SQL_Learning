-- TRABAJO EN CLASE 06/02/2025 :)
-- NOMBRE: José Emanuel Figueroa

--Instrucci�n DDL para borrar la tabla
DROP TABLE employees CASCADE CONSTRAINTS; 
DROP TABLE eventos CASCADE CONSTRAINTS; 
--Instrucci�n DDL para convertir la entidad en tabla.
CREATE TABLE employees
(id NUMBER(4),
last_name VARCHAR2(50),
first_name VARCHAR2(50),
user_id VARCHAR2(12),
start_date DATE,
comments VARCHAR2(400),
title VARCHAR2(100),
salary NUMBER(10,2),
commission_percent NUMBER(5,2),
department_id NUMBER(5),
manager_id NUMBER(4)
);

--Instrucci�n DDL para crear el constraint de Llave Primaria. 
ALTER TABLE employees 
ADD CONSTRAINT  emp_id_pk PRIMARY KEY(id);

--Instrucci�n DDL para crear el constraint de Llave �nica. 
ALTER TABLE employees
ADD CONSTRAINT  emp_user_uk UNIQUE (user_id);

--Instrucci�n DDL para crear el constraint de Llave Not Null. 
ALTER TABLE employees 
MODIFY user_id CONSTRAINT emp_user_nn NOT NULL;

--Instrucci�n DDL para crear el constraint de Llave Foranea. 
ALTER TABLE employees
ADD CONSTRAINT emp_dep_fk FOREIGN KEY(department_id)
     REFERENCES departments(id);

--Instrucci�n DDL para crear el constraint de Llave Foranea.      
ALTER TABLE employees
 ADD CONSTRAINT emp_man_fk FOREIGN KEY (manager_id)
    REFERENCES employees(id);
    
ALTER TABLE employees
MODIFY last_name CONSTRAINT emp_last_nn NOT NULL;


-- NUEVOS TIPOS DE DATOS

CREATE TABLE eventos(
id NUMBER(3),
fecha TIMESTAMP,
duracion_anos INTERVAL YEAR TO MONTH,
duracion_dias INTERVAL DAY TO SECOND
);

--DML

INSERT INTO eventos(fecha,duracion_anos,duracion_dias)
VALUES(TIMESTAMP '2024-02-06 14:30:00',
 INTERVAL '2-6' YEAR TO MONTH,
 INTERVAL '10 4:15:00' DAY TO SECOND
 );
    
SELECT *
FROM eventos;

SELECT sysdate + duracion_dias
FROM eventos;

ALTER TABLE eventos 
MODIFY fecha DEFAULT systimestamp;

INSERT INTO eventos(duracion_anos,duracion_dias)
VALUES(INTERVAL '2-6' YEAR TO MONTH,
 INTERVAL '10 4:15:00' DAY TO SECOND
 );
    
SELECT *
FROM eventos;

SELECT *
FROM lpalacios.eventos;
    