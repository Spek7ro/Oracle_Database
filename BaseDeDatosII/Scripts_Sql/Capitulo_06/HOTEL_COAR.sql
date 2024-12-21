-- ACTIVIDAD: CAPITULO_06.
-- MATERIA: SISTEMAS DE BASE DE DATOS II.
-- NOMBRE: CRISITAN OMAR ALVARADO RODRIGUEZ.
-- GRUPO: 5"B".

-- NATURAL JOIN:
SELECT E.NOMBRE || ' ' || E.APATERNO || ' ' || E.AMATERNO EMPLEADO,
       A.ID_AGENCIA
FROM AGENCIA_EMPLEADO_COAR A NATURAL JOIN EMPLEADO_COAR E;      

SELECT * FROM AGENCIA_EMPLEADO_COAR NATURAL JOIN AGENCIA_COAR;

SELECT ID_HOTEL,
       H.NOMBRE "NOMBRE HOTEL",
       ID_HABITACION,
       CANTIDAD
FROM HOTEL_COAR H NATURAL JOIN HOTEL_HABITACION_COAR HH;

-- JOIN USING:
SELECT ID_CLIENTE,
       C.NOMBRE || ' ' || C.APATERNO || ' ' || C.AMATERNO CLIENTE,
       R.ID_HOTEL,
       R.FOLIO_RESERVACION,
       R.FECHA_INICIO,
       R.FECHA_FIN,
       R.SUBTOTAL
FROM CLIENTE_COAR C JOIN RESERVACION_COAR R USING(ID_CLIENTE);

SELECT ID_EMPLEADO,
       E.NOMBRE || ' ' || E.APATERNO || ' ' || E.AMATERNO EMPLEADO,
       A.ID_AGENCIA,
       A.FECHA_ASIGNACION
FROM AGENCIA_EMPLEADO_COAR A JOIN EMPLEADO_COAR E USING(ID_EMPLEADO);

SELECT * FROM AGENCIA_EMPLEADO_COAR JOIN AGENCIA_COAR
USING(ID_EMPLEADO);

-- JOIN ON:
SELECT A.ID_AGENCIA,
       A.NOMBRE "NOMBRE AGENCIA",
       E.ID_EMPLEADO,
       E.NOMBRE || ' ' || E.APATERNO || ' ' || E.AMATERNO EMPLEADO,
       E.FECHA_CONTRATACION,
       E.SALARIO
FROM EMPLEADO_COAR E JOIN AGENCIA_EMPLEADO_COAR AE
ON E.ID_EMPLEADO = AE.ID_EMPLEADO JOIN AGENCIA_COAR A
ON A.ID_AGENCIA = AE.ID_AGENCIA;

SELECT C.ID_CLIENTE,
       C.NOMBRE || ' ' || C.APATERNO || ' ' || C.AMATERNO CLIENTE,
       R.ID_HOTEL,
       H.NOMBRE "NOMBRE HOTEL",
       R.FOLIO_RESERVACION,
       R.FECHA_INICIO,
       R.FECHA_FIN,
       R.SUBTOTAL
FROM CLIENTE_COAR C JOIN RESERVACION_COAR R 
ON C.ID_CLIENTE = R.ID_CLIENTE JOIN HOTEL_COAR H 
ON H.ID_HOTEL = R.ID_HOTEL;

SELECT H.ID_HOTEL,
       H.NOMBRE "NOMBRE HOTEL",
       H.TELEFONO,
       H.DOMICILIO,
       C.DESCRIPCION AS CATEGORIA,
       C.IVA
FROM HOTEL_COAR H JOIN CATEGORIA_HOTEL_COAR C
ON H.ID_CATEGORIA_HOTEL = C.ID_CATEGORIA_HOTEL;

-- SELF-JOIN:
ALTER TABLE EMPLEADO_COAR ADD ID_JEFE NUMBER(6) 
DEFAULT NULL;

SELECT * FROM EMPLEADO_COAR;

ALTER TABLE EMPLEADO_COAR ADD 
CONSTRAINT JEFE_EMP_COAR_FK FOREIGN KEY 
(ID_JEFE) REFERENCES EMPLEADO_COAR (ID_EMPLEADO);

UPDATE EMPLEADO_COAR SET ID_JEFE = 30 WHERE ID_EMPLEADO = 40;
UPDATE EMPLEADO_COAR SET ID_JEFE = 30 WHERE ID_EMPLEADO = 50;
UPDATE EMPLEADO_COAR SET ID_JEFE = 30 WHERE ID_EMPLEADO = 60;
UPDATE EMPLEADO_COAR SET ID_JEFE = 30 WHERE ID_EMPLEADO = 70;

SELECT E.NOMBRE || ' ' || E.APATERNO || ' ' || E.AMATERNO EMPLEADO,
       J.NOMBRE || ' ' || J.APATERNO || ' ' || J.AMATERNO JEFE
