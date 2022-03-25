CREATE DATABASE Lab03_QLXNHangHoa

use Lab03_QLXNHangHoa
go

create table HangHoa
(
	MaHH varchar(5) primary key,
	TenHH varchar(30) not null unique,
	DVT nvarchar(3) not null,
	SoLuongTon tinyint
)

go
create table DoiTac
(
	MaDT varchar(5) primary key,
	TenDT nvarchar(30) not null,
	DiaChi nvarchar(35),
	DienThoai varchar(12)
)

go
create table KhaNangCC
(
	MaDT varchar(5) references DoiTac(MaDT),
	MaHH varchar(5) references HangHoa(MaHH),
	primary key(MaDT, MaHH)
)

go
create table HoaDon
(
	SoHD varchar(5) primary key,
	NgayLapHD date not null,
	MaDT varchar(5) references DoiTac(MaDT),
	TongTG float
)

go
create table CT_HoaDon
(
	SoHD varchar(5) references HoaDon(SoHD),
	MaHH varchar(5) references HangHoa(MaHH),
	primary key(SoHD, MaHH),
	DonGia int not null,
	SoLuong tinyint not null
)

insert into HangHoa values('CPU01','CPU INTEL, CELERON 600 BOX',N'CÁI','5')
insert into HangHoa values('CPU02','CPU INTEL, PIII 700',N'CÁI','10')
insert into HangHoa values('CPU03','CPU AMD K7 ATHL,ON 600',N'CÁI','8')
insert into HangHoa values('HDD01','HDD 10.2 GB QUANTUM',N'CÁI','10')
insert into HangHoa values('HDD02','HDD 13.6 GB SEAGATE',N'CÁI','15')
insert into HangHoa values('HDD03','HDD 20 GB QUANTUM',N'CÁI','6')
insert into HangHoa values('KB01','KB GENIUS',N'CÁI','12')
insert into HangHoa values('KB02','KB MITSUMIMI',N'CÁI','5')
insert into HangHoa values('MB01','GIGABYTE CHIPSET INTEL',N'CÁI','10')
insert into HangHoa values('MB02','ACOPR BX CHIPSET VIA',N'CÁI','10')
insert into HangHoa values('MB03','INTEL PHI CHIPSET INTEL',N'CÁI','10')
insert into HangHoa values('MB04','ECS CHIPSET SIS',N'CÁI','10')
insert into HangHoa values('MB05','ECS CHIPSET VIA',N'CÁI','10')
insert into HangHoa values('MNT01','SAMSUNG 14" SYNCMASTER',N'CÁI','5')
insert into HangHoa values('MNT02','LG 14"',N'CÁI','5')
insert into HangHoa values('MNT03','ACER 14"',N'CÁI','8')
insert into HangHoa values('MNT04','PHILIPS 14"',N'CÁI','6')
insert into HangHoa values('MNT05','VIEWSONIC 14"',N'CÁI','7')

insert into DoiTac values('CC001','Cty TNC',N'176 BTX Q1 - TP.HCM','08.8250259')
insert into DoiTac values('CC002',N'Cty Hoàng Long','15A TTT Q1 - TP.HCM','08.8250898')
insert into DoiTac values('CC003',N'Cty Hợp Nhất','152 BTX Q1 - TP.HCM','08.8252376')
insert into DoiTac values('K0001',N'Nguyễn Minh Hải',N'91 Nguyễn Văn Trỗi Tp.Đà Lạt','063.831129')
insert into DoiTac values('K0002',N'Như Quỳnh',N'21 Điện Biên Phủ. N.Trang','058590270')
insert into DoiTac values('K0003',N'Trần Nhật Duật',N'Lê Lợi Tp.Huế','054.848376')
insert into DoiTac values('K0004',N'Phan Nguyễn Hùng Anh',N'11 Nam Kỳ Khỡi Nghĩa Tp.Đà Lạt','063.823409')

