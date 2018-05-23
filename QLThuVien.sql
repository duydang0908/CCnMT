use master

drop database QLThuVien
create database QLThuVien
use QLThuVien

create table CHUDE
(
	MaCD int identity(1,1) primary key NOT NULL,
	TenCD nvarchar(50) NOT NULL,
)

create table TACGIA
(
	MaTG [int] IDENTITY(1,1) primary key NOT NULL,
	TenTG [nvarchar](50) NOT NULL,
	DiachiTG [nvarchar](100) NULL,
	DienthoaiTG [varchar](15) NULL,
)



create table NXB
(
[MaNXB] [int] IDENTITY(1,1) primary key NOT NULL,
	[TenNXB] [nvarchar](100) NOT NULL,
	[Diachi] [nvarchar](150) NULL,
	[DienThoai] [nvarchar](15) NULL,
)

create table SACH
(
	[Masach] [int] IDENTITY(1,1) NOT NULL primary key,
	[Tensach] [nvarchar](100) NOT NULL,
	[Mota] [ntext] NULL,
	[Hinhminhhoa] [varchar](50) NULL,
	[MaCD] [int] foreign key references CHUDE(MaCD) NULL,
	[MaNXB] [int] foreign key references NXB(MaNXB) NULL,
	SoLuongCon int null, 
	[Ngaycapnhat] [smalldatetime] NULL,
)
create table DOCGIA
(
	MaDG int identity(1,1) not null primary key,
	TenDG nvarchar(50) not null,
	DiaChi nvarchar(50) null,
	DienThoai varchar(50) null,
	Email varchar(50) null,
	TenDN varchar(20) Not null,
	MatKhau varchar(20) Not null,
)
create table VIETSACH
(
	[MaTG] [int] identity(1,1) foreign key references TACGIA(MaTG) NOT NULL,
	[Masach] [int] foreign key references SACH(Masach)  NOT NULL,
	[Vaitro] [nvarchar](30) NULL,
)

create table NhapSach
(
	Masach int references SACH(Masach),
	NgayNhap int,
	TriGia int,
)
create table PhieuMuonSach
(
	MaPhieuMuon int IDENTITY(1,1) primary key,
	MaDG int references DocGia(MaDG),
	NgayMuon datetime
)
create table CT_PhieuMuonSach
(
	MaPhieuMuon int foreign key references  PhieuMuonSach(MaPhieuMuon),
	Masach int foreign key references SACH(Masach),
	SoLuong int
	constraint PK_CTDDH primary key(MaPhieuMuon ,Masach)
)

create table TraSach
(
	MaPhieuMuon int  references PhieuMuonSach(MaPhieuMuon),
	Masach int references SACH(Masach),
	NgayTra datetime,
	TienPhat money,
)
create table PhieuThu
(
	MaPhieu int IDENTITY(1,1) primary key,
	MaDG int references DocGia(MaDG),
	SoTienThu money
)
create table BaoCaoMuonSach
(
	MaBaoCaoMuonSach int IDENTITY(1,1) primary key,
	MaCD int references CHUDE(MaCD),
	SoLuotMuon int
)
GO
SET IDENTITY_INSERT [dbo].[CHUDE] ON 
INSERT [dbo].[CHUDE] ([MaCD], [TenCD]) VALUES (1, N'Ngoại ngữ')
INSERT [dbo].[CHUDE] ([MaCD], [TenCD]) VALUES (2, N'Công nghệ thông tin')
INSERT [dbo].[CHUDE] ([MaCD], [TenCD]) VALUES (3, N'Luật')
INSERT [dbo].[CHUDE] ([MaCD], [TenCD]) VALUES (4, N'Văn học')
INSERT [dbo].[CHUDE] ([MaCD], [TenCD]) VALUES (5, N'Khoa học kỹ thuật')
INSERT [dbo].[CHUDE] ([MaCD], [TenCD]) VALUES (6, N'Nông nghiệp')
INSERT [dbo].[CHUDE] ([MaCD], [TenCD]) VALUES (7, N'Triết học-Chính trị')
INSERT [dbo].[CHUDE] ([MaCD], [TenCD]) VALUES (8, N'Lịch sử, địa lý')
INSERT [dbo].[CHUDE] ([MaCD], [TenCD]) VALUES (9, N'Kinh tế')
INSERT [dbo].[CHUDE] ([MaCD], [TenCD]) VALUES (10, N'Sách giáo khoa')
INSERT [dbo].[CHUDE] ([MaCD], [TenCD]) VALUES (11, N'Nghệ thuật sống')
INSERT [dbo].[CHUDE] ([MaCD], [TenCD]) VALUES (12, N'Chính trị')
SET IDENTITY_INSERT [dbo].[CHUDE] OFF

SET IDENTITY_INSERT [dbo].[NXB] ON 

INSERT [dbo].[NXB] ([MaNXB], [TenNXB], [Diachi], [DienThoai]) VALUES (1, N'Nhà xuất bản Trẻ', N'124 Nguyễn Văn Cừ Q.1 Tp.HCM', N'19001560')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB], [Diachi], [DienThoai]) VALUES (2, N'NXB Thống kê', N'Đồng Nai', N'19001511')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB], [Diachi], [DienThoai]) VALUES (3, N'Kim đồng', N'Tp.HCM', N'19001570')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB], [Diachi], [DienThoai]) VALUES (4, N'Đại học quốc gia', N'Tp.HCM', N'0908419981')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB], [Diachi], [DienThoai]) VALUES (5, N'Văn hóa nghệ thuật', N'Đà Nẵng', N'0903118833')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB], [Diachi], [DienThoai]) VALUES (6, N'Văn hóa', N'Bình Dương', N'0913336677')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB], [Diachi], [DienThoai]) VALUES (7, N'Lao động - Xã hội', N'Tp.HCM', N'0989888888')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB], [Diachi], [DienThoai]) VALUES (8, N'Khoa Học & Kỹ Thuật', N'Hà Nội', N'8351056')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB], [Diachi], [DienThoai]) VALUES (9, N'aa', N'aa', N'122')
SET IDENTITY_INSERT [dbo].[NXB] OFF

create table Admin
(
	UserAdmin varchar(30) primary key,
	PassAdmin varchar(30) not null,
	Hoten Nvarchar(50),
)
insert into Admin values('admin','123456',N'Nguyễn Khải')
insert into Admin values('user','123456',N'Mr Khải')

