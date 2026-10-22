{# 
Q1. You forgot to add a phone_number column. How would you add it?
Q2. How would you rename city to customer_city?
Q3. How would you change the datatype of customer_id from INT to BIGINT?
Q4. How would you remove the email column?
Q5. How would you rename the table customers to customer_master? #}



CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);
drop table customer_master;

alter table customers add phone_number VARCHAR(15);
alter table customers rename city to new_city;
alter table customers alter column customer_id type BIGINT;
alter table customers drop column email;
alter table customers rename to customer_master;
select * from customer_master;


------------------
{# 
Q6. Insert one customer:
customer_id = 101
customer_name = Gaurav
email = gaurav@gmail.com
city = Nashik #}

insert into customers(customer_id, customer_name, email, city) values (101,'Gaurav','gauravabhoi@gmail.com','Nashik');
select * from customers;

insert into customers(customer_id, customer_name) values (101,'Praful');