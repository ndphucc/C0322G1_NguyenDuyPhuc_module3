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

select HD.ma_hop_dong, NV.ho_ten, KH.ho_ten, KH.so_dien_thoai, DV.ten_dich_vu, HD.tien_dat_coc from hop_dong HD
join nhan_vien NV on HD.ma_nhan_vien = NV.ma_nhan_vien
join khach_hang KH on HD.ma_khach_hang = KH.ma_khach_hang
join hop_dong_chi_tiet HDCT on HD.ma_hop_dong = HDCT.ma_hop_dong
join dich_vu_di_kem DVDK on HDCT.ma_dich_vu_di_kem = DVDK.ma_dich_vu_di_kem
join dich_vu DV on HD.ma_dich_vu = DV.ma_dich_vu
where (month(HD.ngay_lam_hop_dong) between 10 and 12 ) and yaer(HD.ngay_lam_hop_dong) = 2020;





