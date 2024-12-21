-- ACTIVIDAD: CAPITULO_01
-- MATERIA: SISTEMAS DE BASE DE DATOS II.
-- NOMBRE: CRISITAN OMAR ALVARADO RODRIGUEZ.
-- GRUPO: 5"B".

-- 1) EXPRESIONES:
SELECT SALARIO * 12 "SALARIO ANUAL" FROM EMPLEADO_COAR;
SELECT SALARIO / 30.4 "SALARIO DIARIO" FROM EMPLEADO_COAR;
SELECT SALARIO + 200 "SALARIO MENSUAL MAS 200" FROM EMPLEADO_COAR;

-- 2) CONCATENACION:
SELECT NOMBRE || ' ' || APATERNO || ' ' || AMATERNO AS "EMPLEADO", 
       SALARIO * 12 "SALARIO ANUAL" 
FROM EMPLEADO_COAR;

SELECT NOMBRE || ' ' || APATERNO || ' ' || AMATERNO AS "NOMBRE DE LOS CLIENTES", 
       TELEFONO FROM CLIENTE_COAR;

SELECT NOMBRE || ' ' || APATERNO || ' ' || AMATERNO AS "EMPLEADO", 
       TELEFONO || '-' || CORREO AS "DATOS DE CONTACTO" 
FROM EMPLEADO_COAR;

-- 3) CONCATENACION CON VALOR LITERAL:
SELECT 'El empleado '  || NOMBRE || ' ' || APATERNO || ' ' || AMATERNO ||
       ' tiene un salario de ' || SALARIO AS "DETALLES SALARIO DEL EMPLEADO"
FROM EMPLEADO_COAR;

SELECT 'El cliente ' || NOMBRE || ' ' || APATERNO || ' ' || AMATERNO ||
       ' tiene una edad de ' || EDAD AS "EDADES DE LOS CLIENTES"
FROM CLIENTE_COAR;

SELECT 'EL hotel ' || NOMBRE || ' esta ubicado en ' || DOMICILIO
        AS "DETALLES HOTEL" FROM HOTEL_COAR;

-- 4) OPERADOR Q:
SELECT q'[El empleado ]' || ID_EMPLEADO || q'[ comenzo a trabajar el ]' ||
       FECHA_ASIGNACION || q'[ en la agencia ]' || ID_AGENCIA 
       AS "DETALLES EMPLEADO"
FROM AGENCIA_EMPLEADO_COAR;

SELECT q'[El empleado ]' || NOMBRE || q'[ ]' || APATERNO || q'[ ]' || AMATERNO ||
       q'[ percibe un salario de ]' || SALARIO
       AS "DETALLES SALARIO DEL EMPLEADO"
FROM EMPLEADO_COAR; 

SELECT q'[El cliente ]' || NOMBRE || q'[ ]' || APATERNO || q'[ ]' || AMATERNO ||
       q'[ tiene una edad de ]' || EDAD || q'[ años y su telefono es ]' || TELEFONO
       AS "DETALLES DE LOS CLIENTES"
FROM CLIENTE_COAR; 

-- 5) ALIAS (PARA CADA TIPO):
SELECT NOMBRE || ' ' || APATERNO || ' ' || AMATERNO AS EMPLEADO
FROM EMPLEADO_COAR;

SELECT NOMBRE || ' ' || APATERNO || ' ' || AMATERNO AS "NOMBRE DE LOS CLIENTES"
FROM CLIENTE_COAR; 

SELECT NOMBRE || ' ' || APATERNO || ' ' || AMATERNO empleado
FROM EMPLEADO_COAR;

-- 6) DISTINCT:
SELECT DISTINCT ID_CATEGORIA_HOTEL
FROM HOTEL_COAR;

SELECT DISTINCT ID_AGENCIA
FROM AGENCIA_EMPLEADO_COAR;

SELECT DISTINCT ID_HOTEL
FROM RESERVACION_COAR;