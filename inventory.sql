
SELECT datname FROM pg_database;

drop table prod_order;
drop table customer;
drop table product;
drop table supplier;

create table product (
	p_id serial primary key,
	prod_id varchar(6) not null,
	prod_name varchar(15) not null,
	prod_price decimal(10,2) not null,
	prod_quantity int not null,
	prod_description varchar(20),
	created_date timestamp,
	updated_date timestamp,
	created_by varchar(20),
	updated_by varchar(20)
);
create table supplier (
	s_id serial primary key,
	supp_id varchar(6) not null,
	supp_name varchar(15) not null,
	supp_mob_no varchar(12) not null,
	created_date timestamp,
	updated_date timestamp,
	created_by varchar(20),
	updated_by varchar(20)
);

create table customer (
	c_id serial primary key,
	cus_id varchar(6) not null,
	cus_name varchar(15) not null,
	cus_mob_no varchar(12) not null,
	cus_address varchar(25) not null,
	cus_email varchar(25),
	created_date timestamp,
	updated_date timestamp,
	created_by varchar(20),
	updated_by varchar(20)
);

create table prod_order (
 	o_id serial primary key,
	order_id varchar(6) not null,
	order_date date,
	product_id int references product(p_id),
	customer_id int references customer(c_id),
	created_date timestamp,
	updated_date timestamp,
	created_by varchar(20),
	updated_by varchar(20)
 );
 
alter table product
add column supplier_id int;

alter table product 
add constraint supplier_id
foreign key (supplier_id)
references  supplier(s_id);

create index idx_supplier_id_product 
on product (supplier_id);

create index idx_customer_id_prod_order
on prod_order (customer_id);

insert into product (prod_id, prod_name, prod_price, prod_quantity, prod_description, created_date, updated_date, created_by, updated_by)
values
('P001', 'pen', 25, 100, 'smooth flow', NOW(), NOW(), 'Admin', 'Admin'),
('P002', 'bottle', 200.15, 75, 'good grip', NOW(), NOW(), 'Admin', 'Admin'),
('P003', 'bag', 850, 50, 'nice quality', NOW(), NOW(), 'Admin', 'Admin'),
('P004', 'iphone', 500000, 23, '', NOW(), NOW(), 'Admin', 'Admin'),
('P005', 'earphone', 650.85, 30, 'noise cancellation', NOW(), NOW(), 'Admin', 'Admin');

insert into supplier (supp_id, supp_name, supp_mob_no, created_date, updated_date, created_by, updated_by)
values
('S001', 'kumar', '1234567890', NOW(), NOW(), 'Admin', 'Admin'),
('S002', 'ravi', '9876543210', NOW(), NOW(), 'Admin', 'Admin'),
('S003', 'deepa', '5554443332', NOW(), NOW(), 'Admin', 'Admin');

insert into customer (cus_id, cus_name, cus_mob_no, cus_address, cus_email, created_date, updated_date, created_by, updated_by)
values
('C001', 'Priya', '1112223333', '123 Main St', 'customer1@example.com', NOW(), NOW(), 'Admin', 'Admin'),
('C002', 'Kiran', '4445556666', '456 Elm St', 'customer2@example.com', NOW(), NOW(), 'Admin', 'Admin'),
('C003', 'Rahul', '7778889999', '789 Oak St', 'customer3@example.com', NOW(), NOW(), 'Admin', 'Admin'),
('C004', 'Neha', '1113335555', '234 Cedar St', 'customer4@example.com', NOW(), NOW(), 'Admin', 'Admin'),
('C005', 'Sonia', '9998887777', '567 Pine St', 'customer5@example.com', NOW(), NOW(), 'Admin', 'Admin');


insert into prod_order (order_id, order_date, product_id, customer_id, created_date, updated_date, created_by, updated_by)
values
('ORD001', '2023-01-15', 15, 11, NOW(), NOW(), 'Admin', 'Admin'),
('ORD002', '2023-02-20', 13, 12, NOW(), NOW(), 'Admin', 'Admin'),
('ORD003', '2023-03-10', 11, 13, NOW(), NOW(), 'Admin', 'Admin'),
('ORD004', '2023-04-05', 14, 14, NOW(), NOW(), 'Admin', 'Admin'),
('ORD005', '2023-05-18', 11, 15, NOW(), NOW(), 'Admin', 'Admin'),
('ORD006', '2023-06-22', 12, 11, NOW(), NOW(), 'Admin', 'Admin'),
('ORD007', '2023-07-08', 14, 12, NOW(), NOW(), 'Admin', 'Admin'),
('ORD008', '2023-08-14', 13, 13, NOW(), NOW(), 'Admin', 'Admin'),
('ORD009', '2023-09-25', 12, 14, NOW(), NOW(), 'Admin', 'Admin'),
('ORD010', '2023-10-30', 12, 15, NOW(), NOW(), 'Admin', 'Admin');

select * from customer;

select sum(prod_quantity) 
from product p;

select count(order_id) 
from prod_order po 
group by customer_id;

select p.p_id, p.prod_name, o.o_id, o.order_id, o.order_date
from product p
inner join prod_order o on p.p_id = o.product_id;

select c.c_id, c.cus_name, o.o_id, o.order_id, o.order_date
from customer c
left join prod_order o on c.c_id = o.customer_id;