set dateformat dmy	
go--
insert into HoaDon values('N0001','25/01/2006','CC001','')
insert into HoaDon values('N0002','01/05/2006','CC002','')
insert into HoaDon values('X0001','12/05/2006','K0001','')
insert into HoaDon values('X0002','16/6/2006','K0002','')
insert into HoaDon values('X0003','20/04/2006','K0001','')

insert into KhaNangCC values('CC001','CPU01')
insert into KhaNangCC values('CC001','HDD03')
insert into KhaNangCC values('CC001','KB01')
insert into KhaNangCC values('CC001','MB02')
insert into KhaNangCC values('CC001','MB04')
insert into KhaNangCC values('CC001','MNT01')
insert into KhaNangCC values('CC002','CPU01')
insert into KhaNangCC values('CC002','CPU02')
insert into KhaNangCC values('CC002','CPU03')
insert into KhaNangCC values('CC002','KB02')
insert into KhaNangCC values('CC002','MB01')
insert into KhaNangCC values('CC002','MB05')
insert into KhaNangCC values('CC002','MNT03')
insert into KhaNangCC values('CC003','HDD01')
insert into KhaNangCC values('CC003','HDD02')
insert into KhaNangCC values('CC003','HDD03')
insert into KhaNangCC values('CC003','MB03')

insert into CT_HoaDon values('N0001','CPU01','63','10')
insert into CT_HoaDon values('N0001','HDD03','97','7')
insert into CT_HoaDon values('N0001','KB01','3','5')
insert into CT_HoaDon values('N0001','MB02','57','5')
insert into CT_HoaDon values('N0001','MNT01','112','3')
insert into CT_HoaDon values('N0002','CPU02','115','3')
insert into CT_HoaDon values('N0002','KB02','5','7')
insert into CT_HoaDon values('N0002','MNT03','111','5')
insert into CT_HoaDon values('X0001','CPU01','67','2')
insert into CT_HoaDon values('X0001','HDD03','100','2')
insert into CT_HoaDon values('X0001','KB01','5','2')
insert into CT_HoaDon values('X0001','MB02','62','1')
insert into CT_HoaDon values('X0002','CPU01','67','1')
insert into CT_HoaDon values('X0002','KB02','7','3')
insert into CT_HoaDon values('X0002','MNT01','115','2')
insert into CT_HoaDon values('X0003','CPU01','67','1')
insert into CT_HoaDon values('X0003','MNT03','115','2')

select * from HangHoa
select * from DoiTac
select * from KhaNangCC
select * from HoaDon
select * from CT_HoaDon

--1 
select A.MAHH,TENHH
from HangHoa A
where MAHH like'HDD%'

--2 
select A.MAHH,TENHH,SOLUONGTON
from HangHoa A
where A.SOLUONGTON >10
group by A.MAHH,TENHH,SOLUONGTON

--3
select *
from DOITAC A
where MADT like 'CC%'

--4
select A.MADT,convert(char(10),NGAYLAPHD,105),TENDT,DIACHI,DIENTHOAI,B.SOHD,SUM(SoLuong) as SL
from DOITAC A,CT_HOADON B,HOADON C
where A.MADT = C.MADT and C.SOHD =B.SOHD and MONTH(NGAYLAPHD) = 5 and YEAR(NGAYLAPHD)=2006 and B.SoHD like 'N%'
group by A.MADT,TENDT,DIACHI,DIENTHOAI,B.SOHD,NGAYLAPHD

--5
select A.MADT,TENDT
from DOITAC A, KHANANGCC B,HANGHOA C
where A.MADT =B.MADT and B.MAHH =C.MAHH and TENHH like 'HDD%'
order by A.MADT ASC

--6
select TENDT,TENHH
from DOITAC A, KHANANGCC B,HANGHOA C
where A.MADT =B.MaDT and B.MAHH =C.MAHH and C.MAHH like 'HDD%'

--7
select  distinct A.MaDT, TenDT ,DiaChi, DienThoai
from DOITAC A, KHANANGCC B
where A.MADT =B.MaDT and A.MADT
							not in (select X.MaDT
											from KHANANGCC X
											where MAHH like 'HDD%'
											group by X.MaDT)