SET IDENTITY_INSERT [dbo].[DOCGIA] ON 
insert into DOCGIA (MaDG, TenDG, DiaChi, DienThoai, Email, TenDN, MatKhau) values (1, 'Boonie Checklin', '76417 Jana Center', '7991934857', 'bchecklin0@blogspot.com', 'User1', '123456');
insert into DOCGIA (MaDG, TenDG, DiaChi, DienThoai, Email, TenDN, MatKhau) values (2, 'Ara Correa', '275 Shopko Plaza', '3982238047', 'acorrea1@admin.ch', 'User2', '123456');
insert into DOCGIA (MaDG, TenDG, DiaChi, DienThoai, Email, TenDN, MatKhau) values (3, 'Darsie Caskie', '326 Novick Parkway', '6733896329', 'dcaskie2@economist.com', 'User3', '123456');
insert into DOCGIA (MaDG, TenDG, DiaChi, DienThoai, Email, TenDN, MatKhau) values (4, 'Marlyn Kelk', '973 International Hill', '1939097790', 'mkelk3@acquirethisname.com', 'User4', '123456');
insert into DOCGIA (MaDG, TenDG, DiaChi, DienThoai, Email, TenDN, MatKhau) values (5, 'Elia Ditchburn', '9 Westridge Parkway', '9022837644', 'editchburn4@google.com.au', 'User5', '123456');
insert into DOCGIA (MaDG, TenDG, DiaChi, DienThoai, Email, TenDN, MatKhau) values (6, 'Linette Muddimer', '328 Monica Lane', '9312999623', 'lmuddimer5@ezinearticles.com', 'User6', '123456');
insert into DOCGIA (MaDG, TenDG, DiaChi, DienThoai, Email, TenDN, MatKhau) values (7, 'Wynn Largen', '03771 Kinsman Pass', '2491124023', 'wlargen6@dot.gov', 'User7', '123456');
insert into DOCGIA (MaDG, TenDG, DiaChi, DienThoai, Email, TenDN, MatKhau) values (8, 'Kleon Paxeford', '065 Village Green Plaza', '7289387095', 'kpaxeford7@blinklist.com', 'User8', '123456');
insert into DOCGIA (MaDG, TenDG, DiaChi, DienThoai, Email, TenDN, MatKhau) values (9, 'Nomi Abdee', '1 Coleman Hill', '2147039696', 'nabdee8@ow.ly', 'User9', '123456');
insert into DOCGIA (MaDG, TenDG, DiaChi, DienThoai, Email, TenDN, MatKhau) values (10, 'Linn Watkins', '49831 Welch Terrace', '4674250045', 'lwatkins9@oaic.gov.au', 'User10', '123456');
insert into DOCGIA (MaDG, TenDG, DiaChi, DienThoai, Email, TenDN, MatKhau) values (11, 'Dallas Peddowe', '4 Alpine Drive', '6629668715', 'dpeddowea@issuu.com', 'User11', '123456');
insert into DOCGIA (MaDG, TenDG, DiaChi, DienThoai, Email, TenDN, MatKhau) values (12, 'Germayne Tack', '17 Michigan Plaza', '4603663224', 'gtackb@nhs.uk', 'User12', '123456');
insert into DOCGIA (MaDG, TenDG, DiaChi, DienThoai, Email, TenDN, MatKhau) values (13, 'Sharity Gaul', '35 Elgar Crossing', '9191652950', 'sgaulc@bing.com', 'User13', '123456');
insert into DOCGIA (MaDG, TenDG, DiaChi, DienThoai, Email, TenDN, MatKhau) values (14, 'Deeann Vauter', '76992 Sundown Avenue', '3426226220', 'dvauterd@homestead.com', 'User14', '123456');
insert into DOCGIA (MaDG, TenDG, DiaChi, DienThoai, Email, TenDN, MatKhau) values (15, 'Billie Vallow', '17 Hollow Ridge Lane', '7825652449', 'bvallowe@themeforest.net', 'User15', '123456');
insert into DOCGIA (MaDG, TenDG, DiaChi, DienThoai, Email, TenDN, MatKhau) values (16, 'Gary Ricarde', '5309 Stone Corner Point', '7221535733', 'gricardef@wordpress.org', 'User16', '123456');
insert into DOCGIA (MaDG, TenDG, DiaChi, DienThoai, Email, TenDN, MatKhau) values (17, 'Karena Fitchen', '299 Esch Place', '5114849282', 'kfitcheng@gnu.org', 'User17', '123456');
insert into DOCGIA (MaDG, TenDG, DiaChi, DienThoai, Email, TenDN, MatKhau) values (18, 'Lammond Bummfrey', '1 Carberry Point', '5508764622', 'lbummfreyh@marriott.com', 'User18', '123456');
insert into DOCGIA (MaDG, TenDG, DiaChi, DienThoai, Email, TenDN, MatKhau) values (19, 'Elberta Ilyenko', '4771 Annamark Drive', '9537927702', 'eilyenkoi@earthlink.net', 'User19', '123456');
insert into DOCGIA (MaDG, TenDG, DiaChi, DienThoai, Email, TenDN, MatKhau) values (20, 'Christan Loudian', '27859 Mallard Point', '1971131838', 'cloudianj@symantec.com', 'User20', '123456');
insert into DOCGIA (MaDG, TenDG, DiaChi, DienThoai, Email, TenDN, MatKhau) values (21, 'Blithe Lambe', '2828 Clemons Point', '7508945202', 'blambek@infoseek.co.jp', 'User21', '123456');
insert into DOCGIA (MaDG, TenDG, DiaChi, DienThoai, Email, TenDN, MatKhau) values (22, 'Noella Cecere', '9 Shoshone Alley', '7586577769', 'ncecerel@reference.com', 'User22', '123456');
insert into DOCGIA (MaDG, TenDG, DiaChi, DienThoai, Email, TenDN, MatKhau) values (23, 'Olly Canto', '4 7th Lane', '1202893192', 'ocantom@webnode.com', 'User23', '123456');
insert into DOCGIA (MaDG, TenDG, DiaChi, DienThoai, Email, TenDN, MatKhau) values (24, 'Evelin Frosch', '129 Moulton Center', '5827619114', 'efroschn@icio.us', 'User24', '123456');
insert into DOCGIA (MaDG, TenDG, DiaChi, DienThoai, Email, TenDN, MatKhau) values (25, 'Janessa Judkins', '5006 Springs Center', '1841191853', 'jjudkinso@ocn.ne.jp', 'User25', '123456');
insert into DOCGIA (MaDG, TenDG, DiaChi, DienThoai, Email, TenDN, MatKhau) values (26, 'Tilda Arlet', '52 Northwestern Street', '9671055711', 'tarletp@admin.ch', 'User26', '123456');
insert into DOCGIA (MaDG, TenDG, DiaChi, DienThoai, Email, TenDN, MatKhau) values (27, 'Nikolaos Eate', '29 Westport Park', '2096972267', 'neateq@pcworld.com', 'User27', '123456');
insert into DOCGIA (MaDG, TenDG, DiaChi, DienThoai, Email, TenDN, MatKhau) values (28, 'Kyle Tetlow', '533 Clemons Alley', '1088545502', 'ktetlowr@statcounter.com', 'User28', '123456');
insert into DOCGIA (MaDG, TenDG, DiaChi, DienThoai, Email, TenDN, MatKhau) values (29, 'Toma Wildblood', '0839 Johnson Drive', '2257330360', 'twildbloods@microsoft.com', 'User29', '123456');
insert into DOCGIA (MaDG, TenDG, DiaChi, DienThoai, Email, TenDN, MatKhau) values (30, 'Lindy Jirusek', '4147 Anzinger Way', '9011828220', 'ljirusekt@disqus.com', 'User30', '123456');
SET IDENTITY_INSERT [dbo].[DOCGIA] OFF

