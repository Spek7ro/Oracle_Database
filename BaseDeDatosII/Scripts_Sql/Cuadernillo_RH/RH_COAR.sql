-- ACTIVIDAD: Cuadernillo de la Base de Datos RH.
-- MATERIA: SISTEMAS DE BASE DE DATOS II.
-- NOMBRE: CRISITAN OMAR ALVARADO RODRIGUEZ.
-- GRUPO: 5"B".

-- 1. Consultar el nombre de la región, el nombre del país, datos generales
-- de las localidades y en caso de que una localidad tenga
-- departamentos, mostrar también el nombre del departamento.
SELECT R.NOMBRE_REGION REGION, P.NOMBRE_PAIS PAIS,
       U.*, D.DEPARTAMENTO_NOMBRE DEPARTAMENTO
FROM REGION_COAR R JOIN PAIS_COAR P
ON R.ID_REGION = P.ID_REGION JOIN
UBICACION_COAR U ON P.ID_PAIS = U.ID_PAIS
JOIN DEPARTAMENTO_COAR D ON U.ID_UBICACION = D.ID_UBICACION;

-- 2. Consultar el nombre completo de los empleados que no han
-- generados ningún histórico en un determinado año.
SELECT ID_EMPLEADO,
       NOMBRE_EMPLEADO || ' ' || APELLIDO_EMPLEADO EMPLEADO
FROM EMPLEADO_COAR WHERE ID_EMPLEADO = ANY (SELECT ID_EMPLEADO FROM EMPLEADO_COAR
                                            MINUS
                                            SELECT ID_EMPLEADO FROM HISTORIAL_TAB_COAR 
                                            WHERE FECHA_INICIO LIKE '%02');                                                                                       

-- 3. Consultar el nombre de los departamentos y el total de empleados
-- que tiene cada uno de ellos, pero sólo mostrar aquellos
-- departamentos que tengan más de 5 empleados.
SELECT E.ID_DEPARTAMENTO, D.DEPARTAMENTO_NOMBRE DEPARTAMENTO,
       COUNT(*) "TOTAL DE EMPLEADOS"
FROM EMPLEADO_COAR  E JOIN DEPARTAMENTO_COAR D
ON E.ID_DEPARTAMENTO = D.ID_DEPARTAMENTO 
GROUP BY E.ID_DEPARTAMENTO, D.DEPARTAMENTO_NOMBRE
HAVING COUNT(*) > 5;

-- 4. Consultar los datos generales de los históricos (mostrar los datos
-- generales de las tablas que se relacionan con la tabla de
-- JOB_HISTORY).
SELECT H.*, E.*, T.*, D.* 
FROM EMPLEADO_COAR E JOIN HISTORIAL_TAB_COAR H
ON E.ID_EMPLEADO = H.ID_EMPLEADO JOIN TRABAJO_COAR T
ON T.ID_TRABAJO = H.ID_TRABAJO JOIN DEPARTAMENTO_COAR D
ON D.ID_DEPARTAMENTO = H.ID_DEPARTAMENTO;

-- 5. Consultar los nombres de los puestos (job_title) y total de empleados
-- (que no ganen entre 8000 y 12000 y que tengan comisión asignada)
-- que tiene cada uno de ellos, pero sólo mostrar aquellos puestos que
-- tengan más de 3 empleado.
SELECT E.ID_TRABAJO, T.TITULO_TRABAJO, COUNT(*)
FROM EMPLEADO_COAR E JOIN TRABAJO_COAR T
ON E.ID_TRABAJO = T.ID_TRABAJO 
WHERE (E.SALARIO BETWEEN 8000 AND 12000) AND
(E.COMICION_PCT IS NOT NULL)
GROUP BY E.ID_TRABAJO, T.TITULO_TRABAJO
HAVING COUNT(*) > 3;

-- 6. Consultar el nombre del empleado que más veces ha cambiado de
-- departamento.
CREATE VIEW DEP_HISTORICOS AS
SELECT ID_EMPLEADO, ID_DEPARTAMENTO FROM HISTORIAL_TAB_COAR
UNION ALL
SELECT ID_EMPLEADO, ID_DEPARTAMENTO FROM EMPLEADO_COAR
WHERE ID_EMPLEADO IN (SELECT ID_EMPLEADO FROM HISTORIAL_TAB_COAR)
ORDER BY ID_EMPLEADO;

