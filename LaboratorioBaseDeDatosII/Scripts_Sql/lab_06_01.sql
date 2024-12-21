-- PRACTICE 06, ACTIVITY 10

CREATE TABLE MY_EMPLOYEE (
    ID NUMBER(4) CONSTRAINT MY_EMPLOYEE_PK PRIMARY KEY,
    LAST_NAME VARCHAR2(25),
    FIRST_NAME VARCHAR2(25),
    USERID VARCHAR2(8),
    SALARY NUMBER(9,2)
);

DESC MY_EMPLOYEE;

INSERT INTO MY_EMPLOYEE (ID, LAST_NAME, FIRST_NAME, USERID, SALARY)
VALUES (1, 'Patel', 'Ralph', 'rpatel', 895);

INSERT INTO MY_EMPLOYEE VALUES (2, 'Dancs', 'Betty', 'bdancs', 860);

SELECT * FROM MY_EMPLOYEE;

COMMIT;

UPDATE MY_EMPLOYEE SET LAST_NAME = 'Drexler' WHERE ID = 3;

UPDATE MY_EMPLOYEE SET SALARY = 1000 WHERE SALARY < 900;

SELECT * FROM MY_EMPLOYEE;

DELETE FROM MY_EMPLOYEE WHERE FIRST_NAME = 'Betty' AND LAST_NAME = 'Dancs';

SELECT * FROM MY_EMPLOYEE;

COMMIT;

SELECT * FROM MY_EMPLOYEE;

SAVEPOINT POINT_01;

DELETE FROM MY_EMPLOYEE;

SELECT * FROM MY_EMPLOYEE;

ROLLBACK TO POINT_01;

SELECT * FROM MY_EMPLOYEE;

COMMIT;
