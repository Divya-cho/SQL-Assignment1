create database sales;
use sales;

#creating products table
create table Products(product_id int primary key,product_name varchar(50),description char,price float,category char);
desc products;
select * from Products;

#creating Region table
create table Region(region_id int,name char);
alter table Region add primary key(region_id);
desc Region;
select * from Region;

#creating Time_period table
create table Time_period(time_period_id int primary key,name char);
desc Time_period;
select * from Time_period;

#creating Customer table
create table Customer(customer_id int primary key,name varchar(25),Address char,age int,Loyality_status varchar(25));
desc Customer;
select * from Customer;

#creating Purchase table
create table Purchase(purchase_id int primary key,customer_id int,time_period_id int,total_purchase_amount int);
alter table Purchase add constraint foreign key(customer_id) references Customer(customer_id);
alter table Purchase add constraint foreign key(time_period_id) references Time_period(time_period_id);
desc Purchase;
select * from Purchase;

#creating Inventory table
create table Inventory(inventory_id int primary key,product_id int,stock_level int);
alter table Inventory add constraint foreign key(product_id) references Products(product_id);
desc Inventory;
select * from Inventory;

#creating Purchase_product table
create table Purchase_product(purchase_id int,product_id int);
alter table Purchase_product add primary key(purchase_id,product_id);
alter table Purchase_product add constraint foreign key(purchase_id) references Purchase(purchase_id);
alter table Purchase_product add constraint foreign key(product_id) references Products(product_id);
desc Purchase_product;
select * from Purchase_product;

#creating Product_region table
create table Product_region(product_id int,region_id int);
alter table Product_region add primary key(product_id,region_id);
alter table Product_region add constraint foreign key(product_id) references Purchase(purchase_id);
alter table Product_region add constraint foreign key(region_id) references Products(product_id);
desc Product_region;
select * from Product_region;