FROM EMPLEADO_COAR E JOIN EMPLEADO_COAR J
ON (E.ID_JEFE = J.ID_EMPLEADO);

COMMIT;

-- NONEQUIJOIN:
CREATE TABLE TIPO_CLIENTE_COAR (
    TIPO VARCHAR2(25) CONSTRAINT TIPO_CLI_COAR_PK PRIMARY KEY,
    EDAD_INICIO NUMBER(5) CONSTRAINT TC_EDAD_INI_NN NOT NULL,
    EDAD_FIN NUMBER(5) CONSTRAINT TC_EDAD_FIN_NN NOT NULL
);

SELECT * FROM TIPO_CLIENTE_COAR;

INSERT INTO TIPO_CLIENTE_COAR VALUES ('BEBE', 0, 4);
INSERT INTO TIPO_CLIENTE_COAR VALUES ('NIÑO', 5, 13);
INSERT INTO TIPO_CLIENTE_COAR VALUES ('ADOLECENTE', 14, 17);
INSERT INTO TIPO_CLIENTE_COAR VALUES ('ADULTO JOVEN', 18, 35);
INSERT INTO TIPO_CLIENTE_COAR VALUES ('ADULTO', 36, 64);
INSERT INTO TIPO_CLIENTE_COAR VALUES ('TERCERA EDAD', 65, 100);

COMMIT;

SELECT C.ID_CLIENTE,
       C.NOMBRE || ' ' || C.APATERNO || ' ' || C.AMATERNO CLIENTE,
       C.EDAD,
       T.TIPO "TIPO CLIENTE"
FROM CLIENTE_COAR C JOIN TIPO_CLIENTE_COAR T 
ON C.EDAD BETWEEN T.EDAD_INICIO AND T.EDAD_FIN;

CREATE TABLE NIVEL_SALARIO_COAR (
    NIVEL_SALARIO CHAR(1) CONSTRAINT NIVEL_SAL_COAR_PK PRIMARY KEY,
    SAL_BAJO NUMBER(8,2) CONSTRAINT NVL_SAL_BAJ_SAL_NN NOT NULL,
    SAL_ALTO NUMBER(8,2) CONSTRAINT NVL_SAL_ALT_SAL_NN NOT NULL
);

SELECT * FROM NIVEL_SALARIO_COAR;

INSERT INTO NIVEL_SALARIO_COAR VALUES ('A', 1000, 2999);
INSERT INTO NIVEL_SALARIO_COAR VALUES ('B', 3000, 5999);
INSERT INTO NIVEL_SALARIO_COAR VALUES ('C', 6000, 9999);
INSERT INTO NIVEL_SALARIO_COAR VALUES ('D', 10000, 14999);
INSERT INTO NIVEL_SALARIO_COAR VALUES ('E', 15000, 24999);
INSERT INTO NIVEL_SALARIO_COAR VALUES ('F', 25000, 40000);

COMMIT;

SELECT E.ID_EMPLEADO,
       E.NOMBRE || ' ' || E.APATERNO || ' ' || E.AMATERNO EMPLEADO,
       E.SALARIO,
       N.NIVEL_SALARIO
FROM EMPLEADO_COAR E JOIN NIVEL_SALARIO_COAR N 
ON E.SALARIO BETWEEN N.SAL_BAJO AND N.SAL_ALTO;

-- LEFT OUTER JOIN:
SELECT A.ID_AGENCIA,
       A.NOMBRE "NOMBRE AGENCIA",
       E.ID_EMPLEADO,
       E.NOMBRE || ' ' || E.APATERNO || ' ' || E.AMATERNO EMPLEADO,
       E.FECHA_CONTRATACION,
       E.SALARIO
FROM EMPLEADO_COAR E LEFT OUTER JOIN AGENCIA_EMPLEADO_COAR AE
ON E.ID_EMPLEADO = AE.ID_EMPLEADO LEFT OUTER JOIN AGENCIA_COAR A
ON A.ID_AGENCIA = AE.ID_AGENCIA; 

SELECT C.ID_CLIENTE,
       C.NOMBRE || ' ' || C.APATERNO || ' ' || C.AMATERNO CLIENTE,
       R.ID_HOTEL,
       H.NOMBRE "NOMBRE HOTEL",
       R.FOLIO_RESERVACION,
       R.FECHA_INICIO,
       R.FECHA_FIN,
       R.SUBTOTAL
FROM CLIENTE_COAR C LEFT OUTER JOIN RESERVACION_COAR R 
ON C.ID_CLIENTE = R.ID_CLIENTE LEFT OUTER JOIN HOTEL_COAR H 
ON H.ID_HOTEL = R.ID_HOTEL;

