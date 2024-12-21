-- ACTIVIDAD: CAPITULO_04.
-- MATERIA: SISTEMAS DE BASE DE DATOS II.
-- NOMBRE: CRISITAN OMAR ALVARADO RODRIGUEZ.
-- GRUPO: 5"B"

-- 1. Escriba la sentencia SELECT necesaria para que muestre el siguiente resultado.
SELECT ID_EMPLEADO, 
       TO_CHAR(FECHA_CONTRATACION, 'MM/YY') "MONTH_HIRED"
FROM EMPLEADO_COAR WHERE ID_EMPLEADO = 206;

-- 2. Investigue y elabore un ejemplo sobre los siguientes elementos de fecha:

-- SCC o CC: Muestra dos digitos para el siglo correspondiente a una determinada fecha,
-- el SCC tmabien muestra el siglo pero si es anterior a Cristo lo indica con un signo de menos:
SELECT TO_CHAR(FECHA_CONTRATACION, 'CC') FROM EMPLEADO_COAR;

-- Years in dates YYYY, Año en formato de cuatro cifras, SYYYY 
-- Es Lo mismo que YYYY pero añade un menos "-" si la fecha es antes de Cristo:
SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY') FROM DUAL;

-- YYY año en formato de tres cifras, YY año en formato de dos cifras, Y ultimo dígito del año.
SELECT TO_CHAR(FECHA_CONTRATACION, 'DD/MM/YYY') FROM EMPLEADO_COAR;
SELECT TO_CHAR(SYSDATE, 'DD/MM/YY') FROM DUAL;
SELECT TO_CHAR(FECHA_CONTRATACION, 'DD/MM/Y') FROM EMPLEADO_COAR; 

-- Y,YYY: El año en cuatro cifras pero con seperador (coma despues del primer digito); 
-- Posición de los separadores, donde se pongan estos simbolo apareceran en el resultado.
-- La (Coma) devuelve una coma en la posición especificada.
SELECT TO_CHAR(FECHA_CONTRATACION, 'DD/MM/Y,YYY') FROM EMPLEADO_COAR;	

-- I, IY, IYY, IYYY: Año en formato de una, dos, tres o cuatro cifras segun el estandar ISO.
SELECT TO_CHAR(FECHA_CONTRATACION, 'DD/MM/I') FROM EMPLEADO_COAR; -- año una cifra.
SELECT TO_CHAR(FECHA_CONTRATACION, 'DD/MM/IY') FROM EMPLEADO_COAR; -- año dos cifras.
SELECT TO_CHAR(SYSDATE, 'DD/MM/IYY') FROM DUAL; -- año tres cifras.
SELECT TO_CHAR(SYSDATE, 'DD/MM/IYYY') FROM DUAL; -- año cuatro cifras.

-- YEAR o SYEAR: Year el año escrito en letra y en inglés, SYEAR es Igual que YEAR 
-- pero añade un signo de menos (-) si la fecha es antes de Cristo.
SELECT TO_CHAR(SYSDATE, 'Year') FROM DUAL; 

-- BC o AD: Indica BC (en español usará AC) o AD (en español DC) si el año es anterior
-- o posterior, respectivamente, al nacimiento de Jesucristo. 	
-- BC (Antes de Cristo) o AD (Después de cristo)
SELECT TO_CHAR(DATE '2070-09-10', 'DD-MM-YYYY AD') FROM DUAL;

-- B.C. o A.D.: Indica B.C.(Fecha antes de Cristo) o A.D. (Fecha después de cristo).
SELECT TO_CHAR(DATE '1789-11-12', 'DD-MM-YYYY B.C.') FROM DUAL;

-- Q: Indica el cuarto del año (cuatrimestre).
SELECT TO_CHAR(FECHA_CONTRATACION, 'DD-MM-YYYY Q') FROM EMPLEADO_COAR;

-- MM: Se muestra el mes en formato de dos cifras.
SELECT TO_CHAR(FECHA_CONTRATACION, 'DD/MM/YYYY') FROM EMPLEADO_COAR;

-- MONTH: Nombre completo del mes.
SELECT TO_CHAR(FECHA_CONTRATACION, 'DD "de" Month "del" YYYY') FROM EMPLEADO_COAR;

-- MON: Se muestran las tres primeras letras del mes.
SELECT TO_CHAR(FECHA_CONTRATACION, 'DD-Mon-YYYY') FROM EMPLEADO_COAR;

-- RM: Nos muestra el mes en numeros romanos.
SELECT TO_CHAR(SYSDATE, 'DD/RM/YYYY') FROM DUAL;

-- WW o W: la doble W nos muestra el numero de la semana con respecto al año y la W 
-- nos inidica el numero de la semana del mes.
SELECT TO_CHAR(FECHA_CONTRATACION, 'WW') FROM EMPLEADO_COAR;
SELECT TO_CHAR(FECHA_CONTRATACION, 'W') FROM EMPLEADO_COAR;