SELECT * FROM DEP_HISTORICOS;

SELECT E.NOMBRE_EMPLEADO, E.APELLIDO_EMPLEADO, 
       COUNT(DISTINCT D.ID_DEPARTAMENTO) "NUMERO DE CAMBIOS"
FROM DEP_HISTORICOS D JOIN EMPLEADO_COAR E ON E.ID_EMPLEADO = D.ID_EMPLEADO
GROUP BY E.NOMBRE_EMPLEADO, E.APELLIDO_EMPLEADO
HAVING COUNT(DISTINCT D.ID_DEPARTAMENTO) = (SELECT MAX(COUNT(DISTINCT ID_DEPARTAMENTO)) FROM
DEP_HISTORICOS GROUP BY ID_EMPLEADO);

-- 7. Consultar el nombre del empleado que más veces ha cambiado de
-- puesto.
CREATE VIEW TAB_HISTORICOS AS 
SELECT ID_EMPLEADO, ID_TRABAJO FROM HISTORIAL_TAB_COAR
UNION ALL
SELECT ID_EMPLEADO, ID_TRABAJO FROM EMPLEADO_COAR
WHERE ID_EMPLEADO IN (SELECT ID_EMPLEADO FROM HISTORIAL_TAB_COAR)
ORDER BY ID_EMPLEADO;

SELECT * FROM TAB_HISTORICOS;

SELECT E.NOMBRE_EMPLEADO, E.APELLIDO_EMPLEADO, 
       COUNT(DISTINCT H.ID_TRABAJO) "NUMERO DE CAMBIOS"
FROM HISTORIAL_TAB_COAR H JOIN EMPLEADO_COAR E ON E.ID_EMPLEADO = H.ID_EMPLEADO
GROUP BY E.NOMBRE_EMPLEADO, E.APELLIDO_EMPLEADO
HAVING COUNT(DISTINCT H.ID_TRABAJO) = (SELECT MAX(COUNT(DISTINCT H.ID_TRABAJO)) FROM HISTORIAL_TAB_COAR H 
GROUP BY ID_EMPLEADO);

-- 8. Consultar el nombre de la región que tenga más empleados.
-- PASO 1: Obtener el total de empleados de cada region.
SELECT NOMBRE_REGION FROM REGION_COAR WHERE ID_REGION =
(SELECT ID_REGION FROM PAIS_COAR WHERE ID_PAIS =
(SELECT ID_PAIS FROM UBICACION_COAR WHERE ID_UBICACION =
(SELECT ID_UBICACION FROM DEPARTAMENTO_COAR WHERE ID_DEPARTAMENTO =
(SELECT ID_DEPARTAMENTO FROM EMPLEADO_COAR GROUP BY ID_DEPARTAMENTO 
HAVING COUNT(ID_EMPLEADO) =  (SELECT MAX(COUNT(ID_EMPLEADO)) FROM EMPLEADO_COAR 
GROUP BY ID_DEPARTAMENTO)))));

-- 9. Consultar el nombre de los países que su total de localidades se
-- encuentre por arriba del promedio de localidades por país.
SELECT ID_PAIS, COUNT(ID_UBICACION)
FROM UBICACION_COAR
GROUP BY ID_PAIS
HAVING COUNT(ID_UBICACION) > (SELECT AVG(COUNT(ID_UBICACION)) 
                              FROM UBICACION_COAR GROUP BY ID_PAIS);

-- 10. Consultar el puesto que más empleados tenga.
SELECT TITULO_TRABAJO, COUNT(ID_EMPLEADO) NUM_EMPLEADOS
FROM EMPLEADO_COAR E JOIN TRABAJO_COAR T ON T.ID_TRABAJO = E.ID_TRABAJO
GROUP BY TITULO_TRABAJO
HAVING COUNT(ID_EMPLEADO) = (SELECT MAX(COUNT(ID_EMPLEADO)) 
                            FROM EMPLEADO_COAR GROUP BY ID_TRABAJO);

