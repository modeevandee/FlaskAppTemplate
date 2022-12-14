/****** Object:  Database CyberArk    Script Date: 30-Apr-07 2:12:38 PM ******/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'mydatabaseCONFS')
	DROP DATABASE [mydatabase]
GO

CREATE DATABASE [mydatabase]
 COLLATE SQL_Latin1_General_CP1_CI_AS

GO
ALTER DATABASE mydatabase SET ONLINE
GO

ALTER DATABASE mydatabase SET AUTO_CLOSE OFF
GO

ALTER DATABASE mydatabase SET RECOVERY FULL
GO

ALTER DATABASE mydatabase SET PAGE_VERIFY CHECKSUM
GO

ALTER DATABASE mydatabase SET READ_WRITE
GO

ALTER DATABASE mydatabase SET MULTI_USER
GO

ALTER DATABASE mydatabase SET AUTO_SHRINK OFF
GO

ALTER DATABASE mydatabase SET ANSI_NULL_DEFAULT OFF
GO

ALTER DATABASE mydatabase SET RECURSIVE_TRIGGERS OFF
GO

ALTER DATABASE mydatabase SET ANSI_NULLS ON
GO

ALTER DATABASE mydatabase SET CONCAT_NULL_YIELDS_NULL ON
GO

ALTER DATABASE mydatabase SET CURSOR_CLOSE_ON_COMMIT OFF
GO

ALTER DATABASE mydatabase SET CURSOR_DEFAULT GLOBAL
GO

ALTER DATABASE mydatabase SET QUOTED_IDENTIFIER OFF
GO

ALTER DATABASE mydatabase SET ANSI_WARNINGS OFF
GO

ALTER DATABASE mydatabase SET AUTO_CREATE_STATISTICS ON
GO

ALTER DATABASE mydatabase SET AUTO_UPDATE_STATISTICS ON
GO

use [mydatabase]
GO

/****** Object:  Table [dbo].[notifyconf]    Script Date: 30-Apr-07 2:12:38 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[notifyconf]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[notifyconf]
GO

/****** Object:  Table [dbo].[notifyconf]    Script Date: 30-Apr-07 2:12:39 PM ******/
CREATE TABLE [dbo].[notifyconf] (
	[mailserver] [nvarchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[port] [int] NULL ,
	[secure] [int] NULL ,
	[sender] [nvarchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ekey] [nvarchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO

 CREATE  INDEX [notifyconfIND] ON [dbo].[notifyconf]([mailserver], [port], [secure], [sender], [ekey]) ON [PRIMARY]
GO

INSERT INTO notifyconf VALUES('smtp.gmail.com', 25, 1, 'monkey.d.mundo@gmail.com', 'Cyberark1')