-- D dia de la semana (del 1 al 7), DD dia del mes en formato de dos cifras (del 1 al 31) y
-- DDD Día del año.
SELECT TO_CHAR(FECHA_CONTRATACION, 'D/MM/YYYY') FROM EMPLEADO_COAR;
SELECT TO_CHAR(FECHA_CONTRATACION, 'DD/MM/YYYY') FROM EMPLEADO_COAR;
SELECT TO_CHAR(SYSDATE, 'DDD') FROM DUAL;

-- DAY, Nombre en letra del dia.
SELECT TO_CHAR(SYSDATE, 'DAY') FROM DUAL; 

-- DY, Muestra el día de la semana en tres letra:
SELECT TO_CHAR(FECHA_CONTRATACION, 'DY') FROM EMPLEADO_COAR;

-- J, Día juliano. Número de días transcurridos desde el 31 de Diciembre del 4713 A.C.
SELECT TO_CHAR(FECHA_CONTRATACION, 'J') FROM EMPLEADO_COAR;

-- IW, Semana del año en formato ISO.
SELECT TO_CHAR(SYSDATE, 'IW') FROM DUAL;

-- 3. Escriba la sentencia SELECT necesaria para que muestre el siguiente resultado.
SELECT NOMBRE_EMPLEADO, 
       TO_CHAR(FECHA_CONTRATACION, 'ddspth "of" Month YYYY HH12:MI:SS AM') "HIRE_DATE"
FROM EMPLEADO_COAR;

-- 4. ¿En qué consiste el modificador fm?, Elabore un ejemplo.
-- SI anteponemos el texto fm a los códigos de formato 
-- (tanto para convertir fechas como para números), entonces se 
-- eliminan en el resultado todos los ceros a la izquierda que se 
-- obtenga y todos los espacios interiores.
SELECT TO_CHAR(FECHA_CONTRATACION, 'fmdd/month/yyyy') FROM EMPLEADO_COAR;

-- 5. ¿En qué consiste el modificador fx?, Elabore un ejemplo.
-- el prefijo fx en el texto con los códigos de conversión que obliga 
-- a que la expresión encaje exactamente con el modelo 
-- (de otro modo los ceros a la izquierda se ignoran).

-- Marca un error por que se encontro un caracter no numerico donde se esperaba un numero.
SELECT TO_DATE(SYSDATE, 'FXDD/MM/YYYY') FROM DUAL; 

-- Formato correto:
SELECT TO_DATE('20/06/2022', 'FXDD/MM/YYYY') FROM DUAL;

-- 6. Explique el resultado de la siguiente consulta:
-- Marca un error ya que el formato del mes no considen ya que el prefijo fx nos indica que los formatos deben de considir.
SELECT APELLIDO_EMPLEADO, FECHA_CONTRATACION
FROM EMPLEADO_COAR WHERE FECHA_CONTRATACION = TO_DATE('MAY 24, 2002', 'fxMonth DD, YYYY');

-- 7. Escriba la sentencia SELECT necesaria para mostrar la fecha y hora actual bajo el siguiente
-- formato: Hoy es: Martes 11 de Octubre de 2022 y son las: 11:50:00 AM.
SELECT TO_CHAR(SYSDATE, '"Hoy es:" Day fmDD "de" Month "del" YYYY "y son las:" HH12:MI:SS AM') 
"FECHA ACTUAL" FROM DUAL;

-- 8. Escriba la Sentencias SELECT para resolver el siguiente problema:
SELECT TO_CHAR(NEXT_DAY(ADD_MONTHS(FECHA_CONTRATACION, 6), 'VIERNES'),
       'fmDay, Month ddth, YYYY') "Next 6 Month Review"
FROM EMPLEADO_COAR ORDER BY  FECHA_CONTRATACION;

-- 9. Explique para que se utilizan las funciones NVL, NVL2, NULLIF y COALESCE y haga un
-- ejemplo de cada una usando la tabla dual.
-- FUNCION NVL:
-- > Convierte un valor nulo en un valor real.
-- > Los argumentos pueden ser de cualquier tipo de dato pero deben corresponder entre ellos, 
-- > entiendase que ambos deben ser del mismo tipo.
-- > arg1 es el valor o la expresión de origen que puede contener un valor nulo.
-- > arg2 es el valor de retorno si arg1 es nulo.
-- > Como retorna uno de los argumentos, el valor retornado es del mismo tipo que ellos.
SELECT NVL(TO_CHAR(COMICION_PCT),'No Tiene Comicion') FROM EMPLEADO_COAR;
SELECT NVL(COMICION_PCT, 0) "COMICION_PCT" FROM EMPLEADO_COAR;

