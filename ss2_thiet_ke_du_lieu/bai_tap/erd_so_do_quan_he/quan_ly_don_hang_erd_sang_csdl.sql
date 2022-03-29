drop database if exists ss2_thiet_ke_csdl;
create database ss2_thiet_ke_csdl;
use ss2_thiet_ke_csdl;
create table nha_cung_cap(
id_ncc int not null auto_increment key,
ten_ncc varchar(50) not null unique,
dia_chi_ncc varchar(255) not null,
sdt_ncc varchar(10) not null
);

create table don_dat_hang(
id_ddh int not null auto_increment primary key,
ma_dh varchar(20) not null,
ngay_dh datetime,
id_ncc int not null,
foreign key (id_ncc) references nha_cung_cap(id_ncc)
);

create table phieu_xuat(
so_px int not null auto_increment primary key,
ngay_xuat datetime
);

create table vat_tu(
ma_vt int not null auto_increment,
ten_vt varchar(255) not null,
primary key (ma_vt)
);

create table phieu_nhap(
so_pn int not null auto_increment,
ngay_nhap date,
primary key (so_pn))
;


create table chi_tiet_phieu_xuat(
	so_px int not null,
    ma_vt int not null,
    dg_xuat int not null,
    sl_xuat int not null,
    primary key (so_px,ma_vt),
    foreign key (so_px) references phieu_xuat(so_px),
    foreign key (ma_vt) references vat_tu(ma_vt)
);

create table chi_tiet_phieu_nhap(
so_pn int not null,
ma_vt int not null,
dg_nhap int not null,
sl_nhap int not null,
primary key(so_pn,ma_vt),
foreign key (so_pn) references phieu_nhap(so_pn),
foreign key (ma_vt) references vat_tu(ma_vt)
);

create table sdt_ncc(
id_sdt_ncc int not null,
so_dt varchar(10) not null,
id_ncc int not null,
primary key (id_sdt_ncc),
foreign key (id_ncc) references nha_cung_cap(id_ncc));

create table chi_tiet_don_dat_hang(
id_ddh int not null,
ma_vt int not null,
primary key(id_ddh,ma_vt),
foreign key (id_ddh) references don_dat_hang(id_ddh),
foreign key(ma_vt) references vat_tu(ma_vt)
);