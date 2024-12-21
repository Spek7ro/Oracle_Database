-- PRACTICA 06, ACTIVIDAD 09:
-- SESSION 02.
SELECT * FROM regions;

INSERT INTO regions VALUES (101, 'GB');

SELECT * FROM regions;

ROLLBACK;

SELECT * FROM regions;

DELETE FROM regions WHERE region_id=101;

SELECT * FROM regions;

COMMIT;

SELECT * FROM regions;
