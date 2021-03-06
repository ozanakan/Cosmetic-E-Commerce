USE [master]
GO
/****** Object:  Database [KUMSALKOZMETIK]    Script Date: 15.05.2020 22:27:02 ******/
CREATE DATABASE [KUMSALKOZMETIK]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KUMSALKOZMETIK', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\KUMSALKOZMETIK.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KUMSALKOZMETIK_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\KUMSALKOZMETIK_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [KUMSALKOZMETIK] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KUMSALKOZMETIK].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KUMSALKOZMETIK] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KUMSALKOZMETIK] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KUMSALKOZMETIK] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KUMSALKOZMETIK] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KUMSALKOZMETIK] SET ARITHABORT OFF 
GO
ALTER DATABASE [KUMSALKOZMETIK] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KUMSALKOZMETIK] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KUMSALKOZMETIK] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KUMSALKOZMETIK] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KUMSALKOZMETIK] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KUMSALKOZMETIK] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KUMSALKOZMETIK] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KUMSALKOZMETIK] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KUMSALKOZMETIK] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KUMSALKOZMETIK] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KUMSALKOZMETIK] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KUMSALKOZMETIK] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KUMSALKOZMETIK] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KUMSALKOZMETIK] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KUMSALKOZMETIK] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KUMSALKOZMETIK] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KUMSALKOZMETIK] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KUMSALKOZMETIK] SET RECOVERY FULL 
GO
ALTER DATABASE [KUMSALKOZMETIK] SET  MULTI_USER 
GO
ALTER DATABASE [KUMSALKOZMETIK] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KUMSALKOZMETIK] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KUMSALKOZMETIK] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KUMSALKOZMETIK] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KUMSALKOZMETIK] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'KUMSALKOZMETIK', N'ON'
GO
ALTER DATABASE [KUMSALKOZMETIK] SET QUERY_STORE = OFF
GO
USE [KUMSALKOZMETIK]
GO
/****** Object:  Table [dbo].[KATEGORI]    Script Date: 15.05.2020 22:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KATEGORI](
	[KA_ID] [int] IDENTITY(1,1) NOT NULL,
	[UK_ID] [int] NOT NULL,
	[KA_CODE] [nvarchar](100) NULL,
 CONSTRAINT [PK_KATEGORI] PRIMARY KEY CLUSTERED 
(
	[KA_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KATEGORI_ALT]    Script Date: 15.05.2020 22:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KATEGORI_ALT](
	[AK_ID] [int] IDENTITY(1,1) NOT NULL,
	[KA_ID] [int] NULL,
	[AK_CODE] [nvarchar](150) NULL,
 CONSTRAINT [PK_KATEGORI_ALT] PRIMARY KEY CLUSTERED 
(
	[AK_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KATEGORI_UST]    Script Date: 15.05.2020 22:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KATEGORI_UST](
	[UK_ID] [int] IDENTITY(1,1) NOT NULL,
	[UK_CODE] [nvarchar](100) NULL,
 CONSTRAINT [PK_KATEGORI_UST] PRIMARY KEY CLUSTERED 
(
	[UK_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MARKA]    Script Date: 15.05.2020 22:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MARKA](
	[MA_ID] [int] IDENTITY(1,1) NOT NULL,
	[MA_CODE] [varchar](100) NULL,
 CONSTRAINT [PK_MARKA] PRIMARY KEY CLUSTERED 
(
	[MA_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MUSTERI]    Script Date: 15.05.2020 22:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MUSTERI](
	[MU_ID] [int] IDENTITY(1,1) NOT NULL,
	[MU_AD_SOYAD] [nvarchar](100) NULL,
	[MU_SIRKET] [varchar](100) NULL,
	[MU_KULLANICI_ADI] [varchar](100) NULL,
	[MU_TELEFON] [varchar](100) NULL,
	[MU_ADRES] [varchar](100) NULL,
	[MU_EMAIL] [varchar](100) NULL,
	[MU_SIFRE] [varchar](100) NULL,
 CONSTRAINT [PK_MUSTERI] PRIMARY KEY CLUSTERED 
(
	[MU_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIPARIS]    Script Date: 15.05.2020 22:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIPARIS](
	[HZ_ID] [int] IDENTITY(1,1) NOT NULL,
	[HZ_MUSTERI_ADI] [nvarchar](100) NULL,
	[HZ_MUSTERI_SIRKET] [nvarchar](100) NULL,
	[HZ_SIPARIS] [nvarchar](max) NULL,
 CONSTRAINT [PK_SIPARIS] PRIMARY KEY CLUSTERED 
(
	[HZ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[URUN]    Script Date: 15.05.2020 22:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URUN](
	[UR_ID] [int] IDENTITY(1,1) NOT NULL,
	[UR_AD] [varchar](200) NULL,
	[UR_MARKA] [varchar](100) NULL,
	[UR_KATEGORI] [varchar](100) NULL,
	[UR_GRAMAJ] [varchar](100) NULL,
	[UR_FIYAT] [numeric](18, 2) NULL,
	[UR_INDIRIM] [numeric](18, 2) NULL,
	[UR_YENI] [varchar](5) NULL,
	[UR_STOK] [int] NULL,
	[UR_RESIM_URL] [nvarchar](max) NULL,
	[UR_INDIRIM_YUZDE] [int] NULL,
	[UR_FIYAT_INDIRIMLI] [numeric](18, 2) NULL,
 CONSTRAINT [PK_URUN] PRIMARY KEY CLUSTERED 
(
	[UR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[KATEGORI] ON 

INSERT [dbo].[KATEGORI] ([KA_ID], [UK_ID], [KA_CODE]) VALUES (1, 1, N'TEMİZLEYİCİ')
INSERT [dbo].[KATEGORI] ([KA_ID], [UK_ID], [KA_CODE]) VALUES (2, 1, N'NEMLENDİRİCİ')
INSERT [dbo].[KATEGORI] ([KA_ID], [UK_ID], [KA_CODE]) VALUES (3, 1, N'MASKELER')
INSERT [dbo].[KATEGORI] ([KA_ID], [UK_ID], [KA_CODE]) VALUES (4, 2, N'SAÇ ŞAMPUANI')
INSERT [dbo].[KATEGORI] ([KA_ID], [UK_ID], [KA_CODE]) VALUES (5, 2, N'SAÇ KREMİ')
INSERT [dbo].[KATEGORI] ([KA_ID], [UK_ID], [KA_CODE]) VALUES (6, 2, N'SAÇ BOYASI')
INSERT [dbo].[KATEGORI] ([KA_ID], [UK_ID], [KA_CODE]) VALUES (7, 3, N'GÖZ')
INSERT [dbo].[KATEGORI] ([KA_ID], [UK_ID], [KA_CODE]) VALUES (8, 3, N'YÜZ')
INSERT [dbo].[KATEGORI] ([KA_ID], [UK_ID], [KA_CODE]) VALUES (9, 3, N'DUDAK')
INSERT [dbo].[KATEGORI] ([KA_ID], [UK_ID], [KA_CODE]) VALUES (10, 3, N'KIRNAK')
SET IDENTITY_INSERT [dbo].[KATEGORI] OFF
GO
SET IDENTITY_INSERT [dbo].[KATEGORI_ALT] ON 

INSERT [dbo].[KATEGORI_ALT] ([AK_ID], [KA_ID], [AK_CODE]) VALUES (1, 1, N'YÜZ TEMİZLEYİCİ')
INSERT [dbo].[KATEGORI_ALT] ([AK_ID], [KA_ID], [AK_CODE]) VALUES (2, 1, N'MAKYAJ TEMİZLEYİCİ')
INSERT [dbo].[KATEGORI_ALT] ([AK_ID], [KA_ID], [AK_CODE]) VALUES (3, 1, N'SİYAH NOKTA TEMİZLEYCİ')
INSERT [dbo].[KATEGORI_ALT] ([AK_ID], [KA_ID], [AK_CODE]) VALUES (4, 2, N'GÜNDÜZ NEMLENDİRİCİSİ')
INSERT [dbo].[KATEGORI_ALT] ([AK_ID], [KA_ID], [AK_CODE]) VALUES (5, 2, N'GECE NEMLENDİRİCİSİ')
INSERT [dbo].[KATEGORI_ALT] ([AK_ID], [KA_ID], [AK_CODE]) VALUES (6, 3, N'MASKE')
INSERT [dbo].[KATEGORI_ALT] ([AK_ID], [KA_ID], [AK_CODE]) VALUES (7, 4, N'NORMAL SAÇ ŞAMPUANLAR')
INSERT [dbo].[KATEGORI_ALT] ([AK_ID], [KA_ID], [AK_CODE]) VALUES (8, 4, N'KURU SAÇ ŞAMPUANLARI')
INSERT [dbo].[KATEGORI_ALT] ([AK_ID], [KA_ID], [AK_CODE]) VALUES (9, 4, N'ÖZEL SAÇ ŞAMPUANLARI')
SET IDENTITY_INSERT [dbo].[KATEGORI_ALT] OFF
GO
SET IDENTITY_INSERT [dbo].[KATEGORI_UST] ON 

INSERT [dbo].[KATEGORI_UST] ([UK_ID], [UK_CODE]) VALUES (1, N'Cilt')
INSERT [dbo].[KATEGORI_UST] ([UK_ID], [UK_CODE]) VALUES (2, N'Saç')
INSERT [dbo].[KATEGORI_UST] ([UK_ID], [UK_CODE]) VALUES (3, N'Makyaj')
SET IDENTITY_INSERT [dbo].[KATEGORI_UST] OFF
GO
SET IDENTITY_INSERT [dbo].[MARKA] ON 

INSERT [dbo].[MARKA] ([MA_ID], [MA_CODE]) VALUES (20, N'INOA')
INSERT [dbo].[MARKA] ([MA_ID], [MA_CODE]) VALUES (21, N'ALIX')
INSERT [dbo].[MARKA] ([MA_ID], [MA_CODE]) VALUES (22, N'INDOLA')
INSERT [dbo].[MARKA] ([MA_ID], [MA_CODE]) VALUES (23, N'IGORA')
INSERT [dbo].[MARKA] ([MA_ID], [MA_CODE]) VALUES (24, N'MAJIREL')
INSERT [dbo].[MARKA] ([MA_ID], [MA_CODE]) VALUES (25, N'MATRIX')
INSERT [dbo].[MARKA] ([MA_ID], [MA_CODE]) VALUES (26, N'IGORA')
INSERT [dbo].[MARKA] ([MA_ID], [MA_CODE]) VALUES (27, N'KOLESTON')
INSERT [dbo].[MARKA] ([MA_ID], [MA_CODE]) VALUES (28, N'RALISS')
INSERT [dbo].[MARKA] ([MA_ID], [MA_CODE]) VALUES (29, N'LOREAL')
INSERT [dbo].[MARKA] ([MA_ID], [MA_CODE]) VALUES (30, N'VELLA')
INSERT [dbo].[MARKA] ([MA_ID], [MA_CODE]) VALUES (31, N'PERÇEM')
INSERT [dbo].[MARKA] ([MA_ID], [MA_CODE]) VALUES (32, N'REDIST')
INSERT [dbo].[MARKA] ([MA_ID], [MA_CODE]) VALUES (33, N'MORFOSE')
INSERT [dbo].[MARKA] ([MA_ID], [MA_CODE]) VALUES (34, N'TRINA')
INSERT [dbo].[MARKA] ([MA_ID], [MA_CODE]) VALUES (35, N'HECTOR')
INSERT [dbo].[MARKA] ([MA_ID], [MA_CODE]) VALUES (36, N'LILAFIX')
INSERT [dbo].[MARKA] ([MA_ID], [MA_CODE]) VALUES (37, N'ORGANIC')
SET IDENTITY_INSERT [dbo].[MARKA] OFF
GO
SET IDENTITY_INSERT [dbo].[MUSTERI] ON 

INSERT [dbo].[MUSTERI] ([MU_ID], [MU_AD_SOYAD], [MU_SIRKET], [MU_KULLANICI_ADI], [MU_TELEFON], [MU_ADRES], [MU_EMAIL], [MU_SIFRE]) VALUES (6, N'gökhan akkaya', N'zirve kuaför', N'gokhanakkaya31984', N'5062066885', N'pasa mah.17.sokak no:70 akhisar/manisa', N'gokhanakkaya31984@gmail.com', N'00001984')
INSERT [dbo].[MUSTERI] ([MU_ID], [MU_AD_SOYAD], [MU_SIRKET], [MU_KULLANICI_ADI], [MU_TELEFON], [MU_ADRES], [MU_EMAIL], [MU_SIFRE]) VALUES (7, N'Vildan Balverdi', N'imperial imports and exports', N'vildan', N'', N'kanada', N'vildan.balverdi@gmail.com', N'canada')
INSERT [dbo].[MUSTERI] ([MU_ID], [MU_AD_SOYAD], [MU_SIRKET], [MU_KULLANICI_ADI], [MU_TELEFON], [MU_ADRES], [MU_EMAIL], [MU_SIFRE]) VALUES (8, N'FUNDA OCAK', N'', N'fundaocak', N'05330240236', N'Kurtulus mah.64014 sk.özferay apt.Kat:1 Daire:1 Adana/Seyhan', N'funda_ock@hotmail.com', N'funda0000')
INSERT [dbo].[MUSTERI] ([MU_ID], [MU_AD_SOYAD], [MU_SIRKET], [MU_KULLANICI_ADI], [MU_TELEFON], [MU_ADRES], [MU_EMAIL], [MU_SIFRE]) VALUES (9, N'ozan', N'', N'ozanakan', N'555594', N'1828/6', N'ozaazn@gmamil', N'123')
INSERT [dbo].[MUSTERI] ([MU_ID], [MU_AD_SOYAD], [MU_SIRKET], [MU_KULLANICI_ADI], [MU_TELEFON], [MU_ADRES], [MU_EMAIL], [MU_SIFRE]) VALUES (17, N'ozan akan', N'', N'ozanakan', N'555594', N'1828/6', N'ozaazn@gmamil', N'123')
SET IDENTITY_INSERT [dbo].[MUSTERI] OFF
GO
SET IDENTITY_INSERT [dbo].[SIPARIS] ON 

INSERT [dbo].[SIPARIS] ([HZ_ID], [HZ_MUSTERI_ADI], [HZ_MUSTERI_SIRKET], [HZ_SIPARIS]) VALUES (13, N'gokhanakkaya31984', N'zirve kuaför', N'Ürün Adi:MAJIREL SAÇ BOYASI  -   Ürün Adeti:5  -  Siparis Detayi:

')
INSERT [dbo].[SIPARIS] ([HZ_ID], [HZ_MUSTERI_ADI], [HZ_MUSTERI_SIRKET], [HZ_SIPARIS]) VALUES (14, N'vildan', N'imperial imports and exports', N'Yeni web sitenizin hayirli olmasi dilegiyle iyi satislar dileriz :)
Turkish Bazaar Kanada')
SET IDENTITY_INSERT [dbo].[SIPARIS] OFF
GO
SET IDENTITY_INSERT [dbo].[URUN] ON 

INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (39, N'LOREAL INOA SAÇ BOYASI', N'20', N'12', N'60', CAST(24.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'1,00', NULL, N'Loreal_inoa_saç_boyasi_60_ml.jpg', 50, CAST(12.00 AS Numeric(18, 2)))
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (40, N'IGORA SAÇ BOYASI', N'23', N'12', N'60', CAST(3.00 AS Numeric(18, 2)), NULL, N'', NULL, N'Schwarzkopf_profesyonel_absolutes_igora_saç_boyasi_renkleri_60_ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (41, N'VELLA KOLESTON SAÇ BOYASI', N'27', N'12', N'60', CAST(3.00 AS Numeric(18, 2)), NULL, N'', NULL, N'koleston_boya.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (42, N'VELLA KOLESTON INNOSENSE SAÇ BOYASI', N'27', N'12', N'60', CAST(10.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'1', NULL, N'Wella_innosense_Sac_Boyalari_60_ml.jpg', 40, CAST(6.00 AS Numeric(18, 2)))
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (43, N'INDOLA SAÇ BOYASI', N'22', N'12', N'60', CAST(3.00 AS Numeric(18, 2)), NULL, N'2', NULL, N'Indola_saç_boyasi_60_ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (44, N'ALIX SAÇ BOYASI', N'21', N'12', N'60', CAST(3.00 AS Numeric(18, 2)), NULL, N'2', NULL, N'Alix_tüp_saç_boyasi_60_ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (45, N'MAJIREL SAÇ BOYASI', N'24', N'12', N'60', CAST(100.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'2', NULL, N'Loreal_Majirel_Sac_Boyalari_60_ml.jpg', 70, CAST(30.00 AS Numeric(18, 2)))
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (46, N'MATRIX SAÇ BOYASI', N'25', N'12', N'60', CAST(3.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'-', NULL, N'Martix_saç_boyasi_60_ml.png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (47, N'LILAFIX SAÇ BOYASI', N'36', N'12', N'60', CAST(3.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'1', NULL, N'Lilafix_saç_boyasi_60_ml.png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (48, N'ALIX BITKI ÖZLÜ SAÇ BOYASI', N'21', N'12', N'130', CAST(3.00 AS Numeric(18, 2)), NULL, N'1', NULL, N'Alix_bitli_özlü_saç_boyasi_130_ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (49, N'ORGANIC BITKISEL SAÇ BOYASI', N'37', N'12', N'150', CAST(3.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'1', NULL, N'Organik_bitkisal_saç_boyasi_150_ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (50, N'RALISS SAÇ BOYASI', N'28', N'12', N'60', CAST(3.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'-', NULL, N'Raliss.png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (55, N'LOREAL INOA KREM OKSIDAN 1000ml', N'29', N'18', N'1000', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL_INOA_Krem_Oksidan_Peroksit_1000_ml_10_20_30_VOLUM.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (56, N'LOREAL INOA SAMPUAN 1500ml', N'29', N'18', N'1500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'loreal-inoa-post-sampuan-1500_ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (57, N'LOREAL Serie Expert Absolut Repair Lipidium Onarici Sampuan 500ml', N'29', N'18', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Absolut Repair Lipidium Onarici Sampuan 500ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (58, N'LOREAL Serie Expert Absolut Repair Lipidium Asiri Yipranmis Saçlar Için Onarici Sampuan 750ml', N'29', N'18', N'750', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Absolut Repair Lipidium Asiri Yipranmis Saçlar Için Onarici Sampuan 750ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (59, N'LOREAL Serie Expert Absolut Repair Lipidium Onarici Sampuan 1500ml', N'29', N'18', N'1500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Absolut Repair Lipidium Onarici Sampuan 1500ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (60, N'LOREAL Serie Expert Absolut Repair Lipidium Asiri Yipranmis Saçlar Için Onarici Mini Maske 75ml', N'29', N'18', N'75', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Absolut Repair Lipidium Asiri Yipranmis Saçlar Için Onarici Mini Maske 75ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (61, N'LOREAL Serie Expert Absolut Repair Lipidium Maske 200ml', N'29', N'18', N'200', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Absolut Repair Lipidium Maske 200ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (62, N'LOREAL Serie Expert Absolut Repair Lipidium Asiri Yipranmis Saçlar Için Onarici Maske 500ml', N'29', N'18', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Absolut Repair Lipidium Asiri Yipranmis Saçlar Için Onarici Maske 500ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (63, N'LOREAL Serie Expert Power Repair Lipidium Yipranmis Saçlar Için Onarici Serum 30x10ml', N'29', N'18', N'10', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Power Repair Lipidium Yipranmis Saçlar Için Onarici Serum 30x10ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (64, N'LOREAL Serie Expert Aminexil Dökülme Önleyici Set', N'29', N'18', N'', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Aminexil Dökülme Önleyici Set.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (65, N'LOREAL Serie Expert Aminexil Advanced Saç Dökülmesine Karsi Serum 10x6ml', N'29', N'18', N'6', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Aminexil Advanced Saç Dökülmesine Karsi Serum 10x6ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (66, N'LOREAL Serie Expert Aminexil Advanced Saç Dökülmesine Karsi Roll On Serum 42x6ml', N'29', N'18', N'6', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Aminexil Advanced Saç Dökülmesine Karsi Roll On Serum 42x6ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (67, N'LOREAL Serie Expert Density Advanced Saç Dökülmesi Karsiti Yogunlastirici Sampuan 500ml', N'29', N'18', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Density Advanced Saç Dökülmesi Karsiti Yogunlastirici Sampuan 500ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (68, N'LOREAL Serie Expert Pure Resource Yagli Saçlar Için Arindirici Sampuan 500ml', N'29', N'18', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Pure Resource Yagli Saçlar Için Arindirici Sampuan 500ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (69, N'LOREAL Serie Expert Sensi Balance Hassas Bas Derisi Için Yatistirici Sampuan 500ml', N'29', N'18', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Sensi Balance Hassas Bas Derisi Için Yatistirici Sampuan 500ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (70, N'LOREAL Serie Expert Instant Clear Pure Yagli Saçlar Için Kepek Önleyici Sampuan 1500ml', N'29', N'18', N'1500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Instant Clear Pure Yagli Saçlar Için Kepek Önleyici Sampuan 1500ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (71, N'LOREAL Serie Expert Curl Contour Dalgali Saçlar Için Bukle Belirginlestirici Sampuan 500ml', N'29', N'18', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Curl Contour Dalgali Saçlar Için Bukle Belirginlestirici Sampuan 500ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (72, N'LOREAL Serie Expert Curl Contour Dalgali Saçlar Için Bukle Belirginlestirici Maske 200ml', N'29', N'18', N'200', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Curl Contour Dalgali Saçlar Için Bukle Belirginlestirici Maske 200ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (73, N'LOREAL Serie Expert Intense Repair Kuru Saçlar Için Nemlendirici ve Besleyici Sampuan 500ml', N'29', N'18', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Intense Repair Kuru Saçlar Için Nemlendirici ve Besleyici Sampuan 500ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (74, N'LOREAL Serie Expert Intense Repair Kuru Saçlar Için Nemlendirici ve Besleyici Sampuan 1500ml', N'29', N'18', N'1500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Intense Repair Kuru Saçlar Için Nemlendirici ve Besleyici Sampuan 1500ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (75, N'LOREAL Serie Expert Intense Repair Kuru Saçlar Için Nemlendirici ve Besleyici Maske 200ml', N'29', N'18', N'200', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Intense Repair Kuru Saçlar Için Nemlendirici ve Besleyici Maske 200ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (76, N'LOREAL Serie Expert Intense Repair Kuru Saçlar Için Nemlendirici ve Besleyici Maske 500ml', N'29', N'18', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Intense Repair Kuru Saçlar Için Nemlendirici ve Besleyici Maske 500ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (77, N'LOREAL Serie Expert Liss Unlimited Asi Saçlar Için Düzlestirici Sampuan 500ml', N'29', N'18', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Liss Unlimited Asi Saçlar Için Düzlestirici Sampuan 500ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (78, N'LOREAL Serie Expert Liss Unlimited Asi Saçlar Için Düzlestirici Sampuan 1500ml', N'29', N'18', N'1500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Liss Unlimited Asi Saçlar Için Düzlestirici Sampuan 1500ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (79, N'LOREAL Serie Expert Liss Unlimited Asi Saçlar Için Düzlestirici Maske 200ml', N'29', N'18', N'200', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'loreal-serie-expert-liss-unlimited-duzlestirici-maske-200ml-650x650.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (80, N'LOREAL Serie Expert Liss Unlimited Asi Saçlar Için Düzlestirici Maske 500ml', N'29', N'18', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Liss Unlimited Asi Saçlar Için Düzlestirici Maske 500ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (81, N'LOREAL Serie Expert Shine Blonde Sari Saçlar Için Turuncu Önleyici Parlaklik Sampuani 500ml', N'29', N'18', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Shine Blonde Sari Saçlar Için Turuncu Önleyici Parlaklik Sampuani 500ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (82, N'LOREAL Serie Expert Lumino Contrast Röfleli Saçlar Için Sampuan 1500ml', N'29', N'18', N'1500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Lumino Contrast Röfleli Saçlar Için Sampuan 1500ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (83, N'LOREAL Serie Expert Lumino Contrast Röfleli Saçlar Için Sampuan 500ml', N'29', N'18', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Lumino Contrast Röfleli Saçlar Için Sampuan 500ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (84, N'LOREAL Serie Expert Silver Gri ve Beyaz Saçlar Için Parlaklik Veren Sampuan 500ml', N'29', N'18', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Silver Gri ve Beyaz Saçlar Için Parlaklik Veren Sampuan 500ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (85, N'LOREAL Serie Expert Silver Gri ve Beyaz Saçlar Için Parlaklik Veren Sampuan 750ml', N'29', N'18', N'750', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Silver Gri ve Beyaz Saçlar Için Parlaklik Veren Sampuan 750ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (86, N'LOREAL Serie Expert Lumino Contrast Röfleli Saçlar Için Maske 200ml', N'29', N'18', N'200', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Lumino Contrast Röfleli Saçlar Için Maske 200ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (87, N'LOREAL Serie Expert Lumino Contrast Röfleli Saçlar Için Maske 500ml', N'29', N'18', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Lumino Contrast Röfleli Saçlar Için Maske 500ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (88, N'LOREAL Serie Expert PRO KERATIN REFILL Yipranmis Zayif Saçlar Için Onarici Güçlendirici Sampuan 500ml', N'29', N'18', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert PRO KERATIN REFILL Yipranmis Zayif Saçlar Için Onarici Güçlendirici Sampuan 500ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (89, N'LOREAL Serie Expert PRO KERATIN REFILL Yipranmis Zayif Saçlar Için Onarici Güçlendirici Sampuan 1500ml', N'29', N'18', N'1500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert PRO KERATIN REFILL Yipranmis Zayif Saçlar Için Onarici Güçlendirici Sampuan 1500ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (90, N'LOREAL Serie Expert PRO KERATIN REFILL Yipranmis Zayif Saçlar Için Onarici Güçlendirici Maske 200ml', N'29', N'18', N'200', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert PRO KERATIN REFILL Yipranmis Zayif Saçlar Için Onarici Güçlendirici Maske 200ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (91, N'LOREAL Serie Expert PRO KERATIN REFILL Yipranmis Zayif Saçlar Için Onarici Güçlendirici Maske 500ml', N'29', N'18', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert PRO KERATIN REFILL Yipranmis Zayif Saçlar Için Onarici Güçlendirici Maske 500ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (92, N'LOREAL Serie Expert Power Kera-Recharge Yipranmis Saçlar Için Yogun Bakim Serumu 30x10ml', N'29', N'18', N'10', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Power Kera-Recharge Yipranmis Saçlar Için Yogun Bakim Serumu 30x10ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (93, N'LOREAL Serie Expert Vitamino Color Boyali Saçlar Için Renk Koruyucu Sampuan 500ml', N'29', N'18', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Vitamino Color Boyali Saçlar Için Renk Koruyucu Sampuan 500ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (94, N'LOREAL Serie Expert Vitamino Color Boyali Saçlar Için Renk Koruyucu Sampuan 750ml', N'29', N'18', N'750', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Vitamino Color Boyali Saçlar Için Renk Koruyucu Sampuan 750ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (95, N'LOREAL Serie Expert Vitamino Color Boyali Saçlar Için Renk Koruyucu Sampuan 1500ml', N'29', N'18', N'1500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Vitamino Color Boyali Saçlar Için Renk Koruyucu Sampuan 1500ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (96, N'LOREAL Serie Expert Vitamino Color AOX Boyali Saçlar Için Renk Koruyucu Mini Jel Maske 75ml', N'29', N'18', N'75', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Vitamino Color AOX Boyali Saçlar Için Renk Koruyucu Mini Jel Maske 75ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (97, N'LOREAL Serie Expert Vitamino Color Boyali Saçlar Için Renk Koruyucu Jel Maske 200ml', N'29', N'18', N'200', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Vitamino Color Boyali Saçlar Için Renk Koruyucu Jel Maske 200ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (98, N'LOREAL Serie Expert Vitamino Color Boyali Saçlar Için Renk Koruyucu Jel Maske 500ml', N'29', N'18', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Vitamino Color Boyali Saçlar Için Renk Koruyucu Jel Maske 500ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (99, N'LOREAL Serie Expert Vitamino Delicate Color Boyali Saçlar Için Renk Koruyucu Sülfatsiz Sampuan 500ml', N'29', N'18', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Vitamino Delicate Color Boyali Saçlar Için Renk Koruyucu Sülfatsiz Sampuan 500ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (100, N'LOREAL Serie Expert Delicate Color Boyali Saçlar Için Renk Koruyucu Sülfatsiz Sampuan 1500ml', N'29', N'18', N'1500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Delicate Color Boyali Saçlar Için Renk Koruyucu Sülfatsiz Sampuan 1500ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (101, N'LOREAL Serie Expert Powerdose Color Boyali Saçlar Için Renk Koruyucu Parlaklik Serumu 30x10ml', N'29', N'18', N'10', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Powerdose Color Boyali Saçlar Için Renk Koruyucu Parlaklik Serumu 30x10ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (102, N'LOREAL Serie Expert Volumetry Ince Telli Saçlar Için Hacimlendirici Sampuan 500ml', N'29', N'18', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Volumetry Ince Telli Saçlar Için Hacimlendirici Sampuan 500ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (103, N'LOREAL Serie Expert Volumetry Ince Telli Saçlar Için Hacimlendirici Sampuan 750ml', N'29', N'18', N'750', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Volumetry Ince Telli Saçlar Için Hacimlendirici Sampuan 750ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (104, N'LOREAL Serie Expert Volumetry Volumceutic Ince Telli Saçlar Için Hacimlendirici Maske 500ml', N'29', N'18', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Serie Expert Volumetry Volumceutic Ince Telli Saçlar Için Hacimlendirici Maske 500ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (105, N'LOREAL Infinie Platine Pro-Keratine Güçlendirici Besleyici Güçlü Toz Saç Açici 500gr', N'29', N'18', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'LOREAL Infinie Platine Pro-Keratine Güçlendirici Besleyici Güçlü Toz Saç Açici 500gr.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (106, N'Wella Professionals Brillance Kalin Telli Boyali Saçlar Için Sampuan 1 lt', N'30', N'19', N'1000', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Wella Professionals Brillance Kalin Telli Boyali Saçlar Için Sampuan 1 lt.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (107, N'Wella Professionals Brillance Ince Telli Boyali Saçlar Için Sampuan 1 lt', N'30', N'19', N'1000', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Wella Professionals Brillance Ince Telli Boyali Saçlar Için Sampuan 1 lt.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (108, N'Wella ProfessionalsEnrich Conditioner 1 lt Kalin Telli Saçlar Için Saç Kremi', N'30', N'19', N'1000', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Wella ProfessionalsEnrich Conditioner 1 lt Kalin Telli Saçlar Için Saç Kremi.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (109, N'Wella Professionals Enrich Conditioner 1 lt Ince Telli Saçlar Için Saç Kremi', N'30', N'19', N'1000', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Wella ProfessionalsEnrich Conditioner 1 lt Ince Telli Saçlar Için Saç Kremi.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (110, N'Wella Enrich Moisturizing Sampuan  Kalin Telli Saçlar Için Sampuan 1000 ml', N'30', N'19', N'1000', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Wella Enrich Moisturizing Sampuan  Kalin Telli Saçlar Için Sampuan 1000 ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (111, N'Wella Enrich Moisturizing Sampuan  Ince Telli Saçlar Için Sampuan 1000 ml', N'30', N'19', N'1000', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Wella Enrich Moisturizing Sampuan  Ince Telli Saçlar Için Sampuan 1000 ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (112, N'Wella Professionals Enrich Conditioner 1lt Ince Telli Saçlar Için Saç Kremi', N'30', N'19', N'1000', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Wella Professionals EnrichConditioner 1lt Ince Telli Saçlar Için Saç Kremi.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (113, N'Wella Professionals EnrichConditioner 1lt Kalin Telli Saçlar Için Saç Kremi', N'30', N'19', N'1000', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Wella Professionals EnrichConditioner 1lt Kalin Telli Saçlar IçinSaç Kremi.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (114, N'Wella Brillance Kalin Telli/Normal Boyali Saçlar Için Sampuan 250ml', N'30', N'19', N'250', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'wella-brillance-ince-tellinormal-boyali-saclar-icin-sampuan-250ml-5421-85-B.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (115, N'Wella Brillance Ince Telli/Normal Boyali Saçlar Için Sampuan 250ml', N'30', N'19', N'250', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'wella-brillance-kalin-tellinormal-boyali-saclar-icin-sampuan-250ml-5421-85-B.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (116, N'Wella Brillance Kalin Telli/Normal Boyali Saçlar Için Maske 150ml', N'30', N'19', N'150', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'wella-brillance-ince-tellinormal-boyali-saclar-icin-maske-150ml-926-85.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (117, N'Wella Brillance Ince Telli/Normal Boyali Saçlar Için Maske 150ml', N'30', N'19', N'150', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'wella-brillance-kalin-tellinormal-boyali-saclar-icin-maske-150ml-926-85 - Kopya.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (118, N'Wella Brillance Kalin Telli Boyali Saçlar Için Maske 500ml', N'30', N'19', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'wella-brillance-kalin-telli-boyali-saclar-icin-maske-500ml-924-85-O.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (119, N'Wella Brillance Ince Telli Boyali Saçlar Için Maske 500ml', N'30', N'19', N'500', CAST(300.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'wella-brillance-ince-telli-boyali-saclar-icin-maske-500ml-924-85-O.jpg', 50, CAST(150.00 AS Numeric(18, 2)))
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (120, N'Wella Brillance Kalin Telli Boyali Saçlar Için Bakim Kremi 200ml', N'30', N'19', N'200', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'wella-brillance-kalin-telli-boyali-saclar-icin-bakim-kremi-200ml-922-84-O.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (121, N'Wella Brillance Ince Telli Boyali Saçlar Için Bakim Kremi 200ml', N'30', N'19', N'200', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'wella-brillance-ince-telli-boyali-saclar-icin-bakim-kremi-200ml-922-84-O.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (122, N'Wella Clean Kepek Önleyici Sampuan 250ml', N'30', N'19', N'250', CAST(100.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'wella-clean-kepek-onleyici-sampuan-250ml-1654-84-O.jpg', 20, CAST(80.00 AS Numeric(18, 2)))
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (123, N'Wella Pure Arindirici Sampuan 250ml', N'30', N'19', N'250', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'wella-pure-arindirici-sampuan-250ml-3127-84-O.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (124, N'Wella Refresh Canlandirici Sampuan 250ml', N'30', N'19', N'250', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Wella Refresh Canlandirici Sampuan250ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (125, N'Wella Calm Hassas Saç Derisi Için Sampuan 250ml', N'30', N'19', N'250', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'wella-calm-hassas-sac-derisi-icin-sampuan-250ml-5420-84-O.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (126, N'Wella Balance Dökülmeye Karsi Serum 8X6ml', N'30', N'19', N'6', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'wella-balance-dokulmeye-karsi-serum-8x6ml-3124-84-O.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (127, N'Wella Enrich Kalin Telli Saçlar Için Nemlendirici Sampuan 250ml', N'30', N'19', N'250', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'wella-enrich-kalin-telli-saclar-icin-nemlendirici-sampuan-250ml-933-86-O.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (128, N'Wella Enrich Ince Telli Saçlar Için Nemlendirici Sampuan 250ml', N'30', N'19', N'250', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'wella-enrich-ince-telli-saclar-icin-nemlendirici-sampuan-250ml-933-86-O.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (129, N'Wella Enrich Kalin Telli Saçlar Için Nemlendirici Bakim Maskesi 500ml', N'30', N'19', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'wella-enrich-kalin-telli-saclar-icin-nemlendirici-bakim-maskesi-500ml-934-86-O.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (130, N'Wella Enrich Ince Telli Saçlar Için Nemlendirici Bakim Maskesi 500ml', N'30', N'19', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'wella-enrich-ince-telli-saclar-icin-nemlendirici-bakim-maskesi-500ml-934-86-O.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (131, N'Wella Enrich Kalin Telli Saçlar Için Nemlendirici Bakim Kremi 200ml', N'30', N'19', N'250', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'wella-enrich-kalin-telli-saclar-icin-nemlendirici-bakim-kremi-200ml-936-86-O.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (132, N'Wella Enrich Ince Telli Saçlar Için Nemlendirici Bakim Kremi 200ml', N'30', N'19', N'200', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'wella-enrich-ince-telli-saclar-icin-nemlendirici-bakim-kremi-200ml-936-86-O.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (133, N'Wella Enrich Ince Telli/Normal Saçlar Için Hacimlendirici Sampuan 250ml', NULL, NULL, N'', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'wella-enrich-ince-telli-normal-saclar-icin-hacimlendirici-sampuan-250ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (134, N'Wella Enrich Kalin Telli/Normal Saçlar Için Hacimlendirici Sampuan 250ml', N'30', N'19', N'250', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'wella-enrich-kalin-telli-normal-saclar-icin-hacimlendirici-sampuan-250ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (135, N'Wella Enrich Elixir Kirik Uç Bakim Onarim Yagi 40ml', N'30', N'19', N'40', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'wella-enrich-elixir-kirik-uc-bakim-onarim-yagi-40ml-932-86-O.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (136, N'Wella Enrich Kalin Telli Saçlar Için Nemlendirici Bakim Maskesi 150ml', N'30', N'19', N'150', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'wella-enrich-kalin-telli-saclar-icin-nemlendirici-bakim-maskesi-150ml-931-85-O.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (137, N'Wella Enrich Ince Telli Saçlar Için Nemlendirici Bakim Maskesi 150ml', N'30', N'19', N'150', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'wella-enrich-ince-telli-saclar-icin-nemlendirici-bakim-maskesi-150ml-931-85-O.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (138, N'Wella Oil Reflections Bakim Yagi 100ml', N'30', N'19', N'100', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'wella-oil-reflections-bakim-yagi-100ml-944-87-O.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (139, N'PERÇEM NORMAL SAÇLAR IÇIN SAMPUAN 5 LT', N'31', N'48', N'5000', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Perçem_sampuan_saç_kremi_pembe_yesil_bes_5_litre_lt (2).png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (140, N'PERÇEM YIPRANMIS SAÇLAR IÇIN SAMPUAN 5 LT', N'31', N'48', N'5000', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Perçem_sampuan_saç_kremi_pembe_yesil_bes_5_litre_lt (3).png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (141, N'PERÇEM ELMA AROMALI SAMPUAN 5 LT', N'31', N'48', N'5000', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Perçem_sampuan_saç_kremi_pembe_yesil_bes_5_litre_lt (5).png', NULL, NULL)
GO
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (142, N'PERÇEM SARI SAÇ KREMI 5 LT', N'31', N'48', N'5000', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Perçem_sampuan_saç_kremi_pembe_yesil_bes_5_litre_lt (6).png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (143, N'PERÇEM LIMON AROMALI SAMPUAN 5 LT', N'31', N'48', N'5000', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Perçem_sampuan_saç_kremi_pembe_yesil_bes_5_litre_lt (4).png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (144, N'PERÇEM PEROKSIT 10 VOLUM (%3) 1 LT', N'31', N'48', N'1000', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Perçem_oksidan_peroksit_krem_bir_litre_1_lt_10_20_30_40_volum_yüzde_üç_alti_dokuz_oniki (2).png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (145, N'PERÇEM PEROKSIT 20 VOLUM (%6) 1 LT', N'31', N'48', N'1000', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Perçem_oksidan_peroksit_krem_bir_litre_1_lt_10_20_30_40_volum_yüzde_üç_alti_dokuz_oniki (3).png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (146, N'PERÇEM PEROKSIT 30 VOLUM (%9) 1 LT', N'31', N'48', N'1000', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Perçem_oksidan_peroksit_krem_bir_litre_1_lt_10_20_30_40_volum_yüzde_üç_alti_dokuz_oniki (4).png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (147, N'PERÇEM PEROKSIT 40 VOLUM (%12) 1 LT', N'31', N'48', N'1000', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Perçem_oksidan_peroksit_krem_bir_litre_1_lt_10_20_30_40_volum_yüzde_üç_alti_dokuz_oniki (5).png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (149, N'PERÇEM EXTRA SERT SAÇ KÖPÜGÜ 500 ML', N'31', N'48', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Percem-Sac-Kopugu-500-ml--43751.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (150, N'PERÇEM LIMON AROMALI 80 DERECE KOLONYA 1 lt', N'31', N'48', N'1000', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Perçem_limon_kolonyasi_bir_litre_1lt.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (151, N'PERÇEM LIMON AROMALI 80 DERECE KOLONYA 5 lt', N'31', N'48', N'5000', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'PERÇEM LIMON AROMALI 80 DERECE KOLONYA 5lt.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (152, N'PERÇEM EL KREMI E VITAMINLI 250 ml', N'31', N'48', N'250', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'PERÇEM EL KREMI E VITAMINLI 250 ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (153, N'PERÇEM VAZELIN 110 ml', N'31', N'48', N'110', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'PERÇEM VAZELIN 110 ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (154, N'Onarici Saç serumu 75 ml Turuncu', N'33', N'47', N'75', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Onarici Saç serumu 75 ml Turuncu.png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (155, N'Morfose Keratin Serum 75ml Siyah', N'33', N'47', N'75', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Keratin Serum 75ml Siyah.png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (156, N'Morfose Silk Serum 75 ml Beyaz', N'33', N'47', N'75', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Silk Serum 75 ml Beyaz.png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (157, N'Morfose Saç Spreyi 400 ml Extra Strong Siyah', N'33', N'47', N'400', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Saç Spreyi 400 ml Extra Strong Siyah.png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (158, N'Morfose Saç Spreyi 350 ml Normal Strong Beyaz', N'33', N'47', N'350', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'1.png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (159, N'Morfose Saç Spreyi 400 ml Mega Strong Mor', N'33', N'47', N'400', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Saç Spreyi 400ml Mega Strong Mor.png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (160, N'Morfose Saç Spreyi 400 ml NOGAS Ultra Strong Turuncu', N'33', N'47', N'400', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Saç Spreyi 400ml NOGAS Ultra Strong Turuncu.png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (161, N'Morfose Saç Waxi  120g Ultra Strong Turuncu', N'33', N'47', N'120', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Saç Waxi 120g Ultra Strong Turuncu.png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (162, N'Morfose Saç Waxi 120g Extra Strong Siyah', N'33', N'47', N'120', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Saç Waxi 120g Extra Strong Siyah.png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (163, N'Morfose Saç Waxi 120g Clay Mat', N'33', N'47', N'120', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Saç Waxi 120g Clay Mat.png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (164, N'Morfose Biryantin 175 ml', N'33', N'47', N'175', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Biryantin 175ml.png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (165, N'Morfose Saç Spreyi 400 ml Ultra Strong Turuncu', N'33', N'47', N'400', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Saç Spreyi 400ml Ultra Strong Turuncu.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (166, N'Morfose Toz Açici 1000 g', N'33', N'47', N'1000', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Toz Açici 1000 g.png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (167, N'Morfose Balyaj Boyasi 250 ml', N'33', N'47', N'250', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Balyaj Boyasi 250ml.png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (168, N'Morfose Renkli Isiltili Saç Spreyi Glitter Spray 125 ml', N'33', N'47', N'125', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Renkli Isiltili Saç Spreyi Glitter Spray 125ml.png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (169, N'Morfose Biotin Fön Suyu 400 ml Yesil', N'33', N'47', N'400', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Biotin Fön Suyu 400 ml Yesil.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (170, N'Morfose Keratin Fön Suyu 400 ml Mor', N'33', N'47', N'400', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Keratin Fön Suyu 400 ml Mor.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (171, N'Morfose Argan Fön Suyu 400 ml Turuncu', N'33', N'47', N'400', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Argan Fön Suyu 400 ml Turuncu.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (172, N'Morfose Keratin Maske 500 ml', N'33', N'47', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Keratin Maske 500 ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (173, N'Morfose Saç Maskesi 250 ml', N'33', N'47', N'250', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Saç Maskesi 250 ml.png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (174, N'Morfose Milk Keratin Serum 125 ml', N'33', N'47', N'125', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Milk Keratin Serum 125 ml.png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (175, N'Morfose Kremsi Saç Bakim Köpügü 200 ml', N'33', N'47', N'200', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Kremsi Saç Bakim Köpügü 200 ml.png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (176, N'Morfose Çift Fazla Fön Sütü 400 ml', N'33', N'47', N'400', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Çift Fazla Fön Sütü 400ml.png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (177, N'Morfose Kremsi Süt Sampuan 400 ml', N'33', N'47', N'400', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Kremsi Süt Sampuan 400 ml.png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (178, N'Morfose Milk Therapy Chocolate 200 ml', N'33', N'47', N'200', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Milk Therapy Chocolate 200 ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (179, N'Morfose Saç bakim maskesi 500 ml Balli', N'33', N'47', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Saç bakim maskesi 500ml Balli.png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (180, N'Morfose Saç bakim maskesi 500 ml Boya Koruma', N'33', N'47', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Saç bakim maskesi 500ml Boya Koruma.png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (181, N'Morfose Saç bakim maskesi 500 ml Onarici', N'33', N'47', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Saç bakim maskesi 500ml Onarici.png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (182, N'Morfose Saç serumu 100 ml', N'33', N'47', N'100', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Saç serumu 100ml.png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (183, N'Morfose Saç masaj tonigi 250 ml', N'33', N'47', N'250', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Saç masaj tonigi 250ml.png', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (184, N'Morfose Argan Sampuan 500 ml', N'33', N'47', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Argan Sampuan 500ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (185, N'Morfose Argan Krem Maske 170 ml', N'33', N'47', N'170', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Argan Krem Maske 170ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (186, N'Morfose Argan Yagi 100 ml', N'33', N'47', N'100', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Argan Yagi 100ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (187, N'Morfose Argan Sekillendirici Elixir 100 ml', N'33', N'47', N'100', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Argan Sekillendirici Elixir 100ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (188, N'Morfose Argan Saf Yag 15 ml', N'33', N'47', N'15', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Argan Saf Yag 15ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (189, N'Morfose Natura Therapy Macadamia Sampuan 500 ml', N'33', N'47', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Natura Therapy Macadamia Sampuan.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (190, N'Morfose Natura Therapy Macadamia Bakim Yagi 125 ml', N'33', N'47', N'125', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Natura Therapy Macadamia Bakim Yagi 125 ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (191, N'Morfose Macadamia Krem Maske 500 ml', N'33', N'47', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Macadamia Krem Maske 500 ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (192, N'Morfose Natura Therapy Saf Macadamia Yagi', N'33', N'47', N'', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Morfose Natura Therapy Saf Macadamia Yagi.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (193, N'Redist Hair Care Shampoo / Saç Bakim Sampuani 40 çesit 500 ml', N'33', N'47', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'redist-hair-care-shampoo-saç-bakim-sampuani-40-çesit-500ml-sampuanlar-redist-alk10--2827-320x300.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (194, N'Redist Hair Care Oil / Saç Bakim Yagi 150 ml', N'33', N'47', N'150', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'redist-hair-care-oil-saç-bakim-yagi-150ml-saç-bakim-urunleri-redist-alk103--2761-320x300.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (195, N'Redist Miracle Hair Care Oil Plus Keratin Yagi 100 ml', N'32', N'20', N'100', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'redist-miracle-hair-care-oil-plus-keratin-yagi-100ml-saç-bakim-urunleri-redist-alk10--2842-320x300.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (196, N'Redist Saç Serumu (Maximum Bakim)', N'32', N'20', N'', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'redist-saç-serumu-maximum-bakim-saç-bakim-urunleri-redist-alk105-1-2-48-320x300.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (197, N'Redist Hair Serum /Saç Serumu (Organik Argan Yagi)Komple Bakim 100 ml', N'32', N'20', N'100', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'redist-hair-serum-saç-serumu-organik-argan-yagikomple-bakim-100ml-saç-bakim-urunl-49-320x300.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (198, N'Redist Hair Care Mousse / Saç Köpügü 40 Çesit 200gr', N'32', N'20', N'200', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'redist-hair-care-mousse-saç-köpugu-40-çesit-200gr-saç-bakim-urunleri-redist-alk114--2760-320x300.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (199, N'Redist Keratin Argan Sampuan 500 ml', N'32', N'20', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Redist Keratin Argan Sampuan 500 Ml.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (200, N'Redist 2 Fazli Saç Kondisyoneri / Argan yagi içerikli 400 ml', N'32', N'20', N'400', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'redist-2-fazli-saç-kondisyoneri-argan-yagi-içerikli-400ml-redist-urunleri-redist-a--2732-320x300.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (201, N'Redist Hair Care Saç Bakim Kremi 500 ml', N'32', N'20', N'500', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'redist-hair-care-saç-bakim-kremi-500ml-sampuanlar-redist-alk108--2828-320x300.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (202, N'MORFOSE FACE & BODY SCRUB RASPBERY / Morfose El ve Vücut Peelingi Ahududu 200 ml', N'33', N'47', N'200', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'MORFOSE BODY SCRUB-500x500 (4).jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (203, N'MORFOSE FACE & BODY SCRUB APRICOT / Morfose El ve Vücut Peelingi Kayisi 200 ml', N'33', N'47', N'200', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'MORFOSE BODY SCRUB-500x500 (5).jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (204, N'MORFOSE FACE & BODY SCRUB BAMBOO / Morfose El ve Vücut Peelingi Bambu 200 ml', N'33', N'47', N'200', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'MORFOSE BODY SCRUB-500x500 (6).jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (205, N' Organic Colour Systems Cream Activatör Oksidan 1000 m', N'37', N'13', N'1000', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'23581854059792976154.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (206, N'Welloxon Perfect Wella Oksidan Krem 20 Vol. 6''lik 1 lt', N'30', N'13', N'1000', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Welloxon-Perfect-Wella-Oksidan-Krem-20-Vol.-6''lik.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (207, N'Welloxon Perfect Wella Oksidan Krem 30 Vol. 9''lik 1 lt', N'30', N'13', N'1000', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Welloxon-Perfect-Wella-Oksidan-Krem-30-Vol.-9''lik.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (208, N'Welloxon Perfect Wella Oksidan Krem 40 Vol. 12''lik 1 lt', N'30', N'13', N'1000', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Welloxon-Perfect-Wella-Oksidan-Krem-40-Vol.-12''lik.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (209, N'Igora Royal Oksidan 10(%3) 20(%6) 30(%9) 40(%12) vol 1 lt', N'23', N'13', N'1000', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'igora_oksidan.gif.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (210, N'Tek Kullanimlik 100''lü Havlu', NULL, N'49', N'', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Tek Kullanimlik 100''lü Havlu.jpeg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (211, N'Agda Bezi', NULL, N'49', N'', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Agda Bezi.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (212, N'Tek Kullanimlik Terlik', NULL, N'49', N'', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Tek Kullanimlik Terlik.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (213, N'Vinyl Beybi Lateks Boya Eldiveni 100''lü Medium (M)', NULL, N'49', N'', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'BYB-0002_Beybi-Lateks-Muayene-Eldiveni-100''lu_Medium-500x554.JPG', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (214, N'Vinyl Beybi Lateks Boya Eldiveni 100''lü Large', NULL, N'49', N'', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'dsc01664.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (215, N'Vinyl Beybi Lateks Boya Eldiveni 100''lü Small', NULL, N'49', N'', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'beybi-muayene-eld-pudrasz-small-100lu-0-zoom.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (216, N'Wella Curl It Intense Perma Losyonu 75ml', N'30', N'19', N'75', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'wella-curl-it-mild-perma-losyonu-75ml-wella-perma-urunleri-4798-28-O.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (217, N'Wella Blondor Toz Açici 800 gr', N'30', N'19', N'800', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'wella_blonder.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (218, N'Wella Professionals Blondor Soft Blonde Cream', N'30', N'19', N'', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'-wella-professionals-blondor-soft-blonde-cream.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (219, N'Flormar Oje', NULL, N'61', N'', CAST(3.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'thumba___oje_5.jpg', NULL, NULL)
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (220, N'MATRIX SAÇ BOYASI', N'25', NULL, N'60', CAST(3.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'-', NULL, N'Martix_saç_boyasi_60_ml.png', NULL, NULL)
SET IDENTITY_INSERT [dbo].[URUN] OFF
GO
USE [master]
GO
ALTER DATABASE [KUMSALKOZMETIK] SET  READ_WRITE 
GO









USE [KUMSALKOZMETIK]
GO
/****** Object:  Table [dbo].[URUN]    Script Date: 17.05.2020 18:03:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URUN](
	[UR_ID] [int] IDENTITY(1,1) NOT NULL,
	[UR_AD] [varchar](200) NULL,
	[UR_MARKA] [varchar](100) NULL,
	[UR_KATEGORI] [varchar](100) NULL,
	[UR_GRAMAJ] [varchar](100) NULL,
	[UR_FIYAT] [numeric](18, 2) NULL,
	[UR_INDIRIM] [numeric](18, 2) NULL,
	[UR_YENI] [varchar](5) NULL,
	[UR_STOK] [int] NULL,
	[UR_RESIM_URL] [nvarchar](max) NULL,
	[UR_INDIRIM_YUZDE] [int] NULL,
	[UR_FIYAT_INDIRIMLI] [numeric](18, 2) NULL,
 CONSTRAINT [PK_URUN] PRIMARY KEY CLUSTERED 
(
	[UR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[URUN] ON 
GO
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (1229, N'L''oreal Professionnel Absolut Repair Yıpranmış Saçlar İçin Onarıcı Gold Maske 500 ml.', N'29', N'3', N'', CAST(140.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'-', NULL, N'Loreal_Seriexpert_Absolut500ml.jpg', 20, CAST(112.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (1230, N'Loreal Professionnel Serie Expert Vitamino Color Masque 250ml', N'29', N'3', N'250', CAST(140.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'-', NULL, N'Loreal_Seriexpert_VitaminColor500ml.jpg', 50, CAST(70.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (1231, N'Loreal Professionnel Serie Expert Pure Resource Shampoo 300ml', N'29', N'4', N'300', CAST(85.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'-', NULL, N'Loreal_Seriexpert_Silver500ml.jpg', NULL, NULL)
GO
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (1232, N'L''Oréal Professionnel Série Expert Curl Contour Shampoo 300ml', N'29', N'4', N'300', CAST(90.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'-', NULL, N'Loreal_Seriexpert_CurlContour500ml.jpg', NULL, NULL)
GO
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (1233, N'INOA Saç Boyası 6.0 Koyu Kumral Yoğun 60Ml', N'29', N'6', N'60', CAST(40.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'-', NULL, N'inoa_6.0_boya.jpg', NULL, NULL)
GO
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (1234, N'INOA Saç Boyası 4.0 Kahve Yoğun 60Ml', N'29', N'6', N'60', CAST(40.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'inoa_4.0_boya.jpg', NULL, NULL)
GO
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (1235, N' İGORA Royal Absolutes Saç Boyası 10.0 60Ml', N'23', N'6', N'60', CAST(30.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'igora_10.0_boya.jpg', NULL, NULL)
GO
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (1236, N'İGORA Royal Absolutes Saç Boyası 9.00 Yoğun Sarı 60Ml', N'23', N'6', N'60', CAST(35.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'igora_9.0_boya.jpg', NULL, NULL)
GO
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (1237, N'İGORA ROYAL Absolutes Saç Boyası Silver White 60Ml', N'23', N'6', N'60', CAST(100.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'igora_silver_boya.jpg', 20, CAST(80.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (1238, N'VİTAL Saç Boyası 10.0 Platin Sarı 60Ml', N'38', N'6', N'60', CAST(100.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Vital_boya_10.0.jpg', NULL, NULL)
GO
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (1239, N'VİTAL Saç Boyası 8.77 Tarçın Bakır 60Ml', N'100', N'6', N'60', CAST(9.50 AS Numeric(18, 2)), NULL, N'-', NULL, N'Vital_boya_8.77.jpg', NULL, NULL)
GO
INSERT [dbo].[URUN] ([UR_ID], [UR_AD], [UR_MARKA], [UR_KATEGORI], [UR_GRAMAJ], [UR_FIYAT], [UR_INDIRIM], [UR_YENI], [UR_STOK], [UR_RESIM_URL], [UR_INDIRIM_YUZDE], [UR_FIYAT_INDIRIMLI]) VALUES (1240, N'DAVİNES Nourishing Vegetarian Miracle Yıpranmış Kuru Saç Kremi 1000Ml', N'39', N'5', N'1000', CAST(347.00 AS Numeric(18, 2)), NULL, N'-', NULL, N'Davines-sac-kremi-1000.jpg', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[URUN] OFF
GO