-- 11. Consultar el nombre de todos los empleados registrados en la base de
-- datos y si están asignados a algún departamento, mostrar también el
-- nombre del departamento, en caso contrario mostrar la leyenda “no
-- está asignado a ningún departamento”.
SELECT ID_EMPLEADO,
       NOMBRE_EMPLEADO || ' ' || APELLIDO_EMPLEADO EMPLEADO, 
       NVL(D.DEPARTAMENTO_NOMBRE,'No esta asignada a ningun departamento')
       AS DEPARTAMENTO
FROM EMPLEADO_COAR E LEFT OUTER JOIN DEPARTAMENTO_COAR D 
ON E.ID_DEPARTAMENTO = D.ID_DEPARTAMENTO;

-- 12. Consultar el nombre de la región y el total de países que tiene cada
-- una de ellas, pero sólo mostrar cuyo total de países se encuentre por
-- debajo de la media.
SELECT NOMBRE_REGION, COUNT(ID_PAIS) PAISES
FROM REGION_COAR R JOIN PAIS_COAR P ON P.ID_REGION = R.ID_REGION
GROUP BY NOMBRE_REGION
HAVING COUNT(ID_PAIS) < (SELECT AVG(COUNT(ID_PAIS)) 
                        FROM PAIS_COAR GROUP BY ID_REGION);

-- 13. Consultar los datos generales de los empleados que han cambiado de
-- puesto pero no de departamento.
CREATE VIEW EMPL_HISTORICOS AS 
SELECT ID_EMPLEADO, ID_DEPARTAMENTO, ID_TRABAJO FROM HISTORIAL_TAB_COAR
UNION ALL
SELECT ID_EMPLEADO, ID_DEPARTAMENTO, ID_TRABAJO FROM EMPLEADO_COAR
WHERE ID_EMPLEADO IN (SELECT ID_EMPLEADO FROM HISTORIAL_TAB_COAR)
ORDER BY ID_EMPLEADO;

SELECT * FROM EMPL_HISTORICOS;

SELECT * FROM EMPLEADO_COAR
WHERE ID_EMPLEADO IN (SELECT ID_EMPLEADO FROM EMPL_HISTORICOS GROUP BY ID_EMPLEADO HAVING
COUNT(DISTINCT(ID_TRABAJO)) > 1)
AND ID_EMPLEADO NOT IN (SELECT ID_EMPLEADO FROM EMPL_HISTORICOS GROUP BY ID_EMPLEADO HAVING
COUNT(DISTINCT(ID_DEPARTAMENTO)) > 1);

-- 14. Consultar los datos generales de los empleados que han cambiado de
-- departamento pero no de puesto.
CREATE OR REPLACE VIEW EMPL_HISTORICOS AS
SELECT ID_EMPLEADO, ID_TRABAJO, ID_DEPARTAMENTO FROM HISTORIAL_TAB_COAR
UNION ALL
SELECT ID_EMPLEADO, ID_TRABAJO, ID_DEPARTAMENTO FROM EMPLEADO_COAR
WHERE ID_EMPLEADO IN (SELECT ID_EMPLEADO FROM HISTORIAL_TAB_COAR)
ORDER BY ID_EMPLEADO;

SELECT * FROM EMPL_HISTORICOS;

SELECT * FROM EMPLEADO_COAR
WHERE ID_EMPLEADO NOT IN (SELECT ID_EMPLEADO FROM EMPL_HISTORICOS GROUP BY ID_EMPLEADO
HAVING COUNT(DISTINCT(ID_TRABAJO)) > 1)
and ID_EMPLEADO IN (SELECT ID_EMPLEADO FROM EMPL_HISTORICOS GROUP BY ID_EMPLEADO HAVING
COUNT(DISTINCT(ID_DEPARTAMENTO)) > 1);

-- 15. Consultar el nombre del empleado que más ha cambiado tanto de
-- puesto como de departamento.
SELECT E.NOMBRE_EMPLEADO, E.APELLIDO_EMPLEADO EMPLEADO, 
       COUNT(DISTINCT EH.ID_DEPARTAMENTO) "NUMERO DE CAMBIOS"
