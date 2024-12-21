select object_type,count(*) from user_objects group by object_type; 

select object_type,count(*) from all_objects group by object_type;

select distinct owner from all_objects;

select table_name,cluster_name,iot_type from user_tables;

-- Descripciones de las tablas
DESCRIBE REGIONS;
DESCRIBE COUNTRIES;
DESCRIBE LOCATIONS;
DESCRIBE DEPARTMENTS;
DESCRIBE JOBS;
DESCRIBE EMPLOYEES;
DESCRIBE JOB_HISTORY;

select column_name,data_type,nullable from user_tab_columns
where table_name='REGIONS';

select column_name,data_type,nullable from user_tab_columns
where table_name='COUNTRIES';

select column_name,data_type,nullable from user_tab_columns
where table_name='EMPLOYEES';


select column_name,data_type,nullable,data_length,data_precision, data_scale from
user_tab_columns where table_name='EMPLOYEES';

insert into emps select employee_id,last_name,salary,department_id
from employees;

COMMIT;

alter table emps modify (hired default sysdate);

insert into emps (empno,ename) values(99,'Newman');
select hired,count(1) from emps group by hired;

drop table emps;

create table emp as
select employee_id empno, last_name ename, department_id deptno
from employees;


create table dept as
select department_id deptno, department_name dname from departments;


DESCRIBE DEPT;
DESCRIBE EMP;

alter table emp add constraint emp_pk primary key (empno);
alter table dept add constraint dept_pk primary key (deptno);
alter table emp add constraint
dept_fk foreign key (deptno) references dept on delete set null;


insert into dept values(10,'New Department');
insert into emp values(9999,'New emp',99);
truncate table dept;

DROP TABLE EMP;
DROP TABLE DEPT;

CREATE TABLE EMPLOYEES_2 AS SELECT * FROM EMPLOYEES;

DESC EMPLOYEES_2;

ALTER TABLE EMPLOYEES_2 READ ONLY;

ALTER TABLE EMPLOYEES_2 ADD AGE DATE;

ALTER TABLE EMPLOYEES_2 READ WRITE;

DROP TABLE EMPLOYEES_2;

























