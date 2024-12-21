-- ACTIVIDAD: CAPITULO_06.
-- MATERIA: SISTEMAS DE BASE DE DATOS II.
-- NOMBRE: CRISITAN OMAR ALVARADO RODRIGUEZ.
-- GRUPO: 5"B".

-- 1. Mencione los diferentes tipos de uniones que maneja Oracle.
-- * NATURAL JOIN: La cláusula NATURAL JOIN se basa en todas las columnas de 
-- dos tablas que tienen el mismo nombre.
-- * Se utiliza la cláusula USING para hacer coincidir solo una columna 
-- cuando coincida más de una columna.
-- * Se utiliza la cláusula ON para especificar condiciones arbitrarias 
-- o especificar columnas para unir.
-- * Self-join: es una combinación que une una tabla consigo misma. Una unión 
-- automática es útil para comparar filas dentro de una tabla o consultar datos jerárquicos.
-- * Nonequijoins: Las combinaciones no igualitarias son una combinación que hace 
-- coincidir los valores de columna de diferentes tablas en función de una expresión 
-- de desigualdad (en lugar del signo igual como >, <, >=, <= ) la expresión basada 
-- en un operador de desigualdad utilizado en la combinación se evalúa como verdadera.
-- * Uniones Externas, LEFT JOIN Devuelve todas las filas de la tabla de la izquierda, 
-- y las filas coincidentes de la tabla de la derecha.
-- * RIGHT JOIN: Devuelve todas las filas de la tabla de la derecha, y 
-- las filas coincidentes de la tabla de la izquierda.
-- * OUTER JOIN: Devuelve todas las filas de las dos tablas, la izquierda 
-- y la derecha. También se llama FULL OUTER JOIN.
-- * CROSS JOIN: Las combinaciones cruzadas muestran todas 
-- las combinaciones de todos los registros de las tablas combinadas. 
-- Para este tipo de join no se incluye una condición de enlace. Se 
-- genera el producto cartesiano en el que el número de filas del resultado 
-- es igual al número de registros de la primera tabla multiplicado por el 
-- número de registros de la segunda tabla, es decir, si hay 5 registros en 
-- una tabla y 5 en la otra, retorna 25 filas.

-- 2. Mencione las características de un NATURAL JOIN.
-- * La cláusula NATURAL JOIN se basa en todas las columnas de
-- las dos tablas que tienen el mismo nombre.
-- * Selecciona filas de las dos tablas que tienen valores iguales
-- en todas las columnas coincidentes.
-- * Si las columnas que tienen los mismos nombres tienen datos diferentes
-- tipos, se devuelve un error.

-- 3. Explique las diferencias entre un NATURAL JOIN y un JOIN USING.
-- JOIN USING permite asociar tablas indicando las columnas que las relacionan
-- si estas tienen el mismo nombre en ambas tablas, a diferencia de NATURAL JOIN no 
-- tienen porque ser las únicas con el mismo nombre.

-- 4. Explique el funcionamiento de cada una de las siguientes consultas:
-- Query 1: Realiza una union ya que las tablas tinen una columna con el mismo nombre
-- que seria el id del pais.
-- Query 2: Se realiza una union entre ambas tablas solo que ahora nos se utiliza 
-- un natural join, sin que ahora se utiliza la clasula where para realizar compraciones
-- entre los id de los paises de las tablas (se hace una union explicita).
-- Query 3: En esta consulta como no exite una columna en ambas tablas con el mismo
-- nombre se genera un producto cartesiano de 22 x 25 = 550 registros.
-- Query 4: En esta consulta se genera los mismo que el la consulta anterior es decir se
-- nos genera un producto cartesiano ya que no hay columnas con el mismo nombre en las tablas.

-- 5. Explique el funcionamiento de cada una de las siguientes consultas:
-- Query 1: Se realiza una union de las tablas mediante la columna id pais en donde 
-- dicha columna debe tener el mismo nombre y ser de tipos compatibles ya que se usa la
-- clasula using.
-- Query 2: Se realiza la union entre tablas en donde el criterio de union se realiza con la
-- clasula where en donde se compara el id pais de la tabla ubicacion con el id pais de la
-- tabla pais.
-- Query 3: Maraca un error ya que al la clasula using nos se le pasa la columna 
-- para realizar la union (no se le padsa ningun argumento).


-- 6. Elabore una sentencia SELECT que muestre el siguiente resultado:
SELECT E.ID_EMPLEADO, E.APELLIDO_EMPLEADO,
       H.FECHA_INICIO, E.FECHA_CONTRATACION,
       H.FECHA_FIN, H.ID_TRABAJO "Antiguo Trabajo",
       E.ID_TRABAJO "Trabajo Actual"
FROM EMPLEADO_COAR E JOIN HISTORIAL_TAB_COAR H USING(ID_DEPARTAMENTO);            

