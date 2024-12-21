-- Practica 4, Actividad 6

CREATE TABLE EMPS AS SELECT * FROM HR.EMPLOYEES;

DESCRIBE EMPS;

CREATE UNIQUE INDEX EMPS_EMPID_I ON EMPS(EMPLOYEE_ID);

insert into emps(employee_id,last_name,email,hire_date,job_id)
values(198,'Watson','jw@bplc.co.za',sysdate,'IT_PROG');

create index emps_name_i on emps(last_name,first_name);
create index emps_tel_i on emps(phone_number);
create bitmap index emps_mgr_i on emps(manage_id);
create bitmap index emps_dept_i on emps(department_id);

alter table emps add constraint emps_pk primary key (employee_id);
alter table emps add constraint emps_email_uk unique(email);
alter table emps add constraint emps_tel_uk unique(phone_number);


