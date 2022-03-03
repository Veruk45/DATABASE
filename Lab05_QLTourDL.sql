﻿CREATE DATABASE Lab05_QLTourDL

go
use  Lab05_QLTourDL

create table Tour
(
MaTour char(4) primary key,
TongSoNgay int
)

create table ThanhPho
(
MaTP char (4) primary key,
TenTP nvarchar(18)
)

create table Tour_TP
(
MaTour char (4) references Tour(MaTour),
MaTP char (4) ,
SoNgay int
)

create table Lich_TourDL
(
MaTour char(4) references Tour (MaTour),
NgayKH datetime ,
TenHDV nvarchar(8) not null,
SoNguoi int ,
TenKH nvarchar(20)
)

-- Review --
select * from Tour
select * from ThanhPho
select * from Tour_TP
select * from Lich_TourDL

insert into Tour values ('T001', '3')
insert into Tour values ('T002', '4')
insert into Tour values ('T003', '5')
insert into Tour values ('T004', '7')
select * from Tour

insert into ThanhPho values ('01', N'Đà Lạt')
insert into ThanhPho values ('02', N'Nha trang')
insert into ThanhPho values ('03', N'Phan Thiết')
insert into ThanhPho values ('04', N'Huế')
insert into ThanhPho values ('05', N'Đà Nẵng')
insert into ThanhPho values ('01', N'Đà Lạt')
select * from ThanhPho

insert into Tour_TP values ('T001', '01', '2')
insert into Tour_TP values ('T001', '03', '1')
insert into Tour_TP values ('T002', '01', '2')
insert into Tour_TP values ('T002', '02', '2')
insert into Tour_TP values ('T003', '02', '2')
insert into Tour_TP values ('T003', '01', '1')
insert into Tour_TP values ('T003', '04', '2')
insert into Tour_TP values ('T004', '02', '2')
insert into Tour_TP values ('T004', '05', '2')
insert into Tour_TP values ('T004', '04', '3')
select * from Tour_TP

set dateformat dmy
go
insert into Lich_TourDL values ('T001', '14/02/2017', N'Vân', '20', N'Nguyễn Hoàng')
insert into Lich_TourDL values ('T002', '14/02/2017', N'Nam', '30', N'Lê Ngọc')
insert into Lich_TourDL values ('T002', '06/03/2017', N'Hùng', '20', N'Lý Dũng')
insert into Lich_TourDL values ('T003', '18/02/2017', N'Dũng', '20', N'Lý Dũng')
insert into Lich_TourDL values ('T004', '14/02/2017', N'Hùng', '30', N'Dũng Nam')
insert into Lich_TourDL values ('T003', '10/03/2017', N'Nam', '45', N'Nguyễn An')
insert into Lich_TourDL values ('T002', '28/04/2017', N'Vân', '25', N'Ngọc Dung')
insert into Lich_TourDL values ('T004', '29/04/2017', N'Dũng', '35', N'Lê ngọc')
insert into Lich_TourDL values ('T001', '30/04/2017', N'Nam', '25', N'Trần Nam')
insert into Lich_TourDL values ('T003', '15/06/2017', N'Vân', '20', N'Trịnh Bá')
select * from Lich_TourDL
