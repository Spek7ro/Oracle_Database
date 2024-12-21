-- Practica 4, Actividad 5
--  Sesion A

CREATE SEQUENCE SEQ1 
    START WITH 10 nocache maxvalue
    15 cycle;

SELECT SEQ1.NEXTVAL FROM DUAL; 
SELECT SEQ1.NEXTVAL FROM DUAL;
SELECT SEQ1.NEXTVAL FROM DUAL;
SELECT SEQ1.NEXTVAL FROM DUAL;
SELECT SEQ1.NEXTVAL FROM DUAL;

create table seqtest(c1 number,c2 varchar2(10));
alter table seqtest add constraint seqtest_pk
primary key (c1);

create sequence seqtest_pk_s;

insert into seqtest
values(seqtest_pk_s.nextval,'first');
commit;


insert into seqtest
values(seqtest_pk_s.nextval,'third');
commit;
