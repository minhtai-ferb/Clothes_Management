USE [master]
GO
drop database ClothesManagement
go

CREATE DATABASE ClothesManagement

ALTER DATABASE ClothesManagement SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [netclick].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE ClothesManagement SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE ClothesManagement SET ANSI_NULLS OFF 
GO
ALTER DATABASE ClothesManagement SET ANSI_PADDING OFF 
GO
ALTER DATABASE ClothesManagement SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE ClothesManagement SET ARITHABORT OFF 
GO
ALTER DATABASE ClothesManagement SET AUTO_CLOSE OFF 
GO
ALTER DATABASE ClothesManagement SET AUTO_SHRINK OFF 
GO
ALTER DATABASE ClothesManagement SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE ClothesManagement SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE ClothesManagement SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE ClothesManagement SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE ClothesManagement SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE ClothesManagement SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE ClothesManagement SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE ClothesManagement SET  ENABLE_BROKER 
GO
ALTER DATABASE ClothesManagement SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE ClothesManagement SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE ClothesManagement SET TRUSTWORTHY OFF 
GO
ALTER DATABASE ClothesManagement SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE ClothesManagement SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE ClothesManagement SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE ClothesManagement SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE ClothesManagement SET RECOVERY SIMPLE 
GO
ALTER DATABASE ClothesManagement SET  MULTI_USER 
GO
ALTER DATABASE ClothesManagement SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE ClothesManagement SET DB_CHAINING OFF 
GO
ALTER DATABASE ClothesManagement SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE ClothesManagement SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE ClothesManagement SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE ClothesManagement SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE ClothesManagement SET QUERY_STORE = OFF
GO

USE ClothesManagement
GO

