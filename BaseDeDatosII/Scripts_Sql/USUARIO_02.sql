-- ####### ESCENARIOS PARA EL ESQUEMA RH_COAR ########
-- USUARIO 02: HOTEL_COAR.

-- ESCENARIO 03:
SELECT * FROM HR_COAR.EMPLEADO_COAR;
SELECT * FROM HR_COAR.EMPLEADO_COAR;

-- ESCENARIO 04:
SELECT * FROM HR_COAR.EMPLEADO_COAR;
UPDATE HR_COAR.EMPLEADO_COAR SET SALARIO = 4800 WHERE ID_EMPLEADO = 200;
SELECT * FROM HR_COAR.EMPLEADO_COAR;
COMMIT;
SELECT * FROM HR_COAR.EMPLEADO_COAR;

-- ####### ESCENARIOS PARA EL ESQUEMA HOTEL_COAR ########
-- USUARIO 02: RH_COAR.

-- ESCENARIO 03:
SELECT * FROM HOTEL_COAR.HABITACION_COAR;
SELECT * FROM HOTEL_COAR.HABITACION_COAR;

-- ESCENARIO 04:
SELECT * FROM HOTEL_COAR.HABITACION_COAR;
UPDATE HOTEL_COAR.HABITACION_COAR SET NOMBRE = 'ESTUDIO' WHERE ID_HABITACION = 2;
SELECT * FROM HOTEL_COAR.HABITACION_COAR;
COMMIT;
SELECT * FROM HOTEL_COAR.HABITACION_COAR;