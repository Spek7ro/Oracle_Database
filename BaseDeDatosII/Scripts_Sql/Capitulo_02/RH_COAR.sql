-- ACTIVIDAD: CAPITULO_02
-- MATERIA: SISTEMAS DE BASE DE DATOS II.
-- NOMBRE: CRISITAN OMAR ALVARADO RODRIGUEZ.
-- GRUPO: 5"B".

-- 1. Elaborar una sentencia SELECT que muestre los datos generales de
-- los empleados que laboran en el puesto 'SA_REP'.
SELECT * FROM EMPLEADO_COAR WHERE ID_TRABAJO = 'SA_REP';

-- 2. Elaborar una sentencia SELECT que muestre los datos generales de
-- los empleados que fueron contratados el 24 de marzo de 2005.
SELECT * FROM EMPLEADO_COAR WHERE FECHA_CONTRATACION = '24-MAR-05';

-- 3. ¿Cual es el formato de fecha por default?
-- R = Es DD-MON-RR, dos digitos para el dia, mes y dos digitos para el año.

-- 4. Elaborar una sentencia SELECT que muestre los datos generales de
-- los empleados que fueron contratados antes del 19 de enero del 2004.
SELECT * FROM EMPLEADO_COAR WHERE FECHA_CONTRATACION < '19-ENE-04';

-- 5. Elaborar una sentencia SELECT que muestre los datos generales de
-- los empleados que ganan entre 3000 y 10000.
SELECT * FROM EMPLEADO_COAR WHERE SALARIO BETWEEN 3000 AND 10000;

-- 6. Elaborar una sentencia SELECT que muestre los datos generales de
-- los empleados que ganan 1000, 2000, 3000, 4000, 5000, 6000, 7000,
-- 8000, 9000 y 10000.
SELECT * FROM EMPLEADO_COAR WHERE SALARIO 
IN (1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000);

-- 7. Elaborar una sentencia SELECT que muestre los datos generales de
-- los empleados cuyo nombre contenga la letra 'a'.
SELECT * FROM EMPLEADO_COAR;
SELECT * FROM EMPLEADO_COAR WHERE NOMBRE_EMPLEADO LIKE '%a%';

-- 8. Elaborar una sentencia SELECT que muestre los datos generales de
-- los puestos cuyo ID contenga un guion bajo ( _ ). Ingresar un nuevo
-- puesto que no contenga guion bajo en su Id para comprobar.
SELECT * FROM TRABAJO_COAR;
INSERT INTO TRABAJO_COAR VALUES ('AD DB', 'ADMIN BASE DE DATOS', 5000, 15000);
SELECT * FROM TRABAJO_COAR WHERE ID_TRABAJO LIKE '%\_%' ESCAPE '\';

-- 9. Elaborar una sentencia SELECT que muestre los datos generales de
-- los empleados que tiene una comision asignada.
SELECT * FROM EMPLEADO_COAR WHERE COMICION_PCT IS NOT NULL;

-- 10. Elaborar una sentencia SELECT que muestre los datos generales de
-- los empleados cuyo nombre no contenga la letra 'a' y que ganen más de 7500.
SELECT * FROM EMPLEADO_COAR WHERE NOMBRE_EMPLEADO NOT LIKE '%a%' AND SALARIO > 7500;

-- 11. Elaborar una sentencia SELECT que muestre los datos generales de
-- los empleados cuyo puesto sea SA_REP y que ganen mas de 12000 o 
-- cuyo puesto sea AD_PRES.
SELECT * FROM EMPLEADO_COAR WHERE 
(ID_TRABAJO = 'SA_REP' AND SALARIO > 12000) OR ID_TRABAJO = 'AD_PRES';

-- 12. Elaborar una sentencia SELECT que muestre los datos generales de
-- los empleados ordenados por apellido de forma ascendente y por
-- nombre de forma descendente.
SELECT * FROM EMPLEADO_COAR ORDER BY APELLIDO_EMPLEADO; -- Por default el orden es ascendente.
SELECT * FROM EMPLEADO_COAR ORDER BY APELLIDO_EMPLEADO DESC;

-- 13. Elaborar una sentencia SELECT que muestre los datos generales de
-- los empleados cuyo nombre no contenga la letra 'a'.
SELECT * FROM EMPLEADO_COAR WHERE NOMBRE_EMPLEADO NOT LIKE '%a%';

-- 14. Elaborar una sentencia SELECT que muestre los datos generales de
-- los empleados utilizando variables de sustitucion y la reutilizacion de
-- al menos una de ellas.
SELECT * FROM EMPLEADO_COAR WHERE ID_EMPLEADO = &&ID_DEL_EMPLEADO;

SELECT * FROM EMPLEADO_COAR ORDER BY &&COLUMNA_ORDENACION_ASC;

SELECT * FROM EMPLEADO_COAR WHERE &&CONDICION 
ORDER BY &COLUMNA_ORDENACION_DESC DESC; 

-- 15. Elaborar una sentencia SELECT que muestre los datos generales de
-- los empleados utilizando el comando DEFINE.
DEFINE CONDICION_SLARIO = SALARIO BETWEEN 3000 AND 10000;
SELECT * FROM EMPLEADO_COAR WHERE &CONDICION_SLARIO;
