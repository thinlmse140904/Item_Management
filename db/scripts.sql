USE [master]
GO
/****** Object:  Database [ItemManagement]    Script Date: 10/13/2020 9:14:01 AM ******/
CREATE DATABASE [ItemManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ItemManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ItemManagement.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ItemManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ItemManagement_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ItemManagement] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ItemManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ItemManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ItemManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ItemManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ItemManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ItemManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [ItemManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ItemManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ItemManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ItemManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ItemManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ItemManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ItemManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ItemManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ItemManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ItemManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ItemManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ItemManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ItemManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ItemManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ItemManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ItemManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ItemManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ItemManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [ItemManagement] SET  MULTI_USER 
GO
ALTER DATABASE [ItemManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ItemManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ItemManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ItemManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ItemManagement] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ItemManagement', N'ON'
GO
USE [ItemManagement]
GO
/****** Object:  Table [dbo].[tblItems]    Script Date: 10/13/2020 9:14:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblItems](
	[itemCode] [varchar](10) NOT NULL,
	[itemName] [nvarchar](50) NULL,
	[supCode] [varchar](10) NULL,
	[unit] [varchar](50) NULL,
	[price] [float] NULL,
	[supplying] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[itemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSuppliers]    Script Date: 10/13/2020 9:14:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSuppliers](
	[supCode] [varchar](10) NOT NULL,
	[supName] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[collaborating] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[supCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 10/13/2020 9:14:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [varchar](10) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[password] [varchar](50) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblItems] ([itemCode], [itemName], [supCode], [unit], [price], [supplying]) VALUES (N'I01', N'Phone', N'APPLE', N'VND', 120000, 1)
INSERT [dbo].[tblItems] ([itemCode], [itemName], [supCode], [unit], [price], [supplying]) VALUES (N'i02', N'Phone', N'OPPO', N'USD', 50, 0)
INSERT [dbo].[tblItems] ([itemCode], [itemName], [supCode], [unit], [price], [supplying]) VALUES (N'I03', N'abc', N'APPLE', N'abc', 12312, 0)
INSERT [dbo].[tblItems] ([itemCode], [itemName], [supCode], [unit], [price], [supplying]) VALUES (N'I04', N'Phone', N'Vertu', N'VND', 100000, 0)
INSERT [dbo].[tblSuppliers] ([supCode], [supName], [address], [collaborating]) VALUES (N'APPLE', N'IPHONE 7SSSSS', N'America', 1)
INSERT [dbo].[tblSuppliers] ([supCode], [supName], [address], [collaborating]) VALUES (N'Nokia', N'abc', N'abc', 0)
INSERT [dbo].[tblSuppliers] ([supCode], [supName], [address], [collaborating]) VALUES (N'OPPO', N'OPPO A50', N'HCM', 0)
INSERT [dbo].[tblSuppliers] ([supCode], [supName], [address], [collaborating]) VALUES (N'SamSung', N'Samsung S20', N'Korea', 1)
INSERT [dbo].[tblSuppliers] ([supCode], [supName], [address], [collaborating]) VALUES (N'Vertu', N'Vertu S10mnk', N'Taiwan', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [status]) VALUES (N'dai', N'Tran Van Dai', N'654321', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [status]) VALUES (N'nam', N'Nguyen Hoai Nam', N'123456', 0)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [status]) VALUES (N'nghia', N'Nguyen Huu Nghia', N'123456', 0)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [status]) VALUES (N'phong', N'Tran Hoai Phong', N'phong123', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [status]) VALUES (N'thin', N'Lam Minh Thin', N'123456', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [status]) VALUES (N'trang', N'Nguyen Thi Thuy Trang', N'123456', 0)
ALTER TABLE [dbo].[tblItems]  WITH CHECK ADD FOREIGN KEY([supCode])
REFERENCES [dbo].[tblSuppliers] ([supCode])
GO
USE [master]
GO
ALTER DATABASE [ItemManagement] SET  READ_WRITE 
GO
