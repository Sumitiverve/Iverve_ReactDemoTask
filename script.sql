USE [master]
GO
/****** Object:  Database [React_Demo]    Script Date: 3/20/2021 4:39:18 PM ******/
CREATE DATABASE [React_Demo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'React_Demo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SA\MSSQL\DATA\React_Demo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'React_Demo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SA\MSSQL\DATA\React_Demo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [React_Demo] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [React_Demo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [React_Demo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [React_Demo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [React_Demo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [React_Demo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [React_Demo] SET ARITHABORT OFF 
GO
ALTER DATABASE [React_Demo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [React_Demo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [React_Demo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [React_Demo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [React_Demo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [React_Demo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [React_Demo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [React_Demo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [React_Demo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [React_Demo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [React_Demo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [React_Demo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [React_Demo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [React_Demo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [React_Demo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [React_Demo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [React_Demo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [React_Demo] SET RECOVERY FULL 
GO
ALTER DATABASE [React_Demo] SET  MULTI_USER 
GO
ALTER DATABASE [React_Demo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [React_Demo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [React_Demo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [React_Demo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [React_Demo] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'React_Demo', N'ON'
GO
ALTER DATABASE [React_Demo] SET QUERY_STORE = OFF
GO
USE [React_Demo]
GO
/****** Object:  Table [dbo].[tbl_Card]    Script Date: 3/20/2021 4:39:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Card](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CardType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_Card] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CardAnnualCharge]    Script Date: 3/20/2021 4:39:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CardAnnualCharge](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CardType] [int] NOT NULL,
	[AnnualCharge] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_tbl_CardAnnualCharge] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CardLimit]    Script Date: 3/20/2021 4:39:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CardLimit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CardType] [int] NOT NULL,
	[CreditLimit] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_tbl_CardDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Card] ON 

INSERT [dbo].[tbl_Card] ([Id], [CardType]) VALUES (1, N'MoneyBack')
INSERT [dbo].[tbl_Card] ([Id], [CardType]) VALUES (2, N'Platinum')
INSERT [dbo].[tbl_Card] ([Id], [CardType]) VALUES (3, N'Titanium')
SET IDENTITY_INSERT [dbo].[tbl_Card] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_CardAnnualCharge] ON 

INSERT [dbo].[tbl_CardAnnualCharge] ([Id], [CardType], [AnnualCharge]) VALUES (1, 1, CAST(100.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_CardAnnualCharge] ([Id], [CardType], [AnnualCharge]) VALUES (2, 2, CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_CardAnnualCharge] ([Id], [CardType], [AnnualCharge]) VALUES (3, 3, CAST(300.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[tbl_CardAnnualCharge] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_CardLimit] ON 

INSERT [dbo].[tbl_CardLimit] ([Id], [CardType], [CreditLimit]) VALUES (1, 1, CAST(40000.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_CardLimit] ([Id], [CardType], [CreditLimit]) VALUES (2, 2, CAST(50000.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_CardLimit] ([Id], [CardType], [CreditLimit]) VALUES (3, 3, CAST(80000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[tbl_CardLimit] OFF
GO
ALTER TABLE [dbo].[tbl_CardAnnualCharge]  WITH CHECK ADD  CONSTRAINT [FK_tbl_CardAnnualCharge_tbl_Card] FOREIGN KEY([CardType])
REFERENCES [dbo].[tbl_Card] ([Id])
GO
ALTER TABLE [dbo].[tbl_CardAnnualCharge] CHECK CONSTRAINT [FK_tbl_CardAnnualCharge_tbl_Card]
GO
ALTER TABLE [dbo].[tbl_CardLimit]  WITH CHECK ADD  CONSTRAINT [FK_tbl_CardLimit_tbl_Card] FOREIGN KEY([CardType])
REFERENCES [dbo].[tbl_Card] ([Id])
GO
ALTER TABLE [dbo].[tbl_CardLimit] CHECK CONSTRAINT [FK_tbl_CardLimit_tbl_Card]
GO
USE [master]
GO
ALTER DATABASE [React_Demo] SET  READ_WRITE 
GO
