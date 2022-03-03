CREATE DATABASE Lab02_QLSX

go
use Lab02_QLSX

create table ToSanXuat
(MaTSX char(4) primary key,
TenTSX nvarchar(5) not null
)

create table CongNhan
(MACN char(5) primary key,
 Ho	 nvarchar(20) not null,
 Ten nvarchar(10) not null,
 Phai nvarchar(5) not null,
 NgaySinh datetime,
 MaTSX char(4) references ToSanXuat(MaTSX)
)

create table SanPham
(MASP char(5) primary key,
TenSP nvarchar(20) not null,
DVT char(3),
TienCong int
)

create table ThanhPhan
(MACN char(5) references CongNhan(MaCN),
 MASP char(5) references SanPham(MaSP),
 Ngay datetime,
 SoLuong int,
)

-- Review --
select * from ToSanXuat
select * from CongNhan
select * from SanPham
select * from ThanhPhan

insert into ToSanXuat values ('CN001',N'Tổ 1')
insert into ToSanXuat values ('CN002',N'Tổ 2')
select * from ToSanXuat

set dateformat dmy
go
insert into CongNhan values ('CN001', N'Nguyễn Trường', N'An', N'Nam', '12/05/1981', 'TS01')
insert into CongNhan values ('CN001', N'Lê Thị Hồng', N'Gấm', N'Nữ', '04/06/1980', 'TS02')
insert into CongNhan values ('CN001', N'Nguyễn Công', N'Thành', N'Nam', '04/05/1981', 'TS03')
insert into CongNhan values ('CN001', N'Võ Hữu', N'Hankh', N'Nam', '15/02/1980', 'TS04')
insert into CongNhan values ('CN001', N'Lý Thanh', N'Hân', N'Nữ', '03/12/1981', 'TS05')
select * from CongNhan

insert into SanPham values ('SP001',N'Nồi đất', N'cái', '10,000')
insert into SanPham values ('SP002',N'Chén', N'cái', '2,000')
insert into SanPham values ('SP003',N'Bình góm nhỏ', N'cái', '20,000')
insert into SanPham values ('SP004',N'Bình góm lớn', N'cái', '25,000')
select * from SanPham

insert into ThanhPhan values ('CN001','SP001','01/02/2007', '10')
insert into ThanhPhan values ('CN002','SP001','01/02/2007','5')
insert into ThanhPhan values ('CN003','SP002','10/01/2007','50')
insert into ThanhPhan values ('CN004','SP003','12/01/2007','10')
insert into ThanhPhan values ('CN005','SP002','12/01/2007','100')
insert into ThanhPhan values ('CN002','SP004','13/02/2007','10')
insert into ThanhPhan values ('CN001','SP003','14/02/2007','15')
insert into ThanhPhan values ('CN003','SP001','15/01/2007','20')
insert into ThanhPhan values ('CN003','SP004','14/02/2007','15')
insert into ThanhPhan values ('CN004','SP002','30/01/2007','100')
insert into ThanhPhan values ('CN005','SP003','01/02/2007','50')
insert into ThanhPhan values ('CN001','SP001','20/02/2007','30')
select * from ThanhPhan