SET IDENTITY_INSERT TACGIA ON
insert into TACGIA (MaTG, TenTG, DiaChiTG, DienThoaiTG) values (1, 'Avram Gilford', '10 Glacier Hill Parkway', '4796666449');
insert into TACGIA (MaTG, TenTG, DiaChiTG, DienThoaiTG) values (2, 'Anson Devany', '37560 Continental Hill', '3037799871');
insert into TACGIA (MaTG, TenTG, DiaChiTG, DienThoaiTG) values (3, 'Laraine Roch', '01 Gateway Park', '4979245532');
insert into TACGIA (MaTG, TenTG, DiaChiTG, DienThoaiTG) values (4, 'Cristine Coggeshall', '8764 Kipling Hill', '5286527509');
insert into TACGIA (MaTG, TenTG, DiaChiTG, DienThoaiTG) values (5, 'Gracie Filippazzo', '8 Trailsway Plaza', '4854835808');
insert into TACGIA (MaTG, TenTG, DiaChiTG, DienThoaiTG) values (6, 'Katey Wolfendale', '454 Bowman Alley', '1273392802');
insert into TACGIA (MaTG, TenTG, DiaChiTG, DienThoaiTG) values (7, 'Roselin Eddie', '5594 South Drive', '1649603536');
insert into TACGIA (MaTG, TenTG, DiaChiTG, DienThoaiTG) values (8, 'Bax Moller', '4025 Bayside Point', '3362853775');
insert into TACGIA (MaTG, TenTG, DiaChiTG, DienThoaiTG) values (9, 'Gillian Silversmidt', '46875 Merchant Trail', '3069905099');
insert into TACGIA (MaTG, TenTG, DiaChiTG, DienThoaiTG) values (10, 'Lotti Woodus', '1903 Elka Plaza', '4757137228');
insert into TACGIA (MaTG, TenTG, DiaChiTG, DienThoaiTG) values (11, 'Odie Bloor', '5488 Carpenter Place', '1342917453');
insert into TACGIA (MaTG, TenTG, DiaChiTG, DienThoaiTG) values (12, 'Mona Parnell', '59 Glendale Road', '5243969665');
insert into TACGIA (MaTG, TenTG, DiaChiTG, DienThoaiTG) values (13, 'Ana Schouthede', '6191 Rieder Trail', '2007250376');
insert into TACGIA (MaTG, TenTG, DiaChiTG, DienThoaiTG) values (14, 'Moshe Joy', '07832 Dorton Center', '6966740844');
insert into TACGIA (MaTG, TenTG, DiaChiTG, DienThoaiTG) values (15, 'Nananne O''Sheilds', '19 American Crossing', '7136182286');
insert into TACGIA (MaTG, TenTG, DiaChiTG, DienThoaiTG) values (16, 'Jephthah Keyes', '35390 Russell Point', '2559256669');
insert into TACGIA (MaTG, TenTG, DiaChiTG, DienThoaiTG) values (17, 'Rey Lyttle', '9868 Valley Edge Road', '2018588042');
insert into TACGIA (MaTG, TenTG, DiaChiTG, DienThoaiTG) values (18, 'Sheeree Van Der Walt', '2 Debs Park', '7974155574');
insert into TACGIA (MaTG, TenTG, DiaChiTG, DienThoaiTG) values (19, 'Terrel Hellard', '9007 Melody Circle', '8704115599');
insert into TACGIA (MaTG, TenTG, DiaChiTG, DienThoaiTG) values (20, 'Benoit Cominoli', '94 Kingsford Hill', '7065412194');
SET IDENTITY_INSERT TACGIA OFF


