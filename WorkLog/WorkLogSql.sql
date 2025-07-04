USE [WorkLog]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 28.06.2025 20:18:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 28.06.2025 20:18:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoriler](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Kategoriler] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanicilar]    Script Date: 28.06.2025 20:18:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanicilar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Kullanicilar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musteriler]    Script Date: 28.06.2025 20:18:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteriler](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Musteriler] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 28.06.2025 20:18:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Baslik] [nvarchar](max) NOT NULL,
	[Aciklama] [nvarchar](max) NOT NULL,
	[Musteri] [nvarchar](max) NOT NULL,
	[Kategori] [nvarchar](max) NOT NULL,
	[Kullanici] [nvarchar](max) NOT NULL,
	[Sure] [int] NOT NULL,
	[Tarih] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250628114145_InitialCreate', N'9.0.6')
GO
SET IDENTITY_INSERT [dbo].[Kategoriler] ON 

INSERT [dbo].[Kategoriler] ([Id], [Ad]) VALUES (1, N'Teknik Destek')
INSERT [dbo].[Kategoriler] ([Id], [Ad]) VALUES (2, N'Altyapı')
INSERT [dbo].[Kategoriler] ([Id], [Ad]) VALUES (3, N'Kullanıcı Yönetimi')
INSERT [dbo].[Kategoriler] ([Id], [Ad]) VALUES (4, N'Ağ Sorunları')
INSERT [dbo].[Kategoriler] ([Id], [Ad]) VALUES (5, N'Donanım')
INSERT [dbo].[Kategoriler] ([Id], [Ad]) VALUES (6, N'Yazılım')
SET IDENTITY_INSERT [dbo].[Kategoriler] OFF
GO
SET IDENTITY_INSERT [dbo].[Kullanicilar] ON 

INSERT [dbo].[Kullanicilar] ([Id], [Ad]) VALUES (1, N'ahmet.yilmaz')
INSERT [dbo].[Kullanicilar] ([Id], [Ad]) VALUES (2, N'ayse.kara')
INSERT [dbo].[Kullanicilar] ([Id], [Ad]) VALUES (3, N'mehmet.demir')
INSERT [dbo].[Kullanicilar] ([Id], [Ad]) VALUES (4, N'fatma.oz')
INSERT [dbo].[Kullanicilar] ([Id], [Ad]) VALUES (5, N'ali.kaplan')
SET IDENTITY_INSERT [dbo].[Kullanicilar] OFF
GO
SET IDENTITY_INSERT [dbo].[Musteriler] ON 

INSERT [dbo].[Musteriler] ([Id], [Ad]) VALUES (1, N'Acme Corp')
INSERT [dbo].[Musteriler] ([Id], [Ad]) VALUES (2, N'Beta Ltd')
INSERT [dbo].[Musteriler] ([Id], [Ad]) VALUES (3, N'Delta AŞ')
INSERT [dbo].[Musteriler] ([Id], [Ad]) VALUES (4, N'Gamma Inc')
SET IDENTITY_INSERT [dbo].[Musteriler] OFF
GO
SET IDENTITY_INSERT [dbo].[Tickets] ON 

INSERT [dbo].[Tickets] ([Id], [Baslik], [Aciklama], [Musteri], [Kategori], [Kullanici], [Sure], [Tarih]) VALUES (3, N'Yeni Kullanıcı Ekleme', N'Yeni çalışan için sistem hesabı oluşturulacak.', N'Beta Ltd', N'Yazılım', N'fatma.oz', 33, CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Tickets] ([Id], [Baslik], [Aciklama], [Musteri], [Kategori], [Kullanici], [Sure], [Tarih]) VALUES (4, N'VPN Bağlantı Problemi', N'VPN bağlantısı kurulamıyor.', N'Gamma Inc', N'Ağ Sorunları', N'fatma.oz', 60, CAST(N'2025-06-24T16:45:00.0000000' AS DateTime2))
INSERT [dbo].[Tickets] ([Id], [Baslik], [Aciklama], [Musteri], [Kategori], [Kullanici], [Sure], [Tarih]) VALUES (5, N'Yazıcı Çalışmıyor', N'Ofis yazıcısı çıktı vermiyor.', N'Acme Corp', N'Donanım', N'ali.kaplan', 20, CAST(N'2025-06-23T08:20:00.0000000' AS DateTime2))
INSERT [dbo].[Tickets] ([Id], [Baslik], [Aciklama], [Musteri], [Kategori], [Kullanici], [Sure], [Tarih]) VALUES (6, N'Sifre Sıfırlama', N'Kullanıcı şifresini unuttu, sıfırlama talebi.', N'Beta Ltd', N'Kullanıcı Yönetimi', N'ayse.kara', 15, CAST(N'2025-06-22T13:10:00.0000000' AS DateTime2))
INSERT [dbo].[Tickets] ([Id], [Baslik], [Aciklama], [Musteri], [Kategori], [Kullanici], [Sure], [Tarih]) VALUES (7, N'Yazılım Güncelleme', N'CRM yazılımı son sürüme yükseltilecek.', N'Delta AŞ', N'Yazılım', N'mehmet.demir', 90, CAST(N'2025-06-21T10:30:00.0000000' AS DateTime2))
INSERT [dbo].[Tickets] ([Id], [Baslik], [Aciklama], [Musteri], [Kategori], [Kullanici], [Sure], [Tarih]) VALUES (8, N'Outlook Senkronizasyon Hatası', N'Mail senkronize olmuyor.', N'Gamma Inc', N'Teknik Destek', N'ahmet.yilmaz', 40, CAST(N'2025-06-20T15:50:00.0000000' AS DateTime2))
INSERT [dbo].[Tickets] ([Id], [Baslik], [Aciklama], [Musteri], [Kategori], [Kullanici], [Sure], [Tarih]) VALUES (9, N'Raporlama Hatası', N'Finans raporu hatalı veri gösteriyor.', N'Acme Corp', N'Yazılım', N'fatma.oz', 75, CAST(N'2025-06-19T12:00:00.0000000' AS DateTime2))
INSERT [dbo].[Tickets] ([Id], [Baslik], [Aciklama], [Musteri], [Kategori], [Kullanici], [Sure], [Tarih]) VALUES (10, N'Ekran Donması', N'Bilgisayar sık sık donuyor.', N'Beta Ltd', N'Donanım', N'ali.kaplan', 50, CAST(N'2025-06-18T09:40:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Tickets] OFF
GO
