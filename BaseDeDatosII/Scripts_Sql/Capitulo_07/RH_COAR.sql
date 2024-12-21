-- ACTIVIDAD: CAPITULO_07.
-- MATERIA: SISTEMAS DE BASE DE DATOS II.
-- NOMBRE: CRISITAN OMAR ALVARADO RODRIGUEZ.
-- GRUPO: 5"B".

-- 1. Mencione en qué partes de la Sentencia SELECT se puede utilizar una SUBCONSULTA.
-- Se puede encontrar en la lista de selección, en la cláusula WHERE o 
-- en la cláusula HAVING de la consulta principal.

-- 2. Mencione los lineamientos para usar SUBCONSULTAS.
-- * Encerrar las subconsultas entre parentesis.
-- * Colocar las subconsultas en el lado derecho de la comparación
-- condición de legibilidad. (Sin embargo, la subconsulta puede
-- aparecen a ambos lados del operador de comparación.)
-- * Utilizar operadores de una sola fila con subconsultas de una sola fila y
-- operadores de varias filas con subconsultas de varias filas.

-- 3. Explique la diferencia entre los dos tipos de SUBCONSULTAS que existen.
-- las subconsultas Single-Row regresan una sola fila y usana operadores single-row (=,<,>,<=,>=,etc)
-- y las subconsultas Multiple-Row regresan como reultado mas de una fila y usan los operadores 
-- IN, ANY y ALL.

-- 4. Elabore una sentencia SELECT que muestre a todos los empleados que tengan el mismo
-- JOB_ID del empleado 141.
SELECT * FROM EMPLEADO_COAR 
WHERE ID_TRABAJO = (SELECT ID_TRABAJO FROM EMPLEADO_COAR 
                    WHERE ID_EMPLEADO = 141);

-- 5. Elabore una sentencia SELECT que muestre el nombre del puesto cuyo salario promedio (el
-- salario promedio se obtiene con los salarios asignados en la tabla empleados) sea el más bajo
-- de todos los salarios promedio de los diferentes puestos.
SELECT ID_TRABAJO, AVG(SALARIO) FROM EMPLEADO_COAR 
WHERE SALARIO < ANY (SELECT MIN(AVG(SALARIO)) FROM EMPLEADO_COAR
                    GROUP BY ID_TRABAJO) GROUP BY ID_TRABAJO;

-- 6. Explique el funcionamiento de la siguiente consulta:
-- Se muestran a los empleados que son jefes de los departamantos 
-- que estan ubicados en el pais del Reino Unido (UK).

-- 7. Explique el funcionamiento de la siguiente consulta:
-- Se muestran los trabajos que tienen empleados asignados pero solo se muestran 
-- aquellos trabajos en donde el promedio de los salarios sea igual al salario 
-- promedio de cada trabajo.

-- 8. Explique el funcionamiento de cada una de las siguientes consultas:
-- Query 1: Se muestran a los empleados cuyo salario es menyor al salario de 
-- los empleados del departamanto 80.
-- Query 2: Se muestran a los empleados cuyo salario es menyor al salario
-- mas alto del departamanto 80. 

-- 9. Elabore una sentencia SELECT que muestre a los empleados que menos ganan en cada uno 
-- de los departamentos.
SELECT NOMBRE_EMPLEADO, APELLIDO_EMPLEADO, ID_DEPARTAMENTO, SALARIO
FROM EMPLEADO_COAR WHERE (ID_DEPARTAMENTO, SALARIO) 
IN(SELECT ID_DEPARTAMENTO, MIN(SALARIO) MIN_SALARIO FROM EMPLEADO_COAR
GROUP BY ID_DEPARTAMENTO) ORDER BY ID_DEPARTAMENTO;

-- 10. Explique el funcionamiento de la siguiente consulta:
-- Se muestran a todos los empleados que nos son jefes (Managers).