SET IDENTITY_INSERT [dbo].[SACH] ON 
INSERT [dbo].[SACH] ([Masach], [Tensach],[Mota], [Hinhminhhoa], [MaCD], [MaNXB], SoLuongCon ,[Ngaycapnhat]) VALUES (1, N'Giáo trình Tin học cơ bản',N'Nội dung của cuốn: Tin Học Cơ Bản Windows XP gồm có 7 chương:
Chương 1: Một số vấn đề cơ bản. 
Chương 2: Sử dụng nhanh thanh công cụ và thanh thực đơn trong My Computer và Windows Explorer. 
Chương 3: Các thao tác trong windows XP. 
Chương 4: Các thiết lập trong Windows XP. 
Chương 5: Bảo trì máy tính. 
Chương 6: Các phím tắt 
Chương 7: Hỏi và đáp các thắc mắc.
Xin trân trọng giới thiệu cuốn sách cùng bạn', N'TH001.jpg', 7, 1, 10 , CAST(N'2004-07-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[SACH] ([Masach], [Tensach],[Mota], [Hinhminhhoa], [MaCD], [MaNXB], SoLuongCon ,[Ngaycapnhat])  VALUES (2, N'Giáo trình Tin học văn phòng', N'Cuốn sách này gồm 3 phần sau:
Phần 1: Xử lý văn bản trong Microsoft Office Word 2007. 
Phần 2: Xử lý bảng tính trong Microsoft Office Excel 2007. 
Phần 3: Quản lý cơ sở dữ liệu trong Microsoft Office Access 2007.
Xin trân trọng giới thiệu cùng các bạn.', N'TH004.jpg', 3, 2, 10 , CAST(N'2004-06-05T00:00:00' AS SmallDateTime))
INSERT [dbo].[SACH] ([Masach], [Tensach],[Mota], [Hinhminhhoa], [MaCD], [MaNXB], SoLuongCon ,[Ngaycapnhat])  VALUES (3, N'Lập Trình Cơ Sở Dữ Liệu Với Visual Basic 2005 Và ADO.NET 2.0', N'Cuốn sách "Lập Trình Cơ Sở Dữ Liệu Với Visual Basic 2005 Và ADO.NET 2.0" này giới thiệu các nội dung sau:
Chương 1: Căn bản về cơ sở dữ liệu.
Chương 2: Các bộ kết nối và tương tác dữ liệu.
Chương 3: Bộ chứa dữ liệu DataSet.
Chương 4: Bộ điều hợp dữ liệu DataAdapter.
Chương 5: Sử dụng các điều khiển ràng buộc dữ liệu.
Chương 6: Tạo báo cáo với Crystal Report.
Chương 7: ADO.NET và XML.
Xin trân trọng giới thiệu cùng các bạn.', N'TH003.jpg', 7, 3, 10,CAST(N'2004-07-12T00:00:00' AS SmallDateTime))
INSERT [dbo].[SACH] ([Masach], [Tensach],[Mota], [Hinhminhhoa], [MaCD], [MaNXB], SoLuongCon ,[Ngaycapnhat])  VALUES (4, N'Visual Basic 2005 Tập 3, Quyển 2: Lập Trình Web', N'"Visual Basic 2005 Tập 3, Quyển 2: Lập Trình Web Với Cơ Sở Dữ Liệu" sẽ cung cấp kỹ thuật và hướng dẫn bạn:
Tự học xây dựng ứng dụng Web quản lý CSDL toàn diện với ADO.NET 2.0 và ASP.NET. 
Khai thác các đối tượng và nguồn dữ liệu dành cho WebForm. 
Sử dụng các điều khiển dữ liệu đặc thù dành riêng cho ASP.NET và Web. 
Làm quen với những khái niệm xử lý dữ liệu hoàn toàn mới. 
Ràng buộc dữ liệu với các thành phần giao diện Web Forms. 
Thiết kế ứng dụng Web "Quản lý CD Shop" trực quan và thực tế. 
Cung cấp một kiến thức hoàn chỉnh về Web cho các bạn yêu thích ngôn ngữ Visual Basic và .NET Framework.
Sách có kèm theo CD-ROM bài tập.
Xin trân trọng giới thiệu cùng các bạn.', N'LTWeb2005.jpg', 8, 4, 10, CAST(N'2004-07-18T00:00:00' AS SmallDateTime))
INSERT [dbo].[SACH] ([Masach], [Tensach],[Mota], [Hinhminhhoa], [MaCD], [MaNXB], SoLuongCon ,[Ngaycapnhat])  VALUES (5, N'Giáo trình Tin học quản lý 1',  N'Mạng Máy Tính Và Hệ Thống Bảo Mật gồm 7 chương:
Chương I: Tổng quan về công nghệ mạng máy tính và mạng cục bộ.
Chương II: Các thiết bị mạng thông dụng và các chuẩn kết nối vật lý.
Chương III: TCP/IP và mạng Internet.
Chương IV: Hệ điều hành mạng đặc điểm của hệ điều hành mạng.
Chương V: Một số vấn đề an toàn và bảo mật thông tin trên mạng máy tính.
Chương VI: Giới thiệu hệ điều hành Windows NT.
Chương VII: Giới thiệu hệ điều hành UNIX.
Trân trọng giới thiệu.', N'TH001.jpg', 3, 1, 10,CAST(N'2004-06-18T00:00:00' AS SmallDateTime))
INSERT [dbo].[SACH] ([Masach], [Tensach],[Mota], [Hinhminhhoa], [MaCD], [MaNXB], SoLuongCon ,[Ngaycapnhat])  VALUES (6, N'Giáo trình Tin học quản lý 2', N'Mục đích của bộ sách này giúp bạn trở nên thành thạo cơ sở dữ liệu (CSDL) Oracle9i, đề cập đến tất cả những kiến thức cần thiết từ mô hình dữ liệu, quản trị CSDL, sao lưu phục hồi, mạng và xử lý sự cố cũng như hiệu chỉnh hiệu suất thực thi..., với sự kết hợp lý thuyết và thực hành về điều mà Nhà quản trị CSDL Oracle9i cần biết để sử dụng CSDL Oracle9i một cách hiệu quả từ chính bộ sách này.
Bộ sách được chia làm 2 tập, tập 1 đề cập các kiến thức cơ bản về CSDL, mô hình dữ liệu. Bạn sẽ được biết về hệ quản trị CSDL Oracle9i, tạo CSDL, kết nối và quản lý người dùng. Tập 2 hướng dẫn bạn cách nạp, sao lưu và phục hồi dữ liệu, quản lý hoạt động CSDL Oracle9i, thực hiện hiệu chỉnh hiệu suất thực thi và xử lý sự cố cho CSDL.
Xin trân trọng giới thiệu Tập 1 cùng các bạn.', N'130499.jpg', 10, 5, 10,CAST(N'2004-05-15T00:00:00' AS SmallDateTime))
INSERT [dbo].[SACH] ([Masach], [Tensach],[Mota], [Hinhminhhoa], [MaCD], [MaNXB], SoLuongCon ,[Ngaycapnhat])  VALUES (7, N'Giáo trình SQL Server', N'Hệ quản trị cơ sở dữ liệu SQl Server 2003
Test thu', N'Gt_Thcb.jpg', 3, 6, 10,CAST(N'2004-08-16T00:00:00' AS SmallDateTime))
INSERT [dbo].[SACH] ([Masach], [Tensach],[Mota], [Hinhminhhoa], [MaCD], [MaNXB], SoLuongCon ,[Ngaycapnhat])  VALUES (8, N'Phong Cách Quản Lý Kinh Doanh Hiện Đại ', N'Cuốn sách này không đi vào chi tiết những chủ đề quản lý cổ điển đã được nhắc đến trong nhiều cuốn sách khác như tổ chức cuộc họp, cung cấp số liệu, quản lý thời gian. Mục đích của cuốn sách này là mang lại cho bạn "nhiều hơn", một giá trị gia tăng so với những gì bạn đã biết và đã áp dụng, và giúp bạn tối ưu hóa việc quản lý chuyên môn và quản lý nhân sự.
Nội dung sách bao gồm 9 chương:
Chương 1: Bốn cách nhìn quản lý theo sắc màu.
Chương 2: Quản lý các sắc màu của một cộng tác viên.
Chương 3: Quản lý nhóm theo màu sắc.
Chương 4: Quyết định cách thích hợp dựa vào bản thân, người khác và hoàn cảnh.
Chương 5: Phát triển hiệu quả tối ưu theo sắc màu.
Chương 6: Hiểu rõ những sai lệch trong cách quản lý của mình.
Chương 7: Nền tảng cơ sở của hệ thống Success Insights: Bốn màu với tám kiểu.
Chương 8: Nhận biết và quản lý tám kiểu cộng tác viên.
Chương 9: Cải thiện người quản lý.
Xin trân trọng giới thiệu. 
', N'KT0001.jpg', 9, 8, 10,CAST(N'2003-09-16T00:00:00' AS SmallDateTime))
INSERT [dbo].[SACH] ([Masach], [Tensach],[Mota], [Hinhminhhoa], [MaCD], [MaNXB], SoLuongCon ,[Ngaycapnhat])  VALUES (10, N'Cán Bộ Quản Lý Trong Sản Xuất Công Nghiệp', N'Cuốn sách này gồm những nội dung chính sau:
Phần 1: Quản lý sản xuất công nghiệp trong kinh tế thị trường
- Kinh doanh sản xuất công nghiệp trong kinh tế thị trường
- Sự cần thiết và các chức năng của quản lý nhà nước đối với doanh nghiệp sản xuất công nghiệp
- Nội dung và tính chất của những công việc mà cán bộ quản lý sản xuất công nghiệp phải đảm nhiệm, hoàn thành.
- Kinh nghiệm đào tạo và đánh giá cán bộ quản lý kinh doanh ở Nhật.
Phần 2: Thực trạng và một số giải pháp nhằm nâng cao chất lượng đội ngũ cán bộ quản lý sản xuất công nghiệp Việt Nam
- Thực trạng cán bộ quản lý doanh nghiệp công nghiệp của Việt Nam
- Tiêu chuẩn hóa cán bộ quản lý sản xuất công nghiệp Việt Nam
- Đổi mới căn bản nội dung và phương pháp đào tạo cán bộ quản lý sản xuất công nghiệp Việt Nam
Xin trân trọng giới thiệu. 
 
', N'KT0001.jpg', 5, 6, 10,CAST(N'2003-08-27T00:00:00' AS SmallDateTime))
INSERT [dbo].[SACH] ([Masach], [Tensach],[Mota], [Hinhminhhoa], [MaCD], [MaNXB], SoLuongCon ,[Ngaycapnhat])  VALUES (11, N'Tư Duy Chiến Lược (Quản Lý - Tại Sao? Thế Nào?', N'Khả năng hoạch định dài hạn đồng thời tối ưu hóa tình hình hoạt động ngắn hạn là một yêu cầu bắt buộc phải có đối với các nhà quản lý.Tư Duy Chiến Lược sẽ giúp bạn vạch ra con đường đến thành công đồng thời giúp hình thành các kỹ năng phân tích và hoạch định theo nhóm. Tất cả các lĩnh vực then chốt để hình thành và thực thi một chiến lược đều được trình bày cặn kẽ trong cuốn sách này, từ việc nghiên cứu và thu thập thông tin nền tảng, hình thành một chiến lược mới đến việc xem xét và ứng dụng chiến lược ấy. Cả thảy có 101 chỉ dẫn nhằm cung cấp cho các bạn những lời khuyên thực tiễn hơn, đồng thời bài tập tự đánh giá sẽ giúp bạn xác định xem mình là một nhà tư duy chiến lược hiệu quả đến mức nào. Khi bạn có nhiều tham vọng hơn về việc hoạch định cho tương lai, cẩm nang này sẽ là quyển sách tham khảo không thể thiếu, giúp suy nghĩ của bạn đi đúng hướng.
Xin trân trọng giới thiệu cuốn sách cùng bạn. ', N'KT0001.jpg', 11, 3, 10,CAST(N'2003-09-19T00:00:00' AS SmallDateTime))
INSERT [dbo].[SACH] ([Masach], [Tensach],[Mota], [Hinhminhhoa], [MaCD], [MaNXB], SoLuongCon ,[Ngaycapnhat])  VALUES (12, N'Quản Lý Dự Án (Quản Lý - Tại Sao? Thế Nào?) ', N'Để thành công trong môi trường kinh doanh cạnh tranh hiện nay, các giám đốc dự án phải đạt được kết quả trong phạm thời gian và ngân sách đưa ra. Biết cách áp dụng các quy trình, phương pháp và kỹ thuật chỉ dẫn trong cuốn Quản Lý Dự Án này, bạn sẽ tăng tối đa khả năng thực hiện công việc và đảm bảo đạt kết quả tối ưu khi thực hiện dự án.
Được thiết kế phù hợp với tất cả các nhà quản lý ở đủ mọi trình độ, cẩm nang này sẽ trang bị cho bạn những kiến thức cần thiết trong việc quản lý mọi dự án, dù lớn hay nhỏ, để đạt đến thành công. Từ việc khởi xướng một dự án, thúc đẩy, phát triển nhóm dự án đến việc vượt qua những khó khăn, trở ngại; mỗi một khía cạnh của quản lý dự án chuyện nghiệp đều được trình bày một cách rõ nét. Cẩm nang bao gồm các hướng dẫn từng bước về hoạch định dự án và 101 mẹo vặt cung cấp cho bạn những lời khuyên thực tế. 
', N'KT0001.jpg', 4, 8, 10,CAST(N'2003-07-15T00:00:00' AS SmallDateTime))
INSERT [dbo].[SACH] ([Masach], [Tensach],[Mota], [Hinhminhhoa], [MaCD], [MaNXB], SoLuongCon ,[Ngaycapnhat])  VALUES (13, N'Điều Chỉnh Một Số Chính Sách Kinh Tế Ở Trung Quốc (Giai Đoạn 1992 - 2010)',N'Cuốn sách này tập trung vào một số nội dung chính sau đây:

Tìm hiểu về những nhân tố đòi hỏi Trung Quốc phải điều chỉnh chính sách kinh tế.

Tìm hiểu về những nội dung chính trong điều chỉnh kinh tế ở Trung Quốc giai đoạn từ năm 1992 - 2010.

Tìm hiểu về tác động của việc điều chỉnh chính sách kinh tế của Trung Quốc đối với thế giới và khu vực trong đó có Việt Nam, sau đó rút tỉa một số kinh nghiệm của Trung Quốc trong quá trình điều chỉnh chính sách kinh tế mà Việt Nam có thể tham khảo.
Tập thể tác giả tham gia công trình này đều là những người chuyên nghiên cứu về Trung Quốc, hy vọng sẽ đem lại cho các bạn nhiều thông tin bổ ích.', N'KT0001.jpg', 1, 7, 10,CAST(N'2004-05-15T00:00:00' AS SmallDateTime))
INSERT [dbo].[SACH] ([Masach], [Tensach],[Mota], [Hinhminhhoa], [MaCD], [MaNXB], SoLuongCon ,[Ngaycapnhat])  VALUES (14, N'30 phút mỗi ngày để luyện kỹ năng viết câu tiếng Anh', N'30 phút mỗi ngày để luyện kỹ năng viết câu tiếng Anh là một cuốn sách bài tập dành cho những học sinh/sinh viên nghiêm túc quan tâm đến tầm quan trọng của việc nâng cao những yếu tố kỹ thuật cho kỹ năng viết của mình. Rèn luyện để viết cho tốt chẳng khác gì tự trang bị cho mình một sức mạnh cần thiết để thành công - khi đi học cũng như khi ra ngoài xã hội. Trui rèn được một trình độ viết “cứng” không hề là chuyện bỗng nhiên trời cho mà có được; đó phải là kết quả của một quá trình phấn đấu bền bỉ và rèn luyện chăm chỉ.

Đặc nét của sách này là sử dụng cách tiếp cận những kỹ thuật kết hợp câu cơ bản, có nghĩa là, sách không chỉ quan tâm đến việc tránh những sai lỗi, mà còn đặt mục tiêu tạo dựng được những câu hay, linh hoạt, và thể hiện một phong cách riêng. Cạnh đó, sách còn có những điểm đáng lưu ý như: 

- Bàn thảo rõ ràng về những qui tắc và kỹ thuật giúp viết tốt.

- Giải thích súc tích, hạn chế dùng những thuật ngữ ngữ pháp.

- Lương bài tập phong phú, đa dạng, từ những câu hỏi điền vào chỗ trống với mục đích xác định các từ loại cho đến những câu hỏi kết hợp những câu ngắn thành những câu văn dài hơn, ý tứ “duyên” hơn.

- Đáp án cuối sách nhằm giúp học sinh/sinh viên học và nghiên cứu nhanh chậm theo trình độ và ý thích của mình, đồng thời kiểm tra được bài làm trong quá trình học tập.

Học sinh/sinh viên tiếp thu tốt nhất khi họ tham gia tích cực và quá trình học. Họ rất thích những bài tập nào rèn cho họ được những kỹ năng viết họ cần đồng thời có giá trị thông tin nào đó hoặc vui vui. Đó chính là lý do cuốn sách này sử dụng đủ loại chủ đề thú vị trong các bài tập. Cũng vì lý do tương tự, sách có phần trình bày và giảng giải rất ngắn gọn những đưa ra rất nhiều những ví dụ và minh họa mở rộng.

Sử dụng cuốn 30 phút mỗi ngày để luyện kỹ năng viết câu tiếng Anh này sẽ giúp học sinh/sinh viên viết “có nghề” và tự tin hơn".', N'TiengAnh01.jpg', 2, 1, 10,CAST(N'2000-09-20T00:00:00' AS SmallDateTime))
INSERT [dbo].[SACH] ([Masach], [Tensach],[Mota], [Hinhminhhoa], [MaCD], [MaNXB], SoLuongCon ,[Ngaycapnhat])  VALUES (15, N'Tin Học Ứng Dụng: Thành Thạo Oracle 9i - Quản Trị Cơ Sở Dữ Liệu (Tập 1) ', N'Mục đích của bộ sách này giúp bạn trở nên thành thạo cơ sở dữ liệu (CSDL) Oracle9i, đề cập đến tất cả những kiến thức cần thiết từ mô hình dữ liệu, quản trị CSDL, sao lưu phục hồi, mạng và xử lý sự cố cũng như hiệu chỉnh hiệu suất thực thi..., với sự kết hợp lý thuyết và thực hành về điều mà Nhà quản trị CSDL Oracle9i cần biết để sử dụng CSDL Oracle9i một cách hiệu quả từ chính bộ sách này.
Bộ sách được chia làm 2 tập, tập 1 đề cập các kiến thức cơ bản về CSDL, mô hình dữ liệu. Bạn sẽ được biết về hệ quản trị CSDL Oracle9i, tạo CSDL, kết nối và quản lý người dùng. Tập 2 hướng dẫn bạn cách nạp, sao lưu và phục hồi dữ liệu, quản lý hoạt động CSDL Oracle9i, thực hiện hiệu chỉnh hiệu suất thực thi và xử lý sự cố cho CSDL.
Xin trân trọng giới thiệu Tập 1 cùng các bạn. ', N'TH001.jpg', 1, 2, 10,CAST(N'2003-09-16T00:00:00' AS SmallDateTime))
INSERT [dbo].[SACH] ([Masach], [Tensach],[Mota], [Hinhminhhoa], [MaCD], [MaNXB], SoLuongCon ,[Ngaycapnhat])  VALUES (16, N'Mạng Máy Tính Và Hệ Thống Bảo Mật ', N'Mạng Máy Tính Và Hệ Thống Bảo Mật gồm 7 chương:
Chương I: Tổng quan về công nghệ mạng máy tính và mạng cục bộ.
Chương II: Các thiết bị mạng thông dụng và các chuẩn kết nối vật lý.
Chương III: TCP/IP và mạng Internet.
Chương IV: Hệ điều hành mạng đặc điểm của hệ điều hành mạng.
Chương V: Một số vấn đề an toàn và bảo mật thông tin trên mạng máy tính.
Chương VI: Giới thiệu hệ điều hành Windows NT.
Chương VII: Giới thiệu hệ điều hành UNIX.
Trân trọng giới thiệu. 
', N'TH001.jpg', 4, 1, 10,CAST(N'2002-07-16T00:00:00' AS SmallDateTime))
INSERT [dbo].[SACH] ([Masach], [Tensach],[Mota], [Hinhminhhoa], [MaCD], [MaNXB], SoLuongCon ,[Ngaycapnhat])  VALUES (17, N'Thủ Thuật Lập Trình Visual Basic 6 ',N'Mục Lục:
Chương 1: Multimedia.
Chương 2: String.
Chương 3: Form.
Chương 4:Windows Control.
Chương 5: Common Control.
Chương 6: System.
Chương 7: Disk - File.
Chương 8: Graphics.
Chương 9: Internet.
Chương 10: Microsoft Office.
Chương 11: Database.
Chương 12: Clipboard.
Chương 13: Các vấn đề khác.
Phụ lục A: Giới thiệu một số ActiveX Control.
Phụ lục B: Một số tiện ích hỗ trợ lập trình Win32 API.
Phụ lục C: Một số vấn đề về đóng gói phần mềm.
Phụ lục D: Giới thiệu một số Website về Visual Basic.
Trân trọng giới thiệu. 
', N'TH001.jpg', 6, 7, 10,CAST(N'2004-09-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[SACH] ([Masach], [Tensach],[Mota], [Hinhminhhoa], [MaCD], [MaNXB], SoLuongCon ,[Ngaycapnhat])  VALUES (18, N'Lập Trình Mạng Trên Windows (Ấn bản dành cho sinh viên) ',N'Chào mừng đến với "Lập Trình Mạng Trên Windows (Ấn bản dành cho sinh viên)". Quyển sách này sẽ hướng dẫn bạn sử dụng một cách hiệu quả bao gồm một số lượng lớn và đa dạng các hàm mạng sẵn có trong Windows 95, Windows 98, Windows NT 4, Windows CE, và Windows 2000/XP/. NET. Sách được chủ định viết dành cho những lập trình viên từ trung cấp đến cao cấp, tuy nhiên những lập trình viên mới bắt đầu tìm hiểu lập trình mạng cũng sẽ nhận thấy đây là một quyển sách không thể thiếu cho các bước xây dựng ứng dụng mạng sau này.
', N'TH001.jpg', 5, 5, 10,CAST(N'2004-05-15T00:00:00' AS SmallDateTime))
INSERT [dbo].[SACH] ([Masach], [Tensach],[Mota], [Hinhminhhoa], [MaCD], [MaNXB], SoLuongCon ,[Ngaycapnhat])  VALUES (19, N'Căn Bản Về Photoshop CS Tinh Chỉnh Và Xử Lý Màu ', N'"Căn Bản Về Photoshop CS Tinh Chỉnh Và Xử Lý Màu" gồm 12 chương:
Chương 1: Những điểm cơ bản.
Chương 2: Màu Photoshop.
Chương 3: Các tác vụ xử lý ảnh căn bản.
Chương 4: Các điểm cơ bản về pixel.
Chương 5: Các điểm cơ bản về lớp.
Chương 6: Làm việc với các công cụ chọn.
Chương 7: Ghép ảnh.
Chương 8: Làm việc với các palette History.
Chương 9: Các kỹ thuật điều chỉnh hình ảnh.
Chương 10: Chọn các màu.
Chương 11: Tô màu lại.
Chương 12: Làm việc với các công cụ tô vẽ.
Xin trân trọng giới thiệu. ', N'TH002.jpg', 1, 6, 10,CAST(N'2004-08-16T00:00:00' AS SmallDateTime))
INSERT [dbo].[SACH] ([Masach], [Tensach],[Mota], [Hinhminhhoa], [MaCD], [MaNXB], SoLuongCon ,[Ngaycapnhat])  VALUES (20, N' Hướng Dẫn Sử Dụng Norton AntiVirus 2004 (Hướng dẫn bằng hình)  
 ', N'"Hướng Dẫn Sử Dụng Norton AntiVirus 2004 (Hướng dẫn bằng hình)" bao gồm 6 phần, 23 chương:
Phần I: Bắt đầu với Norton AntiVirus 2004.
Chương 1: Bắt đầu với Norton AntiVirus 2004.
Chương 2: Cài đặt Norton System Works Professional.
Chương 3: Các điểm cơ bản về Norton AntiVirus 2004.
Chương 4: Các tùy chọn trong Norton SystemWorks.
Chương 5: Cải tiến sự trình duyệt Web và phục hồi đĩa cứng.
Chương 6: Duy trì tính bảo mật password và cập nhật với LiveUpdate.
Phần II: Làm việc với Norton AntiVirus 2004.
Chương 7: Bảo vệ đĩa, file và dữ liệu để tránh bị nhiễm Virus.
Chương 8: Những điều cần làm nếu phát hiện virus.
', N'TH002.jpg', 5, 7, 10,CAST(N'2003-07-15T00:00:00' AS SmallDateTime))
INSERT [dbo].[SACH] ([Masach], [Tensach],[Mota], [Hinhminhhoa], [MaCD], [MaNXB], SoLuongCon ,[Ngaycapnhat])  VALUES (21, N'Tin Học Văn Phòng - Microsoft Word 2000 (Tái Bản Lần Thứ Nhất) ', N'Đây là sách giáo dục ', N'TH002.jpg', 2, 8, 10,CAST(N'2003-02-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[SACH] ([Masach], [Tensach],[Mota], [Hinhminhhoa], [MaCD], [MaNXB], SoLuongCon ,[Ngaycapnhat])  VALUES (22, N'Adobe Photoshop 6.0 và ImageReady 3.0 ', N'Cuốn sách Adobe Photoshop 6.0 và ImageReady 3.0 này sẽ giúp bạn tìm hiểu những tính năng tuyệt vời của phiên bản 6.0, nó cũng là con đường ngắn nhất cho những người mới sử dụng Photoshop lần đầu. Với bạn đọc đã sử dụng cuốn sách "Adobe Photoshop 5.5 và ImageReady 2.0" do MK.PUB biên soạn trước đây, cuốn sách này là một cách cập nhật nhanh chóng nhất.
Adobe Photoshop 6.0 và ImageReady 3.0 gồm hai phần chính, đan xen nhau: 

Adobe Photoshop 6.0: trình bày các kỹ thuật xử lý ảnh cao cấp, các tính năng mới, giúp bạn tạo được các ảnh đẹp, rõ nét và mang tính mỹ thuật cao, hỗ trợ đắc lực cho các chương trình dàn trang và tách màu điện tử. Đặc biệt trong phiên bản này, để đáp ứng cho mong mỏi từ lâu của người dùng, các hình thể vector bắt đầu được đưa vào sử dụng trong môi trường Photoshop.

', N'TH002.jpg', 5, 5, 10,CAST(N'2002-04-12T00:00:00' AS SmallDateTime))
INSERT [dbo].[SACH] ([Masach], [Tensach],[Mota], [Hinhminhhoa], [MaCD], [MaNXB], SoLuongCon ,[Ngaycapnhat])  VALUES (23, N'Hướng Dẫn Tự Học Photoshop CS (Photoshop 8.0) ', N' ', N'TH003.jpg', 8, 4, 10,CAST(N'2006-09-16T00:00:00' AS SmallDateTime))
INSERT [dbo].[SACH] ([Masach], [Tensach],[Mota], [Hinhminhhoa], [MaCD], [MaNXB], SoLuongCon ,[Ngaycapnhat])  VALUES (24, N'Tin Học Văn Phòng - Microsoft Excel 2000 (Tái Bản Lần Thứ Nhất)  
 
 
', N'Cuốn sách này gồm những nội dung chính sau:
Chương 1: Giới thiệu
Chương 2: Soạn thảo văn bản
Chương 3: Trình bày Font chữ
Chương 4: Trình bày Paragraph
Chương 5: Trình bày trang in
Chương 6: Bảng biểu - Table
Chương 7: Cột chữ - Column
Chương 8: Hình vẽ
Chương 9: Microsoft Equation
Chương 10: Trình bày văn bản nhanh
Chương 11: Bài tập mẫu
Xin trân trọng giới thiệu. 
', N'TH003.jpg', 6, 5, 10,CAST(N'2003-05-24T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[SACH] OFF

SET IDENTITY_INSERT [dbo].[VIETSACH] ON 
INSERT [dbo].[VIETSACH] ([MaTG], [Masach], [Vaitro]) VALUES (1, 1, N'Tác giả')
INSERT [dbo].[VIETSACH] ([MaTG], [Masach], [Vaitro]) VALUES (2, 24, N'Tác giả')
INSERT [dbo].[VIETSACH] ([MaTG], [Masach], [Vaitro]) VALUES (3, 1, N'Đồng tác giả')
INSERT [dbo].[VIETSACH] ([MaTG], [Masach], [Vaitro]) VALUES (3, 2, N'Tác giả')
INSERT [dbo].[VIETSACH] ([MaTG], [Masach], [Vaitro]) VALUES (4, 1, N'Hiệu đính')
INSERT [dbo].[VIETSACH] ([MaTG], [Masach], [Vaitro]) VALUES (5, 3, N'Tác giả')
INSERT [dbo].[VIETSACH] ([MaTG], [Masach], [Vaitro]) VALUES (5, 4, N'Tác giả')
INSERT [dbo].[VIETSACH] ([MaTG], [Masach], [Vaitro]) VALUES (5, 19, N'Tác giả')
INSERT [dbo].[VIETSACH] ([MaTG], [Masach], [Vaitro]) VALUES (6, 3, N'Hiệu đính')
INSERT [dbo].[VIETSACH] ([MaTG], [Masach], [Vaitro]) VALUES (6, 5, N'Tác giả')
INSERT [dbo].[VIETSACH] ([MaTG], [Masach], [Vaitro]) VALUES (6, 11, N'Tác giả')
INSERT [dbo].[VIETSACH] ([MaTG], [Masach], [Vaitro]) VALUES (7, 8, N'Tác giả')
INSERT [dbo].[VIETSACH] ([MaTG], [Masach], [Vaitro]) VALUES (7, 14, N'Tác giả')
INSERT [dbo].[VIETSACH] ([MaTG], [Masach], [Vaitro]) VALUES (8, 7, N'Tác giả')
INSERT [dbo].[VIETSACH] ([MaTG], [Masach], [Vaitro]) VALUES (8, 20, N'Tác giả')
INSERT [dbo].[VIETSACH] ([MaTG], [Masach], [Vaitro]) VALUES (10, 1, N'Chủ biên')
INSERT [dbo].[VIETSACH] ([MaTG], [Masach], [Vaitro]) VALUES (10, 22, N'Tác giả')
INSERT [dbo].[VIETSACH] ([MaTG], [Masach], [Vaitro]) VALUES (11, 10, N'Tác giả')
INSERT [dbo].[VIETSACH] ([MaTG], [Masach], [Vaitro]) VALUES (11, 23, N'Tác giả')
INSERT [dbo].[VIETSACH] ([MaTG], [Masach], [Vaitro]) VALUES (12, 5, N'Chủ biên')
INSERT [dbo].[VIETSACH] ([MaTG], [Masach], [Vaitro]) VALUES (12, 15, N'Tác giả')
INSERT [dbo].[VIETSACH] ([MaTG], [Masach], [Vaitro]) VALUES (13, 12, N'Tác giả')
INSERT [dbo].[VIETSACH] ([MaTG], [Masach], [Vaitro]) VALUES (13, 21, N'Tác giả')
INSERT [dbo].[VIETSACH] ([MaTG], [Masach], [Vaitro]) VALUES (14, 2, N'Đồng tác giả')
INSERT [dbo].[VIETSACH] ([MaTG], [Masach], [Vaitro]) VALUES (14, 6, N'Sưu tầm và biên soạn')
INSERT [dbo].[VIETSACH] ([MaTG], [Masach], [Vaitro]) VALUES (14, 16, N'Tác giả')
INSERT [dbo].[VIETSACH] ([MaTG], [Masach], [Vaitro]) VALUES (14, 17, N'Chủ biên')
INSERT [dbo].[VIETSACH] ([MaTG], [Masach], [Vaitro]) VALUES (15, 17, N'Tác giả')
INSERT [dbo].[VIETSACH] ([MaTG], [Masach], [Vaitro]) VALUES (15, 18, N'Tác giả')
INSERT [dbo].[VIETSACH] ([MaTG], [Masach], [Vaitro]) VALUES (16, 13, N'Tác giả')
SET IDENTITY_INSERT [dbo].[VIETSACH] OFF


--------------- Khi đặt hàng giảm số lượng trong bảng sản phẩm ---------------
go
CREATE TRIGGER GiamSoLuongHang ON dbo.CT_PhieuMuonSach FOR INSERT
AS
    DECLARE @maHang nvarchar(5)
    DECLARE @soLuong INT
    SELECT @maHang=Masach,@soLuong=SoLuong FROM inserted  
    UPDATE SACH SET SoLuongCon-=@soLuong WHERE Masach=@maHang
 
--------------- Khi số lượng bằng 0 không cho đặt hàng nữa ---------------
GO
CREATE TRIGGER SoLuongAm
ON SACH
FOR INSERT, UPDATE
as 
	declare @SoLuong float
	select @SoLuong=SoLuongCon from inserted
	if(@SoLuong < 0) 
		begin
		print 'hang da het khong the dat hang' 
		rollback tran
		end
 
---------------- Khi hủy đơn hàng số lượng sản phẩm sẽ tặng lại ---------------
Go
create TRIGGER HuyDonHang ON CT_PhieuMuonSach FOR DELETE AS 
BEGIN
	UPDATE SACH
	SET SoLuongCon = SoLuongCon + (SELECT SoLuong FROM deleted WHERE Masach = SACH.Masach)
	FROM SACH 
	JOIN deleted ON SACH.Masach = deleted.Masach
END
 