-- 7. Elabore una sentencia SELECT que muestre el siguiente resultado:
SELECT E.NOMBRE_EMPLEADO || ' ' || E.APELLIDO_EMPLEADO || 
       ' es jefe del departamento de ' || D.DEPARTAMENTO_NOMBRE "Managers"
FROM EMPLEADO_COAR E JOIN DEPARTAMENTO_COAR D ON D.ID_JEFE = E.ID_EMPLEADO;

-- 8. Explique el funcionamiento de cada una de las siguientes consultas:
-- Query 1: Se muestran los nombres de los departamantos en donde el id ubicacion 
-- sea igual en ambas tablas y que ademas el nombre del deparatamento inicie con 
-- la letra P.
-- Query 2: Se muestran lo mismo que la consulta anterior solo que ahora la
-- condicion se realiza usano el operado AND y no con la clasula WHERE.  


-- 9. Elabore las sentencias necesarias para crear la tabla e insertar los datos de lo siguiente:
CREATE TABLE JOB_GRADES (
    GRADE_LEVEL CHAR(1) CONSTRAINT JOB_GRADES_PK PRIMARY KEY,
    LOWEST_SAL NUMBER(8,2) CONSTRAINT JOB_GRADE_LOW_SAL_NN NOT NULL,
    HIGHEST_SAL NUMBER(8,2) CONSTRAINT JOB_GRADES_HIG_SAL_NN NOT NULL
);

SELECT * FROM JOB_GRADES;

INSERT INTO JOB_GRADES VALUES ('A', 1000, 2999);
INSERT INTO JOB_GRADES VALUES ('B', 3000, 5999);
INSERT INTO JOB_GRADES VALUES ('C', 6000, 9999);
INSERT INTO JOB_GRADES VALUES ('D', 10000, 14999);
INSERT INTO JOB_GRADES VALUES ('E', 15000, 24999);
INSERT INTO JOB_GRADES VALUES ('F', 25000, 40000);

COMMIT;

-- 10. Elabore una sentencia SELECT que muestre el siguiente resultado:
SELECT E.NOMBRE_EMPLEADO, E.SALARIO, J.GRADE_LEVEL "NIVEL_SALARIO"
FROM EMPLEADO_COAR E JOIN JOB_GRADES J ON E.SALARIO BETWEEN
J.LOWEST_SAL AND J.HIGHEST_SAL;

-- 11. Explique el funcionamiento de cada una de las siguientes consultas:
-- Query 1: Se muestran el apellido del empleado, el id de los departamantos
-- y el nombre de los departamantos; En este caso solo se muestran los departamantos
-- en donde trabajan los empleados por ejemplo al empleado Grant no se le asignada
-- un departamanto por eso no se muestra el id y el nombre del departamanto y esto lleva
-- uun condicion en donde solo se muestran los registros en donde el nombre 
-- de los departamantos comienzen con la letra P.
-- Query 2: Se muestran los datos de los departamantos en donde trabajan los empleados
-- solo se muestran aquellos en donde el nombre del departamento comienza con la
-- letra P.

-- 12. Elabore una sentencia SELECT que muestre el siguiente resultado:
SELECT H.ID_TRABAJO "TRBAJOS EN HISTORIAL_TAB",
       E.ID_TRABAJO "TRBAJOS EN EMPLEADO"
FROM HISTORIAL_TAB_COAR H RIGHT OUTER JOIN EMPLEADO_COAR E 
ON (E.ID_TRABAJO = H.ID_TRABAJO);

-- 13. Elabore una sentencia SELECT que muestre el siguiente resultado:
SELECT E.APELLIDO_EMPLEADO, D.DEPARTAMENTO_NOMBRE
FROM EMPLEADO_COAR E LEFT OUTER JOIN DEPARTAMENTO_COAR D
ON (E.ID_DEPARTAMENTO = D.ID_DEPARTAMENTO) 
ORDER BY E.APELLIDO_EMPLEADO DESC;

-- 14. Explique el funcionamiento de la siguiente consulta:
-- Se produce un produccto cartesiano de 25x4 = 100 estos se realiza
-- con una union cruzada (CROSS JOIN).
SELECT R.NOMBRE_REGION, P.NOMBRE_PAIS
FROM REGION_COAR R CROSS JOIN PAIS_COAR P
ORDER BY R.NOMBRE_REGION, P.NOMBRE_PAIS;    

-- 15. Elabore una Sentencia SELECT que muestre todos los empleados que hay registrados en la
-- tabla, y en de que tengan un departamento asignado, mostrar el nombre de dicho
-- departamento. 
SELECT E.NOMBRE_EMPLEADO, E.APELLIDO_EMPLEADO, 
       D.ID_DEPARTAMENTO, D.DEPARTAMENTO_NOMBRE
FROM EMPLEADO_COAR E FULL OUTER JOIN DEPARTAMENTO_COAR D
ON (E.ID_DEPARTAMENTO = D.ID_DEPARTAMENTO) 
ORDER BY E.APELLIDO_EMPLEADO;
