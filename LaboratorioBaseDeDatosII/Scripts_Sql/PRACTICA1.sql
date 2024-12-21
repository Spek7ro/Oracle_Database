-- Practica #01_ACT04: Inventario
-- Materia: Laboratorio de Base de Datos
-- Alumno: Cristian Omar Alvarado Rodriguez

CREATE TABLE ASSET_TYPES (
    ASSET_TYPE_CODE CHAR(8) CONSTRAINT ASSET_TYPE_CODE_PK PRIMARY KEY,
    ASSET_TYPE_DESCRIPTION VARCHAR2(30) CONSTRAINT ASSET_TYPE_DESCRIPTION_NN NOT NULL

);

SELECT * FROM ASSET_TYPES;

CREATE TABLE IT_ASSETS (
    ASSET_ID NUMBER(5),
    ASSET_TYPE_CODE CHAR(8),
    DESCRIPTIONS VARCHAR2(30) CONSTRAINT DESCRIPTION_NN NOT NULL,
    OTHER_DETAILS VARCHAR2(30) CONSTRAINT OTHER_DETAILS_NN NOT NULL,
    CONSTRAINT IT_ASSETS_PK PRIMARY KEY (ASSET_ID),
    CONSTRAINT ASSET_TYPE_FK FOREIGN KEY (ASSET_TYPE_CODE) REFERENCES ASSET_TYPES (ASSET_TYPE_CODE) 
);

SELECT * FROM IT_ASSETS;

CREATE TABLE IT_ASSETS_INVENTORY (
    IT_ASSETS_INVENTORY_ID NUMBER(5) CONSTRAINT IT_ASSETS_INVENTORY_ID_PK PRIMARY KEY,
    ASSET_ID NUMBER(5),
    INVENTORY_DATE DATE CONSTRAINT INVENTORY_DATE_NN NOT NULL,
    NUMBER_ASSIGNED NUMBER(5) CONSTRAINT NUM_ASSIGNED_NN NOT NULL,
    NUMBER_IN_STOCK NUMBER(5) CONSTRAINT NUM_IN_STOCK_NN NOT NULL,
    OTHER_DETAILS VARCHAR2(30) CONSTRAINT OTHER_DETAILS_INV_NN NOT NULL,
    CONSTRAINT ASSET_FK FOREIGN KEY (ASSET_ID) REFERENCES IT_ASSETS (ASSET_ID)
);

SELECT * FROM IT_ASSETS_INVENTORY;

CREATE TABLE EMPLOYEES (
    EMPLOYEE_ID NUMBER(5) CONSTRAINT EMPLOYEE_ID_PK PRIMARY KEY,
    FRIST_NAME VARCHAR2(30) CONSTRAINT FIRST_NAME_NN NOT NULL,
    LAST_NAME VARCHAR2(30) CONSTRAINT LAST_NAME_NN NOT NULL,
    DEPARTMENT VARCHAR2(45) CONSTRAINT DEPARTMENT_NN NOT NULL,
    EXTENSION NUMBER(3) CONSTRAINT EXTENSION_NN NOT NULL,
    CELL_MOBILE VARCHAR2(10) CONSTRAINT CELL_MOBILE_NN NOT NULL,
    EMAIL_ADDRESS VARCHAR2(45) CONSTRAINT EMAIL_ADDRESS_NN NOT NULL,
    OTHER_DETAILS VARCHAR2(30) CONSTRAINT OTHER_DETAILS_EMP_NN NOT NULL
);

SELECT * FROM EMPLOYEES;

CREATE TABLE EMPLOYEE_ASSETS (
    ASSET_ID NUMBER(5),
    EMPLOYEE_ID NUMBER(5),
    DATE_OUT DATE,
    CONSTRAINT EMPLOYEE_ASSETS_PK PRIMARY KEY (ASSET_ID, EMPLOYEE_ID, DATE_OUT),
    CONSTRAINT ASSET_EMP_FK FOREIGN KEY (ASSET_ID) REFERENCES IT_ASSETS (ASSET_ID),
    CONSTRAINT EMPLOYEE_FK FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEES (EMPLOYEE_ID)
);

SELECT * FROM EMPLOYEE_ASSETS;
