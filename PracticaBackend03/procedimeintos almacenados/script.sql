USE [master]
GO
/****** Object:  Database [a]    Script Date: 09-06-2023 23:35:48 ******/
CREATE DATABASE [a]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'a', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\a.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'a_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\a_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [a] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [a].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [a] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [a] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [a] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [a] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [a] SET ARITHABORT OFF 
GO
ALTER DATABASE [a] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [a] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [a] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [a] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [a] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [a] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [a] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [a] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [a] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [a] SET  DISABLE_BROKER 
GO
ALTER DATABASE [a] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [a] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [a] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [a] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [a] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [a] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [a] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [a] SET RECOVERY FULL 
GO
ALTER DATABASE [a] SET  MULTI_USER 
GO
ALTER DATABASE [a] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [a] SET DB_CHAINING OFF 
GO
ALTER DATABASE [a] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [a] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [a] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [a] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'a', N'ON'
GO
ALTER DATABASE [a] SET QUERY_STORE = ON
GO
ALTER DATABASE [a] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [a]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 09-06-2023 23:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](50) NOT NULL,
	[code] [varchar](50) NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserve]    Script Date: 09-06-2023 23:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserve](
	[id_user] [int] NOT NULL,
	[id_book] [int] NOT NULL,
	[reserved] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 09-06-2023 23:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[faculty] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([id], [name], [description], [code]) VALUES (5, N'Yvette Corwin V', N'Ea non nesciunt distinctio aspernatur eum id id.', N'cgLFZuT6Y8q7cf0byW')
INSERT [dbo].[Books] ([id], [name], [description], [code]) VALUES (6, N'Felipa Lindgren DVM', N'Iure quibusdam aut quo qui pariatur eum libero.', N'6xvGgDMVCYy28epj83P9BUOd')
INSERT [dbo].[Books] ([id], [name], [description], [code]) VALUES (7, N'Ollie Rowe', N'At velit et hic modi sunt iure consequatur.', N'f0VJg6Py60FS2Er318')
INSERT [dbo].[Books] ([id], [name], [description], [code]) VALUES (8, N'Historia de alejandro sanz', N'su vida, sus exitos', N'67f4g3hew88hu')
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
INSERT [dbo].[Reserve] ([id_user], [id_book], [reserved]) VALUES (1, 5, CAST(N'2023-06-09T19:37:54.000' AS DateTime))
INSERT [dbo].[Reserve] ([id_user], [id_book], [reserved]) VALUES (1, 6, CAST(N'2023-06-05T19:37:54.000' AS DateTime))
INSERT [dbo].[Reserve] ([id_user], [id_book], [reserved]) VALUES (3, 7, CAST(N'2023-06-08T19:37:54.000' AS DateTime))
INSERT [dbo].[Reserve] ([id_user], [id_book], [reserved]) VALUES (4, 8, CAST(N'2023-05-28T19:37:54.000' AS DateTime))
INSERT [dbo].[Reserve] ([id_user], [id_book], [reserved]) VALUES (1, 7, CAST(N'2023-04-09T19:37:54.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [name], [faculty]) VALUES (1, N'Prof. Aleen Konopelsk', N'Voluptatibus quia voluptatem quia nisi.')
INSERT [dbo].[Users] ([id], [name], [faculty]) VALUES (2, N'Antoinette Mayer', N'Animi laboriosam voluptatum assumenda odit.')
INSERT [dbo].[Users] ([id], [name], [faculty]) VALUES (3, N'Yvonne Terry', N'Et sed quos enim ut quis hic.')
INSERT [dbo].[Users] ([id], [name], [faculty]) VALUES (4, N'Alberto Espinoza', N'Músico')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Reserve]  WITH CHECK ADD  CONSTRAINT [FK_Reserve_Books] FOREIGN KEY([id_book])
REFERENCES [dbo].[Books] ([id])
GO
ALTER TABLE [dbo].[Reserve] CHECK CONSTRAINT [FK_Reserve_Books]
GO
ALTER TABLE [dbo].[Reserve]  WITH CHECK ADD  CONSTRAINT [FK_Reserve_Users] FOREIGN KEY([id_user])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Reserve] CHECK CONSTRAINT [FK_Reserve_Users]
GO
/****** Object:  StoredProcedure [dbo].[ContarLibros]    Script Date: 09-06-2023 23:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ContarLibros]
@id int
as
select COUNT(*) from Books inner join Reserve on id_book = id
where id_user = @id
GO
/****** Object:  StoredProcedure [dbo].[MostrarfechaMasReciente]    Script Date: 09-06-2023 23:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MostrarfechaMasReciente]
@id int
as
select max(reserved) from Reserve
where id_user = @id
GO
/****** Object:  StoredProcedure [dbo].[MostrarLibros]    Script Date: 09-06-2023 23:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MostrarLibros]
as
select id, name, description
from Books
GO
/****** Object:  StoredProcedure [dbo].[MostrarLibrosPorUsuario]    Script Date: 09-06-2023 23:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MostrarLibrosPorUsuario]
@id int
as
select b.* from Books as b inner join Reserve as p on id = p.id_book
where p.id_user = @id and p.reserved >= CONVERT(date, DATEADD(MONTH, -1, GETDATE())) 
GO
/****** Object:  StoredProcedure [dbo].[MostrarUsuarios]    Script Date: 09-06-2023 23:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MostrarUsuarios]
as
select e.id, e.name, e.faculty
from Users as e
GO
/****** Object:  StoredProcedure [dbo].[MostrarUsuariosPorLibro]    Script Date: 09-06-2023 23:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MostrarUsuariosPorLibro]
@id int
as
select u.*
from Users as u inner join Reserve on u.id = id_user
where id_book = @id;
GO
USE [master]
GO
ALTER DATABASE [a] SET  READ_WRITE 
GO
