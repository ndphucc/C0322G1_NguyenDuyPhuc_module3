create database demo;

use demo;

-- Tạo bảng Products với các trường dữ liệu sau:

create table products(
	id int primary key,
	product_code varchar(20),
	product_name varchar(45),
	product_price double,
	product_amount int,
	product_description varchar(45),
	product_status varchar(45)
);
insert into products values
(1,'code_1','name1',20,1,'aa','bb'),
(2,'code_2','name2',20,1,'aa','bb');
 
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)

create unique index index_product_code on products(product_code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)

create index index_2 on products(product_name,product_price);

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.

create view product_view as 
select product_code, product_name, product_price, product_status from products;

-- Tiến hành sửa đổi view

create or replace view product_view as
select product_code from products;

-- Tiến hành xoá view

drop view product_view;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product

delimiter //
create procedure display()
begin
	select * from products;
end
// delimiter ;    

-- Tạo store procedure thêm một sản phẩm mới

delimiter //
create procedure add_product(id int,product_name varchar(45))
begin 
	insert into demo.products (id, product_name) values
    (id, product_name);
end
// delimiter ;   
 
-- Tạo store procedure xoá sản phẩm theo id

delimiter //
create procedure delete_product(id_remove int)
begin 
	delete from products 
    where id = id_remove;
end
// delimiter ;

call display(); 

call delete_product(3);    