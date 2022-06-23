use furama;

-- 2.Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.

select * from nhan_vien
where (ho_ten like 'H%' or ho_ten like 'K%' or ho_ten like 'T%' )and char_length(ho_ten)<=15; 

-- 3.Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

select * from khach_hang
where ((year(current_date())-year((ngay_sinh))) between 18 and 50 )and (dia_chi like '%Đà Nẵng%' or dia_chi like'%Quảng Trị%');

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
--  Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select khach_hang.ma_khach_hang, khach_hang.ho_ten, count(hop_dong.ma_khach_hang)as so_lan_dat_phong from khach_hang 
join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
where loai_khach.ten_loai_khach='Diamond'
group by ma_khach_hang
order by so_lan_dat_phong;

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, 
-- tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem,
--  hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

select khach_hang.ma_khach_hang,khach_hang.ho_ten,loai_khach.ten_loai_khach,hop_dong.ma_hop_dong,dich_vu.ten_dich_vu,hop_dong.ngay_lam_hop_dong,hop_dong.ngay_ket_thuc, sum(ifnull(dich_vu.chi_phi_thue, 0) + ifnull(hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia, 0)) as tong_tien
from khach_hang
left join hop_dong on hop_dong.ma_khach_hang =khach_hang.ma_khach_hang
left join loai_khach on loai_khach.ma_loai_khach =khach_hang.ma_loai_khach
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
left join dich_vu_di_kem on  hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem 
left join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where hop_dong.ma_hop_dong is not null
group by hop_dong.ma_hop_dong
union 
select khach_hang.ma_khach_hang,khach_hang.ho_ten,loai_khach.ten_loai_khach,hop_dong.ma_hop_dong,dich_vu.ten_dich_vu,hop_dong.ngay_lam_hop_dong,hop_dong.ngay_ket_thuc, '0' as tong_tien
from khach_hang
left join hop_dong on hop_dong.ma_khach_hang =khach_hang.ma_khach_hang
left join loai_khach on loai_khach.ma_loai_khach =khach_hang.ma_loai_khach
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
left join dich_vu_di_kem on  hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem 
left join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where hop_dong.ma_hop_dong is null
order by ma_khach_hang,tong_tien;

-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng
--  thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

select DV.ma_dich_vu, DV.ten_dich_vu, DV.dien_tich, DV.chi_phi_thue, LDV.ten_loai_dich_vu from dich_vu DV
join loai_dich_vu LDV on LDV.ma_loai_dich_vu = DV.ma_loai_dich_vu
join hop_dong HD on HD.ma_dich_vu= DV.ma_dich_vu 
where  DV.ma_dich_vu not in(
select DV.ma_dich_vu from dich_vu DV
join loai_dich_vu LDV on LDV.ma_loai_dich_vu = DV.ma_loai_dich_vu
join hop_dong HD on HD.ma_dich_vu= DV.ma_dich_vu
where HD.ngay_lam_hop_dong between '2021-01-01' and '2021-03-31')
group by DV.ma_dich_vu;

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
--  của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

select DV.ma_dich_vu, DV.ten_dich_vu, DV.dien_tich, DV.chi_phi_thue, LDV.ten_loai_dich_vu from dich_vu DV
join loai_dich_vu LDV on DV.ma_loai_dich_vu = LDV.ma_loai_dich_vu
join hop_dong HD on DV.ma_dich_vu = HD.ma_dich_vu
where year(HD.ngay_lam_hop_dong) = 2020 and DV.ma_dich_vu not in (
select DV.ma_dich_vu from dich_vu DV
join hop_dong HD on DV.ma_dich_vu = HD.ma_dich_vu
where year(HD.ngay_lam_hop_dong) = 2021)
group by DV.ma_dich_vu;

-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.

-- cách 1:
select * from khach_hang 
group by ho_ten;

