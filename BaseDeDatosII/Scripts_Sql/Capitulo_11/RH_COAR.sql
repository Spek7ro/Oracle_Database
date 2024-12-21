-- ACTIVIDAD: CAPITULO_11 "Vistas".
-- MATERIA: SISTEMAS DE BASE DE DATOS II.
-- NOMBRE: CRISITAN OMAR ALVARADO RODRIGUEZ.
-- GRUPO: 5"B".

-- 1. Explique en qué consiste una vista.
-- Una vista es un tipo de objeto de Oracle, una vista es una 
-- alternativa para mostrar datos de varias tablas (es como 
-- una tabla virtual que almacena una consulta)

-- 2. Mencione las ventajas de las vistas.
-- * Restringir el acceso a los datos.
-- * Facilita las consultas complejas.
-- * Proporciona independencia de los datos.  
-- * Presentar o tener diferentes vistas de los mismos datos.

-- 3. Mencione las características de una vista simple y de una vista compleja.
-- VISTA SIMPLE:
-- * Solo se puede usar una tabla.
-- * No contiene funciones.
-- * No contiene agrupaciones de datos.
-- * Si se pueden realizar operaciones DML.
-- VISTA COMPLEJA:
-- * Se puede usar mas de una tabla.
-- * Si contiene funciones.
-- * Si contiene agrupaciones de datos.
-- * No simpre se pueden realizar operaciones DML.

-- 4. Explique el funcionamiento de la siguiente vista:
-- Se crea una vista con los nombres de cada departamanto y la suma
-- de los salarios de los empleados que trabajan en cada uno de los departamantos
-- los datos son agrupadaos por el nombre de los departamantos y son ordenados 
-- por el nombre de los departamantos.

-- 5. Elabore una sentencia SELECT para crear una Vista que muestre el Nombre del Puesto, la
-- suma de los salarios asignados a ese puesto, el salario más alto y el salario más bajo que se
-- haya asignado a un empleado en ese puesto.
CREATE VIEW PUESTO_SAL AS
SELECT T.TITULO_TRABAJO, SUM(E.SALARIO) SUM_SAL, 
       MIN(E.SALARIO) MIN_SAL, MAX(E.SALARIO) MAX_SAL
FROM TRABAJO_COAR T JOIN EMPLEADO_COAR E
ON T.ID_TRABAJO = E.ID_TRABAJO
GROUP BY T.TITULO_TRABAJO 
ORDER BY T.TITULO_TRABAJO; 

DESCRIBE PUESTO_SAL;

SELECT * FROM PUESTO_SAL;

-- 6. Mencione las reglas para poder ejecutar sentencias DML a través de una vista, para:
-- a) insertar datos.
-- b) modificar datos.
-- c) eliminar datos. 
-- * Las instrucciones DML (INSERT, UPDATE o DELETE) se pueden ejecutar sobre las vistas simples.
-- En el caso de las vistas complejas, se pueden borrar filas si la vista:
-- No contiene funciones de agrupación (como SUM o AVG).
-- No se usa la cláusula GROUP BY.
-- No se usa la cláusula DISTINCT.
-- No se usa ROWNUM.
-- Además no se pueden modificar los datos si hay columnas que utilizan 
-- expresiones o funciones.
-- Para añadir datos (instrucción INSERT) además hay que cumplir que 
-- todos los campos con restricciones de tipo NOT NULL de las tablas están incluidos.

-- 7. Elabore una vista que muestre el siguiente resultado:
CREATE VIEW DEP_PERSONAL AS
SELECT E.ID_DEPARTAMENTO, COUNT(*) PERSONAL, 
       SUM(SALARIO) SALARIOS, D.DEPARTAMENTO_NOMBRE
FROM EMPLEADO_COAR E JOIN DEPARTAMENTO_COAR D
ON E.ID_DEPARTAMENTO = D.ID_DEPARTAMENTO
GROUP BY E.ID_DEPARTAMENTO, D.DEPARTAMENTO_NOMBRE;   

DESCRIBE DEP_PERSONAL;

SELECT * FROM DEP_PERSONAL;

-- 8. Elabore una vista que muestre un listado de los empleados que ganen mas de $10,000.00. A
-- través de la vista tratar de registrar un empleado que gane $8,000.00. Alterar la vista para
-- agregar la opción WITH CHECK OPTION. Nuevamente, a través de la vista tratar de
-- registrar un empleado que gane $8,000.00. Explicar el comportamiento de todo el ejercicio.
CREATE VIEW EMPL_SAL AS
SELECT * FROM EMPLEADO_COAR WHERE SALARIO > 10000; 

SELECT * FROM EMPL_SAL;

INSERT INTO EMPL_SAL VALUES (EMP_COAR_EMP_ID_SEQ.NEXTVAL, 'ALVARADO', 'OMAR',
               'AOMAR', '492.674.2139', '14/11/2022', 'IT_PROG', 8000, NULL, 103, 60);

CREATE OR REPLACE VIEW EMPL_SAL AS
SELECT * FROM EMPLEADO_COAR WHERE SALARIO > 10000
WITH CHECK OPTION CONSTRAINT EMPL_SAL_CK;  

INSERT INTO EMPL_SAL VALUES (EMP_COAR_EMP_ID_SEQ.NEXTVAL, 'GARCIA', 'ANA',
               'AANA', '492.778.3129', '15/11/2022', 'IT_PROG', 8000, NULL, 103, 60);

-- En la primera vista si se pude insertar el registro ya que nos exite ninguna
-- restriccion, en la segunda vista en donde se agrega la restriccion WITH CHECK OPTION
-- no se puede insertar el registro ya que la restriccion es violentada ya que el
-- salario del empleado no es mayor a 10,000.00 por lo tanto cada resgistro que 
-- se intente insertar con un salario menor a 10,000.00 oracle mostrara un error.

-- 9. Elabore una vista de solo lectura. Trate de agregar un registro a través de la vista. Explique
-- el comportamiento
CREATE VIEW EMPL_IT_PROG AS
SELECT ID_EMPLEADO, APELLIDO_EMPLEADO, NOMBRE_EMPLEADO,
       SALARIO, ID_TRABAJO, COMICION_PCT, ID_DEPARTAMENTO
FROM EMPLEADO_COAR WHERE ID_TRABAJO = 'IT_PROG'
WITH READ ONLY;

SELECT * FROM EMPL_IT_PROG;

UPDATE EMPL_IT_PROG SET SALARIO = 13500 WHERE ID_EMPLEADO = 105;
DELETE FROM EMPL_IT_PROG WHERE ID_EMPLEADO = 105;

-- No se pueden efectuar operaciones DML (insertar, elminar o actualizar) en la 
-- vista ya que dicha vista tine una restriccion de solo lectura.

-- 10. Elabore una sentencia para borrar una de las vistas anteriormente creadas.
DROP VIEW DEP_PERSONAL;
DROP VIEW EMPL_IT_PROG;
DROP VIEW EMPL_SAL;
DROP VIEW PUESTO_SAL;