-- FUNCION NVL2:
-- La funcion NVL2 examina la primera expresion. Si la primera expresion no es nula, 
-- la función NVL2 devuelve la segunda expresion. Si la primera expresion es nula, 
-- se devuelve la tercera expresion.
-- arg1 es el valor o la expresión de origen que puede contener un valor nulo.
-- arg2 es el valor que se devuelve si arg1 no es nulo.
-- arg3 es el valor que se devuelve si arg2 es nulo.
-- El argumento arg1 puede tener cualquier tipo de datos. Los argumentos arg2 y arg3 
-- pueden tener cualquier tipo de datos excepto LONG, si los tipos de datos del arg2 y arg3 
-- son diferentes, Oracle Server convierte el arg3 al tipo de datos de arg2 antes de compararlos 
-- a menos que el arg3 sea una constante nula.
SELECT NVL2(ID_JEFE, 'Tiene Jefe', 'No Tiene Jefe') FROM EMPLEADO_COAR;

SELECT NVL2(COMICION_PCT, 'SALARIO + COMICION', 'SOLO TINE SALARIO')
FROM EMPLEADO_COAR;

-- FUNCION NULLIF:
-- La función NULLIF compara dos expresiones, si son iguales la función devuelve un valor nulo. 
-- Si son diferentes, la función devuelve la primera expresion (arg1). 
-- arg1 es el valor de origen que se compara con el arg2.
-- arg2 es el valor de origen que se compara con el arg1 (Si no es igual que arg1, se devuelve arg1.).
-- No puede especificar el literal NULL para la primera expresión(arg1).
SELECT E.NOMBRE_EMPLEADO, NULLIF(H.ID_TRABAJO, E.ID_TRABAJO) "ID Del Trabajo Antiguo"
FROM EMPLEADO_COAR E, HISTORIAL_TAB_COAR H WHERE E.ID_EMPLEADO = H.ID_EMPLEADO
ORDER BY NOMBRE_EMPLEADO, 2;

-- FUNCION COALESCE:
-- Si la primera expresión no es nula, la función COALESCE devuelve esa expresión, en caso contrario, 
-- realiza una fusión (COALESCE) de las expresiones restantes.
-- arg1 devuelve esta expresión si no es nula.
-- arg2 devuelve esta expresión si la primera expresión es nula y esta expresión no lo es.
-- argn devuelve esta expresión si las expresiones precedentes son nulas.
-- Todas las expresiones deben ser del mismo tipo de datos.
-- Si todos los parámetros son Nulos, la función retorna NULL.
SELECT COMICION_PCT, ID_JEFE,
       COALESCE(COMICION_PCT, ID_JEFE, -1)
FROM EMPLEADO_COAR ORDER BY 2 DESC, 1 DESC;

-- 10. Escriba la sentencia SELECT necesaria para que muestre el siguiente resultado.
SELECT NOMBRE_EMPLEADO, SALARIO, COMICION_PCT,
       CASE WHEN  NVL(COMICION_PCT, 0) > 0 THEN SALARIO + (SALARIO * COMICION_PCT)
            ELSE SALARIO + 2000
       END "NUEVO SALARIO"
FROM EMPLEADO_COAR ORDER BY NOMBRE_EMPLEADO;

-- 11. Usando la función DECODE resuelva el siguiente ejercicio:
SELECT NOMBRE_EMPLEADO, SALARIO,
       DECODE(TRUNC(SALARIO/2000, 0),
              0, 0.00,
              1, 0.09,
              2, 0.20,
              3, 0.30,
              4, 0.40,
              5, 0.42,
              6, 0.44,
              0.45) "Impuesto Salarial"
FROM EMPLEADO_COAR ORDER BY 3 DESC;

-- 12. Escriba una sentencia SELECT que muestre SALARIO_BAJO si gana menos de 5000,
-- SALARIO MEDIO si gana 5000 o más y menos de 10000, SALARIO ALTO si gana 10000 o más.
SELECT NOMBRE_EMPLEADO, SALARIO,
  CASE WHEN SALARIO < 5000 THEN 'Salario Bajo'
       WHEN SALARIO >= 5000 AND SALARIO < 10000 THEN 'Salario Medio'
       WHEN SALARIO >= 10000 THEN 'Salario Alto'
       ELSE 'No Tiene Salario'
  END "TIPO SALARIO"
FROM EMPLEADO_COAR ORDER BY SALARIO DESC;

-- 13. Elabore una sentencia SELECT que muestre los datos generales y el nivel del salario que le
-- corresponde a cada empleado según su salario de acuerdo con la siguiente tabla:
SELECT NOMBRE_EMPLEADO, SALARIO,
  CASE WHEN SALARIO >= 1000 AND SALARIO < 3000 THEN 'A'
       WHEN SALARIO >= 3000 AND SALARIO < 6000 THEN 'B'
       WHEN SALARIO >= 6000 AND SALARIO < 10000 THEN 'C'
       WHEN SALARIO >= 10000 AND SALARIO < 15000 THEN 'D'
       WHEN SALARIO >= 15000 AND SALARIO < 25000 THEN 'E'
       WHEN SALARIO >= 25000 AND SALARIO <= 40000  THEN 'F'
       ELSE 'No Tiene Nivel Salario'
  END "NIVEL DE SALARIO"
FROM EMPLEADO_COAR ORDER BY SALARIO;
