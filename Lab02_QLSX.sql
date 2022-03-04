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
DVT nvarchar(3),
TienCong int
)

create table ThanhPhan
(MACN char(5) references CongNhan(MaCN),
 MASP char(5) references SanPham(MaSP),
 Ngay datetime,
 SoLuong int,
 primary key(MaCN,MaSP)
)

-- Review --
select * from ToSanXuat
select * from CongNhan
select * from SanPham
select * from ThanhPhan

insert into ToSanXuat values ('TS01',N'Tổ 1')
insert into ToSanXuat values ('TS02',N'Tổ 2')
select * from ToSanXuat

set dateformat dmy
go
insert into CongNhan values ('CN001', N'Nguyễn Trường', N'An', N'Nam', '12/05/1981', 'TS01')
insert into CongNhan values ('CN002', N'Lê Thị Hồng', N'Gấm', N'Nữ', '04/06/1980', 'TS01')
insert into CongNhan values ('CN003', N'Nguyễn Công', N'Thành', N'Nam', '04/05/1981', 'TS02')
insert into CongNhan values ('CN004', N'Võ Hữu', N'Hạnh', N'Nam', '15/02/1980', 'TS02')
insert into CongNhan values ('CN005', N'Lý Thanh', N'Hân', N'Nữ', '03/12/1981', 'TS01')
select * from CongNhan
--Convert(char(10),NgaySinh,103)--


insert into SanPham values ('SP001',N'Nồi đất', N'cái', '10000')
insert into SanPham values ('SP002',N'Chén', N'cái', '2000')
insert into SanPham values ('SP003',N'Bình gốm nhỏ', N'cái', '20000')
insert into SanPham values ('SP004',N'Bình gốm lớn', N'cái', '25000')
select * from SanPham

set dateformat dmy
go
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

--Request--
--1
select TenTSX, Ho+' '+Ten as HoTen, NgaySinh, Phai
from CongNhan A ,ToSanXuat B
where A.MaTSX = B.MaTSX
order by TenTSX, Ten, Ho ASC

--2 
select TenSP, Ngay, SoLuong, TienCong As ThanhTien
from SanPham A, ThanhPhan B, CongNhan C
where A.MASP = B.MASP and B.MACN = C.MACN 
					and Ho+' '+Ten = N'Nguyễn Trường An'
order by Ngay ASC
--3
select Ho+' '+Ten As Hoten
from CongNhan A
where A.MACN NOT IN (select B.MACN
					 from	ThanhPhan B, SanPham C
					 where B.MASP = C.MASP and TenSP = N'Bình gốm lớn')
--4 
select Ho+' '+Ten As Hoten
from CongNhan A, ThanhPhan B, SanPham C
where A.MACN = B.MACN and B.MASP = C.MASP and TenSP =N'Nồi đất'
										  and A.MACN in (select X.MACN
														 from ThanhPhan X, SanPham Y
														 where X.MASP = Y.MASP and TenSP =N'Bình gốm nhỏ')
--5 
select B.MaTSX,TenTSX,COUNT(MACN) as SốLượng 
from CongNhan A, ToSanXuat B
where A.MaTSX = B.MaTSX
group by B.MaTSX,TenTSX

--6 
select A.MACN,Ho+' '+Ten As Hoten,TenSP,SUM(SoLuong) As TongSLThanhPhan,SUM(SoLuong * TienCong) As TongSoTien
from CongNhan A, ThanhPhan B, SanPham C
where A.MACN = B.MACN and B.MASP = C.MASP
group by A.MACN,Ho,Ten
