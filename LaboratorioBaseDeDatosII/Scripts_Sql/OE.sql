-- PRACTICA 06, ACTIVIDAD 03

insert into customers
(customer_id,cust_first_name,cust_last_name)
values((select max(customer_id)+1 from customers),'John','Watson');


update customers set credit_limit=(select avg(credit_limit)
from customers) where cust_last_name='Watson';

insert into customers(customer_id,cust_first_name,cust_last_name,credit_limit)
select customer_id+1,cust_first_name,cust_last_name,credit_limit
from customers where cust_last_name='Watson';

update customers set cust_last_name='Ramklass',cust_first_name='Roopesh'
where customer_id=(select max(customer_id) from customers);

COMMIT;

select customer_id,cust_last_name from customers
where cust_last_name in ('Watson','Ramklass') for update;

COMMIT;

truncate table customers;

select max(customer_id) from customers;
