USE [master]
GO
/****** Object:  Database [Thuvien2023]    Script Date: 11/28/2023 11:54:39 PM ******/
CREATE DATABASE [Thuvien2023]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Thuvien2023', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Thuvien2023.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Thuvien2023_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Thuvien2023_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Thuvien2023] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Thuvien2023].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Thuvien2023] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Thuvien2023] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Thuvien2023] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Thuvien2023] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Thuvien2023] SET ARITHABORT OFF 
GO
ALTER DATABASE [Thuvien2023] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Thuvien2023] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Thuvien2023] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Thuvien2023] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Thuvien2023] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Thuvien2023] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Thuvien2023] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Thuvien2023] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Thuvien2023] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Thuvien2023] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Thuvien2023] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Thuvien2023] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Thuvien2023] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Thuvien2023] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Thuvien2023] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Thuvien2023] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Thuvien2023] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Thuvien2023] SET RECOVERY FULL 
GO
ALTER DATABASE [Thuvien2023] SET  MULTI_USER 
GO
ALTER DATABASE [Thuvien2023] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Thuvien2023] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Thuvien2023] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Thuvien2023] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Thuvien2023] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Thuvien2023] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Thuvien2023', N'ON'
GO
ALTER DATABASE [Thuvien2023] SET QUERY_STORE = OFF
GO
USE [Thuvien2023]
GO
/****** Object:  Table [dbo].[bookRating]    Script Date: 11/28/2023 11:54:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bookRating](
	[rateId] [int] IDENTITY(1,1) NOT NULL,
	[bookId] [int] NOT NULL,
	[userId] [int] NULL,
	[rating] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[rateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 11/28/2023 11:54:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[bookId] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](255) NULL,
	[author] [varchar](255) NULL,
	[publication_year] [varchar](255) NULL,
	[cid] [int] NULL,
	[describe] [varchar](255) NULL,
	[img] [varchar](255) NULL,
	[number] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[bookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Borrow]    Script Date: 11/28/2023 11:54:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrow](
	[borrowId] [int] IDENTITY(1,1) NOT NULL,
	[cardId] [int] NULL,
	[note] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[borrowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BorrowDetails]    Script Date: 11/28/2023 11:54:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BorrowDetails](
	[borrowId] [int] NOT NULL,
	[status] [varchar](255) NULL,
	[bFrom] [date] NULL,
	[bTo] [date] NULL,
	[NgayTra] [date] NULL,
	[number] [int] NULL,
	[bookId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[bookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/28/2023 11:54:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[cname] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactForm]    Script Date: 11/28/2023 11:54:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactForm](
	[formId] [int] IDENTITY(1,1) NOT NULL,
	[cName] [varchar](255) NULL,
	[cEmail] [varchar](255) NULL,
	[mes] [ntext] NULL,
	[Date] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[formId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LibCard]    Script Date: 11/28/2023 11:54:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibCard](
	[cardId] [int] IDENTITY(1,1) NOT NULL,
	[id] [int] NULL,
	[status] [bit] NULL,
	[maxBookBor] [int] NULL,
	[numOfBorrowing] [int] NULL,
	[NgayCap] [date] NULL,
	[NgayHetHan] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[cardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 11/28/2023 11:54:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[roleId] [int] NOT NULL,
	[roleName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/28/2023 11:54:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[phno] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[sId] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[isAdmin] [int] NULL,
	[Avt src] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('avt.jpg') FOR [Avt src]
GO
ALTER TABLE [dbo].[bookRating]  WITH CHECK ADD FOREIGN KEY([bookId])
REFERENCES [dbo].[Books] ([bookId])
GO
ALTER TABLE [dbo].[bookRating]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[Borrow]  WITH CHECK ADD FOREIGN KEY([cardId])
REFERENCES [dbo].[LibCard] ([cardId])
GO
ALTER TABLE [dbo].[BorrowDetails]  WITH CHECK ADD FOREIGN KEY([bookId])
REFERENCES [dbo].[Books] ([bookId])
GO
ALTER TABLE [dbo].[BorrowDetails]  WITH CHECK ADD FOREIGN KEY([borrowId])
REFERENCES [dbo].[Borrow] ([borrowId])
GO
ALTER TABLE [dbo].[LibCard]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([isAdmin])
REFERENCES [dbo].[role] ([roleId])
GO
USE [master]
GO
ALTER DATABASE [Thuvien2023] SET  READ_WRITE 
GO
