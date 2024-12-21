-- PRACTICE 06, ACTIVITY 10

INSERT INTO MY_EMPLOYEE (ID, LAST_NAME, FIRST_NAME, USERID, SALARY)
VALUES (&ID, '&LAST_NAME', '&FIRST_NAME', SUBSTR(FIRST_NAME, 0,1) || ' ' || LAST_NAME, &SALARY);

CREATE OR REPLACE FUNCTION GET_USERID (
    F_NAME VARCHAR2,
    L_NAME VARCHAR2
)
RETURN VARCHAR2
IS 
    RET VARCHAR2(50);
BEGIN
    SELECT SUBSTR(FIRST_NAME, 0,1) || ' ' || LAST_NAME INTO RET FROM MY_EMPLOYEE 
    WHERE FIRST_NAME =  F_NAME AND LAST_NAME = L_NAME;
    RETURN RET;
END GET_USERID;

SELECT GET_USERID(FIRST_NAME, LAST_NAME) FROM MY_EMPLOYEE;
