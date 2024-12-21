-- ACTIVIDAD: CAPITULO_04.
-- MATERIA: SISTEMAS DE BASE DE DATOS II.
-- NOMBRE: CRISITAN OMAR ALVARADO RODRIGUEZ.
-- GRUPO: 5"B"

-- Sentencias SELECT que utilicen la función TO_CHAR para fechas.
SELECT NOMBRE || ' ' || APATERNO || ' ' || AMATERNO  AS EMPLEADO,
    TO_CHAR(FECHA_CONTRATACION, 'Day fmDD "de" Month "del" YYYY "a las" HH12:MI:SS AM')
    "FECHA CONTRATACION" 
FROM EMPLEADO_COAR;

SELECT NOMBRE || ' ' || APATERNO || ' ' || AMATERNO  AS EMPLEADO,
       TO_CHAR(ADD_MONTHS(FECHA_CONTRATACION, 6),
       'fmDay, DD "de" Month "del" YYYY') "FECHA REVISION (Mes 6)"
FROM EMPLEADO_COAR ORDER BY  FECHA_CONTRATACION;

-- Sentencias SELECT que utilicen la función TO_CHAR para Números.
SELECT NOMBRE || ' ' || APATERNO || ' ' || AMATERNO  AS EMPLEADO,
        TO_CHAR(SALARIO,'fm$9,999,999.00') AS SALARIO
FROM EMPLEADO_COAR; 

SELECT NOMBRE || ' ' || APATERNO || ' ' || AMATERNO  AS EMPLEADO,
        TO_CHAR(SALARIO,'L9G999G999D00') AS SALARIO
FROM EMPLEADO_COAR;

-- Sentencias SELECT que utilicen la función TO_DATE.
SELECT NOMBRE || ' ' || APATERNO || ' ' || AMATERNO  AS EMPLEADO,
       TO_DATE(FECHA_CONTRATACION,'DD-MM-YYYY') "FECHA CONTRATACION"
FROM EMPLEADO_COAR;

SELECT * FROM RESERVACION_COAR WHERE FECHA_INICIO < TO_DATE('10-Sep-2022','fxDD-Mon-YYYY');

-- Sentencias SELECT que utilicen la función TO_NUMBER.
SELECT * FROM RESERVACION_COAR WHERE SUBTOTAL > TO_NUMBER('$3,500.00','$9,999,999.00');

select 
    to_number('$6,000.000','L999,999.999'),
    to_char(to_number('$6,000.000','L999,999.999')*12,'L999,999.999') annual_salary 
from dual;  

SELECT NOMBRE || ' ' || APATERNO || ' ' || AMATERNO  AS EMPLEADO,
       SALARIO * 12 "SALARIO ANUAL"
FROM EMPLEADO_COAR WHERE (SALARIO*12) > TO_NUMBER('$3,000.00','L999,999.99')*12;       

-- Sentencias SELECT que utilicen funciones anidadas.
SELECT NOMBRE || ' ' || APATERNO || ' ' || AMATERNO  AS EMPLEADO,
       UPPER(CONCAT(SUBSTR(NOMBRE, 1, 3), CONCAT(SUBSTR(APATERNO, 1, 3), '@HOTEL.COM.MX')))
       "CORREO EMPRESARIAL"
FROM EMPLEADO_COAR;      

SELECT NOMBRE || ' ' || APATERNO || ' ' || AMATERNO  AS EMPLEADO,
       TO_CHAR(NEXT_DAY(ADD_MONTHS(FECHA_CONTRATACION, 6), 'LUNES'),
       'fmDay, DD "de" Month "del" YYYY') "FECHA REVISION (Mes 6)"
FROM EMPLEADO_COAR ORDER BY  FECHA_CONTRATACION;

-- Sentencias SELECT para cada una de las funciones GENERALES.
-- NVL:
SELECT NOMBRE, APATERNO, NVL(AMATERNO, 'Sin Apellido Materno')
FROM EMPLEADO_COAR;