delete tblAccount  where 1=1
go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccount](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[password] [varchar](50) NULL,
	[roleID] [nvarchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK__Account] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT INTO [dbo].[tblAccount] (userName, email, password, roleID, status) VALUES (N'admin', N'admin@gmail.com', N'1', N'AD', 1)
INSERT INTO [dbo].[tblAccount] (userName, email, password, roleID, status) VALUES (N'user', N'user@gmail.com', N'1', N'US', 1)
INSERT INTO [dbo].[tblAccount] (userName, email, password, roleID, status) VALUES (N'user1', N'user1@gmail.com', N'1', N'US', 1)
INSERT INTO [dbo].[tblAccount] (userName, email, password, roleID, status) VALUES (N'user2', N'user2@gmail.com', N'1', N'US', 1)

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[proID] [int] IDENTITY(1,1) NOT NULL,
	[proName] [nvarchar](255) NULL,
	[price] decimal(15,3) NULL,
	[description] [nvarchar](255) NULL,
	[color] [nvarchar](50) NULL,
	[size] [nvarchar] (50) NULL,
	[imgUrl] TEXT NULL,
	[type] [nvarchar] (50) NULL,
	[collection] [nvarchar] (50) NULL,
	[status] [nvarchar] (50) NULL,
 CONSTRAINT [PK__Product] PRIMARY KEY CLUSTERED 
(
	[proID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


INSERT INTO [dbo].[tblProduct] (proName, price, description, color, size, type, status, collection, imgUrl) VALUES (N'MINI SKORT', 100, N'Length: 38cm - 39cm;Zipper at back.;Materials: cotton canvas lining by silk', N'Black;White', N'XS;S;M;L', 'Bottom', N'active','Spring-Summer`23', 'https://elpisclothing.com/cdn/shop/files/PRODUCT23B-07.jpg?v=1683537216;https://elpisclothing.com/cdn/shop/files/elpis7410copy.jpg?v=1684143659;https://elpisclothing.com/cdn/shop/files/PRODUCT23B-08.jpg?v=1688629982;https://elpisclothing.com/cdn/shop/files/23-14_dde650f6-b05d-49a6-a40e-5c52a0bd23af.jpg?v=1688629982;https://elpisclothing.com/cdn/shop/files/23-13_14630198-8b68-47ad-b871-e88bdc0b7025.jpg?v=1688629982;https://elpisclothing.com/cdn/shop/files/elpis7445copy_76e5588b-80d3-49b8-8cab-cb7d4e388429.jpg?v=1688629982')
INSERT INTO [dbo].[tblProduct] (proName, price, description, color, size, type, status, collection, imgUrl) VALUES (N'JEAN MINI A-LINE DRESS FEATURING SQUARE NECKLINE', 150, N'Length (from chest to the end): 62cm - 63cm;Zipper at back.;Materials: Jeans lining by silk;No hidden push-up pads', N'Dark Blue;Light Blue', N'XS;S;M;L', 'Dress', N'active', 'Spring-Summer`23','https://elpisclothing.com/cdn/shop/files/23-15_a1dfe724-b454-4dc6-beb6-e9be61c50ba9.jpg?v=1684138301;https://elpisclothing.com/cdn/shop/files/elpis7620copy.jpg?v=1684143464;https://elpisclothing.com/cdn/shop/files/23-16_95719996-4b0d-46ec-a8f7-2986d9238a59.jpg?v=1684143464;https://elpisclothing.com/cdn/shop/files/elpis7641copy.jpg?v=1684143464;https://elpisclothing.com/cdn/shop/files/elpis7647copy.jpg?v=1684138301;https://elpisclothing.com/cdn/shop/files/elpis7561copy.jpg?v=1684138301;https://elpisclothing.com/cdn/shop/files/elpis7576copy.jpg?v=1684138301;https://elpisclothing.com/cdn/shop/files/elpis7594copy.jpg?v=1684138301')
INSERT INTO [dbo].[tblProduct] (proName, price, description, color, size, type, status, collection, imgUrl) VALUES (N'MINI JEANS SKIRTS', 100, N'Length: 38cm - 39cm.;Zipper at back.;Materials: cotton canvas lining by silk', N'Light Blue', N'XS;S;M;L', 'Bottom', N'active', 'Spring-Summer`23', 'https://elpisclothing.com/cdn/shop/files/23-06_93f69740-0d58-4ecd-8f4a-86fd209cc88b.jpg?v=1684138576;https://elpisclothing.com/cdn/shop/files/elpis7113copy.jpg?v=1684138576;https://elpisclothing.com/cdn/shop/files/elpis7133copy.jpg?v=1684138576')
INSERT INTO [dbo].[tblProduct] (proName, price, description, color, size, type, status, collection, imgUrl) VALUES (N'PLEAT MINI DRESS', 150, '', N'Blue;Pink', N'XS;S;M;L', 'Dress', N'active', 'Spring-Summer`23', 'https://elpisclothing.com/cdn/shop/files/23-15.jpg?v=1683528809;https://elpisclothing.com/cdn/shop/files/PART200584.jpg?v=1693293980;https://elpisclothing.com/cdn/shop/files/PART200933.jpg?v=1693293980;https://elpisclothing.com/cdn/shop/files/23-03.jpg?v=1693293980;https://elpisclothing.com/cdn/shop/files/23-16.jpg?v=1693293980;https://elpisclothing.com/cdn/shop/files/23-02.jpg?v=1693293980;https://elpisclothing.com/cdn/shop/files/PART20207.jpg?v=1693293939;https://elpisclothing.com/cdn/shop/files/PART20238.jpg?v=1693293939;https://elpisclothing.com/cdn/shop/files/PART20221.jpg?v=1693293939')
INSERT INTO [dbo].[tblProduct] (proName, price, description, color, size, type, status, collection, imgUrl) VALUES (N'JEANS CORSET', 90, 'Length (from chest to the end): 23cm - 24cm;Materials: Jeans lining by silk;No hidden push-up pads', N'Dark Blue;Light Blue', N'XS;S;M;L', 'Corset', N'active', 'Spring-Summer`23', 'https://elpisclothing.com/cdn/shop/files/23-07_5a698e39-865f-4024-b9c3-2e004e10b4a6.jpg?v=1684138359;https://elpisclothing.com/cdn/shop/files/elpis7080copy.jpg?v=1684143472;https://elpisclothing.com/cdn/shop/files/23-08_cadf0870-90b8-4f4e-999b-38f02d2afeac.jpg?v=1684143472;https://elpisclothing.com/cdn/shop/files/23-23_2800a43b-7d23-441c-8a75-c9899fd2a0ff.jpg?v=1684143472;https://elpisclothing.com/cdn/shop/files/23-22.jpg?v=1684143472;https://elpisclothing.com/cdn/shop/files/elpis7106copy.jpg?v=1684138359')
INSERT INTO [dbo].[tblProduct] (proName, price, description, color, size, type, status, collection, imgUrl) VALUES (N'KNIT TOP FEATURING LONG SLEEVES CUT-OUT DETAILING', 80, 'Length (from chest to the end): 38cm - 40cm;Materials: knit;No hidden push-up pads', N'Black;White;Node', N'XS;S;M;L', 'Top', N'active', 'Spring-Summer`23', 'https://elpisclothing.com/cdn/shop/files/PRODUCT23-14.jpg?v=1683530649;https://elpisclothing.com/cdn/shop/files/elpis7122copy.jpg?v=1684143537;https://elpisclothing.com/cdn/shop/files/PRODUCT23-09.jpg?v=1684143537;https://elpisclothing.com/cdn/shop/files/PRODUCT23-10.jpg?v=1684143537;https://elpisclothing.com/cdn/shop/files/elpis6850copy.jpg?v=1683530649')
INSERT INTO [dbo].[tblProduct] (proName, price, description, color, size, type, status, collection, imgUrl) VALUES (N'SHORTS', 90, '', N'Jeans;White', N'XS;S;M;L', 'Bottom', N'active', 'Spring-Summer`23', 'https://elpisclothing.com/cdn/shop/files/23-04_38397702-044a-48cb-9d3d-8fee4a5f7504.jpg?v=1684138638;https://elpisclothing.com/cdn/shop/files/elpis7857copy.jpg?v=1684143706;https://elpisclothing.com/cdn/shop/files/23-05_fdc52e8a-57f0-4f8c-91a1-33653bc3e8bb.jpg?v=1684143706;https://elpisclothing.com/cdn/shop/files/elpis7860copy_cf0f6ea5-5bab-490b-9958-96ce7f1b03df.jpg?v=1684138638')
INSERT INTO [dbo].[tblProduct] (proName, price, description, color, size, type, status, collection, imgUrl) VALUES (N'MINI A-LINE JEANS DRESS FEATURING SQUARE NECKLINE PUFF SLEEVES', 140, 'Length (from chest to the end): 58cm - 61cm;Zipper at back.;Materials: Jeans lining by silk;No hidden push-up pads', N'Dark Blue;Light Blue', N'XS;S;M;L', 'Dress', N'active', 'Spring-Summer`23', 'https://elpisclothing.com/cdn/shop/files/23-18_cc3d49e9-804f-4f86-8d8a-dec4816c5189.jpg?v=1684138475;https://elpisclothing.com/cdn/shop/files/elpis7719copy.jpg?v=1684143577;https://elpisclothing.com/cdn/shop/files/23-19_6ac740c5-b2ba-4750-a25f-fd459087f833.jpg?v=1684143577;https://elpisclothing.com/cdn/shop/files/23-17_e870a929-7934-4965-91fc-7bf887b0efac.jpg?v=1684143577;https://elpisclothing.com/cdn/shop/files/elpis7715copy.jpg?v=1684143577;https://elpisclothing.com/cdn/shop/files/elpis7742copy.jpg?v=1684143577;https://elpisclothing.com/cdn/shop/files/elpis7671copy.jpg?v=1684143577;https://elpisclothing.com/cdn/shop/files/elpis7706copy.jpg?v=1684143572;https://elpisclothing.com/cdn/shop/files/elpis7694copy.jpg?v=1684143572')
INSERT INTO [dbo].[tblProduct] (proName, price, description, color, size, type, status, collection, imgUrl) VALUES (N'PENCIL MIDI SILK SKIRT', 80, N'', N'White;Purple;Node', N'XS;S;M;L', 'Bottom', N'active', 'Spring-Summer`23', N'https://elpisclothing.com/cdn/shop/files/23-19_5f4c5d11-705f-4d9d-b6ec-d6ea56259e77.jpg?v=1689840905;https://elpisclothing.com/cdn/shop/files/PART20142.jpg?v=1693294125;https://elpisclothing.com/cdn/shop/files/23-26_dab35781-aad9-47e9-81f6-ff1c7cd7ff3f.jpg?v=1693294125;https://elpisclothing.com/cdn/shop/files/PART20494.jpg?v=1693294125;https://elpisclothing.com/cdn/shop/files/23-17_47e9ca04-9b29-4618-9a02-218a784e7950.jpg?v=1693294125;https://elpisclothing.com/cdn/shop/files/PART200502.jpg?v=1693294670;https://elpisclothing.com/cdn/shop/files/23-18_bfe7919d-b879-4faa-9134-486b7eefd91f.jpg?v=1693294670')
INSERT INTO [dbo].[tblProduct] (proName, price, description, color, size, type, status, collection, imgUrl) VALUES (N'LACE BRALETTE', 80, N'', N'Coral', N'XS;S;M;L', 'Corset', N'active', 'Spring-Summer`23', 'https://elpisclothing.com/cdn/shop/files/23-09_07f535af-92ce-43b8-b5a8-3b223fd30c13.jpg?v=1689842045;https://elpisclothing.com/cdn/shop/files/23-10_1e28092f-f6a4-414e-a58c-95a8a42cbabf.jpg?v=1689842045')
INSERT INTO [dbo].[tblProduct] (proName, price, description, color, size, type, status, collection, imgUrl) VALUES (N'STRAPS TOP FEATURING OPEN BACK', 80, N'', N'White;Purple;Node', N'XS;S;M;L', 'Top', N'active', 'Spring-Summer`23', 'https://elpisclothing.com/cdn/shop/files/23-24_071b9571-4abd-47ca-94c7-379c32cf3d85.jpg?v=1689841929;https://elpisclothing.com/cdn/shop/files/PART20142_531501f1-930b-45f3-bd23-a3dd4c0351d4.jpg?v=1693294694;https://elpisclothing.com/cdn/shop/files/23-25_3da92ae7-8425-48c5-9642-0d5fad201b43.jpg?v=1693294694;https://elpisclothing.com/cdn/shop/files/23-16_7ac4d04d-3bd4-41dd-9a9b-69bd089868da.jpg?v=1693294694;https://elpisclothing.com/cdn/shop/files/PART200502_0c4bb1b4-f22c-44a4-863a-7981c6d7807d.jpg?v=1693294694;https://elpisclothing.com/cdn/shop/files/23-19_8e06d91e-722b-4148-b9c7-41231a0bf726.jpg?v=1693294694')
INSERT INTO [dbo].[tblProduct] (proName, price, description, color, size, type, status, collection, imgUrl) VALUES (N'FLARE PANTS', 80, N'', N'White', N'XS;S;M;L', 'Bottom', N'active', 'Spring-Summer`23', 'https://elpisclothing.com/cdn/shop/files/23-20_7962cd4f-43f5-4e60-b333-1bd02513f264.jpg?v=1689841235;https://elpisclothing.com/cdn/shop/files/23-21_311acaa2-0ba1-4722-87ae-4feb53054016.jpg?v=1689841235')
INSERT INTO [dbo].[tblProduct] (proName, price, description, color, size, type, status, collection, imgUrl) VALUES (N'STRAPS CROP TOP', 100, N'', N'White', N'XS;S;M;L', 'Corset', N'active', 'Spring-Summer`23', 'https://elpisclothing.com/cdn/shop/files/23-01_c80d99e4-f094-4f80-876e-06b7e6098aea.jpg?v=1689842435;https://elpisclothing.com/cdn/shop/files/PART20494_fabea9fc-c349-4fa3-a04f-1e23befae3e7.jpg?v=1693294630;https://elpisclothing.com/cdn/shop/files/23-02_762ef6f3-a007-4c9a-802f-7aaa6ba8df38.jpg?v=1693294630')
INSERT INTO [dbo].[tblProduct] (proName, price, description, color, size, type, status, collection, imgUrl) VALUES (N'SILK A LINE MINI DRESS', 140, N'', N'Purple;Node;Black', N'XS;S;M;L', 'Dress', N'active', 'Spring-Summer`23', 'https://elpisclothing.com/cdn/shop/files/23-25_95af50e2-497e-4564-8fb1-e32b7ada8739.jpg?v=1693294184;https://elpisclothing.com/cdn/shop/files/PART200811.jpg?v=1693294184;https://elpisclothing.com/cdn/shop/files/23-24_c260239c-5627-4be6-b8dd-e0034a957b45.jpg?v=1693294184;https://elpisclothing.com/cdn/shop/files/PART20113.jpg?v=1693294462;https://elpisclothing.com/cdn/shop/files/23-20_8307dc62-fc11-4abc-b644-0aa3c1277323.jpg?v=1693294462;https://elpisclothing.com/cdn/shop/files/23-21_209428f7-8ab1-4eb2-8127-334abe22c2a9.jpg?v=1693294462;https://elpisclothing.com/cdn/shop/files/23-05_3a7605e2-5549-4ec5-bdbb-82c2931ebe14.jpg?v=1693294462;https://elpisclothing.com/cdn/shop/files/23-03_c7bdf1fd-d579-4c4e-83c0-b8131aa3fb5e.jpg?v=1693294462')
INSERT INTO [dbo].[tblProduct] (proName, price, description, color, size, type, status, collection, imgUrl) VALUES (N'PLEAT MIDI DRESS', 150, N'', N'Pink;Purple', N'XS;S;M;L', 'Dress', N'active', 'Spring-Summer`23', 'https://elpisclothing.com/cdn/shop/files/23-06_ee75666c-b603-4b70-a84c-721bcf6cac57.jpg?v=1689840563;https://elpisclothing.com/cdn/shop/files/23-07_956dc8ab-1822-4754-8131-143cac94713c.jpg?v=1689840563;https://elpisclothing.com/cdn/shop/files/23-15_a4be44b1-3571-4f92-845e-8f468bc32fa0.jpg?v=1689840574')
INSERT INTO [dbo].[tblProduct] (proName, price, description, color, size, type, status, collection, imgUrl) VALUES (N'STRAPS A LINE MINI DRESS', 150, N'', N'Purple;White', N'XS;S;M;L', 'Dress', N'active', 'Spring-Summer`23', 'https://elpisclothing.com/cdn/shop/files/23-04_e481998f-a3bc-4cd3-8d41-12a1424d6687.jpg?v=1689842715;https://elpisclothing.com/cdn/shop/files/PART202162.jpg?v=1693294439;https://elpisclothing.com/cdn/shop/files/23-03_1dcbacd9-45ee-49eb-85d2-83df657da5ef.jpg?v=1693294439;https://elpisclothing.com/cdn/shop/files/PART20322.jpg?v=1693294439')

																																			
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDepots](
	[depotID] [int] IDENTITY(1,1) NOT NULL,
	[proID] [int] NOT NULL FOREIGN KEY REFERENCES [dbo].[tblProduct]([proID]),
	[color] [nvarchar](50) NULL,
	[size] [nvarchar](50) NULL,
	[quantity] int NULL,
 CONSTRAINT [PK__DetailPro] PRIMARY KEY CLUSTERED 
(
	[depotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (1, N'Black', N'XS', 10) 
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (1, N'Black', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (1, N'Black', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (1, N'Black', N'L', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (1, N'White', N'XS', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (1, N'White', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (1, N'White', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (1, N'White', N'L', 10)

INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (2, N'Dark Blue', N'XS', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (2, N'Dark Blue', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (2, N'Dark Blue', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (2, N'Dark Blue', N'L', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (2, N'Light Blue', N'XS', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (2, N'Light Blue', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (2, N'Light Blue', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (2, N'Light Blue', N'L', 10)

INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (3, N'Light Blue', N'XS', 10) 
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (3, N'Light Blue', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (3, N'Light Blue', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (3, N'Light Blue', N'L', 10)

INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (4, N'Blue', N'XS', 10)  
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (4, N'Blue', N'S', 10)	
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (4, N'Blue', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (4, N'Blue', N'L', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (4, N'Pink', N'XS', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (4, N'Pink', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (4, N'Pink', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (4, N'Pink', N'L', 10)

INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (5, N'Dark Blue', N'XS', 10)  
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (5, N'Dark Blue', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (5, N'Dark Blue', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (5, N'Dark Blue', N'L', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (5, N'Light Blue', N'XS', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (5, N'Light Blue', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (5, N'Light Blue', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (5, N'Light Blue', N'L', 10)

INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (6, N'Black', N'XS', 10)   
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (6, N'Black', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (6, N'Black', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (6, N'Black', N'L', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (6, N'White', N'XS', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (6, N'White', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (6, N'White', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (6, N'White', N'L', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (6, N'Node', N'XS', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (6, N'Node', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (6, N'Node', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (6, N'Node', N'L', 10)

INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (7, N'Jeans', N'XS', 10)   
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (7, N'Jeans', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (7, N'Jeans', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (7, N'Jeans', N'L', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (7, N'White', N'XS', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (7, N'White', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (7, N'White', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (7, N'White', N'L', 10)

INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (8, N'Dark Blue', N'XS', 10)    
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (8, N'Dark Blue', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (8, N'Dark Blue', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (8, N'Dark Blue', N'L', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (8, N'Light Blue', N'XS', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (8, N'Light Blue', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (8, N'Light Blue', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (8, N'Light Blue', N'L', 10)

INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (9, N'White', N'XS', 10)  
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (9, N'White', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (9, N'White', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (9, N'White', N'L', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (9, N'Purple', N'XS', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (9, N'Purple', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (9, N'Purple', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (9, N'Purple', N'L', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (9, N'Node', N'XS', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (9, N'Node', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (9, N'Node', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (9, N'Node', N'L', 10)

INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (10, N'Coral', N'XS', 10)  
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (10, N'Coral', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (10, N'Coral', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (10, N'Coral', N'L', 10)

INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (11, N'White', N'XS', 10)   
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (11, N'White', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (11, N'White', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (11, N'White', N'L', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (11, N'Purple', N'XS', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (11, N'Purple', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (11, N'Purple', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (11, N'Purple', N'L', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (11, N'Node', N'XS', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (11, N'Node', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (11, N'Node', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (11, N'Node', N'L', 10)

INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (12, N'White', N'XS', 10)    
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (12, N'White', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (12, N'White', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (12, N'White', N'L', 10)

INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (13, N'White', N'XS', 10)   
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (13, N'White', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (13, N'White', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (13, N'White', N'L', 10)

INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (14, N'Purple', N'XS', 10)   
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (14, N'Purple', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (14, N'Purple', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (14, N'Purple', N'L', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (14, N'Node', N'XS', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (14, N'Node', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (14, N'Node', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (14, N'Node', N'L', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (14, N'Black', N'XS', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (14, N'Black', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (14, N'Black', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (14, N'Black', N'L', 10)

INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (15, N'Pink', N'XS', 10)   
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (15, N'Pink', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (15, N'Pink', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (15, N'Pink', N'L', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (15, N'Purple', N'XS', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (15, N'Purple', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (15, N'Purple', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (15, N'Purple', N'L', 10)

INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (16, N'Purple', N'XS', 10)     
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (16, N'Purple', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (16, N'Purple', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (16, N'Purple', N'L', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (16, N'White', N'XS', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (16, N'White', N'S', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (16, N'White', N'M', 10)
INSERT INTO [dbo].[tblDepots] ([proID], [color], [size], [quantity]) VALUES (16, N'White', N'L', 10)

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblColor](
	[colorID] [int] IDENTITY(1,1) NOT NULL,
	[proID] [int] NULL FOREIGN KEY REFERENCES [dbo].[tblProduct] ([proID]),
	[color] [nvarchar](50) NOT NULL,
	[imgUrl] TEXT NULL,
 CONSTRAINT [PK__Color] PRIMARY KEY CLUSTERED 
(
	[colorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (1, N'Black', N'https://elpisclothing.com/cdn/shop/files/PRODUCT23B-07_400x.jpg?v=1683537216')
INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (1, N'White', N'https://elpisclothing.com/cdn/shop/files/23-13_14630198-8b68-47ad-b871-e88bdc0b7025_400x.jpg?v=1688629982')

INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (2, N'Dark Blue', N'https://elpisclothing.com/cdn/shop/files/elpis7641copy_200x.jpg?v=1684143464')
INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (2, N'Light Blue', N'https://elpisclothing.com/cdn/shop/files/elpis7594copy_200x.jpg?v=1684138301')

INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (3, N'Light Blue', N'https://elpisclothing.com/cdn/shop/files/23-06_93f69740-0d58-4ecd-8f4a-86fd209cc88b_400x.jpg?v=1684138576')

INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (4, N'Blue', N'https://elpisclothing.com/cdn/shop/files/23-02_400x.jpg?v=1693293980')
INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (4, N'Pink', N'https://elpisclothing.com/cdn/shop/files/23-15_400x.jpg?v=1683528809')

INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (5, N'Dark Blue', N'https://elpisclothing.com/cdn/shop/files/23-07_5a698e39-865f-4024-b9c3-2e004e10b4a6_400x.jpg?v=1684138359')
INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (5, N'Light Blue', N'https://elpisclothing.com/cdn/shop/files/23-23_2800a43b-7d23-441c-8a75-c9899fd2a0ff_400x.jpg?v=1684143472')

INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (6, N'Black', N'https://elpisclothing.com/cdn/shop/files/PRODUCT23-14_400x.jpg?v=1683530649')
INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (6, N'White', N'https://elpisclothing.com/cdn/shop/files/elpis7122copy_400x.jpg?v=1684143537')
INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (6, N'Node', N'https://elpisclothing.com/cdn/shop/files/PRODUCT23-09_400x.jpg?v=1684143537')

INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (7, N'Jeans', N'https://elpisclothing.com/cdn/shop/files/23-04_38397702-044a-48cb-9d3d-8fee4a5f7504_400x.jpg?v=1684138638')
INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (7, N'White', N'https://elpisclothing.com/cdn/shop/files/23-04_38397702-044a-48cb-9d3d-8fee4a5f7504_400x.jpg?v=1684138638')

INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (8, N'Dark Blue', N'https://elpisclothing.com/cdn/shop/files/23-18_cc3d49e9-804f-4f86-8d8a-dec4816c5189_400x.jpg?v=1684138475')
INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (8, N'Light Blue', N'https://elpisclothing.com/cdn/shop/files/23-17_e870a929-7934-4965-91fc-7bf887b0efac_400x.jpg?v=1684143577')

INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (9, N'White', N'https://elpisclothing.com/cdn/shop/files/23-17_47e9ca04-9b29-4618-9a02-218a784e7950_400x.jpg?v=1693294125')
INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (9, N'Purple', N'https://elpisclothing.com/cdn/shop/files/23-18_bfe7919d-b879-4faa-9134-486b7eefd91f_400x.jpg?v=1693294670')
INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (9, N'Node', N'https://elpisclothing.com/cdn/shop/files/23-19_5f4c5d11-705f-4d9d-b6ec-d6ea56259e77_400x.jpg?v=1689840905')

INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (10, N'Coral', N'https://elpisclothing.com/cdn/shop/files/23-09_07f535af-92ce-43b8-b5a8-3b223fd30c13_400x.jpg?v=1689842045')

INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (11, N'White', N'https://elpisclothing.com/cdn/shop/files/23-16_7ac4d04d-3bd4-41dd-9a9b-69bd089868da_400x.jpg?v=1693294694')
INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (11, N'Purple', N'https://elpisclothing.com/cdn/shop/files/23-19_8e06d91e-722b-4148-b9c7-41231a0bf726_400x.jpg?v=1693294694')
INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (11, N'Node', N'https://elpisclothing.com/cdn/shop/files/23-24_071b9571-4abd-47ca-94c7-379c32cf3d85_400x.jpg?v=1689841929')

INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (12, N'White', N'https://elpisclothing.com/cdn/shop/files/23-20_7962cd4f-43f5-4e60-b333-1bd02513f264_400x.jpg?v=1689841235')

INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (13, N'White', N'https://elpisclothing.com/cdn/shop/files/23-01_c80d99e4-f094-4f80-876e-06b7e6098aea_400x.jpg?v=1689842435')

INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (14, N'Purple', N'https://elpisclothing.com/cdn/shop/files/23-25_95af50e2-497e-4564-8fb1-e32b7ada8739_400x.jpg?v=1693294184')
INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (14, N'Node', N'https://elpisclothing.com/cdn/shop/files/23-20_8307dc62-fc11-4abc-b644-0aa3c1277323_400x.jpg?v=1693294462')
INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (14, N'Black', N'https://elpisclothing.com/cdn/shop/files/23-05_3a7605e2-5549-4ec5-bdbb-82c2931ebe14_400x.jpg?v=1693294462')

INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (15, N'Pink', N'https://elpisclothing.com/cdn/shop/files/23-06_ee75666c-b603-4b70-a84c-721bcf6cac57_400x.jpg?v=1689840563')
INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (15, N'Purple', N'https://elpisclothing.com/cdn/shop/files/23-15_a4be44b1-3571-4f92-845e-8f468bc32fa0_400x.jpg?v=1689840574')

INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (16, N'Purple', N'https://elpisclothing.com/cdn/shop/files/PART20322_400x.jpg?v=1693294439')
INSERT INTO [dbo].[tblColor] ([proID], [color], [imgUrl]) VALUES (16, N'White', N'https://elpisclothing.com/cdn/shop/files/23-04_e481998f-a3bc-4cd3-8d41-12a1424d6687_400x.jpg?v=1689842715')


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [int]  NOT NULL,
	[userID] [int] NULL FOREIGN KEY REFERENCES [dbo].[tblAccount]([userID]),
	[orderDate] date NULL,
	[total] decimal(15,3) NULL,
	[addressID] [int] NULL,
	[status] [nvarchar] (50) NULL,
 CONSTRAINT [PK__Order] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NULL FOREIGN KEY REFERENCES [dbo].[tblOrder] ([orderID]),
	[depotID] [int] NULL FOREIGN KEY REFERENCES [dbo].[tblDepots] ([depotID]),
	[userID] [int] NULL FOREIGN KEY REFERENCES [dbo].[tblAccount] ([userID]),
	[quantityOrder] int NULL,
	[priceOrder] decimal(15,3) NULL,
 CONSTRAINT [PK__OrderDetail] PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAddress](
	[addressID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NULL FOREIGN KEY REFERENCES [dbo].[tblAccount] ([userID]),	
	[fullName] [nvarchar] (255) NULL,
	[phone] [nvarchar] (50) NULL,
	[city] [nvarchar] (50) NULL,
	[district] [nvarchar] (50) NULL,
	[wardss] [nvarchar] (50) NULL,
	[addressHouse] [nvarchar] (255) NULL,
	[status] [nvarchar] (50) NULL,
 CONSTRAINT [PK__Address] PRIMARY KEY CLUSTERED 
(
	[addressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO