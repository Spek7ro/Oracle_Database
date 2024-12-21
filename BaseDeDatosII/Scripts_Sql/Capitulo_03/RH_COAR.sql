-- ACTIVIDAD: CAPITULO_03.
-- MATERIA: SISTEMAS DE BASE DE DATOS II.
-- NOMBRE: CRISITAN OMAR ALVARADO RODRIGUEZ.
-- GRUPO: 5"B".

-- 1. Mencione la diferencia que hay entre las funciones SINGLE-ROW y
-- MULTIPLE-ROW.
-- > Las funciones single-row regresa un resultado por fila y las funciones
-- multiple-row regresa un resultado para un conjunto de filas.

-- 2. Menciones 5 características de una función SINGLE-ROW.
-- > Manipular elementos de datos (Personalizacion del resultado).
-- > Aceptan argumentos y devuelve un valor.
-- > Devuelve un resultado por fila.
-- > Acepta argumentos los cuales pueden ser una columna o una expresión.
-- > Se pueden anidar.

-- 3. Las funciones SINGLE-ROW se pueden clasificar en:
-- > Funciones de caracteres.
-- > Funciones numericas.
-- > Funciones de fechas (Date).
-- > Funciones de conversion.
-- > Funciones generales.

-- 4. Escriba una sentencia SELECT que muestre el siguiente resultado:
SELECT CONCAT('El Id_Trabajo de ', NOMBRE_EMPLEADO) || 
       CONCAT(' es ', ID_TRABAJO) "Detalles Empleado"
FROM EMPLEADO_COAR; 

-- 5. Explique la diferencia que hay entre las siguientes consultas:
-- En la primera consulta no se muestra ningun resultado por que el clinte con el nombre
-- higgins (letra 'h' minuscula) no exite y en la segunda consulta si se muestra un resultado
-- ya que cuando se realiza la consulta en last_name de empleado se convierte a minusculas
-- para que asi sea igual al nombre de la condicion (higgins). 

-- 6. Elabore una sentencia SELECT que muestre el siguiente resultado
-- (Solo muestra a los empleados que su last_name termina con la letra
-- "n"):
SELECT ID_EMPLEADO, 
       NOMBRE_EMPLEADO || CONCAT(' ', APELLIDO_EMPLEADO)  "Nombre del empleado",
       LENGTH(APELLIDO_EMPLEADO),
       INSTR(APELLIDO_EMPLEADO, 'a') "Contiene 'a'?"
FROM EMPLEADO_COAR WHERE APELLIDO_EMPLEADO LIKE '%n';

-- 7. Explique el comportamiento de las siguientes sentencias:
-- Query 1: En esta consulta se muestra el resultado de la operacion 27 entre 7.
-- Query 2: En esta consulta se muestra la fecha actual del sistema.
-- Query 3: En esta consulta se pone en mayúsculas la primera letra de cada palabra 
-- de la cadena especificada.

-- 8. Elabore una sentencia SELECT que muestre un listado de paises cuyo
-- nombre tenga una longitud minima de 10 caracteres.
SELECT * FROM PAIS_COAR WHERE LENGTH(NOMBRE_PAIS) >= 10;

-- 9. Explique el comportamiento de las siguientes sentencias:
-- Query 1: Rellena la cadena de la operacion por la izquierda hasta la 
-- longitud n que en este caso es 14 con el caracter definido el cual es un '*'.
-- Query 2: Rellena la cadena del resultado de la operacion por la derecha hasta 
-- la longitud n (14) con el caracter definido el cual es un '*'.
-- Query3: Rellena la cadena de la fecha actual del sitema  por la izquierda hasta 
-- la longitud n (14) con el caracter definido el cual es un '$#'. salida = '$#$#$#07/10/22'
-- Query 4: En este caso no se realiza un rellno ya que como la longitud hasta donde se desa rellenar es
-- 4 la cadena se corta hasta el caracter numero 4 es decir muestra la salida '07/1'.

