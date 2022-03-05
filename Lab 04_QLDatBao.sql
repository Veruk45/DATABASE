﻿CREATE DATABASE Lab04_QLDatBao

go
use  Lab04_QLDatBao

go
create table KHACHHANG
(
MaKH  char (4) primary key,
TenKH nvarchar (10),
DiaChi nvarchar(15)
)

create table BAO_TCHI
(
MaBaoTC char (4) primary key,
Ten			  nvarchar (30),
DinhKy	  nvarchar (20),
SoLuong	  int,
GiaBan	  int
)

create table PHATHANH
(
MaBaoTC	char (4) references BAO_TCHI (MaBaoTC),
SoBaoTC		int,
NgayPH		datetime
)

create table DATBAO
(
MaKH			char (4) references KHACHHANG (MaKH),
MaBaoTC	char (4) references BAO_TCHI (MaBaoTC),
SLMua		int,
NgayDM		datetime
)

--Reivew--
go
insert into KHACHHANG values ('KH01', N'LAN', N'2 NCT')
insert into KHACHHANG values ('KH02', N'NAM', N'32 THĐ')
insert into KHACHHANG values ('KH03', N'NGỌC', N'16 LHP')
select * from KHACHHANG


go
insert into BAO_TCHI values ('TT01', N'Tuổi trẻ', N'Nhật báo',1000,1500)
insert into BAO_TCHI values ('KT01', N'Kiến thức ngày nay', N'Bán nguyệt san',3000,6000)
insert into BAO_TCHI values ('TN01', N'Thanh niên', N'Nhật báo',1000,2000)
insert into BAO_TCHI values ('PN01', N'Phụ nữ', N'Tuần báo',2000,4000)
insert into BAO_TCHI values ('PN02', N'Phụ nữ', N'Nhật báo',1000,2000)
select * from BAO_TCHI


go
set dateformat dmy
select convert(varchar, getdate(), 103)
insert into PHATHANH values ('TT01',123,'15/12/2005')
insert into PHATHANH values ('KT01',70,'15/12/2005')
insert into PHATHANH values ('TT01',124,'16/12/2005')
insert into PHATHANH values ('TN01',256,'17/12/2005')
insert into PHATHANH values ('PN01',45,'23/12/2005')
insert into PHATHANH values ('PN02',111,'18/12/2005')
insert into PHATHANH values ('PN02',112,'19/12/2005')
insert into PHATHANH values ('TT01',125,'17/12/2005')
insert into PHATHANH values ('PN01',46,'30/12/2005')
select * from PHATHANH

go
set dateformat dmy
insert into DATBAO values ('KH01', 'TT01', 100, '12/01/2000')
insert into DATBAO values ('KH02', 'TN01', 150, '01/05/2001')
insert into DATBAO values ('KH01', 'PN01', 200, '25/06/2001')
insert into DATBAO values ('KH03', 'KT01', 50, '17/03/2002')
insert into DATBAO values ('KH03', 'PN02', 200, '26/08/2003')
insert into DATBAO values ('KH02', 'TT01', 250, '15/01/2004')
insert into DATBAO values ('KH01', 'KT01', 300, '14/10/2004')
select * from DATBAO