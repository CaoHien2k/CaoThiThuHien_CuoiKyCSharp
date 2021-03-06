USE [master]
GO
/****** Object:  Database [CaoThiThuHienDB]    Script Date: 06/20/21 3:56:06 PM ******/
CREATE DATABASE [CaoThiThuHienDB] ON  PRIMARY 
( NAME = N'CaoThiThuHienDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\CaoThiThuHienDB.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CaoThiThuHienDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\CaoThiThuHienDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CaoThiThuHienDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CaoThiThuHienDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CaoThiThuHienDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CaoThiThuHienDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CaoThiThuHienDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CaoThiThuHienDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CaoThiThuHienDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CaoThiThuHienDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CaoThiThuHienDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CaoThiThuHienDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CaoThiThuHienDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CaoThiThuHienDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CaoThiThuHienDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CaoThiThuHienDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CaoThiThuHienDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CaoThiThuHienDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CaoThiThuHienDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CaoThiThuHienDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CaoThiThuHienDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CaoThiThuHienDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CaoThiThuHienDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CaoThiThuHienDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CaoThiThuHienDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CaoThiThuHienDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CaoThiThuHienDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CaoThiThuHienDB] SET  MULTI_USER 
GO
ALTER DATABASE [CaoThiThuHienDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CaoThiThuHienDB] SET DB_CHAINING OFF 
GO
USE [CaoThiThuHienDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 06/20/21 3:56:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](150) NULL,
	[MetaTitle] [nchar](50) NULL,
	[DisplayOrder] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Footer]    Script Date: 06/20/21 3:56:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Footer](
	[ID] [varchar](50) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Footer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 06/20/21 3:56:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NULL,
	[Link] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Target] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[TypeID] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 06/20/21 3:56:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_MenuType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 06/20/21 3:56:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Decentralization] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 06/20/21 3:56:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[UnitCost] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Image] [nvarchar](100) NULL,
	[Description] [nvarchar](150) NULL,
	[Status] [bit] NOT NULL,
	[TypeID] [bigint] NOT NULL,
	[MetaTitle] [nchar](50) NULL,
	[Size] [nchar](50) NULL,
	[ThuongHieu] [nvarchar](150) NULL,
	[Color] [nvarchar](150) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [nvarchar](100) NULL,
	[TopHot] [datetime] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 06/20/21 3:56:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Slide](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Link] [nvarchar](250) NULL,
	[Description] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserAccount]    Script Date: 06/20/21 3:56:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserAccount](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[QuyenID] [bigint] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_UserAccount] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name], [Description], [MetaTitle], [DisplayOrder]) VALUES (1, N'Áo nữ', N'Áo thun nữ, áo ba lỗ nữ, áo kiểu nữ', N'ao-nu                                             ', 1)