--8 
select A.MaHH,TenHH
from HangHoa A
where A.MaHH not in (select X.MaHH
					 from CT_HoaDon X
					 group by MaHH)
--9
select A.MaHH,TenHH,SUM(SoLuong) as BanChay
from HangHoa A,CT_HoaDon B
where A.MaHH =B.MaHH and SoHD like 'X%'
group by A.MaHH,TenHH
having SUM(SoLuong) >=all (select SUM(SoLuong)
						from CT_HoaDon 
						where  SoHD like 'X%'
						group by MaHH )

--10
select TenHH,SUM(SoLuong) as TongSL_NhapItNhat
from HangHoa A, CT_HoaDon B
where A.MaHH = B.MaHH and B.SoHD like 'N%'
group by A.MaHH,TenHH
having SUM(SoLuong) <=all (select SUM(X.SoLuong)
							from CT_HoaDon X 
							where X.SoHD like 'N%'
							group by MaHH)
--11
select A.SoHD,MADT,COUNT(MaHH) as HoaDonNhapNhieuNhat
from HoaDon A,CT_HoaDon B
where A.SoHD =B.SoHD and A.SoHD like 'N%'
group by A.SoHD,MaDT
having SUM(SoLuong) >=all (select SUM(SoLuong)
							from CT_HoaDon 
							where SoHD like 'N%'
							group by MaHH)
--12
select A.SoHD,B.MaHH,TenHH
from HoaDon A,CT_HoaDon B,HangHoa C
where A.SoHD = B.SoHD and B.MaHH =C.MaHH and A.SoHD like'%N'
	and A.SoHD not in (select X.SoHD
						from HoaDon X	
						where MONTH(NgayLapHD)=1 and YEAR(NgayLapHD)=2006 )

--13
select A.SoHD,B.MaHH,TenHH
from HoaDon A,CT_HoaDon B,HangHoa C
where A.SoHD = B.SoHD and B.MaHH =C.MaHH and A.SoHD like'%X'
	and A.SoHD not in (select X.SoHD
						from HoaDon X	
						where MONTH(NgayLapHD)=6 and YEAR(NgayLapHD)=2006
						)

--14 
select A.MaHH,SUM(SoLuong) as SLBan, DVT
from CT_HoaDon A,HangHoa B
where A.MaHH = B.MaHH
group by A.MaHH,DVT

--15 
select  A.MaDT,COUNT(B.MaDT) as SLTungCungCap
from DoiTac A, KhaNangCC B,HangHoa C
where A.MaDT =B.MaDT and B.MaHH = C.MaHH
group by A.MaDT,TenDT

--17
select SUM(DonGia*SoLuong) as TongDoanhThu
from HoaDon A,CT_HoaDon B
where A.SoHD =B.SoHD and YEAR(NgayLapHD)=2006

--18
select MaHH,SUM(SoLuong) as BanChay
from HoaDon A,CT_HoaDon B
where A.SoHD = B.SoHD
group by MaHH
having SUM(SoLuong) >=all(select SUM(X.SoLuong)
							from CT_HoaDon X
							group by X.MaHH)

--19
select A.SoHD,C.MaHH,TenHH,DVT,SUM(SoLuong) as TongSL,SUM(SoLuong*DonGia) as TongTien
from HoaDon A,CT_HoaDon B,HangHoa C
where A.SoHD =B.SoHD and B.MaHH = C.MaHH and MONTH(NgayLapHD)=5 and YEAR(NgayLapHD)=2006
group by A.SoHD,C.MaHH,TenHH,DVT

--20
select MaHH,COUNT(MaHH) as Nhieu
from HoaDon A,CT_HoaDon B
where A.SoHD = B.SoHD
group by MaHH
having SUM(SoLuong) >=all(select SUM(X.SoLuong)
							from CT_HoaDon X
							group by X.MaHH)

--21

