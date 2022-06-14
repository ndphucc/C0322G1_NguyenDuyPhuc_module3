create database if not exists quan_li_dat_hang;

use quan_li_dat_hang;

create table phieu_xuat(
so_px int primary key,
ngay_xuat date); 

create table phieu_nhap(
so_pn int primary key,
ngay_nhap date
);

create table vat_tu(
ma_vtu int primary key,
ten_vtu varchar(20)
);

create table chi_tiet_phieu_xuat(
dg_xuat float,
sl_xuat int,
so_px int,
ma_vtu int,
foreign key (so_px) references phieu_xuat(so_px),
foreign key (ma_vtu) references vat_tu(ma_vtu)
); 

create table chi_tiet_phieu_nhap(
dg_nhap double,
sl_nhap int,
ma_vtu int,
so_pn int,
foreign key (ma_vtu) references vat_tu(ma_vtu),
foreign key(so_pn) references phieu_nhap(so_pn));

create table nha_cc(
ma_ncc int primary key,
ten_ncc varchar(50),
dia_chi varchar(50));

create table don_dh(
so_dh int primary key,
ngay_dh date,
ma_ncc int,
foreign key (ma_ncc) references nha_cc(ma_ncc));

create table chi_tiet_don_dat_hang(
ma_vtu int,
so_dh int,
primary key(ma_vtu,so_dh),
foreign key (ma_vtu) references vat_tu(ma_vtu),
foreign key (so_dh) references don_dh(so_dh));

create table ncc_sdt(
sdt varchar(10),
ma_ncc int,
foreign key (ma_ncc) references nha_cc(ma_ncc)); 