INSERT [dbo].[Category] ([ID], [Name], [Description], [MetaTitle], [DisplayOrder]) VALUES (2, N'Quần nữ', N'Quần rin nữ, quần tây nữ', N'quan-nu                                           ', 3)
INSERT [dbo].[Category] ([ID], [Name], [Description], [MetaTitle], [DisplayOrder]) VALUES (3, N'Đầm nữ', N'Đầm body, đầm ren, đầm công chúa', N'dam-nu                                            ', 8)
INSERT [dbo].[Category] ([ID], [Name], [Description], [MetaTitle], [DisplayOrder]) VALUES (4, N'Chân váy nữ', N'Chân váy tennis,chân váy xếp ly,chân váy rin', N'chan-vay-nu                                       ', 9)
INSERT [dbo].[Category] ([ID], [Name], [Description], [MetaTitle], [DisplayOrder]) VALUES (5, N'Áo khoác nữ', N'Áo khoát rin,áo khoát kaki', N'ao-khoac-nu                                       ', 2)
INSERT [dbo].[Category] ([ID], [Name], [Description], [MetaTitle], [DisplayOrder]) VALUES (10, N'Set bộ,jumpsuit', NULL, N'set-bo                                            ', 5)
INSERT [dbo].[Category] ([ID], [Name], [Description], [MetaTitle], [DisplayOrder]) VALUES (11, N'Đồ ngủ,đồ mặc nhà', NULL, NULL, 6)
INSERT [dbo].[Category] ([ID], [Name], [Description], [MetaTitle], [DisplayOrder]) VALUES (12, N'Đồ bơi,đồ đi biển', NULL, NULL, 7)
INSERT [dbo].[Category] ([ID], [Name], [Description], [MetaTitle], [DisplayOrder]) VALUES (13, N'Quần áo thể thao nữ', NULL, NULL, 4)
INSERT [dbo].[Category] ([ID], [Name], [Description], [MetaTitle], [DisplayOrder]) VALUES (14, N'Trang phục cưới', N'đầm,váy cô dâu', NULL, 10)
INSERT [dbo].[Category] ([ID], [Name], [Description], [MetaTitle], [DisplayOrder]) VALUES (15, N'Thời trang trung niên', NULL, NULL, 11)
INSERT [dbo].[Category] ([ID], [Name], [Description], [MetaTitle], [DisplayOrder]) VALUES (16, N'Đồ lót nữ', NULL, NULL, 12)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (1, N'Trang chủ', N'/', 1, N'_blank', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (2, N'Giới Thiệu', N'/gioi-thieu', 2, N'_seft', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (3, N'Tin tức', N'/tin-tuc', 3, N'_seft', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (4, N'Sản phẩm', N'/san-pham', 4, N'_seft', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (5, N'Liên hệ', N'/lien-he', 5, N'_seft', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (6, N'Đăng nhập', N'/dang-nhap', 1, N'_seft', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (7, N'Đăng ký', N'/dang-ky', 2, N'_seft', 1, 2)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[MenuType] ON 

INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (1, N'Menu chính')
INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (2, N'Menu top')
SET IDENTITY_INSERT [dbo].[MenuType] OFF
SET IDENTITY_INSERT [dbo].[PhanQuyen] ON 

INSERT [dbo].[PhanQuyen] ([ID], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[PhanQuyen] ([ID], [Name]) VALUES (2, N'Nhân Viên')
INSERT [dbo].[PhanQuyen] ([ID], [Name]) VALUES (3, N'Khách Hàng')
SET IDENTITY_INSERT [dbo].[PhanQuyen] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [TypeID], [MetaTitle], [Size], [ThuongHieu], [Color], [CreateDate], [CreateBy], [TopHot]) VALUES (7, N'Áo Thun Tay Ngắn Cổ Chữ V ', 120.0000, 100, N'ao1.jpg', N' Trơn', 1, 1, N'ao-thun-tay-ngan                                  ', N'S-M-L                                             ', N'Quảng Châu', N'đen,đỏ,vàng', CAST(N'2020-08-08T00:00:00.000' AS DateTime), N'Admin', CAST(N'2021-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [TypeID], [MetaTitle], [Size], [ThuongHieu], [Color], [CreateDate], [CreateBy], [TopHot]) VALUES (9, N'Áo Sát Nách Siêu Xinh', 79.0000, 120, N'ao2.jpg', N'Tơ nhung

', 1, 1, N'ao-sat-nach                                       ', N'freesize                                          ', N'HÀn Quốc', N'trắng,đen', CAST(N'2020-02-08T00:00:00.000' AS DateTime), N'Admin', CAST(N'2021-05-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [TypeID], [MetaTitle], [Size], [ThuongHieu], [Color], [CreateDate], [CreateBy], [TopHot]) VALUES (12, N'Áo bè tay dài', 164.0000, 50, N'ao3.jpg', N'Họa tiết: Sọc kẻ.', 1, 1, N'ao-be                                             ', N'S-M-L-XL                                          ', N'Quảng CHâu', N'vàng', CAST(N'2020-02-08T00:00:00.000' AS DateTime), N'Admin', CAST(N'2021-10-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [TypeID], [MetaTitle], [Size], [ThuongHieu], [Color], [CreateDate], [CreateBy], [TopHot]) VALUES (13, N'Áo Khoác Nữ Có Nón', 99.0000, 123, N'khoac1.jpg', N'Trơn', 1, 5, N'ao-khoac                                          ', N'S-M                                               ', N'Việt Nam', N'đỏ,vàng', CAST(N'2020-08-08T00:00:00.000' AS DateTime), N'Admin', CAST(N'2021-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [TypeID], [MetaTitle], [Size], [ThuongHieu], [Color], [CreateDate], [CreateBy], [TopHot]) VALUES (14, N'QUẦN TÂY CÔNG SỞ ỐNG LOE', 99.0000, 130, N'quan1.jpg', NULL, 1, 2, N'quan-tay-cong-so                                  ', N'S-M-L                                             ', N'Việt Nam', N'đỏ,vàng', CAST(N'2020-08-08T00:00:00.000' AS DateTime), N'Admin', NULL)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [TypeID], [MetaTitle], [Size], [ThuongHieu], [Color], [CreateDate], [CreateBy], [TopHot]) VALUES (15, N'Quần jean lưng cao ', 139.0000, 50, N'quan2.jpg', N'Trơn', 1, 2, N'quan-rin                                          ', N'freesize                                          ', N'Việt Nam', N'trắng,đen', CAST(N'2020-09-08T00:00:00.000' AS DateTime), N'Admin', CAST(N'2021-10-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [TypeID], [MetaTitle], [Size], [ThuongHieu], [Color], [CreateDate], [CreateBy], [TopHot]) VALUES (17, N'Chân váy xòe dài ', 139.0000, 112, N'cv1.jpg', N'caro', 1, 4, N'chan-vay-xoe                                      ', N'S-M-L                                             ', N'Việt Nam', N'trắng,đen', CAST(N'2020-08-08T00:00:00.000' AS DateTime), N'Admin', NULL)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [TypeID], [MetaTitle], [Size], [ThuongHieu], [Color], [CreateDate], [CreateBy], [TopHot]) VALUES (18, N'Chân váy nữ thạch anh ', 169.0000, 20, N'cv2.jpg', N'Hoa lá', 1, 4, N'chan-vay-nu-hoa-tiet                              ', N'freesize                                          ', N'Việt Nam', N'trắng,đen', CAST(N'2020-08-08T00:00:00.000' AS DateTime), N'Admin', CAST(N'2021-01-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [TypeID], [MetaTitle], [Size], [ThuongHieu], [Color], [CreateDate], [CreateBy], [TopHot]) VALUES (19, N'Đầm phối tay phồng cực ', 300.0000, 50, N'dam1.jpg', N'Trơn', 1, 3, N'dam-phoi                                          ', N'S-M-L                                             ', N'Việt Nam', N'trắng,đen', CAST(N'2020-09-08T00:00:00.000' AS DateTime), N'Admin', CAST(N'2021-10-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [TypeID], [MetaTitle], [Size], [ThuongHieu], [Color], [CreateDate], [CreateBy], [TopHot]) VALUES (20, N'Đầm Ôm Dự Tiệc ', 230.0000, 70, N'dam2.jpg', N'Trơn', 1, 3, N'dam-om                                            ', N'S-M-L                                             ', N'Việt Nam', N'đủ màu', CAST(N'2020-08-08T00:00:00.000' AS DateTime), N'Admin', CAST(N'2021-02-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [TypeID], [MetaTitle], [Size], [ThuongHieu], [Color], [CreateDate], [CreateBy], [TopHot]) VALUES (22, N'Áo len nữ', 285.0000, 12, N'ao4.jpg', NULL, 1, 1, N'ao-len                                            ', N'S-M-L                                             ', N'Việt Nam', N'đủ màu', CAST(N'2020-05-08T00:00:00.000' AS DateTime), N'Admin', CAST(N'2021-07-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [TypeID], [MetaTitle], [Size], [ThuongHieu], [Color], [CreateDate], [CreateBy], [TopHot]) VALUES (24, N'Quần Legging ASOS Lửng ', 60.0000, 45, N'quan3.jpg', NULL, 1, 2, N'quan-legging                                      ', N'freesize                                          ', N'Việt Nam', N'trắng,đen', CAST(N'2020-01-08T00:00:00.000' AS DateTime), N'Admin', CAST(N'2021-06-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [TypeID], [MetaTitle], [Size], [ThuongHieu], [Color], [CreateDate], [CreateBy], [TopHot]) VALUES (27, N'QUẦN SUÔNG ỐNG RỘNG ', 130.0000, 112, N'quan4.jpg', NULL, 1, 2, N'quan-ong-suong                                    ', N'S-M-L-XL                                          ', N'Việt Nam', N'trắng,đen', CAST(N'2020-08-08T00:00:00.000' AS DateTime), N'Admin', CAST(N'2021-07-13T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'bia3.jpg', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'bia2.jpg', 2, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'bia1.png', 3, NULL, NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Slide] OFF
SET IDENTITY_INSERT [dbo].[UserAccount] ON 

INSERT [dbo].[UserAccount] ([ID], [UserName], [Password], [QuyenID], [Status]) VALUES (1, N'admin', N'21232f297a57a5a743894a0e4a801fc3', 1, 1)
INSERT [dbo].[UserAccount] ([ID], [UserName], [Password], [QuyenID], [Status]) VALUES (3, N'Thu Hien', N'380a767a3eb890d7f177538fabd023d6', 2, 1)
INSERT [dbo].[UserAccount] ([ID], [UserName], [Password], [QuyenID], [Status]) VALUES (4, N'Huynh Duy', N'5dc6da3adfe8ccf1287a98c0a8f74496', 3, 1)
INSERT [dbo].[UserAccount] ([ID], [UserName], [Password], [QuyenID], [Status]) VALUES (5, N'Thao My', N'8466fa8e428bf83c4d2d9893b4bada64', 3, 1)
INSERT [dbo].[UserAccount] ([ID], [UserName], [Password], [QuyenID], [Status]) VALUES (8, N'Tan Vui', N'c4f531c3970ac07ba1f678764af59cd0', 2, 0)
INSERT [dbo].[UserAccount] ([ID], [UserName], [Password], [QuyenID], [Status]) VALUES (9, N'Cao Trang', N'c786f96bb9eef05cd4c8641fc7cdeb24', 3, 0)
SET IDENTITY_INSERT [dbo].[UserAccount] OFF
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((1)) FOR [TypeID]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_DisplayOrder]  DEFAULT ((1)) FOR [DisplayOrder]
GO
USE [master]
GO
ALTER DATABASE [CaoThiThuHienDB] SET  READ_WRITE 
GO
