USE [master]
GO
/****** Object:  Database [QL_DOAN]    Script Date: 27/11/2019 2:19:24 PM ******/
CREATE DATABASE [QL_DOAN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QL_DOAN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QL_DOAN.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QL_DOAN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QL_DOAN_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QL_DOAN] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QL_DOAN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QL_DOAN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QL_DOAN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QL_DOAN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QL_DOAN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QL_DOAN] SET ARITHABORT OFF 
GO
ALTER DATABASE [QL_DOAN] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QL_DOAN] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QL_DOAN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QL_DOAN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QL_DOAN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QL_DOAN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QL_DOAN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QL_DOAN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QL_DOAN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QL_DOAN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QL_DOAN] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QL_DOAN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QL_DOAN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QL_DOAN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QL_DOAN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QL_DOAN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QL_DOAN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QL_DOAN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QL_DOAN] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QL_DOAN] SET  MULTI_USER 
GO
ALTER DATABASE [QL_DOAN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QL_DOAN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QL_DOAN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QL_DOAN] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QL_DOAN]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 27/11/2019 2:19:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[MaAdmin] [nchar](10) NOT NULL,
	[Pass] [char](10) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[MaAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietDonDatHang]    Script Date: 27/11/2019 2:19:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonDatHang](
	[MaDatHang] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL,
 CONSTRAINT [PK_ChiTietDonDatHang] PRIMARY KEY CLUSTERED 
(
	[MaDatHang] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 27/11/2019 2:19:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[MaDonHang] [int] NOT NULL,
	[DaThanhToan] [bit] NULL,
	[TinhTrangGiaoHang] [bit] NULL,
	[NgayDat] [datetime] NULL,
	[NgayGiao] [datetime] NULL,
	[MaKH] [int] NULL,
 CONSTRAINT [PK_DonDatHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 27/11/2019 2:19:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](max) NULL,
	[TaiKhoan] [varchar](50) NULL,
	[MatKhau] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[DiaChiKH] [nvarchar](200) NULL,
	[DienThoaiKH] [varchar](15) NULL,
	[NgaySinh] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Loai]    Script Date: 27/11/2019 2:19:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](100) NULL,
	[HinhLoai] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 27/11/2019 2:19:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](max) NULL,
	[Gia] [money] NULL,
	[MoTa] [nvarchar](max) NULL,
	[Hinh] [nvarchar](max) NULL,
	[MaLoai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[Admin] ([MaAdmin], [Pass]) VALUES (N'admin     ', N'123       ')
INSERT [dbo].[Admin] ([MaAdmin], [Pass]) VALUES (N'admin1    ', N'456       ')
INSERT [dbo].[Admin] ([MaAdmin], [Pass]) VALUES (N'admin2    ', N'789       ')
INSERT [dbo].[ChiTietDonDatHang] ([MaDatHang], [MaSP], [SoLuong], [DonGia]) VALUES (0, 14, 1, CAST(229 AS Decimal(18, 0)))
INSERT [dbo].[DonDatHang] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH]) VALUES (0, 0, 0, CAST(N'2019-11-11 20:50:15.187' AS DateTime), NULL, 8)
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChiKH], [DienThoaiKH], [NgaySinh]) VALUES (1, N'Nguyễn Thị Thanh Tú', N'thanhtu', N'123456', N'thanhtu170799@gmail.com', N'TPHCM', N'0764233325', CAST(N'1999-07-17' AS Date))
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChiKH], [DienThoaiKH], [NgaySinh]) VALUES (2, N'Nguyễn Ngọc Khánh Hà', N'khanhha', N'khanhha', N'khanhha@gmail.com', N'Huế', N'0779589390', CAST(N'1999-06-08' AS Date))
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChiKH], [DienThoaiKH], [NgaySinh]) VALUES (3, N'Trần Thị Minh Thư', N'minhthutran', N'1234', N'minhthutran140899@gmail.com', N'Gia Lai', N'0352693638', CAST(N'1999-08-14' AS Date))
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChiKH], [DienThoaiKH], [NgaySinh]) VALUES (8, N'Thành Hiệp', N'thanhhiep', N'hiep', N'thanhhiep1975@gmail.com', N'TPHCM', N'0799589390', CAST(N'1975-06-16' AS Date))
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChiKH], [DienThoaiKH], [NgaySinh]) VALUES (9, N'Nguyễn Ngọc Trà My', N'my', N'098', N'tramy', N'TPHCM', N'0123456789', CAST(N'1998-01-01' AS Date))
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChiKH], [DienThoaiKH], [NgaySinh]) VALUES (10, N'Bảo Anh', N'anh', N'anh23', N'baoanh', N'TPHCM', N'0987654321', CAST(N'1976-12-19' AS Date))
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[Loai] ON 

INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [HinhLoai]) VALUES (1, N'BREAKFAST', N'13.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [HinhLoai]) VALUES (2, N'DESSERT', N'14.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [HinhLoai]) VALUES (3, N'DINNER', N'3.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [HinhLoai]) VALUES (4, N'MEAT & FISH', N'11.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [HinhLoai]) VALUES (5, N'LUNCH', N'2.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [HinhLoai]) VALUES (6, N'SALADS', N'7.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [HinhLoai]) VALUES (7, N'SOUPS', N'15.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [HinhLoai]) VALUES (8, N'VEGETERIAN', N'5.png')
SET IDENTITY_INSERT [dbo].[Loai] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (1, N'Weight Loss Meal Plan', 200.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'1.PNG', 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (2, N'Eggs & Vegetables', 229.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'2.PNG', 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (3, N'Chinese Noodles', 150.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'3.PNG', 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (4, N'Chicken Lettuce', 120.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'4.PNG', 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (5, N'Japanese Saute', 140.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'5.PNG', 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (6, N'PORRIDGE', 100.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'6.PNG', 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (7, N'Tofu Cheese', 150.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'7.PNG', 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (8, N'TOMATO OMELETE', 200.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'8.PNG', 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (9, N'TUNA SALAD', 110.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'9.PNG', 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (10, N'Vegetable Salad', 130.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'10.PNG', 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (11, N'Baked salmon', 200.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'11.PNG', 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (12, N'Chilli Wings', 250.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'12.PNG', 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (13, N'CHINESE NOODLES', 150.0000, N'Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla
 facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'3.PNG', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (14, N'EGGS & VEGETABLES', 229.0000, N'Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'2.PNG', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (15, N'PORRIDGE', 100.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'6.PNG', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (16, N'TOMATO OMELETE', 200.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'8.PNG', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (17, N'Fruit Porridge', 220.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'13.PNG', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (18, N'MAPLE MUFFINS', 150.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'14.PNG', 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (19, N'MAPLE MUFFINS', 160.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'trangmieng5.PNG', 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (20, N'MAPLE MUFFINS', 170.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'trangmieng3.PNG', 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (21, N'MAPLE MUFFINS', 180.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'trangmieng7.PNG', 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (22, N'MAPLE MUFFINS', 190.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'trangmieng1.PNG', 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (23, N'Japanese Saute', 140.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'5.PNG', 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (24, N'Baked salmon', 200.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'11.PNG', 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (25, N'Chilli Wings', 250.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'12.PNG', 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (26, N'Chinese Noodles', 230.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'3.PNG', 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (27, N'Tofu Cheese', 300.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'7.PNG', 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (28, N'TUNA SALAD', 150.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'9.PNG', 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (29, N'GREEK SALAD', 300.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'15.PNG', 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (30, N'GREEK SALAD', 180.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'15.PNG', 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (31, N'TUNA SALAD', 110.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'9.PNG', 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (32, N'GREEK SALAD', 145.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'15.PNG', 8)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (33, N'TUNA SALAD', 110.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'9.PNG', 8)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (34, N'Fruit Porridge', 220.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'13.PNG', 8)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (35, N'Kale Mashed Potatoes', 200.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'vet2.PNG', 7)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (36, N'Mashed Potatoes', 175.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'vet1.PNG', 7)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (37, N'Potatoes', 200.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'vet3.PNG', 7)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MoTa], [Hinh], [MaLoai]) VALUES (38, N'Mashed Potatoes', 210.0000, N'Duis autem vel eum iriure dolor in hendrerit 
in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros 
et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.', N'vet8.PNG', 7)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
ALTER TABLE [dbo].[ChiTietDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonDatHang_DonDatHang] FOREIGN KEY([MaDatHang])
REFERENCES [dbo].[DonDatHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[ChiTietDonDatHang] CHECK CONSTRAINT [FK_ChiTietDonDatHang_DonDatHang]
GO
ALTER TABLE [dbo].[ChiTietDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonDatHang_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietDonDatHang] CHECK CONSTRAINT [FK_ChiTietDonDatHang_SanPham]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_DonDatHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_DonDatHang_KhachHang]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_Loai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[Loai] ([MaLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_Loai]
GO
USE [master]
GO
ALTER DATABASE [QL_DOAN] SET  READ_WRITE 
GO