-- 5cách 2:
select distinct ho_ten from khach_hang;  
 
 -- cách 3
 select ho_ten from khach_hang
 union
 select ho_ten from khach_hang;
 
 -- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng 
 -- thực hiện đặt phòng.

 select month(ngay_lam_hop_dong) as thang, count(month(ngay_lam_hop_dong)) as so_luong_khach_hang  from hop_dong HD
 join khach_hang KH on HD.ma_khach_hang = KH.ma_khach_hang
 where year(ngay_lam_hop_dong) = 2021
 group by month(ngay_lam_hop_dong)
 order by thang;
 
-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong,
-- ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

select HD.ma_hop_dong,HD.ngay_lam_hop_dong,HD.ngay_ket_thuc,HD.tien_dat_coc, ifnull(sum(HDCT.so_luong),0) as so_luong_dich_vu_di_kem  from hop_dong HD
left join hop_dong_chi_tiet HDCT on HDCT.ma_hop_dong = HD.ma_hop_dong
group by HD.ma_hop_dong;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” 
-- và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

select DVDK.ma_dich_vu_di_kem, DVDK.ten_dich_vu_di_kem from dich_vu_di_kem DVDK
join hop_dong_chi_tiet HDCT on DVDK.ma_dich_vu_di_kem = HDCT.ma_dich_vu_di_kem
join hop_dong HD on HDCT.ma_hop_dong = HD.ma_hop_dong
join khach_hang KH on HD.ma_khach_hang = KH.ma_khach_hang
join loai_khach LK on KH.ma_loai_khach = LK.ma_loai_khach
where ten_loai_khach = 'Diamond' and ( dia_chi like '%Vinh%' or dia_chi like '%Quảng Ngãi%'); 

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu,
--  so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ
--  đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

select HD.ma_hop_dong, NV.ho_ten, KH.ho_ten, KH.so_dien_thoai, DV.ten_dich_vu, sum(ifnull(HDCT.so_luong,0)) as so_luong_dich_vu_di_kem, HD.tien_dat_coc from hop_dong HD
join nhan_vien NV on HD.ma_nhan_vien = NV.ma_nhan_vien
join khach_hang KH on HD.ma_khach_hang = KH.ma_khach_hang
left join hop_dong_chi_tiet HDCT on HD.ma_hop_dong = HDCT.ma_hop_dong
join dich_vu DV on HD.ma_dich_vu = DV.ma_dich_vu
left join dich_vu_di_kem DVDK on HDCT.ma_dich_vu_di_kem = DVDK.ma_dich_vu_di_kem
where (month(HD.ngay_lam_hop_dong) between 10 and 12 ) and year(HD.ngay_lam_hop_dong) = 2020 and HD.ma_hop_dong not in(
select HD.ma_hop_dong from hop_dong 
where (month(HD.ngay_lam_hop_dong) between 1 and 6 ) and year(HD.ngay_lam_hop_dong) = 2021)
group by HD.ma_hop_dong ;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

select DVDK.ma_dich_vu_di_kem, DVDK.ten_dich_vu_di_kem,sum(HDCT.so_luong) from dich_vu_di_kem DVDK
right join hop_dong_chi_tiet HDCT on HDCT.ma_dich_vu_di_kem = DVDK.ma_dich_vu_di_kem
group by ma_dich_vu_di_kem
having sum(HDCT.so_luong) >= all (select (sum(HDCT.so_luong)) from dich_vu_di_kem DVDK
join hop_dong_chi_tiet HDCT on HDCT.ma_dich_vu_di_kem = DVDK.ma_dich_vu_di_kem
group by HDCT.ma_dich_vu_di_kem);

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung 
-- (được tính dựa trên việc count các ma_dich_vu_di_kem).

select DVDK.ma_dich_vu_di_kem, DVDK.ten_dich_vu_di_kem,sum(HDCT.so_luong) from dich_vu_di_kem DVDK
right join hop_dong_chi_tiet HDCT on HDCT.ma_dich_vu_di_kem = DVDK.ma_dich_vu_di_kem
group by ma_dich_vu_di_kem
having sum(HDCT.so_luong) = 1; 

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai,
-- dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