SELECT H.ID_HOTEL,
       H.NOMBRE "NOMBRE HOTEL",
       H.TELEFONO,
       H.DOMICILIO,
       C.DESCRIPCION AS CATEGORIA,
       C.IVA
FROM HOTEL_COAR H LEFT OUTER JOIN CATEGORIA_HOTEL_COAR C
ON H.ID_CATEGORIA_HOTEL = C.ID_CATEGORIA_HOTEL;

-- RIGHT OUTER JOIN:
SELECT A.ID_AGENCIA,
       A.NOMBRE "NOMBRE AGENCIA",
       A.TELEFONO,
       A.DOMICILIO
FROM AGENCIA_COAR A RIGHT OUTER JOIN AGENCIA_EMPLEADO_COAR AE
ON A.ID_AGENCIA = AE.ID_AGENCIA;

SELECT C.ID_CLIENTE,
       C.NOMBRE || ' ' || C.APATERNO || ' ' || C.AMATERNO CLIENTE,
       R.ID_HOTEL,
       H.NOMBRE "NOMBRE HOTEL",
       R.FOLIO_RESERVACION,
       R.FECHA_INICIO,
       R.FECHA_FIN,
       R.SUBTOTAL
FROM CLIENTE_COAR C RIGHT OUTER JOIN RESERVACION_COAR R 
ON C.ID_CLIENTE = R.ID_CLIENTE RIGHT OUTER JOIN HOTEL_COAR H 
ON H.ID_HOTEL = R.ID_HOTEL;

SELECT H.ID_HABITACION,
       H.NOMBRE "NOMBRE HABITACION",
       T.ID_TIPO_HABITACION,
       T.DESCRIPCION "TIPO HABITACION"
FROM HABITACION_COAR H RIGHT OUTER JOIN TIPO_HABITACION_COAR T
ON H.ID_TIPO_HABITACION = T.ID_TIPO_HABITACION;

-- FULL OUTER JOIN:
SELECT A.ID_AGENCIA,
       A.NOMBRE "NOMBRE AGENCIA",
       E.ID_EMPLEADO,
       E.NOMBRE || ' ' || E.APATERNO || ' ' || E.AMATERNO EMPLEADO,
       E.FECHA_CONTRATACION,
       E.SALARIO
FROM EMPLEADO_COAR E FULL OUTER JOIN AGENCIA_EMPLEADO_COAR AE
ON E.ID_EMPLEADO = AE.ID_EMPLEADO FULL OUTER JOIN AGENCIA_COAR A
ON A.ID_AGENCIA = AE.ID_AGENCIA;

SELECT C.ID_CLIENTE,
       C.NOMBRE || ' ' || C.APATERNO || ' ' || C.AMATERNO CLIENTE,
       R.ID_HOTEL,
       H.NOMBRE "NOMBRE HOTEL",
       R.FOLIO_RESERVACION,
       R.FECHA_INICIO,
       R.FECHA_FIN,
       R.SUBTOTAL
FROM CLIENTE_COAR C FULL OUTER JOIN RESERVACION_COAR R 
ON C.ID_CLIENTE = R.ID_CLIENTE FULL OUTER JOIN HOTEL_COAR H 
ON H.ID_HOTEL = R.ID_HOTEL;

SELECT H.ID_HABITACION,
       H.NOMBRE "NOMBRE HABITACION",
       T.ID_TIPO_HABITACION,
       T.DESCRIPCION "TIPO HABITACION"
FROM HABITACION_COAR H FULL OUTER JOIN TIPO_HABITACION_COAR T
ON H.ID_TIPO_HABITACION = T.ID_TIPO_HABITACION;

-- CROSS JOIN:
SELECT * FROM AGENCIA_EMPLEADO_COAR CROSS JOIN AGENCIA_COAR;

SELECT E.ID_EMPLEADO,
       E.NOMBRE || ' ' || E.APATERNO || ' ' || E.AMATERNO EMPLEADO,
       AE.ID_AGENCIA
FROM EMPLEADO_COAR E CROSS JOIN AGENCIA_EMPLEADO_COAR AE;

SELECT E1.NOMBRE || ' ' || E1.APATERNO || ' ' || E1.AMATERNO EMPLEADO_01,
       E1.SALARIO "SALARIO EMPLEADO_01",
       E2.NOMBRE || ' ' || E2.APATERNO || ' ' || E2.AMATERNO EMPLEADO_02,
       E2.SALARIO "SALARIO EMPLEADO_02"
FROM EMPLEADO_COAR E1 CROSS JOIN EMPLEADO_COAR E2
WHERE E2.NOMBRE = 'CRISTIAN' AND E2.APATERNO = 'ALVARADO'
AND E2.AMATERNO = 'RODRIGUEZ' AND E1.SALARIO > E2.SALARIO; 