-- NVL2:
SELECT NOMBRE, APATERNO, AMATERNO,
       NVL2(AMATERNO, 'Nombre Completo', 'Sin Apellido Materno')
FROM EMPLEADO_COAR;

-- NULLIF:
SELECT NOMBRE || ' ' || APATERNO || ' ' || AMATERNO  AS EMPLEADO,
       LENGTH(NOMBRE) "Longuitud Nombre",
       LENGTH(APATERNO) "Longuitud Apaterno",
       NULLIF(LENGTH(NOMBRE), LENGTH(APATERNO)) "Funcion NULLIF"
FROM EMPLEADO_COAR;        

-- Sentencias SELECT que utilicen la expresión CASE.
INSERT INTO C_COAR VALUES (CLI_COAR_ID_CLI_SEQ.NEXTVAL, 'DIAZ', 'GARZA',
            'PEDRO', 'M', 14, '4925676384', 'ZACATECAS, NUM 20');

INSERT INTO C_COAR VALUES (CLI_COAR_ID_CLI_SEQ.NEXTVAL, 'RODRIGUEZ', 'RIVERA',
            'ANA', 'F', 10, '4925676721', 'ZACATECAS, NUM 32');

INSERT INTO C_COAR VALUES (CLI_COAR_ID_CLI_SEQ.NEXTVAL, 'TORRES', 'OLVERA',
            'CARLOS', 'M', 75, '4925676776', 'ZACATECAS, NUM 02');

INSERT INTO C_COAR VALUES (CLI_COAR_ID_CLI_SEQ.NEXTVAL, 'VASQUEZ', 'RUIZ',
            'MARIA', 'F', 67, '4925676753', 'ZACATECAS, NUM 90'); 
COMMIT; 

SELECT NOMBRE || ' ' || APATERNO || ' ' || AMATERNO  AS CLIENTE, EDAD, 
  CASE WHEN EDAD >= 5 AND EDAD < 14 THEN 'NIÑO'
       WHEN EDAD >= 14 AND EDAD < 18 THEN 'ADOLECENTE'
       WHEN EDAD >= 18 AND EDAD < 36 THEN 'ADULTO JOVEN'
       WHEN EDAD >= 36 AND EDAD < 65 THEN 'ADULTO'
       ELSE 'TERCERA EDAD'
  END "TIPO DE CLIENTE"
FROM CLIENTE_COAR ORDER BY EDAD;

SELECT NOMBRE || ' ' || APATERNO || ' ' || AMATERNO  AS EMPLEADO, SALARIO,
  CASE WHEN SALARIO < 2500 THEN 'Salario Bajo'
       WHEN SALARIO >= 2500 AND SALARIO < 5000 THEN 'Salario Regular'
       WHEN SALARIO >= 5000 THEN 'Buen Salario'
       ELSE 'No Tiene Salario'
  END "TIPO SALARIO"
FROM EMPLEADO_COAR ORDER BY SALARIO;

-- Sentencias SELECT que utilicen la función DECODE.
SELECT FECHA_INICIO, FECHA_FIN, FECHA_FIN - FECHA_INICIO
FROM RESERVACION_COAR;

SELECT ID_CLIENTE, FECHA_INICIO, FECHA_FIN, FECHA_FIN - FECHA_INICIO "Dias de Hospedaje",
       DECODE(FECHA_FIN - FECHA_INICIO,
              0, 'Malo',
              1, 'Malo',
              2, 'Malo',
              3, 'Regular',
              4, 'Regular',
              5, 'Bueno',
              6, 'Bueno',
              'Muy Bueno') "Tipo de Hospedaje"
FROM RESERVACION_COAR ORDER BY 4 DESC;

SELECT NOMBRE || ' ' || APATERNO || ' ' || AMATERNO  AS EMPLEADO, SALARIO,
       DECODE(TRUNC(SALARIO/1000, 0),
              0, 0.00,
              1, 0.09,
              2, 0.20,
              3, 0.30,
              4, 0.40,
              5, 0.42,
              6, 0.44,
              0.45) "Impuesto Salarial"
FROM EMPLEADO_COAR ORDER BY 3 DESC;
