USE [master]
GO
/****** Object:  Database [DuyTh4i]    Script Date: 19-Nov-20 4:53:08 PM ******/
CREATE DATABASE [DuyTh4i]
GO
ALTER DATABASE [DuyTh4i] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DuyTh4i].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DuyTh4i] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DuyTh4i] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DuyTh4i] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DuyTh4i] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DuyTh4i] SET ARITHABORT OFF 
GO
ALTER DATABASE [DuyTh4i] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DuyTh4i] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DuyTh4i] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DuyTh4i] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DuyTh4i] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DuyTh4i] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DuyTh4i] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DuyTh4i] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DuyTh4i] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DuyTh4i] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DuyTh4i] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DuyTh4i] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DuyTh4i] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DuyTh4i] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DuyTh4i] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DuyTh4i] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DuyTh4i] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DuyTh4i] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DuyTh4i] SET  MULTI_USER 
GO
ALTER DATABASE [DuyTh4i] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DuyTh4i] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DuyTh4i] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DuyTh4i] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DuyTh4i] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DuyTh4i] SET QUERY_STORE = OFF
GO
USE [DuyTh4i]
GO
/****** Object:  Table [dbo].[account]    Script Date: 19-Nov-20 4:53:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[number] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](15) NOT NULL,
	[password] [varchar](32) NOT NULL,
	[permission] [int] NULL,
	[address] [nvarchar](300) NULL,
	[fullName] [nvarchar](50) NULL,
	[phoneNumber] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 19-Nov-20 4:53:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[uNumber] [int] NOT NULL,
	[code] [int] NULL,
	[quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 19-Nov-20 4:53:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[uNumber] [int] NOT NULL,
	[oId] [int] NOT NULL,
	[date] [date] NULL,
	[code] [int] NULL,
	[quantity] [int] NULL,
	[status] [int] NULL,
	[fullName] [nvarchar](50) NULL,
	[phoneNumber] [varchar](10) NULL,
	[address] [nvarchar](300) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 19-Nov-20 4:53:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[code] [int] NOT NULL,
	[name] [varchar](100) NOT NULL,
	[image] [varchar](100) NULL,
	[describe] [nvarchar](500) NOT NULL,
	[price] [int] NULL,
	[amount] [int] NULL,
	[status] [int] NULL,
	[releaseDate] [date] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 
GO
INSERT [dbo].[account] ([number], [username], [password], [permission], [address], [fullName], [phoneNumber]) VALUES (1, N'admin_DuyTh4i', N'thaibadao01', 1, N'', N'', N'')
GO
INSERT [dbo].[account] ([number], [username], [password], [permission], [address], [fullName], [phoneNumber]) VALUES (2, N'userDemo', N'12345678', 0, N'Đại học FPT', N'Nguyễn Văn A', N'0966070888')
GO
INSERT [dbo].[account] ([number], [username], [password], [permission], [address], [fullName], [phoneNumber]) VALUES (3, N'hongPhe', N'123456789', 0, N'Hà Nội', N'Nguyễn Thanh C', N'9996661234')
GO
SET IDENTITY_INSERT [dbo].[account] OFF
GO
INSERT [dbo].[order] ([uNumber], [oId], [date], [code], [quantity], [status], [fullName], [phoneNumber], [address]) VALUES (2, 1, CAST(N'2020-11-05' AS Date), 1509, 1, 1, N'Nguyễn Văn A', N'0966070888', N'Đại học FPT')
GO
INSERT [dbo].[order] ([uNumber], [oId], [date], [code], [quantity], [status], [fullName], [phoneNumber], [address]) VALUES (2, 1, CAST(N'2020-11-05' AS Date), 887, 1, 1, N'Nguyễn Văn A', N'0966070888', N'Đại học FPT')
GO
INSERT [dbo].[order] ([uNumber], [oId], [date], [code], [quantity], [status], [fullName], [phoneNumber], [address]) VALUES (2, 2, CAST(N'2020-11-05' AS Date), 1295, 2, 1, N'Nguyễn Văn A', N'0966070888', N'Đại học FPT')
GO
INSERT [dbo].[order] ([uNumber], [oId], [date], [code], [quantity], [status], [fullName], [phoneNumber], [address]) VALUES (3, 3, CAST(N'2020-11-05' AS Date), 1491, 1, 1, N'Nguyễn Thanh C', N'9996661234', N'Hà Nội')
GO
INSERT [dbo].[order] ([uNumber], [oId], [date], [code], [quantity], [status], [fullName], [phoneNumber], [address]) VALUES (2, 5, CAST(N'2020-11-05' AS Date), 887, 1, 1, N'Nguyễn Văn A', N'0966070888', N'Đại học FPT')
GO
INSERT [dbo].[order] ([uNumber], [oId], [date], [code], [quantity], [status], [fullName], [phoneNumber], [address]) VALUES (2, 5, CAST(N'2020-11-05' AS Date), 1491, 1, 1, N'Nguyễn Văn A', N'0966070888', N'Đại học FPT')
GO
INSERT [dbo].[order] ([uNumber], [oId], [date], [code], [quantity], [status], [fullName], [phoneNumber], [address]) VALUES (2, 7, CAST(N'2020-11-05' AS Date), 1200, 3, 1, N'Nguyễn Văn A', N'0966070888', N'Đại học FPT')
GO
INSERT [dbo].[order] ([uNumber], [oId], [date], [code], [quantity], [status], [fullName], [phoneNumber], [address]) VALUES (2, 7, CAST(N'2020-11-05' AS Date), 473, 4, 1, N'Nguyễn Văn A', N'0966070888', N'Đại học FPT')
GO
INSERT [dbo].[order] ([uNumber], [oId], [date], [code], [quantity], [status], [fullName], [phoneNumber], [address]) VALUES (2, 7, CAST(N'2020-11-05' AS Date), 1218, 5, 1, N'Nguyễn Văn A', N'0966070888', N'Đại học FPT')
GO
INSERT [dbo].[order] ([uNumber], [oId], [date], [code], [quantity], [status], [fullName], [phoneNumber], [address]) VALUES (3, 8, CAST(N'2020-11-06' AS Date), 1475, 1, 2, N'Nguyễn Thanh C', N'9996661234', N'Hà Nội')
GO
INSERT [dbo].[order] ([uNumber], [oId], [date], [code], [quantity], [status], [fullName], [phoneNumber], [address]) VALUES (2, 9, CAST(N'2020-11-07' AS Date), 1148, 1, 1, N'Nguyễn Văn A', N'966070888', N'Đại học FPT')
GO
INSERT [dbo].[order] ([uNumber], [oId], [date], [code], [quantity], [status], [fullName], [phoneNumber], [address]) VALUES (3, 10, CAST(N'2020-11-11' AS Date), 1288, 1, 1, N'Nguyễn Thanh C', N'9996661234', N'Hà Nội')
GO
INSERT [dbo].[order] ([uNumber], [oId], [date], [code], [quantity], [status], [fullName], [phoneNumber], [address]) VALUES (2, 11, CAST(N'2020-11-12' AS Date), 473, 1, 1, N'Nguyễn Văn A', N'966070888', N'Đại học FPT')
GO
INSERT [dbo].[order] ([uNumber], [oId], [date], [code], [quantity], [status], [fullName], [phoneNumber], [address]) VALUES (2, 12, CAST(N'2020-11-12' AS Date), 1474, 1, 1, N'Nguyễn Văn A', N'966070888', N'Đại học FPT')
GO
INSERT [dbo].[order] ([uNumber], [oId], [date], [code], [quantity], [status], [fullName], [phoneNumber], [address]) VALUES (2, 6, CAST(N'2020-11-05' AS Date), 1483, 1, 1, N'Nguyễn Văn A', N'0966070888', N'Đại học FPT')
GO
INSERT [dbo].[order] ([uNumber], [oId], [date], [code], [quantity], [status], [fullName], [phoneNumber], [address]) VALUES (2, 6, CAST(N'2020-11-05' AS Date), 1480, 1, 1, N'Nguyễn Văn A', N'0966070888', N'Đại học FPT')
GO
INSERT [dbo].[order] ([uNumber], [oId], [date], [code], [quantity], [status], [fullName], [phoneNumber], [address]) VALUES (3, 4, CAST(N'2020-11-05' AS Date), 1509, 1, 1, N'Nguyễn Thanh C', N'9996661234', N'Hà Nội')
GO
INSERT [dbo].[order] ([uNumber], [oId], [date], [code], [quantity], [status], [fullName], [phoneNumber], [address]) VALUES (3, 4, CAST(N'2020-11-05' AS Date), 887, 1, 1, N'Nguyễn Thanh C', N'9996661234', N'Hà Nội')
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (473, N'Mario', N'image/473', N'Mario_Super Mario_Good Smile Company_10cm', 1300000, 19, 2, CAST(N'2020-04-01' AS Date))
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (663, N'Rem', N'image/663', N'Rem_Re:ZERO -Starting Life in Another World_Good Smile Company_10cm', 1450000, 20, 1, CAST(N'2020-09-01' AS Date))
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (700, N'Reimu Hakurei 2.0', N'image/700', N'Reimu Hakurei_Touhou Project_Good Smile Company_10cm', 1350000, 20, 1, CAST(N'2020-06-01' AS Date))
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (751, N'Emilia', N'image/751', N'Emilia_Re:ZERO -Starting Life in Another World_Good Smile Company_10cm', 1450000, 20, 1, CAST(N'2020-09-01' AS Date))
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (887, N'Iroha Tamaki', N'image/887', N'Iroha Tamaki_Puella Magi Madoka Magica Side Story: Magia Record_Good Smile Company_10cm', 1500000, 0, 0, CAST(N'2021-06-01' AS Date))
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (1141, N'D.Va: Academy Skin Edition', N'image/1141', N'D.Va_Overwatch®_Good Smile Company_10cm', 1300000, 20, 1, CAST(N'2020-01-01' AS Date))
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (1148, N'The Trapper', N'image/1148', N'The Trapper_Dead by Daylight_Good Smile Company_10cm', 1500000, 19, 1, CAST(N'2020-01-01' AS Date))
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (1200, N'L 2.0', N'image/1200', N'L_DEATH NOTE_Good Smile Company_10cm', 1400000, 20, 1, CAST(N'2020-04-01' AS Date))
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (1218, N'Captain America: Endgame Edition Standard Ver', N'image/1218', N'Captain America_Avengers: Endgame_Good Smile Company_10cm', 1300000, 20, 1, CAST(N'2020-04-01' AS Date))
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (1252, N'Sakura Matou', N'image/1252', N'Sakura Matou_Fate/stay night: Heaven''s Feel_Good Smile Company_10cm', 1350000, 0, 0, CAST(N'2020-12-01' AS Date))
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (1271, N'Senko', N'image/1271', N'Senko_The Helpful Fox Senko-san_Good Smile Company_10cm', 1500000, 20, 1, CAST(N'2020-08-01' AS Date))
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (1288, N'Kaguya Shinomiya', N'image/1288', N'Kaguya Shinomiya_Kaguya-sama: Love is War_Good Smile Company_10cm', 1600000, 0, 0, CAST(N'2020-11-01' AS Date))
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (1295, N'Filo', N'image/1295', N'Filo_The Rising of the Shield Hero_Good Smile Company_10cm', 1400000, 18, 2, CAST(N'2020-10-01' AS Date))
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (1318, N'Sumireko Sanshokuin', N'image/1318', N'Sumireko Sanshokuin_ORESUKI Are you the only one who loves me?_Good Smile Company_10cm', 1550000, 0, 0, CAST(N'2020-10-01' AS Date))
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (1325, N'Ultraman Suit', N'image/1325', N'Ultraman Suit_Ultraman_Good Smile Company_10cm', 1650000, 0, 0, CAST(N'2020-12-01' AS Date))
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (1333, N'Himiko Toga', N'image/1333', N'Himiko Toga_My Hero Academia_Good Smile Company_10cm', 1400000, 0, 0, CAST(N'2020-11-01' AS Date))
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (1334, N'Zenitsu Agatsuma', N'image/1334', N'Zenitsu Agatsuma_Demon Slayer: Kimetsu no Yaiba_Good Smile Company_10cm', 1500000, 20, 1, CAST(N'2020-10-01' AS Date))
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (1339, N'Hatsune Miku: Magical Mirai 2019 Ver', N'image/1339', N'Hatsune Miku_Character Vocal Series 01: Hatsune Miku_Good Smile Company_10cm', 1550000, 0, 0, CAST(N'2020-11-01' AS Date))
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (1343, N'Asuna [Stacia, the Goddess of Creation]', N'image/1343', N'Asuna_Sword Art Online Alicization: War of Underworld_Good Smile Company_10cm', 1350000, 0, 0, CAST(N'2020-11-01' AS Date))
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (1353, N'Ristarte', N'image/1353', N'Ristarte_Cautious Hero: The Hero Is Overpowered But Overly Cautious_Good Smile Company_10cm', 1400000, 0, 0, CAST(N'2020-12-01' AS Date))
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (1375, N'W', N'image/1375', N'W_Arknights_Good Smile Company_10cm', 1350000, 0, 0, CAST(N'2020-12-01' AS Date))
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (1405, N'Iori Fuyusaka', N'image/1405', N'Iori Fuyusaka_13 Sentinels: Aegis Rim_Good Smile Company_10cm', 1400000, 0, 0, CAST(N'2020-12-01' AS Date))
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (1425, N'Doctor Strange: Endgame Ver', N'image/1425', N'Doctor Strange_Avengers: Endgame_Good Smile Company_10cm', 1350000, 0, 0, CAST(N'2020-12-01' AS Date))
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (1473, N'Chizuru Mizuhara', N'image/1473', N'Chizuru Mizuhara_Rent-A-Girlfriend (Kanojo, Okarishimasu)_Good Smile Company_10cm', 1500000, 0, 0, CAST(N'2021-04-01' AS Date))
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (1474, N'Moca Aoba: Stage Outfit Ver', N'image/1474', N'Moca Aoba_BanG Dream! Girls Band Party!_Good Smile Company_10cm', 1620000, 0, 0, CAST(N'2021-05-01' AS Date))
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (1475, N'NieR:Automata 2B (YoRHa No.2 Type B)', N'image/1475', N'YoRHa No.2 Type B_NieR:Automata_Good Smile Company_10cm_2/2021', 1880000, 0, 0, CAST(N'2021-02-01' AS Date))
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (1480, N'Karyl', N'image/1480', N'Karyl_Princess Connect! Re: Dive_Good Smile Company_10cm', 1550000, 0, 0, CAST(N'2021-05-01' AS Date))
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (1483, N'Rena Ryugu', N'image/1483', N'Rena Ryugu_Higurashi: When They Cry - GOU_Good Smile Company_10cm', 1500000, 0, 0, CAST(N'2021-05-01' AS Date))
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (1491, N'Saber/Okita Souji', N'image/1491', N'Saber/Okita Souji_Fate/Grand Order_Good Smile Company_10cm', 1450000, 0, 0, CAST(N'2021-06-01' AS Date))
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (1495, N'Ichika Nakano', N'image/1495', N'Ichika Nakano_The Quintessential Quintuplets_Good Smile Company_10cm', 1400000, 0, 0, CAST(N'2021-05-01' AS Date))
GO
INSERT [dbo].[product] ([code], [name], [image], [describe], [price], [amount], [status], [releaseDate]) VALUES (1509, N'Sakura Matou: Grail of Makiri Ver', N'image/1509', N'Sakura Matou_Fate/stay night: Heaven''s Feel_Good Smile Company_10cm', 1880000, 0, 0, CAST(N'2021-12-01' AS Date))
GO
ALTER TABLE [dbo].[account] ADD  DEFAULT ((0)) FOR [permission]
GO
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [df_Amount]  DEFAULT ((0)) FOR [amount]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD FOREIGN KEY([code])
REFERENCES [dbo].[product] ([code])
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD FOREIGN KEY([uNumber])
REFERENCES [dbo].[account] ([number])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([code])
REFERENCES [dbo].[product] ([code])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([uNumber])
REFERENCES [dbo].[account] ([number])
GO
/****** Object:  Trigger [dbo].[updateAmount2]    Script Date: 19-Nov-20 4:53:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[updateAmount2] on [dbo].[product]
after update
as update product set amount = 0, status=0 where amount<=0 
GO
ALTER TABLE [dbo].[product] ENABLE TRIGGER [updateAmount2]
GO
USE [master]
GO
ALTER DATABASE [DuyTh4i] SET  READ_WRITE 
GO
