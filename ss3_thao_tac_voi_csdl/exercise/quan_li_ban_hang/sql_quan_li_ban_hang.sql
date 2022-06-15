use ss3_quan_ly_ban_hang;
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select `order`.o_id,o_date,p_price from `order`
right join oder_detail on `order`.o_id = oder_detail.o_id
left join product on oder_detail.p_id= product.p_id;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select customer.c_name,product.p_name from customer
join `order` on customer.c_id= `order`.c_id
join oder_detail on `order`.o_id = oder_detail.o_id
join product on oder_detail.p_id= product.p_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select customer.c_id,c_name from customer
left join  `order` on customer.c_id= `order`.c_id
where `order`.o_id is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select `order`.o_id,o_date,sum(od_qty*p_price) as gia_tien from `order`
 join oder_detail on `order`.o_id= oder_detail.o_id
 join product on oder_detail.p_id= product.p_id
 group by oder_detail.o_id;

