USE [master]
GO
/****** Object:  Database [erationcard]    Script Date: 1/18/2017 5:52:24 PM ******/
CREATE DATABASE [erationcard]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'erationcard', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\erationcard.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'erationcard_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\erationcard_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [erationcard] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [erationcard].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [erationcard] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [erationcard] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [erationcard] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [erationcard] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [erationcard] SET ARITHABORT OFF 
GO
ALTER DATABASE [erationcard] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [erationcard] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [erationcard] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [erationcard] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [erationcard] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [erationcard] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [erationcard] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [erationcard] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [erationcard] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [erationcard] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [erationcard] SET  ENABLE_BROKER 
GO
ALTER DATABASE [erationcard] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [erationcard] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [erationcard] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [erationcard] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [erationcard] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [erationcard] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [erationcard] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [erationcard] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [erationcard] SET  MULTI_USER 
GO
ALTER DATABASE [erationcard] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [erationcard] SET DB_CHAINING OFF 
GO
ALTER DATABASE [erationcard] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [erationcard] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [erationcard]
GO
/****** Object:  StoredProcedure [dbo].[sp_CheckAdminLogin]    Script Date: 1/18/2017 5:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_CheckAdminLogin]
@Username varchar(100),
@Password varchar(100)
as
begin
	select * from AdminLogin where Username=@Username and Password=@Password
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteFamilyDetailsById]    Script Date: 1/18/2017 5:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_DeleteFamilyDetailsById]
@id int
as
begin
	delete from FamilyDetails where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteFamilyHeadDetailsById]    Script Date: 1/18/2017 5:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_DeleteFamilyHeadDetailsById]
@id int
as
begin
	delete from FamilyHeadDetails where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteItemDetailsById]    Script Date: 1/18/2017 5:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_DeleteItemDetailsById]
@id int
as
begin
	delete from ItemDetails where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DisplayAllFamilyHeadDetails]    Script Date: 1/18/2017 5:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_DisplayAllFamilyHeadDetails]
as
begin
	select * from FamilyHeadDetails
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DisplayAllFamilyHeadDetailsById]    Script Date: 1/18/2017 5:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_DisplayAllFamilyHeadDetailsById]
@id int
as
begin
	select * from FamilyHeadDetails where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DisplayAllItemDetails]    Script Date: 1/18/2017 5:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_DisplayAllItemDetails]
as
begin
	select * from ItemDetails
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DisplayAllOrderDetails]    Script Date: 1/18/2017 5:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_DisplayAllOrderDetails]
as
begin
	select * from OrderDetails order by OrderDate desc
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DisplayAvailableItemDetails]    Script Date: 1/18/2017 5:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_DisplayAvailableItemDetails]
as
begin
	select * from ItemDetails where Availability='Available'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DisplayDistinctOrderId]    Script Date: 1/18/2017 5:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_DisplayDistinctOrderId]
as
begin
	select distinct(OrderId) as 'OrderID' from OrderDetails
end

GO
/****** Object:  StoredProcedure [dbo].[sp_DisplayDistinctOrderIdByRelationalRef]    Script Date: 1/18/2017 5:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_DisplayDistinctOrderIdByRelationalRef]
@RelationalNumber varchar(50)
as
begin
	select distinct(OrderId) as 'OrderID' from OrderDetails where RelationalNumber=@RelationalNumber
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DisplayFamilyDetailsByFamilyHeadId]    Script Date: 1/18/2017 5:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_DisplayFamilyDetailsByFamilyHeadId]
@FamilHeadId int
as
begin
	select * from FamilyDetails where FamilHeadId=@FamilHeadId
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DisplayFamilyDetailsById]    Script Date: 1/18/2017 5:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_DisplayFamilyDetailsById]
@id int
as
begin
	select * from FamilyDetails where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DisplayFamilyHeadDetailsByName]    Script Date: 1/18/2017 5:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_DisplayFamilyHeadDetailsByName]
@FName varchar(50)
as
begin
	select * from FamilyHeadDetails where FName like '%'+@FName+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DisplayFamilyHeadDetailsByRelationalNumber]    Script Date: 1/18/2017 5:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_DisplayFamilyHeadDetailsByRelationalNumber]
@RelationalNumber varchar(50)
as
begin
	select * from FamilyHeadDetails where RelationalNumber=@RelationalNumber
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DisplayItemDetailsById]    Script Date: 1/18/2017 5:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_DisplayItemDetailsById]
@id int
as
begin
	select * from ItemDetails where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DisplayItemDetailsByName]    Script Date: 1/18/2017 5:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_DisplayItemDetailsByName]
@Name varchar(50)
as
begin
	select * from ItemDetails where Name like '%'+@Name+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DisplayOrderDetailsByOrderId]    Script Date: 1/18/2017 5:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_DisplayOrderDetailsByOrderId]
@OrderId varchar(50)
as
begin
	select * from OrderDetails where OrderId=@OrderId order by OrderDate desc
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DisplayOrderDetailsByRelationalNumber]    Script Date: 1/18/2017 5:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_DisplayOrderDetailsByRelationalNumber]
@RelationalNumber varchar(50)
as
begin
	select * from OrderDetails where RelationalNumber=@RelationalNumber order by OrderDate desc
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertOrderDetails]    Script Date: 1/18/2017 5:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_InsertOrderDetails]
@OrderId varchar(50),
@RelationalNumber varchar(50),
@ItemId int,
@Quantity int,
@Amount varchar(50),
@RecievedBy varchar(20)
as
begin
	insert into OrderDetails values(@OrderId,@RelationalNumber,@ItemId,@Quantity,@Amount,@RecievedBy,getdate())
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertUpdateFamilyDetails]    Script Date: 1/18/2017 5:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_InsertUpdateFamilyDetails]
@id int,
@FamilHeadId int,
@FName varchar(100),
@MName varchar(100),
@LName varchar(100),
@Image varchar(100),
@DOB Datetime,
@Gender varchar(10),
@ContactNo varchar(100),
@Email varchar(100),
@Relation varchar(50),
@Address varchar(500),
@State varchar(50),
@District varchar(50),
@Taluka varchar(50),
@Designation varchar(100),
@AnnualIncome varchar(100)
as
begin
	if(@id<0)
	begin
		insert into FamilyDetails values(@FamilHeadId,@FName,@MName,@LName,@Image,@DOB,@Gender,@ContactNo,@Email,@Relation,@Address,@State,@District,@Taluka,@Designation,
		@AnnualIncome)
	end
	else
	begin
		update FamilyDetails set FName=@FName,MName=@MName,LName=@LName,Image=@Image,DOB=@DOB,Gender=@Gender,ContactNo=@ContactNo,Email=@Email,Relation=@Relation,Address=@Address,State=@State,
		District=@District,Taluka=@Taluka,Designation=@Designation,AnnualIncome=@AnnualIncome where id=@id
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertUpdateFamilyHeadDetails]    Script Date: 1/18/2017 5:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_InsertUpdateFamilyHeadDetails]
@id int,
@FName varchar(100),
@MName varchar(100),
@LName varchar(100),
@Image varchar(100),
@DOB Datetime,
@Gender varchar(10),
@ContactNo varchar(100),
@Email varchar(100),
@Password varchar(50),
@Address varchar(500),
@State varchar(50),
@District varchar(50),
@Taluka varchar(50),
@Designation varchar(100),
@AnnualIncome varchar(100),
@RelationalNumber varchar(50)
as
begin
	if(@id<0)
	begin
		insert into FamilyHeadDetails values(@FName,@MName,@LName,@Image,@DOB,@Gender,@ContactNo,@Email,@Password,@Address,@State,@District,@Taluka,@Designation,
		@AnnualIncome,@RelationalNumber)
	end
	else
	begin
		update FamilyHeadDetails set FName=@FName,MName=@MName,LName=@LName,Image=@Image,DOB=@DOB,Gender=@Gender,ContactNo=@ContactNo,Email=@Email,Address=@Address,State=@State,
		District=@District,Taluka=@Taluka,Designation=@Designation,AnnualIncome=@AnnualIncome where id=@id
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertUpdateItemDetails]    Script Date: 1/18/2017 5:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_InsertUpdateItemDetails]
@id int,
@Name varchar(20),
@Amount varchar(10),
@Availability varchar(100)
as
begin
	if(@id<0)
	begin
		insert into ItemDetails values(@Name,@Amount,@Availability)
	end
	else
	begin
		update ItemDetails set Name=@Name,Amount=@Amount,Availability=@Availability where id=@id
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateFamilyHeadDetailsPassword]    Script Date: 1/18/2017 5:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_UpdateFamilyHeadDetailsPassword]
@RelationalNumber varchar(50),
@Password varchar(50)
as
begin
	update FamilyHeadDetails set Password=@Password where RelationalNumber=@RelationalNumber
end
GO
/****** Object:  Table [dbo].[AdminLogin]    Script Date: 1/18/2017 5:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdminLogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](100) NULL,
	[Password] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FamilyDetails]    Script Date: 1/18/2017 5:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FamilyDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FamilHeadId] [int] NULL,
	[FName] [varchar](100) NULL,
	[MName] [varchar](100) NULL,
	[LName] [varchar](100) NULL,
	[Image] [varchar](100) NULL,
	[DOB] [datetime] NULL,
	[Gender] [varchar](10) NULL,
	[ContactNo] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Relation] [varchar](50) NULL,
	[Address] [varchar](500) NULL,
	[State] [varchar](50) NULL,
	[District] [varchar](50) NULL,
	[Taluka] [varchar](50) NULL,
	[Designation] [varchar](100) NULL,
	[AnnualIncome] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FamilyHeadDetails]    Script Date: 1/18/2017 5:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FamilyHeadDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FName] [varchar](100) NULL,
	[MName] [varchar](100) NULL,
	[LName] [varchar](100) NULL,
	[Image] [varchar](100) NULL,
	[DOB] [datetime] NULL,
	[Gender] [varchar](10) NULL,
	[ContactNo] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Password] [varchar](50) NULL,
	[Address] [varchar](500) NULL,
	[State] [varchar](50) NULL,
	[District] [varchar](50) NULL,
	[Taluka] [varchar](50) NULL,
	[Designation] [varchar](100) NULL,
	[AnnualIncome] [varchar](100) NULL,
	[RelationalNumber] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemDetails]    Script Date: 1/18/2017 5:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NULL,
	[Amount] [varchar](10) NULL,
	[Availability] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 1/18/2017 5:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [varchar](50) NULL,
	[RelationalNumber] [varchar](50) NULL,
	[ItemId] [int] NULL,
	[Quantity] [int] NULL,
	[Amount] [varchar](50) NULL,
	[RecievedBy] [varchar](20) NULL,
	[OrderDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [erationcard] SET  READ_WRITE 
GO