select NV.ma_nhan_vien, NV.ho_ten, TD.ten_trinh_do, BP.ten_bo_phan, NV.so_dien_thoai, NV.dia_chi from nhan_vien NV
join trinh_do TD on NV.ma_trinh_do = TD.ma_trinh_do
join bo_phan BP on NV.ma_bo_phan = BP.ma_bo_phan
left join hop_dong HD on NV.ma_nhan_vien = HD.ma_nhan_vien
group by HD.ma_nhan_vien
having count(ifnull(HD.ma_nhan_vien,0)) <=3 ;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

alter table nhan_vien 
add delete_status int default 0;

alter table khach_hang 
add delete_status int default 0;

set sql_safe_updates = 0;
update nhan_vien  
set delete_status = 1
where ma_nhan_vien not in (
select * from (
select NV.ma_nhan_vien from nhan_vien NV 
join hop_dong HD on NV.ma_nhan_vien = HD.ma_nhan_vien
where year(ngay_lam_hop_dong) between 2019 and 2021) temp);

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

update khach_hang 
set ma_loai_khach = 1
where ma_khach_hang in (select * from ( select KH.ma_khach_hang from khach_hang KH
join hop_dong HD on KH.ma_khach_hang = HD.ma_khach_hang 
left join dich_vu DV on HD.ma_dich_vu = DV.ma_dich_vu
left join hop_dong_chi_tiet HDCT on HD.ma_hop_dong = HDCT.ma_hop_dong
left join dich_vu_di_kem DVDK on HDCT.ma_dich_vu_di_kem = DVDK.ma_dich_vu_di_kem
where year(HD.ngay_lam_hop_dong) = 2021 
group by  HD.ma_hop_dong 
having (sum(DV.chi_phi_thue+HDCT.so_luong*DVDK.gia))>=10000000) temp);

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

update khach_hang KH
set delete_status = 1
where KH.ma_khach_hang in (select * from (
select KH.ma_khach_hang from khach_hang KH 
join hop_dong HD on KH.ma_khach_hang = HD.ma_khach_hang
where year(HD.ngay_lam_hop_dong) < 2021) temp) ;

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

update dich_vu_di_kem DVDK 
set DVDK.gia = DVDK.gia*2
where DVDK.ma_dich_vu_di_kem in (select * from (
select DVDK.ma_dich_vu_di_kem from dich_vu_di_kem DVDK 
left join hop_dong_chi_tiet HDCT on DVDK.ma_dich_vu_di_kem = HDCT.ma_dich_vu_di_kem
left join hop_dong HD on HDCT.ma_hop_dong = HD.ma_hop_dong
where year(HD.ngay_lam_hop_dong) = 2020
group by ma_dich_vu_di_kem
having sum(HDCT.so_luong)>10) temp); 

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id 
-- (ma_nhan_vien, ma_khach_hang), ho_ten, email, s o_dien_thoai, ngay_sinh, dia_chi.

select ma_nhan_vien,ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from nhan_vien
union
select ma_khach_hang,ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from khach_hang;

-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” 
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”

create or replace view v_nhan_vien as  
select nhan_vien.* from nhan_vien
join hop_dong on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
where dia_chi like '%Hai Châu%' and ngay_lam_hop_dong = '2019-12-12';

-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy
-- bởi khung nhìn này.

set sql_safe_updates = 0;
update v_nhan_vien 
set dia_chi = 'Liên Chiểu';

-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào 
-- như là 1 tham số của sp_xoa_khach_hang.

delimiter //
create procedure sp_xoa_khach_hang(id int)
begin
	update khach_hang 
    set delete_status = 1
    where ma_khach_hang = id;
end
// delimiter ;  

-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong
-- phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn 
-- vẹn tham chiếu đến các bảng liên quan.

-- 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong
-- thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
delimiter //
create trigger tr_xoa_hop_dong
before delete
on hop_dong for each row
if old.ma_hop_dong in ( select ma_hop_dong from hop_dong_chi_tiet) 
then signal sqlstate '45000'
set message_text = 'Hop_dong có một bản ghi hop_dong_chi_tiet liên quan';
end if
// delimiter ;
delete from hop_dong where ma_hop_dong = 12;