-- 10. Explique el comportamiento de las siguientes sentencias:
-- Query 1: En esta consulta a la cadena que se muestra como resultado se le quita el caracter
-- 'e' del final, ya que con TRAILING quitamos por detras dicho caracter.
-- Query 2: En esta consulta se le quitan los asteriscos a la palabra tanto por atras como por adelante.
-- Query 3: En esta consulta nos muestra como resultado la fecha actual del sistema.

-- 11. Explique el comportamiento de las siguientes sentencias:
-- Query 1: Esta consulta remplaza los caracteres '#' de la cadena por '->'.
-- Query 2: Esta consulta remplaza los caracteres '#' de la cadena pero en este caso como 
-- no se le indica ningun argumento con algun carcter o algo para replazar el caracter '#' de la cadena
-- los carcteres '#' de la cadena son eliminados dando como resultado la cadena '13579'.

-- 12. Explique el comportamiento de las siguientes sentencias:
-- Query 1: Esta consulta redondea el numero de 1601.916718 a un decimal (1601.9).
-- Query 2: Esta consulta redondea el numero de 1601.916718 a dos decimales (1601.92).
-- Query 3: Esta consulta redondea el numero de 1601.916718 a los miles haste proceso se le conoce 
-- como escaldo es decir nos dara como resultado 2000.
-- Query 4: En esta consulta como no se le pasa un segundo argumento a la funcion el numero se 
-- redondea a cero decimales (1602).

-- 13. Explique el comportamiento de las siguientes sentencias:
-- Query 1: Esta consulta corta el numero (1601.916718) hasta el primer decimal que es 9 por
-- lo que nos da como resultado 1601.9.
-- Query 2: Esta consulta corta el numero (1601.916718) hasta el segundo decimal por lo que nos
-- da como resultado 1601.91.
-- Query 3: Esta consulta corta al numero hasta el 1000 porque se realiza un escalado a miles.
-- Query 4: En esta consulta como no se le pasa un segundo argumento a la funcion (TRUNC) el numero se 
-- corta a cero decimales (1602).

-- 14. Explique el comportamiento de las siguientes sentencias:
-- Query 1: Esta consulta calcula el modulo entre los numeros 6 y 2; la funcion MOD nos regresa el residuo
-- de dividir 6 entre 2 en cual en este caso es cero.
-- Query 2: Esta consulta calcula el modulo entre los numeros 5 y 3; la funcion MOD nos regresa el residuo
-- de dividir 5 entre 3 en cual en este caso es 2.
-- Query 3: ta consulta calcula el modulo entre los numeros 7 y 35; la funcion MOD nos regresa el residuo
-- de dividir 7 entre 35 en cual en este caso es 7.
-- Query 4: ta consulta calcula el modulo entre los numeros 5.2 y 3; la funcion MOD nos regresa el residuo
-- de dividir 5.2 entre 3 en cual en este caso es 2.2.

-- 15. Interprete el formato RR y el formato YY para cada ejemplo (llenar
-- cada espacio en blanco con el año en 4 dígitos (ej. 1995) según
-- corresponda).


-- 16. Elabore una sentencia SELECT que muestre el siguiente resultado.
SELECT ID_EMPLEADO,
       FECHA_CONTRATACION,
       (SYSDATE - FECHA_CONTRATACION) "TENENCIA",
       ADD_MONTHS(FECHA_CONTRATACION, 6) "REVISION",
       NEXT_DAY(FECHA_CONTRATACION, 7),
       LAST_DAY(FECHA_CONTRATACION)
FROM EMPLEADO_COAR;

-- 17. Elabore una sentencia SELECT que muestre el siguiente resultado.
SELECT ID_EMPLEADO,
       FECHA_CONTRATACION,
       ROUND(FECHA_CONTRATACION, 'MONTH'),
       TRUNC(FECHA_CONTRATACION, 'MONTH')
FROM EMPLEADO_COAR;
