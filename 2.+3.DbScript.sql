USE [master]
GO
/****** Object:  Database [PrivateSchool]    Script Date: 27/4/2021 11:52:05 πμ ******/
CREATE DATABASE [PrivateSchool]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PrivateSchool', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PrivateSchool.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PrivateSchool_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PrivateSchool_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PrivateSchool] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PrivateSchool].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PrivateSchool] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PrivateSchool] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PrivateSchool] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PrivateSchool] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PrivateSchool] SET ARITHABORT OFF 
GO
ALTER DATABASE [PrivateSchool] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PrivateSchool] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PrivateSchool] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PrivateSchool] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PrivateSchool] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PrivateSchool] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PrivateSchool] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PrivateSchool] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PrivateSchool] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PrivateSchool] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PrivateSchool] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PrivateSchool] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PrivateSchool] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PrivateSchool] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PrivateSchool] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PrivateSchool] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PrivateSchool] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PrivateSchool] SET RECOVERY FULL 
GO
ALTER DATABASE [PrivateSchool] SET  MULTI_USER 
GO
ALTER DATABASE [PrivateSchool] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PrivateSchool] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PrivateSchool] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PrivateSchool] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PrivateSchool] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PrivateSchool] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PrivateSchool', N'ON'
GO
ALTER DATABASE [PrivateSchool] SET QUERY_STORE = OFF
GO
USE [PrivateSchool]
GO
/****** Object:  Table [dbo].[AssignmentPerStudent]    Script Date: 27/4/2021 11:52:07 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignmentPerStudent](
	[StudentID] [int] NOT NULL,
	[AssignmentID] [int] NOT NULL,
 CONSTRAINT [PK_AssignmentPerStudent] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[AssignmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assignments]    Script Date: 27/4/2021 11:52:07 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[SubDateTime] [date] NOT NULL,
	[OralMark] [float] NOT NULL,
	[TotalMark] [float] NOT NULL,
 CONSTRAINT [PK_Assignments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 27/4/2021 11:52:07 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Stream] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentPerCourse]    Script Date: 27/4/2021 11:52:07 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentPerCourse](
	[CourseID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
 CONSTRAINT [PK_StudentPerCourse] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC,
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 27/4/2021 11:52:07 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[TuitionFees] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainerPerCourse]    Script Date: 27/4/2021 11:52:07 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainerPerCourse](
	[CourseID] [int] NOT NULL,
	[TrainerID] [int] NOT NULL,
 CONSTRAINT [PK_TrainerPerCourse] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC,
	[TrainerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trainers]    Script Date: 27/4/2021 11:52:07 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Subject] [nvarchar](50) NULL,
 CONSTRAINT [PK_Trainers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex-20210418-165817]    Script Date: 27/4/2021 11:52:07 πμ ******/
CREATE UNIQUE NONCLUSTERED INDEX [NonClusteredIndex-20210418-165817] ON [dbo].[Assignments]
(
	[CourseID] ASC,
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssignmentPerStudent]  WITH CHECK ADD  CONSTRAINT [FK_AssignmentPerStudent_Assignments] FOREIGN KEY([AssignmentID])
REFERENCES [dbo].[Assignments] ([ID])
GO
ALTER TABLE [dbo].[AssignmentPerStudent] CHECK CONSTRAINT [FK_AssignmentPerStudent_Assignments]
GO
ALTER TABLE [dbo].[AssignmentPerStudent]  WITH CHECK ADD  CONSTRAINT [FK_AssignmentPerStudent_Students] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([ID])
GO
ALTER TABLE [dbo].[AssignmentPerStudent] CHECK CONSTRAINT [FK_AssignmentPerStudent_Students]
GO
ALTER TABLE [dbo].[Assignments]  WITH CHECK ADD  CONSTRAINT [FK_Assignments_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([ID])
GO
ALTER TABLE [dbo].[Assignments] CHECK CONSTRAINT [FK_Assignments_Courses]
GO
ALTER TABLE [dbo].[StudentPerCourse]  WITH CHECK ADD  CONSTRAINT [FK_StudentPerCourse_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([ID])
GO
ALTER TABLE [dbo].[StudentPerCourse] CHECK CONSTRAINT [FK_StudentPerCourse_Courses]
GO
ALTER TABLE [dbo].[StudentPerCourse]  WITH CHECK ADD  CONSTRAINT [FK_StudentPerCourse_Students] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([ID])
GO
ALTER TABLE [dbo].[StudentPerCourse] CHECK CONSTRAINT [FK_StudentPerCourse_Students]
GO
ALTER TABLE [dbo].[TrainerPerCourse]  WITH CHECK ADD  CONSTRAINT [FK_TrainerPerCourse_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([ID])
GO
ALTER TABLE [dbo].[TrainerPerCourse] CHECK CONSTRAINT [FK_TrainerPerCourse_Courses]
GO
ALTER TABLE [dbo].[TrainerPerCourse]  WITH CHECK ADD  CONSTRAINT [FK_TrainerPerCourse_Trainers] FOREIGN KEY([TrainerID])
REFERENCES [dbo].[Trainers] ([ID])
GO
ALTER TABLE [dbo].[TrainerPerCourse] CHECK CONSTRAINT [FK_TrainerPerCourse_Trainers]
GO
USE [master]
GO
ALTER DATABASE [PrivateSchool] SET  READ_WRITE 
GO
