-- ACTIVIDAD: CAPITULO_07.
-- MATERIA: SISTEMAS DE BASE DE DATOS II.
-- NOMBRE: CRISITAN OMAR ALVARADO RODRIGUEZ.
-- GRUPO: 5"B".

-- Elaborar 3 sentencias de subconsultas con operadores de un sólo 
-- registro.
SELECT NOMBRE, APATERNO, AMATERNO, EDAD
FROM CLIENTE_COAR WHERE EDAD < (SELECT EDAD FROM CLIENTE_COAR 
                                WHERE ID_CLIENTE = 15);

SELECT NOMBRE, APATERNO, AMATERNO, SALARIO
FROM EMPLEADO_COAR WHERE SALARIO > (SELECT SALARIO FROM EMPLEADO_COAR 
                                WHERE ID_EMPLEADO = 30);

SELECT NOMBRE, APATERNO, AMATERNO, SALARIO
FROM EMPLEADO_COAR 
WHERE SALARIO = (SELECT MAX(SALARIO) FROM EMPLEADO_COAR);

-- Elaborar 3 sentencias de subconsultas con operadores de múltiples 
-- registros.
SELECT ID_EMPLEADO, NOMBRE, APATERNO, AMATERNO, SALARIO
FROM EMPLEADO_COAR WHERE SALARIO > ANY (SELECT SALARIO FROM EMPLEADO_COAR
                                        WHERE ID_JEFE = 30);
                                          
SELECT NOMBRE || ' ' || APATERNO || ' ' || AMATERNO EMPLEADO,
       SALARIO 
FROM EMPLEADO_COAR
WHERE SALARIO >= ALL (SELECT SALARIO FROM EMPLEADO_COAR);

SELECT ID_EMPLEADO, NOMBRE, APATERNO, AMATERNO EMPLEADO
FROM EMPLEADO_COAR
WHERE ID_EMPLEADO IN (SELECT ID_EMPLEADO FROM AGENCIA_EMPLEADO_COAR);

-- Elaborar 3 sentencias de subconsultas en la cláusula HAVING.
SELECT ID_JEFE, MIN(SALARIO)
FROM EMPLEADO_COAR GROUP BY ID_JEFE
HAVING MIN(SALARIO) > (SELECT MIN(SALARIO) FROM EMPLEADO_COAR 
                                WHERE ID_JEFE = 30);

SELECT ID_CATEGORIA_HOTEL, MAX(FECHA_CONSTRUCCION)
FROM HOTEL_COAR GROUP BY ID_CATEGORIA_HOTEL
HAVING MAX(FECHA_CONSTRUCCION) = (SELECT MAX(FECHA_CONSTRUCCION)
                                 FROM HOTEL_COAR);

-- Elaborar 3 sentencias de subconsultas con el operador EXISTS
SELECT * FROM AGENCIA_COAR A
WHERE EXISTS (SELECT * FROM AGENCIA_EMPLEADO_COAR AE
            WHERE A.ID_AGENCIA = AE.ID_AGENCIA);

SELECT ID_HOTEL, NOMBRE, TELEFONO, DOMICILIO
FROM HOTEL_COAR H WHERE NOT EXISTS (SELECT * FROM RESERVACION_COAR R
                             WHERE H.ID_HOTEL = R.ID_HOTEL);

SELECT ID_CLIENTE, NOMBRE || ' ' || APATERNO || ' ' || AMATERNO CLIENTE
FROM CLIENTE_COAR C WHERE EXISTS (SELECT * FROM RESERVACION_COAR R
                             WHERE C.ID_CLIENTE = R.ID_CLIENTE);
                             