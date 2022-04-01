CREATE DATABASE Lab05_QLTourDL

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

insert into Tour_TP values ('T001', '01', 2)
insert into Tour_TP values ('T001', '03', 1)
insert into Tour_TP values ('T002', '01', 2)
insert into Tour_TP values ('T002', '02', 2)
insert into Tour_TP values ('T003', '02', 2)
insert into Tour_TP values ('T003', '01', 1)
insert into Tour_TP values ('T003', '04', 2)
insert into Tour_TP values ('T004', '02', 2)
insert into Tour_TP values ('T004', '05', 2)
insert into Tour_TP values ('T004', '04', 3)
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

--Truy Van--
--1
select A.MaTour,TongSoNgay
from Tour A,Tour_TP B,ThanhPho C
where A.MaTour =B.MaTour and B.MaTP =C.MaTP and TongSoNgay between 3 and 5
group by A.MaTour,TongSoNgay

--2
select *
from Lich_TourDL 
where MONTH(NgayKH) =2 and YEAR(NgayKH) = 2017

--3
select  A.MaTour,C.MaTP,TenTP
from Tour A,Tour_TP B,ThanhPho C
where  A.MaTour=B.MaTour	and B.MaTP=C.MaTP 
													and C.MaTP not in (select MaTP
																						from ThanhPho 
																						where TenTP=N'Nha Trang'
																						)
--4
select C.MaTP,TenTP,COUNT(A.MaTour) as SLTour
from Tour A,Tour_TP B,ThanhPho C
where A.MaTour=B.MaTour and B.MaTP=C.MaTP
group by C.MaTP,TenTP

--5
select TenHDV,COUNT(B.MaTour) as SLTourDaLam
from Tour A, Lich_TourDL B
where A.MaTour =B.MaTour
group by TenHDV

--6
select TenTP,COUNT(B.MaTP) as TPCoNhieu_Tour
from Tour_TP B ,ThanhPho C
where  B.MaTP=C.MaTP 
group by TenTP
having  COUNT(B.MaTP) >= all (select COUNT(X.MaTP)
													from Tour_TP X,ThanhPho Y
													where X.MaTP=Y.MaTP
													group by X.MaTour)

--7 error
--8 đi qua thành phố đà lạt
select B.MaTour,SUM(SoNgay) as SoNgay
from Lich_TourDL A, Tour_TP B,ThanhPho C
where  A.MaTour=B.MaTour and B.MaTP =C.MaTP and TenTP =N'Đà Lạt'
group by B.MaTour
order by B.MaTour
															
--9
select A.MaTour,SUM(SoNguoi) as SLThamGiaNhieuNhat
from Tour A,Lich_TourDL B
where  A.MaTour= B.MaTour
group by A.MaTour
having SUM(SoNguoi) >= all (select SUM(SoNguoi)
													from Tour X,Lich_TourDL Y
													where X.MaTour =Y.MaTour
													group by X.MaTour)

--10 error
