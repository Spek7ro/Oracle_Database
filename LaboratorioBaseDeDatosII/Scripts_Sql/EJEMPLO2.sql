-- Practica 02, Actividad 7

CREATE TABLE EMPLOYEE (
    EMPLOYEE_ID NUMBER(6),
    FRIST_NAME VARCHAR2(35) CONSTRAINT EMPLOYEE_FRIST_NAME_NN NOT NULL,
    LAST_NAME VARCHAR2(35) CONSTRAINT EMPLOYEE_LAST_NAME_NN NOT NULL,
    EMAIL VARCHAR2(55) CONSTRAINT EMPL_EMAIL_NN NOT NULL CONSTRAINT EMPLOYEE_EMAIL_UK UNIQUE,
    PHONE_NUMBER VARCHAR2(10) CONSTRAINT EMPL_PHONE_NUMBER_NN NOT NULL,
    HIRE_DATE DATE CONSTRAINT EMPL_HIRE_DATE_NN NOT NULL,
    SALARY NUMBER(8,2) CONSTRAINT EMPL_SALARY_NN NOT NULL
);

SELECT * FROM EMPLOYEE;

CREATE TABLE JOB (
    JOB_ID NUMBER(4),
    JOB_NAME VARCHAR2(35) CONSTRAINT JOB_JNAME_NN NOT NULL,
    MIN_SALARY NUMBER(6) CONSTRAINT JOB_MIN_SALARY_NN NOT NULL,
    MAX_SALARY NUMBER(6) CONSTRAINT JOB_MAX_SALARY_NN NOT NULL
);

SELECT * FROM JOB;

CREATE TABLE BRANCH (
    BRANCH_ID NUMBER(4),
    BRANCH_NAME VARCHAR2(45) CONSTRAINT BRANCH_BNAME_NN NOT NULL,
    BRANCH_LOCATION VARCHAR2(55) CONSTRAINT BRANCH_BLOCATION_NN NOT NULL
);

SELECT * FROM BRANCH;

CREATE TABLE WORKS_ON (
    EMPLOYEE_ID NUMBER(6),
    JOB_ID NUMBER(4),
    BRANCH_ID NUMBER(4),
    START_DATE DATE CONSTRAINT WORKS_ON_SDATE_NN NOT NULL,
    END_DATE DATE CONSTRAINT WORKS_ON_EDATE_NN NOT NULL
);

SELECT * FROM WORKS_ON;

CREATE TABLE MANAGER (
    MANAGER_ID NUMBER(6),
    FRIST_NAME VARCHAR2(35) CONSTRAINT MNG_FRIST_NAME_NN NOT NULL,
    LAST_NAME VARCHAR2(35) CONSTRAINT MNG_LAST_NAME_NN NOT NULL,
    EMAIL VARCHAR2(55) CONSTRAINT MNG_EMAIL_NN NOT NULL,
    PHONE_NUMBER VARCHAR2(10) CONSTRAINT MNG_PHONE_NUMBER_NN NOT NULL
);

SELECT * FROM MANAGER;

CREATE TABLE MANAGES (
    DATE_ASSIGNMENTDATE DATE,
    MANAGER_ID NUMBER(6),
    START_DATE DATE
);

SELECT * FROM MANAGES;

-- ADD PRIMARY KEYS
ALTER TABLE EMPLOYEE ADD CONSTRAINT EMPLOYEE_PK PRIMARY KEY (EMPLOYEE_ID);
ALTER TABLE JOB ADD CONSTRAINT JOB_PK PRIMARY KEY (JOB_ID);
ALTER TABLE BRANCH ADD CONSTRAINT BRANCH_PK PRIMARY KEY (BRANCH_ID);
ALTER TABLE WORKS_ON ADD CONSTRAINT WORKS_ON_PK PRIMARY KEY (START_DATE);
ALTER TABLE MANAGER ADD CONSTRAINT MANAGER_PK PRIMARY KEY (MANAGER_ID);
ALTER TABLE MANAGES ADD CONSTRAINT MANAGES_PK PRIMARY KEY (DATE_ASSIGNMENTDATE);

-- ADD FOREIGN KEYS
ALTER TABLE WORKS_ON ADD CONSTRAINT EMPL_WORKS_ON_FK FOREIGN KEY (EMPLOYEE_ID) 
                         REFERENCES EMPLOYEE(EMPLOYEE_ID);

ALTER TABLE WORKS_ON ADD CONSTRAINT JOB_WORKS_ON_FK FOREIGN KEY (JOB_ID)
                         REFERENCES JOB(JOB_ID);

ALTER TABLE WORKS_ON ADD CONSTRAINT BRANCH_WORKS_ON_FK FOREIGN KEY (BRANCH_ID)
                         REFERENCES BRANCH(BRANCH_ID);

ALTER TABLE MANAGES ADD CONSTRAINT MANAGES_MANGER_FK FOREIGN KEY (MANAGER_ID)
                         REFERENCES MANAGER(MANAGER_ID);

ALTER TABLE MANAGES ADD CONSTRAINT MANAGES_WORKS_ON_FK FOREIGN KEY (START_DATE)
                         REFERENCES WORKS_ON(START_DATE);
