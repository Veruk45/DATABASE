CREATE DATABASE Lab03_QLNhapXuatHangHoa

go 
use Lab03_QLNhapXuatHangHoa

create table DOITAC
(
MADT char (5) primary key,
TENDT nvarchar (20) not null,
DIACHI nvarchar (40) not null unique,
DIENTHOAI int
)

create table KHANANGCC
(
MATD char (5) references DOITAC (MADT),
MAHH varchar (6) primary key
)

create table HANGHOA
(
MAHH varchar (6) references KHANANGCC (MAHH),
TENHH varchar (40),
DVT nchar (3),
SOLUONGTON int 
)

create table HOADON
(
SOHD char (5) primary key,
NGAYLAPHD datetime,
MADT char (5),
TONGTG  int  null
)

create table  CT_HOADON
(
SOHD char (5) references HOADON (SOHD),
MAHH varchar (6) references KHANANGCC (MAHH) ,
DONGIA  int,
SOLUONG int
primary key (MAHH,SOHD)
)


insert into DOITAC values ('CC001', N'Cty TNC', N'176 BTX Q1 - TP.HCM', '088250259')
insert into DOITAC values ('CC002', N'Cty Hoàng Long', N'15A TTT Q1 -TP.HCM', '088250898')
insert into DOITAC values ('CC003', N'Cty Hợp Nhất', N'152 BTX  Q1 - TPHCM', '088252376')
insert into DOITAC values ('K0001', N'Nguyễn Minh Hải', N'91 Nguyễn Văn Trỗi TP.Đà Lạt', '063831129')
insert into DOITAC values ('K0002', N'Như Quỳnh', N'21 Điện Biên Phủ N.Trang', '058590270')
insert into DOITAC values ('K0003', N'Trần Nhật Duật', N'Lê Lợi TP.Huế', '054848376')
insert into DOITAC values ('K0004', N'Phan Nguyễn Hùng Anh', N'11 Nam Kỳ Khởi Nghĩa TP.Đà Lạt', '063823409')
select * from DOITAC

insert into KHANANGCC values ('CC001', 'CPU01')
insert into KHANANGCC values ('CC001', 'HDD03')
insert into KHANANGCC values ('CC001', 'KB01')
insert into KHANANGCC values ('CC001', 'MB02')
insert into KHANANGCC values ('CC001', 'MB04')
insert into KHANANGCC values ('CC001', 'MNT01')
insert into KHANANGCC values ('CC002', 'CPU01')
insert into KHANANGCC values ('CC002', 'CPU02')
insert into KHANANGCC values ('CC002', 'CPU03')
insert into KHANANGCC values ('CC002', 'KB02')
insert into KHANANGCC values ('CC002', 'MB01')
insert into KHANANGCC values ('CC002', 'MB05')
insert into KHANANGCC values ('CC002', 'MNT03')
insert into KHANANGCC values ('CC003', 'HDD01')
insert into KHANANGCC values ('CC003', 'HDD02')
insert into KHANANGCC values ('CC003', 'HDD03')
insert into KHANANGCC values ('CC003', 'MB03')
select * from KHANANGCC

insert into HANGHOA values ('CPU01', 'CPU INTEL, CELERON 600 BOX', N'CÁI', 5)
insert into HANGHOA values ('CPU02', 'CPU INTEL, PIII 700', N'CÁI', 10)
insert into HANGHOA values ('CPU03', 'CPU ADM K7 ATHL,ON 600', N'CÁI', 8)
insert into HANGHOA values ('HDD01', 'HDD 10.2 GB QUANTUM', N'CÁI', 10)
insert into HANGHOA values ('HDD02', 'HDD 13.6 GB SEAGAME', N'CÁI', 15)
insert into HANGHOA values ('HDD03', 'HDD 20 GB QUANTUM', N'CÁI', 6)
insert into HANGHOA values ('KB01', 'KB GENIUS', N'CÁI',12)
insert into HANGHOA values ('KB02', 'KB MITSUMINI', N'CÁI', 5)
insert into HANGHOA values ('MB01', 'GIGABYTE CHIPSET INTEL', N'CÁI', 10)
insert into HANGHOA values ('MB02', 'ACOPR BX CHIPSET INTEL', N'CÁI', 10)
insert into HANGHOA values ('MB03', 'INTEL PHI CHIPSET INTEL', N'CÁI', 10)
insert into HANGHOA values ('MB04', 'ECS CHIPSET SIS', N'CÁI', 10)
insert into HANGHOA values ('MB05', 'ECS CHIPSET VIA', N'CÁI', 10)
insert into HANGHOA values ('MNT01', 'SAMSUNG 14" SYNCMASTER', N'CÁI', 5)
insert into HANGHOA values ('MNT02', 'LG 14" ', N'CÁI', 5)
insert into HANGHOA values ('MNT03', 'ACER 14"', N'CÁI', 8)
insert into HANGHOA values ('MNT04', 'PHILIPS 14"', N'CÁI', 6)
insert into HANGHOA values ('MNT05', 'VIEWSONIC 14"', N'CÁI', 7)
select * from HANGHOA

set dateformat dmy
go
insert into HOADON values ('N0001', '25/01/2006','CC001',' ')
insert into HOADON values ('N0002', '01/05/2006','CC002',' ')
insert into HOADON values ('X0001', '12/05/2006','K0001',' ')
insert into HOADON values ('X0002', '16/06/2006','K0002',' ')
insert into HOADON values ('X0003', '24/04/2006','K0001',' ')
select * from HOADON

insert into CT_HOADON values ('N0001', 'CUP01','63','10 ')
insert into CT_HOADON values ('N0001', 'HDD03','97','7 ')
insert into CT_HOADON values ('N0001', 'KB01','3',' 5')
insert into CT_HOADON values ('N0001', 'MB02','57','5 ')
insert into CT_HOADON values ('N0001', 'MNT01','112','3 ')
insert into CT_HOADON values ('N0002', 'CPU02','115','3 ')
insert into CT_HOADON values ('N0002', 'KB02','5',' 7')
insert into CT_HOADON values ('N0002', 'MNT03','111','5 ')
insert into CT_HOADON values ('X0001', 'CPU01','67',' 2')
insert into CT_HOADON values ('X0001', 'HDD03','100','2 ')
insert into CT_HOADON values ('X0001', 'KB01','5',' 2')
insert into CT_HOADON values ('X0001', 'MB02','62',' 1')
insert into CT_HOADON values ('X0002', 'CPU01','67','1 ')
insert into CT_HOADON values ('X0002', 'KB02','7',' 3')
insert into CT_HOADON values ('X0002', 'MNT01','115','2 ')
insert into CT_HOADON values ('X0003', 'CPU01','67',' 1')
insert into CT_HOADON values ('X0003', 'MNT03','115',' 2')
select * from CT_HOADON

select * from DOITAC
select * from KHANANGCC
select * from HANGHOA
select * from HOADON
select * from CT_HOADON