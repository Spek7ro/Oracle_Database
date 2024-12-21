-- ACTIVIDAD: CAPITULO_05.
-- MATERIA: SISTEMAS DE BASE DE DATOS II.
-- NOMBRE: CRISITAN OMAR ALVARADO RODRIGUEZ.
-- GRUPO: 5"B".

-- 1. ¿Qué son las funciones de grupo?
-- A diferencia de las funciones de una sola fila, las funciones de grupo 
-- operan en juegos de filas para dar un resultado por grupo. Estos juegos 
-- pueden abarcar toda la tabla o la tabla dividida en grupos.
-- Las funciones de grupo operan en conjuntos de filas para dar un resultado por grupo. 

-- 2. Explique el funcionamiento de cada una de las siguientes consultas:
-- Query 1: Se realza la suma del numero de registros que regresa la consultas pero dicha suma
-- se realiza dos veces; es decir si la consulta regresa 105 registros la suma seria
-- Query 2: Realiza la suma de todos los salarios de los empleados.
-- Query 3: Realiza la suma de los salarios de los empleados que sean distintos; es decir suma 
-- aquellos salarios que nos son iguales.
-- Query 4: Realiza la suma de las comiciones de los empleados pero solo suma aquellas comiciones
-- que no son null.

-- 3. Explique el funcionamiento de cada una de las siguientes consultas:
-- Query 1: Realiza el promedio de la cantidad de registros que regresa la consulta.
-- Query 2: Realiza y muestra el promedio de los salarios de los empleados.
-- Query 3: Realiza y muestra el promedio de los slarios diferentes de los empleados.
-- Query 4: Realiza y muestra el promedio de las comiciones que nos son null de los empleados.

-- 4. Explique el funcionamiento de cada una de las siguientes consultas:
-- Query 1: Muestra la comicion menor y la comicion mayor de los empleados.
-- Query 2: Muestra la menor fecha de inicio y la mayor fecha de fin del historial de trabajos de los empleados.
-- Query 3: Muestra el menor ID_TRABAJO y el mayor Id_TRABAJO de los empleados; Como el ID_TRABAJO
-- es una cadena de caracteres los valores minimos y maximos se toman en base a las lestras de la cadena
-- de cacteres del ID_TRABAJO.

-- 5. Explique el funcionamiento de cada una de las siguientes consultas:
-- Query 1: Realiza y muestra la suma de las comiciones que no sean null de cada uno de los 
-- departamantos en donde trabajan los empleados.
-- Query 2: Realiza y muestra la suma de las comiciones que no sean null de cada uno de los
-- departamantos y de cada trabajo de los empleados que pertenecen a los deparatmantos; es decir
-- en esta consulta se realiza un subgrupo de un grupo.

-- 6. Explique el funcionamiento de la siguiente consulta:
-- Query 1: Muestra el promedio de los salarios de cada departamanto pero que dicho promedio
-- sea mayor a a 8000.

-- 7. Explique el funcionamiento de la siguiente consulta:
 -- Query 1: Mustra la cantidad de departamantos (50, 60, 80, 110) que exiten en la tabla
-- Hisorial de trabajo; es decir muestra la cantidad que hay de cada unos de los deparatamanstos del
-- historial de trabajo. ejemplo deparmaneto 60 aparece en dos registros de la tabla.

-- 8. Explique el funcionamiento de la siguiente consulta:
-- Query 1: Mustra la cantidad de departamantos (50, 60, 80, 110) que exiten en la tabla
-- Hisorial de trabajo pero solo muestra aquellos que aparecen mas de una vez en la tabla.

-- 9. Elabore una sentencia SELECT que indique la cantidad de empleados que hay en cada
-- departamento (únicamente interesa contar a los empleados que ganan más de 5000 y que
-- tengan una comisión asignada).
SELECT ID_DEPARTAMENTO, COUNT(*) "CANTIDAD DE EMPLEADOS"
FROM EMPLEADO_COAR WHERE COMICION_PCT IS NOT NULL AND SALARIO > 5000 
GROUP BY ID_DEPARTAMENTO;

--  10. Elabore una sentencia SELECT que indique la cantidad de empleados que hay en cada
-- puesto de trabajo (únicamente interesa contar a los empleados que tengan más de 10 de
-- antigüedad) y sólo mostrar los puestos que tengan más de 10 empleados asignados.
SELECT ID_TRABAJO, COUNT(*) "CANTIDAD DE EMPLEADOS" 
FROM EMPLEADO_COAR WHERE (SYSDATE - FECHA_CONTRATACION)/365  > 10
GROUP BY ID_TRABAJO HAVING COUNT(*) > 10;