FROM EMPL_HISTORICOS EH JOIN EMPLEADO_COAR E on E.ID_EMPLEADO = EH.ID_EMPLEADO
GROUP BY E.NOMBRE_EMPLEADO, E.APELLIDO_EMPLEADO
HAVING COUNT(DISTINCT EH.ID_DEPARTAMENTO) = (SELECT MAX(COUNT(DISTINCT ID_DEPARTAMENTO)) FROM
EMPL_HISTORICOS GROUP BY ID_EMPLEADO)
and COUNT(DISTINCT EH.ID_TRABAJO) = (SELECT MAX(COUNT(DISTINCT ID_TRABAJO)) FROM EMPL_HISTORICOS GROUP BY
ID_EMPLEADO);

-- 16. Consultar el nombre de los empleados, el porcentaje de comisión y
-- una leyenda que indique “Tiene comisión asignada” o “No tiene
-- comisión asignada”.
SELECT ID_EMPLEADO,
       NOMBRE_EMPLEADO || ' ' || APELLIDO_EMPLEADO EMPLEADO,
       COMICION_PCT, NVL2(COMICION_PCT, 'Tiene comision asignada', 
       'No tiene comision asignada') "ESTATUS COMICION"
FROM EMPLEADO_COAR;      

-- 17. Consultar el nombre de los empleados, su salario y una leyenda que
-- indique:
-- “Salario de Nivel 1” si gana más de 12,000.00.
-- “Salario de Nivel 2” si gana entre 8,000.00 y 12,000.00.
-- “Salario de Nivel 3” si gana menos de 8,000.00.
SELECT NOMBRE_EMPLEADO, SALARIO,
  CASE WHEN SALARIO > 12000 THEN 'Salario de Nivel 1'
       WHEN SALARIO >= 8000 AND SALARIO <= 12000 THEN 'Salario de Nivel 2'
       WHEN SALARIO < 8000 THEN 'Salario de Nivel 3'
       ELSE 'Salario Normal';
  END "NIVEL DE SALARIO"
FROM EMPLEADO_COAR ORDER BY SALARIO;

-- 18. Consultar el nombre de los países en lo que no haya empleados
-- trabajando.
SELECT NOMBRE_PAIS
FROM PAIS_COAR WHERE ID_PAIS NOT IN (SELECT ID_PAIS FROM UBICACION_COAR);

-- 19. Consultar el nombre del departamento más popular (Departamento
-- que más empleados tenga).
SELECT DEPARTAMENTO_NOMBRE DEPARTAMENTO, COUNT(ID_EMPLEADO) NUM_EMPLEADOS
FROM DEPARTAMENTO_COAR JOIN EMPLEADO_COAR USING (ID_DEPARTAMENTO)
GROUP BY DEPARTAMENTO_NOMBRE
HAVING COUNT(ID_EMPLEADO) = (SELECT MAX(COUNT(ID_EMPLEADO)) FROM EMPLEADO_COAR E GROUP BY
ID_DEPARTAMENTO);

-- 20. Consultar el nombre del departamento, el total de empleados que
-- tiene cada uno de ellos y una leyenda que indique:
-- "Departamento con muchos empleados" si tiene más de 15
-- empleados.
-- "Departamento con pocos empleados" si tiene entre 8 y 15
-- empleados.
-- "Departamento con muy pocos empleados" si tiene menos de 8
-- empleados.
SELECT DEPARTAMENTO_NOMBRE, COUNT(ID_DEPARTAMENTO) NUM_EMPLEADOS,
       CASE WHEN COUNT(ID_DEPARTAMENTO) > 15 THEN 'Departamento con muchos empleados'
            WHEN COUNT(ID_DEPARTAMENTO) BETWEEN 8 AND 15 THEN 'Departamento con pocos empleados'
            WHEN COUNT(ID_DEPARTAMENTO) < 8 THEN 'Departamento con muy pocos empleados'
            ELSE 'No tiene empleados'
       END DEPARTAMENTO    
FROM EMPLEADO_COAR JOIN DEPARTAMENTO_COAR USING(ID_DEPARTAMENTO)
GROUP BY DEPARTAMENTO_NOMBRE;
