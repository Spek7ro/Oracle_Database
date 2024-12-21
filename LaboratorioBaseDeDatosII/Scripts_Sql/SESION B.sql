-- Practica 4, Actividad 5
--  Sesion B

SELECT SEQ1.NEXTVAL FROM DUAL;
SELECT SEQ1.NEXTVAL FROM DUAL;
SELECT SEQ1.NEXTVAL FROM DUAL;
SELECT SEQ1.NEXTVAL FROM DUAL;
SELECT SEQ1.NEXTVAL FROM DUAL;

insert into seqtest
values(seqtest_pk_s.nextval,'second');

rollback;

select * from seqtest;

drop table seqtest;
drop sequence seqtest_pk_s;
drop sequence seq1;

