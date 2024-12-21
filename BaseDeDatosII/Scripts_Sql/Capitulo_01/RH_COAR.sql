-- ACTIVIDAD: CAPITULO_01
-- MATERIA: SISTEMAS DE BASE DE DATOS II.
-- NOMBRE: CRISITAN OMAR ALVARADO RODRIGUEZ.
-- GRUPO: 5"B".

-- 1. Explique las capacidades de la sentencia SELECT.
-- Seleccion: Es la capacidad de identificar los registros de nuestra consulta.
-- Proyeccion: Es la capacidad de poder espesificar que columnas se van a mostrar
-- en el resultado de la consulta.
-- Union: Capacidad de mostrar los datos de mas de una tabla a la vez.

-- 2. ¿Cual es la sintaxis basica de la sentencia SELECT?
--  SELECT *|{[DISTINCT] column|expression [alias],...} FROM Nombre_Tabla;

-- 3. Escriba una sentencia SELECT que calcule el salario diario de un empleado.
SELECT ID_EMPLEADO,
       APELLIDO_EMPLEADO,
       NOMBRE_EMPLEADO,
       SALARIO/30.4 "SALARIO DIARIO"
FROM EMPLEADO_COAR WHERE ID_EMPLEADO = 100;

-- 4. Escriba una sentencia SELECT para incrementar el salario diario de 
-- un empleado 5 pesos.
SELECT ID_EMPLEADO,
       APELLIDO_EMPLEADO,
       NOMBRE_EMPLEADO,
       (SALARIO/30.4) + 5 "SALARIO DIARIO MAS 5 PESOS"
FROM EMPLEADO_COAR WHERE ID_EMPLEADO = 100;

-- 5. Tomando en consideración que la comisión de un empleado es parte 
-- de su salario, escriba una sentencia que calcule su salario quincenal 
-- total (incluya su porcentaje de comisión).
SELECT ID_EMPLEADO,
       APELLIDO_EMPLEADO,
       NOMBRE_EMPLEADO,
       COMICION_PCT "PORCENTAJE DE COMICION",
       (SALARIO/2) + (SALARIO*COMICION_PCT) "SALARIO QUINCENAL"
FROM EMPLEADO_COAR WHERE ID_EMPLEADO = 152;

-- 6. ¿Cuales son las 3 formas de representar un alias a una columna?, 
-- explicar las diferencias.
-- 1) Sin usar comillas dobles solo  poniendo el nombre del alias 
-- despues de la columna eje: Columna_1 AS Alias, por defecto el encabezado
-- se muestra en mayusculas.
-- 2) Igula que el punto uno solo que sin usar la palbra reservada AS.
-- 3) Usando comillas dobles, esto se usa para si el alias contiene espacios 
-- en blanco, o caracteres especiales, o si distingue entre mayúsculas y minúsculas.


-- 7. Escriba una sentencia SELECT que imprima su resultado en el 
-- siguiente formato:
-- Juan Pérez tiene un salario de 3000, trabaja en el departamento 30 y su 
-- puesto es SA_REP.
SELECT NOMBRE_EMPLEADO || ' ' || APELLIDO_EMPLEADO || 
       ' tiene un salario de ' || SALARIO || 
       ', trabaja en el departamento ' || ID_DEPARTAMENTO ||
       ' y su puesto es ' || ID_TRABAJO AS "DETALLES DEL EMPLEADO"
FROM EMPLEADO_COAR WHERE ID_EMPLEADO = 100;  


-- 8. Escriba una sentencia SELECT que utilice el operador Q para que 
-- imprima su resultado en el siguiente formato:
-- El departamento de VENTAS está ubicado en la localidad 2300 y su 
-- jefe tiene el identificador 130.
SELECT q'[El departamento de ]' || DEPARTAMENTO_NOMBRE || 
       q'[ esta ubicado en la localidad ]' || ID_UBICACION ||
       q'[ y su jefe tiene el identificador ]' || ID_JEFE 
       AS "DETALLES DEL DEPARTAMENTO"
FROM DEPARTAMENTO_COAR WHERE ID_DEPARTAMENTO = 20;

-- 9. Escriba una sentencia SELECT que imprima de forma única los 
-- identificadores de los puestos que están asignados a los empleados.
SELECT DISTINCT ID_TRABAJO
FROM EMPLEADO_COAR;

-- 10. Describa la estructura de las 7 tablas de la base de datos RH.
DESC EMPLEADO_COAR;
DESC DEPARTAMENTO_COAR;
DESC PAIS_COAR;
DESC REGION_COAR;
DESC TRABAJO_COAR;
DESC UBICACION_COAR;
DESC HISTORIAL_TAB_COAR;
