-- ACTIVIDAD: CAPITULO_08.
-- MATERIA: SISTEMAS DE BASE DE DATOS II.
-- NOMBRE: CRISITAN OMAR ALVARADO RODRIGUEZ.
-- GRUPO: 5"B".

-- 1. Explique en qué consiste cada uno de los operadores de conjunto.
-- * UNION: permite agregar el resultado de un SELECT a otro SELECT y para esto 
-- ambas instrucciones tienen que utilizar el mismo número y tipo de columnas.
-- * UNION ALL: El funcionamiento y uso es igual que al UNION pero el UNION ALL 
-- no elimina los datos repetidos.
-- * INTERSECT: permite unir dos consultas SELECT de tal modo que el resultado sean 
-- las filas que esten presentes en ambas consultas (se muestran los registros que son
-- iguales en ambos conjuntos, se eliminan los duplicados y se ordenan automaticamante).
-- * MINUS: se combinan dos consultas SELECT de forma que apareceran los registros del 
-- primer SELECT que no estén presentes en el segundo (se muestran los registros que son
-- iguales en ambos conjuntos, se eliminan los duplicados y se ordenan automaticamante).

-- 2. Mencione los lineamientos que se deben de seguir para el uso de los operadores de
-- conjunto.
-- 1) Las expresiones en las listas SELECT deben coincidir en número.
-- 2) El tipo de datos de cada columna en la segunda consulta debe coincidir con 
-- el tipo de datos de su columna correspondiente en la primera consulta.
-- 3) Los paréntesis se pueden utilizar para alterar la secuencia de ejecución.
-- 4) La cláusula ORDER BY solo puede aparecer al final de la instrucción.
-- 5) Las filas duplicadas se eliminan automáticamente excepto en UNION ALL.
-- 6) Los nombres de columna de la primera consulta aparecen en el resultado.
-- 7) La salida se ordena en orden ascendente de forma predeterminada, excepto en UNION ALL.

-- 3. Elabore una sentencia SELECT que muestre el siguiente resultado:
SELECT ID_EMPLEADO, ID_TRABAJO, ID_DEPARTAMENTO FROM EMPLEADO_COAR 
UNION ALL 
SELECT ID_EMPLEADO, ID_TRABAJO, ID_DEPARTAMENTO FROM HISTORIAL_TAB_COAR
ORDER BY ID_EMPLEADO;

-- 4. Elabore una sentencia SELECT que muestre el siguiente resultado:
SELECT ID_EMPLEADO, ID_TRABAJO, ID_DEPARTAMENTO FROM EMPLEADO_COAR 
INTERSECT 
SELECT ID_EMPLEADO, ID_TRABAJO, ID_DEPARTAMENTO FROM HISTORIAL_TAB_COAR 
ORDER BY ID_EMPLEADO;

-- 5. Elabore una sentencia SELECT que muestre el siguiente resultado:
SELECT ID_UBICACION,  DEPARTAMENTO_NOMBRE "Departamento",
       TO_CHAR(NULL) "Ubicacion del almacen" FROM DEPARTAMENTO_COAR
UNION
SELECT ID_UBICACION, TO_CHAR(NULL) "Deparatamento",
       PROVINCIA_ESTADO FROM UBICACION_COAR;

-- 6. Elabore una sentencia SELECT que muestre el Id del empleado, el Id del puesto y el salario,
-- incluir tanto los puestos actuales como los puestos históricos.
SELECT ID_EMPLEADO, ID_TRABAJO, SALARIO FROM EMPLEADO_COAR
UNION ALL  
SELECT ID_EMPLEADO, ID_TRABAJO, 0 FROM HISTORIAL_TAB_COAR;

-- 7. Interprete el funcionamiento de la siguiente consulta:
-- Se mustra el Id del empleado, el Id del puesto y el salario en donde se 
-- muestran los trabajos actuales son su salario actual y los trabajos antiguos
-- con salrio de cero, tambien se quitan registros duplicados.

-- 8. Elaborar una sentencia SELECT que muestre las regiones que tienen países asignados.
SELECT ID_REGION, NOMBRE_REGION FROM REGION_COAR
MINUS
SELECT ID_REGION, TO_CHAR(NULL) FROM PAIS_COAR;

-- 9. Elaborar una sentencia SELECT que muestre las regiones que no tienen países asignados
SELECT ID_REGION, NOMBRE_REGION FROM REGION_COAR
INTERSECT
SELECT ID_REGION, TO_CHAR(NULL) FROM REGION_COAR;

-- 10. Elaborar una sentencia SELECT que muestre los empleados que no han generado histórico.
SELECT ID_EMPLEADO FROM EMPLEADO_COAR
MINUS
SELECT ID_EMPLEADO FROM HISTORIAL_TAB_COAR;
