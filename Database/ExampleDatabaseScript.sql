USE [master]
GO
/****** Object:  Database [POP]    Script Date: 2017/9/19 下午 02:27:09 ******/
CREATE DATABASE [POP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FuturePOP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\POP201706.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FuturePOP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\POP201706_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [POP] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [POP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [POP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [POP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [POP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [POP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [POP] SET ARITHABORT OFF 
GO
ALTER DATABASE [POP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [POP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [POP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [POP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [POP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [POP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [POP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [POP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [POP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [POP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [POP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [POP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [POP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [POP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [POP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [POP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [POP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [POP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [POP] SET  MULTI_USER 
GO
ALTER DATABASE [POP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [POP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [POP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [POP] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [POP] SET DELAYED_DURABILITY = DISABLED 
GO
USE [POP]
GO
/****** Object:  User [IIS APPPOOL\Culture1]    Script Date: 2017/9/19 下午 02:27:09 ******/
CREATE USER [IIS APPPOOL\Culture1] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\Culture1]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ApComplex]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApComplex](
	[ac_Id] [int] IDENTITY(1,1) NOT NULL,
	[ac_zipcode] [nvarchar](20) NOT NULL,
	[ac_name] [nvarchar](20) NOT NULL,
	[ac_location1] [nvarchar](10) NOT NULL,
	[ac_location2] [nvarchar](10) NOT NULL,
	[ac_location3] [nvarchar](50) NOT NULL,
	[ac_belong] [int] NOT NULL,
	[ac_family] [int] NULL,
	[ac_building] [int] NULL,
	[ig_id] [int] NOT NULL,
 CONSTRAINT [PK_Comms] PRIMARY KEY CLUSTERED 
(
	[ac_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BeaconDevice]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BeaconDevice](
	[d_id] [nvarchar](50) NOT NULL,
	[d_name] [varchar](20) NOT NULL,
	[d_out_day] [datetime] NOT NULL,
	[d_location1] [varchar](10) NOT NULL,
	[d_location2] [varchar](10) NOT NULL,
	[d_location3] [varchar](10) NOT NULL,
	[d_location4] [varchar](10) NOT NULL,
	[d_holder] [varchar](20) NOT NULL,
	[d_memo] [varchar](max) NULL,
	[belongto] [nvarchar](128) NOT NULL,
	[d_owner] [bit] NULL,
	[bdf_id] [int] NULL,
	[bpt_id] [int] NULL DEFAULT ((0)),
 CONSTRAINT [PK_BeaconDevices] PRIMARY KEY CLUSTERED 
(
	[d_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BeaconDeviceFlow]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BeaconDeviceFlow](
	[bdf_id] [int] IDENTITY(1,1) NOT NULL,
	[bdf_name] [nvarchar](20) NOT NULL,
	[bdf_content] [nvarchar](50) NOT NULL,
	[bdf_price] [int] NULL,
 CONSTRAINT [PK_BeaconDeviceFlow] PRIMARY KEY CLUSTERED 
(
	[bdf_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BroadcastPointType]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BroadcastPointType](
	[bpt_id] [int] IDENTITY(1,1) NOT NULL,
	[bpt_broadcastPoint] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[bpt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Club]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Club](
	[cl_id] [int] NOT NULL,
	[cl_name] [nvarchar](20) NOT NULL,
	[cl_belong] [nvarchar](128) NOT NULL,
	[cl_location1] [varchar](10) NOT NULL,
	[cl_location2] [varchar](10) NOT NULL,
	[cl_location3] [varchar](10) NOT NULL,
	[cl_location4] [varchar](10) NOT NULL,
	[ig_id] [int] NOT NULL,
 CONSTRAINT [PK_Club] PRIMARY KEY CLUSTERED 
(
	[cl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Community]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Community](
	[co_id] [int] NOT NULL,
	[co_name] [nvarchar](20) NOT NULL,
	[co_belong] [nvarchar](128) NOT NULL,
	[co_location1] [varchar](10) NOT NULL,
	[co_location2] [varchar](10) NOT NULL,
	[co_location3] [varchar](10) NOT NULL,
	[co_location4] [varchar](10) NOT NULL,
	[ig_id] [int] NOT NULL,
 CONSTRAINT [PK_Community] PRIMARY KEY CLUSTERED 
(
	[co_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DeviceInfo]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceInfo](
	[d_id] [nvarchar](50) NOT NULL,
	[i_id] [int] NOT NULL,
 CONSTRAINT [PK_DeviceInfoes] PRIMARY KEY CLUSTERED 
(
	[d_id] ASC,
	[i_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DeviceUsers]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceUsers](
	[d_id] [nvarchar](50) NOT NULL,
	[u_id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_DeviceUser] PRIMARY KEY CLUSTERED 
(
	[d_id] ASC,
	[u_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InfoGroupp]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InfoGroupp](
	[ig_id] [int] NOT NULL,
	[ig_name] [varchar](20) NOT NULL,
	[ig_pic] [nvarchar](50) NULL,
	[ig_price] [int] NOT NULL,
	[DisplayOrder] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_InfoGroups] PRIMARY KEY CLUSTERED 
(
	[ig_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Infos]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Infos](
	[i_id] [int] IDENTITY(1,1) NOT NULL,
	[i_name] [varchar](50) NOT NULL,
	[i_content] [varchar](600) NOT NULL,
	[i_initial_day] [datetime] NOT NULL,
	[i_expired_day] [datetime] NOT NULL,
	[i_location1] [nvarchar](50) NULL,
	[i_location2] [nvarchar](50) NULL,
	[i_pic1] [varchar](255) NULL,
	[i_pic2] [varchar](255) NULL,
	[i_pic3] [varchar](255) NULL,
	[i_pic4] [varchar](255) NULL,
	[i_pic5] [varchar](255) NULL,
	[i_URL] [varchar](50) NULL,
	[ig_id] [int] NOT NULL,
	[u_id] [nvarchar](128) NOT NULL,
	[i_unconfirm] [bit] NOT NULL CONSTRAINT [DF_Info_i_unconfirm]  DEFAULT ((0)),
	[ip_discount] [int] NOT NULL,
	[ip_days] [int] NOT NULL,
	[bill] [int] NOT NULL,
	[i_LINE] [varchar](255) NULL,
	[i_open] [bit] NOT NULL CONSTRAINT [DF__Infos__i_open__1F2E9E6D]  DEFAULT ((0)),
	[or_number] [nvarchar](50) NULL,
	[i_create_datetime] [datetime] NULL,
	[i_probation] [nvarchar](256) NULL,
	[i_formal_period] [nvarchar](256) NULL,
 CONSTRAINT [PK_Info] PRIMARY KEY CLUSTERED 
(
	[i_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvoiceType]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceType](
	[inv_id] [int] IDENTITY(1,1) NOT NULL,
	[inv_type] [nvarchar](50) NULL,
	[inv_description] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[inv_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderRecord]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderRecord](
	[or_id] [int] IDENTITY(1,1) NOT NULL,
	[or_number] [nvarchar](50) NOT NULL,
	[or_create_datetime] [datetime] NOT NULL,
	[or_invoice_title] [nvarchar](50) NULL,
	[or_invoice_address] [nvarchar](512) NULL,
	[or_invoice_code] [nvarchar](50) NULL,
	[inv_type] [nvarchar](50) NULL,
	[or_invoice_public] [bit] NOT NULL,
	[u_id] [nvarchar](128) NULL,
	[bill] [int] NOT NULL,
	[or_payment_status] [bit] NOT NULL,
	[or_payment_confirmed] [bit] NOT NULL,
	[or_remitMoney_name] [nvarchar](50) NULL,
	[or_remitMoney_time] [datetime] NULL,
	[or_remitMoney] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[or_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[P_InfoPrice]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[P_InfoPrice](
	[ip_id] [int] NOT NULL,
	[ip_name] [nvarchar](20) NOT NULL,
	[ip_discount] [int] NOT NULL,
	[ip_days] [int] NOT NULL,
 CONSTRAINT [PK_P_InfoPrice] PRIMARY KEY CLUSTERED 
(
	[ip_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sales]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sales](
	[s_id] [int] NOT NULL,
	[s_day] [datetime] NOT NULL,
	[i_day] [datetime] NOT NULL,
	[i_expired_day] [datetime] NOT NULL,
	[bill] [int] NOT NULL,
	[ip_discount] [int] NOT NULL,
	[i_name] [nvarchar](50) NOT NULL,
	[i_content] [nvarchar](500) NOT NULL,
	[ip_days] [int] NOT NULL,
	[u_name] [nvarchar](20) NOT NULL,
	[u_mail] [nvarchar](50) NOT NULL,
	[u_phone] [nvarchar](20) NOT NULL,
	[u_id] [int] NOT NULL,
	[belongto] [int] NOT NULL,
	[ifout] [bit] NOT NULL,
	[invoice_code] [nvarchar](50) NULL,
 CONSTRAINT [PK_sales1] PRIMARY KEY CLUSTERED 
(
	[s_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[town]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[town](
	[c_id] [int] NOT NULL,
	[c_county] [nvarchar](10) NOT NULL,
	[c_town] [nvarchar](10) NOT NULL,
	[c_zipcode] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_town] PRIMARY KEY CLUSTERED 
(
	[c_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User2]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User2](
	[Id] [nvarchar](128) NOT NULL,
	[u_name] [nvarchar](20) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Gender] [nchar](1) NOT NULL,
	[HireDate] [date] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [date] NOT NULL,
	[receipt] [nvarchar](10) NULL,
	[p_fee] [int] NOT NULL,
	[p_lastFeeDate] [date] NOT NULL,
	[PhoneNumber1] [nvarchar](20) NOT NULL,
	[PhoneNumber2] [nvarchar](20) NOT NULL,
	[u_memo] [nvarchar](max) NULL,
	[RoleId] [nvarchar](128) NOT NULL,
	[u_active] [bit] NOT NULL,
	[belongto] [nvarchar](128) NOT NULL,
	[CommCircleName] [nchar](10) NULL,
	[u_location1] [nvarchar](10) NULL,
	[u_location2] [nvarchar](10) NULL,
	[u_location3] [nvarchar](50) NULL,
	[AddressID] [int] NULL,
	[AddressTypedId] [int] NULL,
	[PostalCode] [nchar](15) NOT NULL,
	[SpatialLocation] [geography] NULL,
	[applyupgrade] [int] NOT NULL,
	[rejectreason] [nvarchar](255) NULL,
	[u_occupation1] [nvarchar](50) NULL,
	[u_occupation2] [nvarchar](max) NULL,
	[u_occupation3] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User2Free]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User2Free](
	[U2_id] [nvarchar](128) NOT NULL,
	[ig_id] [int] NOT NULL,
	[free_id] [int] NOT NULL,
 CONSTRAINT [PK_User2Free] PRIMARY KEY CLUSTERED 
(
	[U2_id] ASC,
	[ig_id] ASC,
	[free_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[uv_ClassifiedAdsSearch]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[uv_ClassifiedAdsSearch] 
AS (
SELECT [i_id]
      ,[i_name]
      ,[i_content]
      ,[i_initial_day]
      ,[i_expired_day]
      ,[i_location1]
      ,[i_location2]
      ,[i_pic1]
      ,[i_pic2]
      ,[i_pic3]
      ,[i_pic4]
      ,[i_pic5]
      ,[i_URL]
      ,[POP].[dbo].[Infos].[ig_id]
      ,[u_id]
      ,[i_unconfirm]
      ,[ip_discount]
      ,[ip_days]
      ,[bill]
      ,[i_LINE]
      ,[i_open]
      ,[or_number]
      ,[i_create_datetime]
      ,[i_probation]
      ,[i_formal_period]

	  ,[ig_name]
      ,[ig_pic]
      ,[ig_price]
	  ,[DisplayOrder]

	  ,[U2_id]
      ,[free_id]

	  ,[co_name]
      ,[co_belong]
      ,[co_location1]
      ,[co_location2]
      ,[co_location3]
      ,[co_location4]

	  ,[cl_name]
      ,[cl_belong]
      ,[cl_location1]
      ,[cl_location2]
      ,[cl_location3]
      ,[cl_location4]

	  ,[ac_zipcode]
      ,[ac_name]
      ,[ac_location1]
      ,[ac_location2]
      ,[ac_location3]
      ,[ac_belong]
      ,[ac_family]
      ,[ac_building]

  FROM [POP].[dbo].[Infos]
  LEFT JOIN [POP].[dbo].[InfoGroupp]
  ON [POP].[dbo].[Infos].[ig_id] = [POP].[dbo].[InfoGroupp].[ig_id]
  LEFT JOIN [POP].[dbo].[User2Free]
  ON [POP].[dbo].[Infos].[ig_id] = [POP].[dbo].[User2Free].[ig_id]
  LEFT JOIN [POP].[dbo].[Community]
  ON [POP].[dbo].[User2Free].[ig_id] = [POP].[dbo].[Community].[ig_id] AND [POP].[dbo].[User2Free].[free_id] = [POP].[dbo].[Community].[co_id]
  LEFT JOIN [POP].[dbo].[Club]
  ON [POP].[dbo].[User2Free].[ig_id] = [POP].[dbo].[Club].[ig_id] AND [POP].[dbo].[User2Free].[free_id] = [POP].[dbo].[Club].[cl_id]
  LEFT JOIN [POP].[dbo].[ApComplex]
  ON [POP].[dbo].[User2Free].[ig_id] = [POP].[dbo].[ApComplex].[ig_id] AND [POP].[dbo].[User2Free].[free_id] = [POP].[dbo].[ApComplex].[ac_Id]
);

GO
/****** Object:  View [dbo].[uv_AdvertisingCategoryCount]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[uv_AdvertisingCategoryCount] 
AS (
	SELECT [ig_id], [ig_name], COUNT( [ig_id]) AS "count"
	  FROM [POP].[dbo].[uv_ClassifiedAdsSearch]
	  WHERE [i_expired_day] >= Convert(varchar(10),getdate(),111) AND [i_open] = 1
	  GROUP BY [ig_id], [ig_name]
);

GO
/****** Object:  View [dbo].[AAA]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AAA]
AS
SELECT          dbo.town.c_id, dbo.town.c_county, dbo.town.c_town, dbo.town.c_zipcode, dbo.BeaconDevice.d_id, 
                            dbo.BeaconDevice.d_name, dbo.BeaconDevice.d_out_day, dbo.BeaconDevice.d_location1, 
                            dbo.BeaconDevice.d_location2, dbo.BeaconDevice.d_location3, dbo.BeaconDevice.d_location4, 
                            dbo.BeaconDevice.d_holder, dbo.BeaconDevice.d_memo, dbo.BeaconDevice.belongto, dbo.Infos.i_id, 
                            dbo.Infos.i_name, dbo.Infos.i_content, dbo.Infos.i_initial_day, dbo.Infos.i_expired_day, dbo.Infos.i_pic1, 
                            dbo.Infos.i_pic2, dbo.Infos.i_pic3, dbo.Infos.i_pic4, dbo.Infos.i_pic5, dbo.Infos.i_URL, dbo.Infos.ig_id, dbo.Infos.u_id, 
                            dbo.Infos.i_unconfirm, dbo.Infos.ip_discount, dbo.Infos.ip_days, dbo.Infos.bill, dbo.Infos.i_LINE, 
                            dbo.Infos.i_location1, dbo.Infos.i_location2
FROM              dbo.town LEFT OUTER JOIN
                            dbo.BeaconDevice ON dbo.town.c_town = dbo.BeaconDevice.d_location2 AND 
                            dbo.town.c_county = dbo.BeaconDevice.d_location1 LEFT OUTER JOIN
                            dbo.DeviceInfo ON dbo.BeaconDevice.d_id = dbo.DeviceInfo.d_id LEFT OUTER JOIN
                            dbo.Infos ON dbo.Infos.i_id = dbo.DeviceInfo.i_id

GO
/****** Object:  View [dbo].[uv_AllBroadcast]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[uv_AllBroadcast]
AS(
	SELECT [d_id]
      ,[d_name]
      ,[d_out_day]
      ,[d_location1]
      ,[d_location2]
      ,[d_location3]
      ,[d_location4]
      ,[d_holder]
      ,[d_memo]
      ,[belongto]
      ,[d_owner]
      ,[POP].[dbo].[BeaconDevice].[bdf_id]
      ,[POP].[dbo].[BeaconDevice].[bpt_id]

      ,[bpt_broadcastPoint]

      ,[bdf_name]
      ,[bdf_content]
      ,[bdf_price]
  FROM [POP].[dbo].[BeaconDevice]
  LEFT JOIN [POP].[dbo].[BroadcastPointType]
  ON [POP].[dbo].[BeaconDevice].[bpt_id] = [POP].[dbo].[BroadcastPointType].[bpt_id]
  LEFT JOIN [POP].[dbo].[BeaconDeviceFlow]
  ON [POP].[dbo].[BeaconDevice].[bdf_id] = [POP].[dbo].[BeaconDeviceFlow].[bdf_id]
);

GO
/****** Object:  View [dbo].[uv_ConditionalSearchPushAdvertisin]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[uv_ConditionalSearchPushAdvertisin] 
AS (
SELECT [POP].[dbo].[BeaconDevice].[d_id]
      ,[POP].[dbo].[DeviceInfo].[i_id]

	  ,[d_name]
      ,[d_out_day]
      ,[d_location1]
      ,[d_location2]
      ,[d_location3]
      ,[d_location4]
      ,[d_holder]
      ,[d_memo]
      ,[belongto]
      ,[d_owner]
      ,[POP].[dbo].[BeaconDevice].[bdf_id]
      ,[POP].[dbo].[BeaconDevice].[bpt_id]

	  ,[bpt_broadcastPoint]

	  ,[bdf_name]
      ,[bdf_content]
      ,[bdf_price]

	  ,[i_name]
      ,[i_content]
      ,[i_initial_day]
      ,[i_expired_day]
      ,[i_location1]
      ,[i_location2]
      ,[i_pic1]
      ,[i_pic2]
      ,[i_pic3]
      ,[i_pic4]
      ,[i_pic5]
      ,[i_URL]
      ,[POP].[dbo].[Infos].[ig_id]
      ,[u_id]
      ,[i_unconfirm]
      ,[ip_discount]
      ,[ip_days]
      ,[bill]
      ,[i_LINE]
	  ,[i_open]

	  ,[ig_name]
      ,[ig_pic]
      ,[ig_price]
      ,[DisplayOrder]

	  ,[U2_id]
      ,[free_id]

	  ,[co_id]
      ,[co_name]
      ,[co_belong]
      ,[co_location1]
      ,[co_location2]
      ,[co_location3]
      ,[co_location4]

	  ,[ac_Id]
      ,[ac_zipcode]
      ,[ac_name]
      ,[ac_location1]
      ,[ac_location2]
      ,[ac_location3]
      ,[ac_belong]
      ,[ac_family]
      ,[ac_building]

	  ,[cl_id]
      ,[cl_name]
      ,[cl_belong]
      ,[cl_location1]
      ,[cl_location2]
      ,[cl_location3]
      ,[cl_location4]

  FROM [POP].[dbo].[DeviceInfo]
  LEFT JOIN [POP].[dbo].[BeaconDevice]
  ON [POP].[dbo].[DeviceInfo].[d_id] = [POP].[dbo].[BeaconDevice].[d_id]
  LEFT JOIN [POP].[dbo].[BroadcastPointType]
  ON [POP].[dbo].[BeaconDevice].[bpt_id] = [POP].[dbo].[BroadcastPointType].[bpt_id]
  LEFT JOIN [POP].[dbo].[BeaconDeviceFlow]
  ON [POP].[dbo].[BeaconDevice].[bdf_id] = [POP].[dbo].[BeaconDeviceFlow].[bdf_id]
  LEFT JOIN [POP].[dbo].[Infos]
  ON [POP].[dbo].[DeviceInfo].[i_id] = [POP].[dbo].[Infos].[i_id]
  LEFT JOIN [POP].[dbo].[InfoGroupp]
  ON [POP].[dbo].[Infos].[ig_id] = [POP].[dbo].[InfoGroupp].[ig_id]
  LEFT JOIN [POP].[dbo].[User2Free]
  ON [POP].[dbo].[Infos].[ig_id] = [POP].[dbo].[User2Free].[ig_id]
  LEFT JOIN [POP].[dbo].[Community]
  ON [POP].[dbo].[User2Free].[ig_id] = [POP].[dbo].[Community].[ig_id] AND [POP].[dbo].[User2Free].[free_id] = [POP].[dbo].[Community].[co_id]
  LEFT JOIN [POP].[dbo].[ApComplex]
  ON [POP].[dbo].[User2Free].[ig_id] = [POP].[dbo].[ApComplex].[ig_id] AND [POP].[dbo].[User2Free].[free_id] = [POP].[dbo].[ApComplex].[ac_id]
  LEFT JOIN [POP].[dbo].[Club]
  ON [POP].[dbo].[User2Free].[ig_id] = [POP].[dbo].[Club].[ig_id] AND [POP].[dbo].[User2Free].[free_id] = [POP].[dbo].[Club].[cl_id]
  
  WHERE [POP].[dbo].[Infos].[i_expired_day] >= Convert(varchar(10),getdate(),111)
);

GO
/****** Object:  View [dbo].[uv_PublishedInquire]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[uv_PublishedInquire] 
AS (
	SELECT [i_id]
      ,[i_name]
      ,[i_content]
      ,[i_initial_day]
      ,[i_expired_day]
      ,[i_location1]
      ,[i_location2]
      ,[i_pic1]
      ,[i_pic2]
      ,[i_pic3]
      ,[i_pic4]
      ,[i_pic5]
      ,[i_URL]
      ,[POP].[dbo].[Infos].[ig_id]
      ,[POP].[dbo].[Infos].[u_id]
      ,[i_unconfirm]
      ,[ip_discount]
      ,[ip_days]
      ,[POP].[dbo].[Infos].[bill]
      ,[i_LINE]
      ,[i_open]
      ,[POP].[dbo].[Infos].[or_number]
      ,[i_create_datetime]
      ,[i_probation]
      ,[i_formal_period]

	  ,[ig_name]
      ,[ig_pic]
      ,[ig_price]
      ,[DisplayOrder]

	  ,[or_id]
      ,[or_create_datetime]
      ,[or_invoice_title]
      ,[or_invoice_address]
      ,[or_invoice_code]
      ,[inv_type]
      ,[or_invoice_public]
      ,[or_payment_status]
      ,[or_payment_confirmed]
  FROM [POP].[dbo].[Infos]
  LEFT JOIN [POP].[dbo].[InfoGroupp]
  ON [POP].[dbo].[Infos].[ig_id] = [POP].[dbo].[InfoGroupp].[ig_id]
  LEFT JOIN [POP].[dbo].[OrderRecord]
  ON [POP].[dbo].[Infos].[or_number] = [POP].[dbo].[OrderRecord].[or_number] 
);

GO
/****** Object:  View [dbo].[View_AspNetUsers_Infos]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_AspNetUsers_Infos]
AS
SELECT          dbo.AspNetUsers.UserName, dbo.Infos.*
FROM              dbo.AspNetUsers INNER JOIN
                            dbo.Infos ON dbo.AspNetUsers.Id = dbo.Infos.u_id

GO
/****** Object:  View [dbo].[View_BeaconDevice_LF_DeviceInfo_LF_Info_LF_InfoGroup]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_BeaconDevice_LF_DeviceInfo_LF_Info_LF_InfoGroup]
AS
SELECT          dbo.town.c_id, dbo.town.c_county, dbo.town.c_town, dbo.town.c_zipcode, dbo.BeaconDevice.d_id, 
                            dbo.BeaconDevice.d_name, dbo.BeaconDevice.d_out_day, dbo.BeaconDevice.d_location1, 
                            dbo.BeaconDevice.d_location2, dbo.BeaconDevice.d_location3, dbo.BeaconDevice.d_location4, 
                            dbo.BeaconDevice.d_holder, dbo.BeaconDevice.d_memo, dbo.BeaconDevice.belongto, dbo.Infos.i_id, 
                            dbo.Infos.i_name, dbo.Infos.i_content, dbo.Infos.i_initial_day, dbo.Infos.i_expired_day, dbo.Infos.i_pic1, 
                            dbo.Infos.i_pic2, dbo.Infos.i_pic3, dbo.Infos.i_pic4, dbo.Infos.i_pic5, dbo.Infos.i_URL, dbo.Infos.ig_id, dbo.Infos.u_id, 
                            dbo.Infos.i_unconfirm, dbo.Infos.ip_discount, dbo.Infos.ip_days, dbo.Infos.bill, dbo.Infos.i_LINE, 
                            dbo.InfoGroupp.ig_name, dbo.InfoGroupp.ig_pic, dbo.InfoGroupp.ig_name AS Expr1, dbo.InfoGroupp.ig_pic AS Expr2, 
                            dbo.InfoGroupp.ig_price, dbo.Infos.i_location1, dbo.Infos.i_location2
FROM              dbo.town LEFT OUTER JOIN
                            dbo.BeaconDevice ON dbo.town.c_town = dbo.BeaconDevice.d_location2 AND 
                            dbo.town.c_county = dbo.BeaconDevice.d_location1 LEFT OUTER JOIN
                            dbo.DeviceInfo ON dbo.BeaconDevice.d_id = dbo.DeviceInfo.d_id LEFT OUTER JOIN
                            dbo.Infos ON dbo.Infos.i_id = dbo.DeviceInfo.i_id LEFT OUTER JOIN
                            dbo.InfoGroupp ON dbo.Infos.ig_id = dbo.InfoGroupp.ig_id
WHERE          (dbo.BeaconDevice.d_id IS NOT NULL) AND (dbo.Infos.i_id IS NOT NULL) AND (dbo.Infos.ig_id IS NOT NULL) AND 
                            (dbo.Infos.u_id IS NOT NULL)

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201607130352396_InitialCreate', N'MagazineVer1.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE436127D5F60FF41D05376E1B47CD919CC1AED044EDBDE35767CC1B427C8DB802DB1DBC4489422518EBD8B7C591EF249F9852D4AD48D175DBAE5EE76102098168B87C5E221592C16FDC76FBF4FBF7F0E7CEB09C70909E9997D3439B42D4CDDD023747566A76CF9ED07FBFBEFFEFA97E9A5173C5B3F1672275C0E6AD2E4CC7E642C3A759CC47DC4014A260171E33009976CE2868183BCD0393E3CFCA77374E46080B001CBB2A69F52CA4880B31FF073165217472C45FE4DE8613F11DFA1649EA15AB728C049845C7C66DFA015FA2FA11874399AE4E2B675EE1304AACCB1BFB42D4469C81003454F3F2778CEE290AEE6117C40FEC34B84416E89FC048B0E9C56E27DFB7278CCFBE254150B28374D58180C043C3A11C671E4EA6B99D82E8D07E6BB0433B317DEEBCC8467F6B587B34F9F421F0C2037783AF3632E0C562E9B384FA25BCC2645C5490E791503DC2F61FC7552473CB07AD73B28C9743C39E4FF1D58B3D467698CCF284E598CFC03EB3E5DF8C4FD0F7E7908BF627A7672B4589E7C78F71E7927EFFF814FDED57B0A7D05B9C607F8741F87118E4137BC2CFB6F5B4EB39E23572CABD5EAE456012EC1BCB0AD1BF4FC11D3157B841973FCC1B6AEC833F68A2F825C9F2981690495589CC2CFDBD4F7D1C2C765B9D3DA26FF7F4BABC7EFDE8FD2EA2D7A22AB6CE8A5F661E2C430AF3E613F2B4D1E49944FAFC6787F1162577118F0DF4D7EE5A55FE6611ABBBC33A151E401C52BCC9ADA4D9D8ABCBD28CDA1C6A77581BAFFD4E69AAAF4D68AF20EAD33138A26B63D1B0A7D5FB7DDDE8C3B8F2218BC8C5ADC22AD845377AB89541D985513AAC873D4973C143AF5675E0B2F0344FC1116C31EAD8023B2247180CB5EFE1002F5101DACF33D4A12580BBC7FA3E4B14575F8E708AACFB19BC640D1394341F4EAADDD3F8614DFA6C182337F7B6D8D36340FBF8457C865617C4979AD8DF13E86EED7306597D4BB400C7F666E01C87F3E90A03FC028EA9CBB2E4E922B2033F66621F8D905E0356527C783E1F80AB56B6764E62312E8BD11692DFD5288561E895E42F14A0C623ACFA44DD58FE18AD07EAA16A2665573894E5585D8505539583F4D85A459D14CA053CF5C6A345F2F1BA1F19DBD0C76FFBDBDCD366FD35A5033E31C5648FC2F4C710CCB98778F18C331AD46A0CFBAB10B67211B3EDEE8ABEF4D594B3F223F1DBBA9B56643B6088C3F1B32D8FD9F0D999AF0F98978DC2BE971042A8401BE97BCFE74D53DE724CDB63D1D1ADDDC76E3DB59034CD3E53C49429764B34013FC12A18BA6FEE0C359DD718CBC37722C043A0644277CCB832FD0375B26D51DBDC03E66D83A77F3E0E00C252EF254334287BC018A153BAA46B12A26D254EEEF4A9BC0741CF34A881F821298A98432755A10EA9208F99D56926AF6DCC278DFCB36E4920B1C61CA1BECB4449FC6F52110AE40D98E34285D169A3A35C6B513D1E0B59AC6BCCB85ADC65D894C6C85931DBEB38197C27F7B1562B65B6C0BE46C37491F058CE1BC5D10549C55FA12403EB8EC1B41A5139381A0C2A5DA0A419B16DB01419B26797304CD8FA87DC75F3AAFEE1B3D9B07E5ED6FEBADE6DA01371BF6D8336AE6BE27D4615003C72A3D2F16BC103F33CDE10CF414E7B344B8BA324538F81CB366C8A6F277B57EA8D30E2293A80DB0225A07A8B808548094093540B92296D7AA9DF02206C01671B75658B1F64BB0350EA8D8F50BD19AA0F9DA542667AFD347D9B3920D0AC97B1D166A381A42C88B57B3E33D8C628ACBAA86E9E30B0FF1866B1D1383D162A00ECFD560A4A233A35BA9A066B795740ED910976C232B49EE93C14A456746B792E068B791344EC100B760231335B7F091265B11E928779BB26CEAE48952E2C3D43164544D6F501411BAAA6558892FD63C4FAF9A7D3B1F9E7614E4188E9B68B28F4A6DCB965818A315964AA169D0F48AC409BB400C2D108FF3CCBC4011D3EEAD86E5BF68B2BE7DAA8358EC038534FF775E43777DDFD86C556F44805C411703EED26471740D01F4D52D9EF2867C146B42F7B3D04F036AF6B0CCB5F30BBC7AFDFC8B8A307524FD150F4A3197E2E7366DDF6B64D45931D628951ECCFA23658630D9BBF03FEB1637F9A46694224455473185AD763672265766D868C96EE2F0C1EA44789D99257253EA00E2D3408C5A7A8302562BEB8FDACC40A963364BFA234A69267548A9688096F564928692F582B5F00C16D54BF46F414D1FA9A3ABA5FD9135892475684DF11AD81A9DE5B2FEA89A5C933AB0A6B83F76957822AFA27BBC77190F2FEB6F5EF90177B3DDCB80F13A4BE2389B5FED1EBF0E54FB3C104BDCD42B60E2FB5ED2C978CA5B9F4E796063333A1930CC6B4FE30ABCB9F4B4DEDB9B311BF7DA8DE5BDED5EDF8C378CB4AF4A0DE594278B94AD97A73DE954371527ACEEC734CA912B17B1ADC28CB0B5BF240C07132E3099FFECCF7C82F9425E08DC204A963861792E877D7C78742C3DC7D99FA7314E9278BEE6846A7A1FD31CB32DA465D12714BB8F2856932436783E52812AF1E76BEAE1E733FB7F59ADD32C94C1FF957D3EB0AE93CF94FC9C42C1439C62EB5735E9739C74FAF673D69E3E7EE86FD5EB9FBEE4550FACBB1866CCA97528D9729D116E3E8918A44D5E75036DD67E28F1762754E30D8216559A10EB3F39581036CA738342CB6F02F4FCB7A1AA699F146C84A879363016DE2826343D0B5807CBF824C0839F2C7B1230ACB3FA2702EBA8667C1E40E87030F97140FF65A8A8B9C3AD467328DAC69294D9B933B97AA34CCB5DEF4D4A0EF646135DCDB31E00B7412EF51ACC786369C8A3ED8E9A2CE3D1B07749ED574F2DDE976CE22ACF63B749C4DBCC1B6EB919FA53A50BEF41829B266167F749C1DBE69A2990BBE79995C3527FF78C6C228D6BF709BEDB269B29CCBBE7641B94C6BB675CDBD5FEB963A6F5DE42779E94ABE617192E6474B1E0AEA4DB3C700E27FC450824C83DCAFCADA43ECBAB2D43B5A3C14AC4DCA839BD4C6E5899384ABB8A447BB3C3FA2A36FCD6CE0A99F6660D49996D6D8BF5BFB56D21D3DEB621D57117E9C2DA64435D0A77C73AD69607F596D2831B3DE9C846EFF2595B6FD7DF5236F0284669CC1EC31DF1DB49FE1DC524634E9D01C9BEEA752FEC9DB5BFB008FB7742561504FF7B8B14BB8D5DB394B9A6CBB0D8BC258D0A112942738319F2604B3D8F1959229741318F31678FBDB3B81DBFE95860EF9ADEA52C4A197419070BBF11F0E24E405BFB59467353E7E95D94FDDD9231BA006A121E9BBFA33FA4C4F74ABDAF3431210304F72E4444978F25E391DDD54B89741BD29E40C27CA553F48083C807B0E48ECED1135E4737A0DF47BC42EE4B15013481740F44D3ECD30B8256310A128151D5879FC0612F78FEEEFF764A834868540000, N'6.1.3-40302')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'087c7200-da62-42f7-afbd-ef9b6386ab94', N's@t.u', 0, N'AKwv7yUQQuncaaCYOJMe8Wp/saIo4g1+CSp58sN9EzEIEo5kCAKkce0wIP84L0cjEg==', N'353b7052-1832-45d5-9598-15c7fcda1ba4', NULL, 0, 0, NULL, 1, 0, N's@t.u')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'09e15f3e-412b-4707-912b-4d5fdd8aaa6a', N'mandy@popper.com.tw', 0, N'AHPoGOoyP6QuqWbEbiZEXzoIPIfOYyS/ARpLvJKp6wifR8AcIyV9wHHi5Np/6ZSW+A==', N'5671b21b-923c-4be4-accc-05e76ba3ebda', NULL, 0, 0, NULL, 1, 0, N'mandy@popper.com.tw')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0b783ed3-f888-45e1-bb2f-6bc675cf972c', N't@u.v', 0, N'ALjLXxj4yVo6yysQV8hDt0Cg8SOR3J7kSmBgrNrYtM/7U2Q3XHb0X53xIOyW3SBaBQ==', N'a93e7f1c-9ee0-4ba4-86f5-f759afebaa05', NULL, 0, 0, NULL, 1, 0, N't@u.v')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0be60609-08d8-4211-ad64-dd2ae169eedc', N'a@b.c', 0, N'ANNQA+WBZo7rvzTtJJz+60DDTVfabBQMVp5uXoKPYs9jAvN1FOXLJVe8nmM0F5UN+A==', N'6dcb0cfa-0484-42d5-b43d-dfd319721a62', NULL, 0, 0, NULL, 1, 0, N'a@b.c')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0c299c06-8e99-4f36-b81f-3efc37b43feb', N'ccc@c.g', 0, N'ABH7hymJBx2s0qJ+vWar7H3tD3Ml3TVl0Q6vNWCHBzFZsK07tSId7WOnYeceMdTmLQ==', N'a980b406-7b73-421b-bace-acdfa48d4a80', NULL, 0, 0, NULL, 1, 0, N'ccc@c.g')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1cdcf753-733c-4e12-9d2b-7f8ef5022dc3', N'q@r.s', 0, N'ADBwv7QHd+mipXdhhpS8kjY+LhcD64rhlJkXKCbz08jkuNGk42vsQsQYQ0GJV1lc2w==', N'31110352-1e3a-46c5-94f2-2fe492232767', NULL, 0, 0, NULL, 1, 0, N'q@r.s')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1d953cdc-f4f1-4bf0-8676-abfe4674a615', N'ggg@c.g', 0, N'ALKObY2qWJSOSpbs4AtoMX+5QfYG19wrkazHlfVSwSce7RCfJyRL9HHeIdzy1n2aQA==', N'0196182c-2144-4169-a1cd-2883106d0921', NULL, 0, 0, NULL, 1, 0, N'ggg@c.g')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'2c15c790-9887-4e61-aef5-93e8309b7604', N'shaoyu.kao@gmail.com', 0, N'ADN8m4UFNCzicr9SSbrUYmJmuGSp4rh4+Ttbt6WSsS9pW1QGQAbmPMZmTJPvckMFLw==', N'04e31eb4-3970-4f6b-9158-c1ac70c40ba7', NULL, 0, 0, NULL, 1, 0, N'shaoyu.kao@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'355ed1f1-d490-4a47-ade3-ca94fdf5c6db', N'j@k.l', 0, N'AAFXMkV3Mh8rCYYLs+DBnAXKzbOE3bHZaMcpMmbUI5i/5e+XdzOHEpMCNdvsqMcO7w==', N'4980c9bf-1169-4777-a3bb-df63416b797d', NULL, 0, 0, NULL, 1, 0, N'j@k.l')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'43fa2c21-0e3a-4f41-9173-f006eafd7baa', N'aabbcc@b.c', 0, N'AKSOqTJIoX2kAB02f1CjMqrKUa69XcO8y5rssnURQEdwXL6TG/BnORaVchj7rgTnXA==', N'fba726d9-e0ba-4b00-bee4-21c51503b4a5', NULL, 0, 0, NULL, 1, 0, N'aabbcc@b.c')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'455099e7-8973-4e01-bdc3-11594d952839', N'eee@c.g', 0, N'ABuDzQ14ISE3nY4iE+SjdMJU+nEsSoiq/7AJ52aOOP/YFUxlNqPT5IX2ykoKvIL/KA==', N'c40eefd1-29ca-424c-9d61-1b54df7ae934', NULL, 0, 0, NULL, 1, 0, N'eee@c.g')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4965df62-2b63-45df-ba8d-bac4542977dd', N'w@popper.com.tw', 0, N'AJGIamUMHDE1UD9maJtJyLK4z0PIfCicTQhwOMfdMmbSZQjs2ruALB2BgcRBh8SWkQ==', N'd20003cf-cd94-40a1-abbc-68a2b0ba2f6b', NULL, 0, 0, NULL, 1, 0, N'w@popper.com.tw')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'50763565-cf17-48e2-b915-cb086b3a188a', N'g@h.i', 0, N'ALRylkrHJgT2o4ioeWd9XG5OfrWIu6/T632wEXHSswMhWE8p0nWP7yClEJi4eQwKfQ==', N'0061fc5f-254a-47d7-9005-2e63638a5663', NULL, 0, 0, NULL, 1, 0, N'g@h.i')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'57411247-1bd0-4199-bebb-02a8520c56b0', N'ddd@c.g', 0, N'AOFoBCzT0MA5wGbRYA1m/yu09CBnbmGg9j7+WqKfv79CaRXPoyb8U3f5YvkE+ykEzg==', N'0ef18183-6898-462c-9610-cf113a831ac8', NULL, 0, 0, NULL, 1, 0, N'ddd@c.g')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'6b0363e0-88e5-473f-b8ac-aa0bb978756d', N'evelyn@popper.com.tw', 0, N'ALIEjgqDFuMn1Zqy6PeBPjNu13CNhWdKEJLB0gIYVac5aI3khz19LiidGacGgV+k9Q==', N'c390fe59-3342-460e-9272-a73cfa1e7f11', NULL, 0, 0, NULL, 1, 0, N'evelyn@popper.com.tw')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'70ba378e-99e7-4047-8e4a-26b000d2a820', N'aaaaa@b.c', 0, N'AGg3o7aP+zWbwuZwLz1Db5xwhiQ3Ibzz8kyrG8JjouprWHfbuD+bmKlOYGfCdicHvA==', N'897be610-87f3-416b-819c-6dda66634107', NULL, 0, 0, NULL, 1, 0, N'aaaaa@b.c')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a23b62fd-6532-40df-a998-e9984f5c66b3', N'bbb@c.g', 0, N'AH7NElAW/OlllKMybEx4VGKsZQJiWY5xQDzvndzZmgQ8CwGNPSlo7k81yQnH86/gYA==', N'6409a685-e06b-4b4b-a2e2-e6192c43ccad', NULL, 0, 0, NULL, 1, 0, N'bbb@c.g')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a6fa145c-cbd6-4c21-bf03-ba45cf12a20f', N'aaa@c.g', 0, N'AC82zeCZavEXA08qx5DpaJueU6QZRBTY8BxUdfpOtePaJWRoyj3GiIYJrYY5YJXq2A==', N'1f30e5fe-3e7d-45e2-be48-ef43a56a10ef', NULL, 0, 0, NULL, 1, 0, N'aaa@c.g')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'aa3045a7-7bf3-4de5-95e1-4c7d0e3e39db', N'aa@b.c', 0, N'AEGm742qaIelVCImyabj7c0heV3HA9nD/frxOxr7/ONid129vBtoxRJo5i3I1HJ/7A==', N'4e88683a-e56f-4629-9153-2f2796d426a8', NULL, 0, 0, NULL, 1, 0, N'aa@b.c')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ac997e01-c355-4042-9254-163a2ffda1cc', N'hhh@c.g', 0, N'ABc8Z9szWqx/FHbBW1oAdy8V6IFX1xjfIjQbjNkuokpEEFdcFMlQltu4raCfhBdSWQ==', N'e88bb42e-f1d0-4bad-99f7-ac0da8485b39', NULL, 0, 0, NULL, 1, 0, N'hhh@c.g')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b1d741cb-0540-4b0c-a01a-34decf59b77c', N'x@y.z', 0, N'AJKVcEnE8/R+kpYATrrZp0MFxqYJK3vmHcKPTQxnvOUvGiAjMrGTYeqxlwrhJNVjcw==', N'19b2c150-01d3-4dcf-8175-3502852a046e', NULL, 0, 0, NULL, 1, 0, N'x@y.z')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'bba52790-b244-423b-b002-caa5e337138d', N'666@b.c', 0, N'AH+CVW6cwJR4nYxv0KIaeK8quO/ad1gLJse3SCnsGn6VJhQkTB6/GvHZtMCI/2ld6Q==', N'b5797e78-040b-4ca7-8620-9449ce736970', NULL, 0, 0, NULL, 1, 0, N'666@b.c')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'bd57fa3e-f0aa-4af1-b1ee-5606a99b7fe9', N'bbbbb@b.c', 0, N'AKZ0K0WpmH5wuwgAEgCLViy9y4fK1oMNEjOefz82UBT1yWbdrLXPTPhdyqWkNqWwCQ==', N'0e6cf46e-fb22-4598-aa42-f0a491a1af78', NULL, 0, 0, NULL, 1, 0, N'bbbbb@b.c')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c65d50a1-02f2-466d-86dc-5242fac6ac26', N'999@b.c', 0, N'AHGKiVByoAmGme19A1J/bfl2G+lbStT3lCTq6+qGE65ethqqsVcFqqId50BTVw3ylA==', N'24c1c5e0-8229-42b1-9652-9c018294419d', NULL, 0, 0, NULL, 1, 0, N'999@b.c')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c6cd4220-921b-47c1-892f-19a53650980e', N'jjj@b.c', 0, N'ABAR07mtvliGvfvv4nKeu/voSWHKwbJWAVHHQqzrkyE8o71C4+5HfuNWQBTJ6XVcYA==', N'3719e342-5f00-4c64-8e3e-e0a70b2adfd8', NULL, 0, 0, NULL, 1, 0, N'jjj@b.c')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'dcbac6f4-b6e9-4f9e-b1bc-ce6f41845c30', N'aaa@b.c', 0, N'AGNEsHllKFKpZIJDok4tSM+A3Wv2Kx+pJKspMA36Z7rN1tGn7p1Jf/wA6aPrKEB77g==', N'8a60cae6-b299-4264-9205-cf400dbf3b52', NULL, 0, 0, NULL, 1, 0, N'aaa@b.c')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e1a4ded4-cfb8-4096-b5c1-6b7ce133b9ba', N'q3387176x@gmail.com', 0, N'AFdEqihdJvr0/zJlXGSHm/5cMC+D9jCl1YENUD81PdWuCbg0/qzKsXKpuIGCGtm8Ng==', N'0cf2a4a6-6d5f-4ff3-927d-c155c38252e3', NULL, 0, 0, NULL, 1, 0, N'q3387176x@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f3cd6b7a-c359-41f6-8682-16e1fd32bcc7', N'n@o.p', 0, N'ALtUAnitN0l1fDf3wfqv8PnLtRgsfSLstSGKHxAH0W0NIeiCdSq9rEZPnHm7lEUToA==', N'7fd0bfca-8b2a-4f4f-8e58-69d2c3bf8dea', NULL, 0, 0, NULL, 1, 0, N'n@o.p')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ff5017af-ebd2-4bd0-9b2b-3bf47ff1750a', N'fff@c.g', 0, N'ANnLDfkEC5u6FGuOMET8S/3DUUQpFuTM0beebKlduEVQIFLKte7XCAVLVG1qe8TmIA==', N'1d5756a4-3332-4ff9-bf3d-bc1d7278e7d4', NULL, 0, 0, NULL, 1, 0, N'fff@c.g')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ffe3af90-70c7-43b8-a700-d8ef6028f886', N'ggg@b.c', 0, N'AANlM+PnILzhvOldzCfY+GlX8zFYT1ROv4/6YNRFXhXs4fp2R8KnEi5rw4RviRH8GQ==', N'dbc40f5c-b521-478c-af25-acbfd2aae997', NULL, 0, 0, NULL, 1, 0, N'ggg@b.c')
INSERT [dbo].[BeaconDevice] ([d_id], [d_name], [d_out_day], [d_location1], [d_location2], [d_location3], [d_location4], [d_holder], [d_memo], [belongto], [d_owner], [bdf_id], [bpt_id]) VALUES (N'22334455', N'虛擬測試先1', CAST(N'2016-12-26 00:00:00.000' AS DateTime), N'桃園市', N'蘆竹區', N'南昌路', N'105號', N'待出售', NULL, N'ffe3af90-70c7-43b8-a700-d8ef6028f886', NULL, 1, 1)
INSERT [dbo].[BeaconDevice] ([d_id], [d_name], [d_out_day], [d_location1], [d_location2], [d_location3], [d_location4], [d_holder], [d_memo], [belongto], [d_owner], [bdf_id], [bpt_id]) VALUES (N'3234243242', N'虛擬測試先', CAST(N'2016-12-26 00:00:00.000' AS DateTime), N'桃園市', N'蘆竹區', N'南昌路', N'100號', N'待出售', NULL, N'0be60609-08d8-4211-ad64-dd2ae169eedc', NULL, 2, 1)
INSERT [dbo].[BeaconDevice] ([d_id], [d_name], [d_out_day], [d_location1], [d_location2], [d_location3], [d_location4], [d_holder], [d_memo], [belongto], [d_owner], [bdf_id], [bpt_id]) VALUES (N'3D033D32-EBA2-41D0-AFAF-7FC153699D7A99.0', N'土城', CAST(N'2015-12-31 00:00:00.000' AS DateTime), N'新北市', N'土城區', N'金城路', N'一段', N'Kelly', NULL, N'0be60609-08d8-4211-ad64-dd2ae169eedc', NULL, 3, 1)
INSERT [dbo].[BeaconDevice] ([d_id], [d_name], [d_out_day], [d_location1], [d_location2], [d_location3], [d_location4], [d_holder], [d_memo], [belongto], [d_owner], [bdf_id], [bpt_id]) VALUES (N'3D033D32-EBA2-41D0-AFAF-7FC153699D7A99.2', N'大同大學', CAST(N'2016-04-07 00:00:00.000' AS DateTime), N'臺北市', N'中山區', N'中山北路', N'三段40號', N'Kelly', NULL, N'0be60609-08d8-4211-ad64-dd2ae169eedc', NULL, 1, 1)
INSERT [dbo].[BeaconDevice] ([d_id], [d_name], [d_out_day], [d_location1], [d_location2], [d_location3], [d_location4], [d_holder], [d_memo], [belongto], [d_owner], [bdf_id], [bpt_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.0', N'GREEN HOUSE', CAST(N'2016-01-30 00:00:00.000' AS DateTime), N'桃園市', N'蘆竹區', N'南福街', N'103號', N'Jack', NULL, N'355ed1f1-d490-4a47-ade3-ca94fdf5c6db', NULL, 2, 1)
INSERT [dbo].[BeaconDevice] ([d_id], [d_name], [d_out_day], [d_location1], [d_location2], [d_location3], [d_location4], [d_holder], [d_memo], [belongto], [d_owner], [bdf_id], [bpt_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.1', N'6街義食屋', CAST(N'2016-01-30 00:00:00.000' AS DateTime), N'桃園市', N'八德區', N'介壽路', N'1號', N'Mandy', NULL, N'09e15f3e-412b-4707-912b-4d5fdd8aaa6a', NULL, 3, 2)
INSERT [dbo].[BeaconDevice] ([d_id], [d_name], [d_out_day], [d_location1], [d_location2], [d_location3], [d_location4], [d_holder], [d_memo], [belongto], [d_owner], [bdf_id], [bpt_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.100', N'八德形象商圈', CAST(N'2016-07-04 00:00:00.000' AS DateTime), N'桃園市', N'八德區', N'介壽路', N'一段7號', N'Candy01', NULL, N'09e15f3e-412b-4707-912b-4d5fdd8aaa6a', NULL, 1, 2)
INSERT [dbo].[BeaconDevice] ([d_id], [d_name], [d_out_day], [d_location1], [d_location2], [d_location3], [d_location4], [d_holder], [d_memo], [belongto], [d_owner], [bdf_id], [bpt_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.2', N'米達詩花藝', CAST(N'2016-01-30 00:00:00.000' AS DateTime), N'新北市', N'蘆洲區', N'集賢路', N'222號', N'王老師', NULL, N'0be60609-08d8-4211-ad64-dd2ae169eedc', NULL, 2, 2)
INSERT [dbo].[BeaconDevice] ([d_id], [d_name], [d_out_day], [d_location1], [d_location2], [d_location3], [d_location4], [d_holder], [d_memo], [belongto], [d_owner], [bdf_id], [bpt_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.3', N'雅加達早餐店', CAST(N'2016-01-30 00:00:00.000' AS DateTime), N'桃園市', N'蘆竹區', N'南福街', N'97號', N'業務測試', NULL, N'355ed1f1-d490-4a47-ade3-ca94fdf5c6db', NULL, 3, 2)
INSERT [dbo].[BeaconDevice] ([d_id], [d_name], [d_out_day], [d_location1], [d_location2], [d_location3], [d_location4], [d_holder], [d_memo], [belongto], [d_owner], [bdf_id], [bpt_id]) VALUES (N'E2C56DB5-DFFB-48D2-B060-D0F5A71096E00.0', N'大二粒', CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'桃園市', N'蘆竹區', N'南福街', N'101號', N'波普', NULL, N'355ed1f1-d490-4a47-ade3-ca94fdf5c6db', NULL, 1, 2)
INSERT [dbo].[BeaconDevice] ([d_id], [d_name], [d_out_day], [d_location1], [d_location2], [d_location3], [d_location4], [d_holder], [d_memo], [belongto], [d_owner], [bdf_id], [bpt_id]) VALUES (N'FDA50693-A4E2-4FB1-AFCF-C6EB0764782510034.58888', N'黃搖', CAST(N'2017-03-11 00:00:00.000' AS DateTime), N'桃園市', N'蘆竹區', N'南昌路', N'一段200號', N'小李', N'NULL', N'1cdcf753-733c-4e12-9d2b-7f8ef5022dc3', NULL, 2, 1)
INSERT [dbo].[BeaconDevice] ([d_id], [d_name], [d_out_day], [d_location1], [d_location2], [d_location3], [d_location4], [d_holder], [d_memo], [belongto], [d_owner], [bdf_id], [bpt_id]) VALUES (N'FDA50693-A4E2-4FB1-AFCF-C6EB0764782520.33394', N'便宜貨', CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'桃園市', N'蘆竹區', N'南福街', N'101號', N'波普', NULL, N'355ed1f1-d490-4a47-ade3-ca94fdf5c6db', NULL, 3, 2)
SET IDENTITY_INSERT [dbo].[BeaconDeviceFlow] ON 

INSERT [dbo].[BeaconDeviceFlow] ([bdf_id], [bdf_name], [bdf_content], [bdf_price]) VALUES (1, N'A', N'小', 100)
INSERT [dbo].[BeaconDeviceFlow] ([bdf_id], [bdf_name], [bdf_content], [bdf_price]) VALUES (2, N'B', N'中', 200)
INSERT [dbo].[BeaconDeviceFlow] ([bdf_id], [bdf_name], [bdf_content], [bdf_price]) VALUES (3, N'C', N'大', 300)
SET IDENTITY_INSERT [dbo].[BeaconDeviceFlow] OFF
SET IDENTITY_INSERT [dbo].[BroadcastPointType] ON 

INSERT [dbo].[BroadcastPointType] ([bpt_id], [bpt_broadcastPoint]) VALUES (1, N'直營播點')
INSERT [dbo].[BroadcastPointType] ([bpt_id], [bpt_broadcastPoint]) VALUES (2, N'加盟播點')
SET IDENTITY_INSERT [dbo].[BroadcastPointType] OFF
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'22334455', 1163)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'22334455', 1164)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'22334455', 1165)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'22334455', 1166)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'22334455', 1167)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'22334455', 1168)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'22334455', 1169)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3234243242', 1163)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3234243242', 1164)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3234243242', 1165)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3234243242', 1166)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3234243242', 1167)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3234243242', 1168)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3234243242', 1169)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3234243242', 1172)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3234243242', 1173)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3234243242', 1174)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3234243242', 1175)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3234243242', 1176)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3234243242', 1180)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3234243242', 1181)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3D033D32-EBA2-41D0-AFAF-7FC153699D7A99.0', 22)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3D033D32-EBA2-41D0-AFAF-7FC153699D7A99.0', 1163)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3D033D32-EBA2-41D0-AFAF-7FC153699D7A99.0', 1164)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3D033D32-EBA2-41D0-AFAF-7FC153699D7A99.0', 1165)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3D033D32-EBA2-41D0-AFAF-7FC153699D7A99.0', 1166)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3D033D32-EBA2-41D0-AFAF-7FC153699D7A99.0', 1167)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3D033D32-EBA2-41D0-AFAF-7FC153699D7A99.0', 1168)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3D033D32-EBA2-41D0-AFAF-7FC153699D7A99.0', 1169)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3D033D32-EBA2-41D0-AFAF-7FC153699D7A99.0', 1172)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3D033D32-EBA2-41D0-AFAF-7FC153699D7A99.0', 1173)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3D033D32-EBA2-41D0-AFAF-7FC153699D7A99.0', 1174)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3D033D32-EBA2-41D0-AFAF-7FC153699D7A99.0', 1175)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3D033D32-EBA2-41D0-AFAF-7FC153699D7A99.0', 2189)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3D033D32-EBA2-41D0-AFAF-7FC153699D7A99.2', 23)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3D033D32-EBA2-41D0-AFAF-7FC153699D7A99.2', 1163)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3D033D32-EBA2-41D0-AFAF-7FC153699D7A99.2', 1164)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3D033D32-EBA2-41D0-AFAF-7FC153699D7A99.2', 1165)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3D033D32-EBA2-41D0-AFAF-7FC153699D7A99.2', 1166)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3D033D32-EBA2-41D0-AFAF-7FC153699D7A99.2', 1167)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3D033D32-EBA2-41D0-AFAF-7FC153699D7A99.2', 1168)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3D033D32-EBA2-41D0-AFAF-7FC153699D7A99.2', 1169)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3D033D32-EBA2-41D0-AFAF-7FC153699D7A99.2', 1186)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'3D033D32-EBA2-41D0-AFAF-7FC153699D7A99.2', 1187)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.0', 24)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.0', 1163)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.0', 1164)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.0', 1165)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.0', 1166)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.0', 1167)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.0', 1168)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.0', 1169)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.1', 25)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.1', 1163)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.1', 1164)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.1', 1165)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.1', 1166)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.1', 1167)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.1', 1168)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.1', 1169)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.1', 1170)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.1', 1171)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.100', 26)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.100', 1163)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.100', 1164)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.100', 1165)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.100', 1166)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.100', 1167)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.100', 1168)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.100', 1169)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.100', 1170)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.2', 1163)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.2', 1164)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.2', 1165)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.2', 1166)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.2', 1167)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.2', 1168)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.2', 1169)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.2', 1176)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.2', 1177)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.2', 1178)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.2', 1179)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.2', 1180)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.2', 1181)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.2', 1184)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.2', 1185)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.2', 1186)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.2', 1187)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.2', 2188)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.2', 2191)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.3', 27)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.3', 1163)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.3', 1164)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.3', 1165)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.3', 1166)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.3', 1167)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.3', 1168)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.3', 1169)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'E2C56DB5-DFFB-48D2-B060-D0F5A71096E00.0', 36)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'E2C56DB5-DFFB-48D2-B060-D0F5A71096E00.0', 1163)
GO
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'E2C56DB5-DFFB-48D2-B060-D0F5A71096E00.0', 1164)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'E2C56DB5-DFFB-48D2-B060-D0F5A71096E00.0', 1165)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'E2C56DB5-DFFB-48D2-B060-D0F5A71096E00.0', 1166)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'E2C56DB5-DFFB-48D2-B060-D0F5A71096E00.0', 1167)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'E2C56DB5-DFFB-48D2-B060-D0F5A71096E00.0', 1168)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'E2C56DB5-DFFB-48D2-B060-D0F5A71096E00.0', 1169)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'FDA50693-A4E2-4FB1-AFCF-C6EB0764782510034.58888', 1182)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'FDA50693-A4E2-4FB1-AFCF-C6EB0764782510034.58888', 2187)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'FDA50693-A4E2-4FB1-AFCF-C6EB0764782520.33394', 1163)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'FDA50693-A4E2-4FB1-AFCF-C6EB0764782520.33394', 1164)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'FDA50693-A4E2-4FB1-AFCF-C6EB0764782520.33394', 1165)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'FDA50693-A4E2-4FB1-AFCF-C6EB0764782520.33394', 1166)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'FDA50693-A4E2-4FB1-AFCF-C6EB0764782520.33394', 1167)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'FDA50693-A4E2-4FB1-AFCF-C6EB0764782520.33394', 1168)
INSERT [dbo].[DeviceInfo] ([d_id], [i_id]) VALUES (N'FDA50693-A4E2-4FB1-AFCF-C6EB0764782520.33394', 1169)
INSERT [dbo].[DeviceUsers] ([d_id], [u_id]) VALUES (N'3D033D32-EBA2-41D0-AFAF-7FC153699D7A99.0', N'0be60609-08d8-4211-ad64-dd2ae169eedc')
INSERT [dbo].[DeviceUsers] ([d_id], [u_id]) VALUES (N'3D033D32-EBA2-41D0-AFAF-7FC153699D7A99.2', N'0be60609-08d8-4211-ad64-dd2ae169eedc')
INSERT [dbo].[DeviceUsers] ([d_id], [u_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.0', N'355ed1f1-d490-4a47-ade3-ca94fdf5c6db')
INSERT [dbo].[DeviceUsers] ([d_id], [u_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.1', N'09e15f3e-412b-4707-912b-4d5fdd8aaa6a')
INSERT [dbo].[DeviceUsers] ([d_id], [u_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.1', N'0be60609-08d8-4211-ad64-dd2ae169eedc')
INSERT [dbo].[DeviceUsers] ([d_id], [u_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.1', N'355ed1f1-d490-4a47-ade3-ca94fdf5c6db')
INSERT [dbo].[DeviceUsers] ([d_id], [u_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.100', N'09e15f3e-412b-4707-912b-4d5fdd8aaa6a')
INSERT [dbo].[DeviceUsers] ([d_id], [u_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.3', N'09e15f3e-412b-4707-912b-4d5fdd8aaa6a')
INSERT [dbo].[DeviceUsers] ([d_id], [u_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.3', N'0be60609-08d8-4211-ad64-dd2ae169eedc')
INSERT [dbo].[DeviceUsers] ([d_id], [u_id]) VALUES (N'B6A3434D-0FC1-4DD0-9429-7EE07C9B7DFD99.3', N'355ed1f1-d490-4a47-ade3-ca94fdf5c6db')
INSERT [dbo].[DeviceUsers] ([d_id], [u_id]) VALUES (N'E2C56DB5-DFFB-48D2-B060-D0F5A71096E00.0', N'355ed1f1-d490-4a47-ade3-ca94fdf5c6db')
INSERT [dbo].[DeviceUsers] ([d_id], [u_id]) VALUES (N'FDA50693-A4E2-4FB1-AFCF-C6EB0764782520.33394', N'355ed1f1-d490-4a47-ade3-ca94fdf5c6db')
INSERT [dbo].[InfoGroupp] ([ig_id], [ig_name], [ig_pic], [ig_price], [DisplayOrder]) VALUES (1, N'社區', N'http://119.14.169.10:83/images/mandy0130/a.jpg', 200, 1)
INSERT [dbo].[InfoGroupp] ([ig_id], [ig_name], [ig_pic], [ig_price], [DisplayOrder]) VALUES (3, N'房仲', N'http://119.14.169.10:83/images/mandy0130/b.jpg', 100, 2)
INSERT [dbo].[InfoGroupp] ([ig_id], [ig_name], [ig_pic], [ig_price], [DisplayOrder]) VALUES (4, N'代書', N'http://119.14.169.10:83/images/mandy0130/c.jpg', 100, 3)
INSERT [dbo].[InfoGroupp] ([ig_id], [ig_name], [ig_pic], [ig_price], [DisplayOrder]) VALUES (7, N'融資', N'http://119.14.169.10:83/images/mandy0130/d.jpg', 100, 4)
INSERT [dbo].[InfoGroupp] ([ig_id], [ig_name], [ig_pic], [ig_price], [DisplayOrder]) VALUES (9, N'娛樂', N'http://119.14.169.10:83/images/mandy0130/e.jpg', 100, 5)
INSERT [dbo].[InfoGroupp] ([ig_id], [ig_name], [ig_pic], [ig_price], [DisplayOrder]) VALUES (11, N'餐飲', N'http://119.14.169.10:83/images/mandy0130/f.jpg', 100, 6)
INSERT [dbo].[InfoGroupp] ([ig_id], [ig_name], [ig_pic], [ig_price], [DisplayOrder]) VALUES (12, N'食品', N'http://119.14.169.10:83/images/mandy0130/g.jpg', 100, 7)
INSERT [dbo].[InfoGroupp] ([ig_id], [ig_name], [ig_pic], [ig_price], [DisplayOrder]) VALUES (16, N'家教', N'http://119.14.169.10:83/images/mandy0130/h.jpg', 100, 8)
INSERT [dbo].[InfoGroupp] ([ig_id], [ig_name], [ig_pic], [ig_price], [DisplayOrder]) VALUES (17, N'正職', N'http://119.14.169.10:83/images/mandy0130/i.jpg', 100, 9)
INSERT [dbo].[InfoGroupp] ([ig_id], [ig_name], [ig_pic], [ig_price], [DisplayOrder]) VALUES (18, N'粗工', N'http://119.14.169.10:83/images/mandy0130/j.jpg', 100, 10)
INSERT [dbo].[InfoGroupp] ([ig_id], [ig_name], [ig_pic], [ig_price], [DisplayOrder]) VALUES (19, N'工讀', N'http://119.14.169.10:83/images/mandy0130/k.jpg', 100, 11)
INSERT [dbo].[InfoGroupp] ([ig_id], [ig_name], [ig_pic], [ig_price], [DisplayOrder]) VALUES (20, N'專技', N'http://119.14.169.10:83/images/mandy0130/l.jpg', 100, 12)
INSERT [dbo].[InfoGroupp] ([ig_id], [ig_name], [ig_pic], [ig_price], [DisplayOrder]) VALUES (21, N'門市', N'http://119.14.169.10:83/images/mandy0130/m.jpg', 100, 13)
INSERT [dbo].[InfoGroupp] ([ig_id], [ig_name], [ig_pic], [ig_price], [DisplayOrder]) VALUES (22, N'清潔', N'http://119.14.169.10:83/images/mandy0130/n.jpg', 100, 14)
INSERT [dbo].[InfoGroupp] ([ig_id], [ig_name], [ig_pic], [ig_price], [DisplayOrder]) VALUES (23, N'照護', N'http://119.14.169.10:83/images/mandy0130/o.jpg', 100, 15)
INSERT [dbo].[InfoGroupp] ([ig_id], [ig_name], [ig_pic], [ig_price], [DisplayOrder]) VALUES (24, N'婚友', N'http://119.14.169.10:83/images/mandy0130/p.jpg', 100, 16)
INSERT [dbo].[InfoGroupp] ([ig_id], [ig_name], [ig_pic], [ig_price], [DisplayOrder]) VALUES (28, N'寵物', N'http://119.14.169.10:83/images/mandy0130/q.jpg', 100, 17)
INSERT [dbo].[InfoGroupp] ([ig_id], [ig_name], [ig_pic], [ig_price], [DisplayOrder]) VALUES (29, N'旅遊', N'http://119.14.169.10:83/images/mandy0130/r.jpg', 100, 18)
INSERT [dbo].[InfoGroupp] ([ig_id], [ig_name], [ig_pic], [ig_price], [DisplayOrder]) VALUES (30, N'二手', N'http://119.14.169.10:83/images/mandy0130/s.jpg', 100, 19)
INSERT [dbo].[InfoGroupp] ([ig_id], [ig_name], [ig_pic], [ig_price], [DisplayOrder]) VALUES (32, N'其他', N'http://119.14.169.10:83/images/mandy0130/t.jpg', 100, 20)
INSERT [dbo].[InfoGroupp] ([ig_id], [ig_name], [ig_pic], [ig_price], [DisplayOrder]) VALUES (33, N'餐廳', N'http://119.14.169.10:83/images/mandy0130/t.jpg', 200, 21)
INSERT [dbo].[InfoGroupp] ([ig_id], [ig_name], [ig_pic], [ig_price], [DisplayOrder]) VALUES (34, N'社群', N'http://119.14.169.10:83/images/mandy0130/t.jpg', 200, 22)
INSERT [dbo].[InfoGroupp] ([ig_id], [ig_name], [ig_pic], [ig_price], [DisplayOrder]) VALUES (35, N'社團', N'http://119.14.169.10:83/images/mandy0130/t.jpg', 200, 23)
SET IDENTITY_INSERT [dbo].[Infos] ON 

INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (22, N'a', N'testaa', CAST(N'2016-02-07 00:00:00.000' AS DateTime), CAST(N'2017-06-07 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 0, 100, 30, 100, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (23, N'郭記胡椒餅', N'埔心店新開募,免費吃一星期,3月份抽獎名單出爐了!請上facebook查看得獎名單', CAST(N'2016-02-08 00:00:00.000' AS DateTime), CAST(N'2017-06-08 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 30, 100, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (24, N'aa', N'bbbb', CAST(N'2016-03-09 00:00:00.000' AS DateTime), CAST(N'2017-07-09 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, N'50763565-cf17-48e2-b915-cb086b3a188a', 1, 100, 30, 100, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (25, N'2', N'6666', CAST(N'2016-03-09 00:00:00.000' AS DateTime), CAST(N'2017-07-09 00:00:00.000' AS DateTime), NULL, NULL, N'http://119.14.169.10:83/images/Mandy1/android.jpg', N'http://lorempixel.com/600/400/food/1', N'http://lorempixel.com/600/400/food/2', N'http://lorempixel.com/600/400/food/3', N'http://lorempixel.com/600/400/food/4', NULL, 12, N'50763565-cf17-48e2-b915-cb086b3a188a', 0, 100, 30, 100, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (26, N'王小姐', N'雙核雲電視盒客廳小電腦智能網路電視盒', CAST(N'2016-07-03 00:00:00.000' AS DateTime), CAST(N'2017-11-03 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, N'50763565-cf17-48e2-b915-cb086b3a188a', 0, 100, 60, 100, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (27, N'陳大器', N'新書發表會', CAST(N'2016-07-02 00:00:00.000' AS DateTime), CAST(N'2017-11-01 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 60, 100, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (36, N'董大偉', N'我的書最暢銷', CAST(N'2016-07-10 00:00:00.000' AS DateTime), CAST(N'2017-11-01 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 0, 100, 60, 100, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (53, N'王小姐11', N'雙核雲電視盒客廳小電腦智能網路電視盒', CAST(N'2016-07-03 00:00:00.000' AS DateTime), CAST(N'2017-11-03 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, N'50763565-cf17-48e2-b915-cb086b3a188a', 0, 100, 60, 100, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (54, N'aaaaa', N'bbbbbccccc', CAST(N'2016-10-11 18:17:34.013' AS DateTime), CAST(N'2018-01-18 18:17:34.013' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (55, N'6666', N'88888', CAST(N'2016-10-12 18:46:31.840' AS DateTime), CAST(N'2018-01-19 18:46:31.840' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (56, N'bbb', N'nnn', CAST(N'2016-10-15 08:59:35.230' AS DateTime), CAST(N'2018-01-22 08:59:35.230' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (58, N'大家好', N'今天天氣很不錯', CAST(N'2016-10-15 11:13:31.307' AS DateTime), CAST(N'2018-01-22 11:13:31.307' AS DateTime), NULL, NULL, N'http://119.14.169.10:83/images/Mandy1/android.jpg', NULL, NULL, NULL, NULL, N'http://www.popper.com.tw', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'http://line.me/ti/p/%40eqv1641v', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (59, N'小花走失，待善心人士尋回。a', N'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', CAST(N'2016-11-09 23:19:00.297' AS DateTime), CAST(N'2018-02-16 23:19:00.297' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'aaa', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'bbb', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (60, N'1110', N'11101110', CAST(N'2016-11-09 23:21:33.070' AS DateTime), CAST(N'2018-02-16 23:21:33.070' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'aa', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'bb', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (61, N'be', N'or not tobe', CAST(N'2016-11-09 23:29:41.187' AS DateTime), CAST(N'2018-02-16 23:29:41.187' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'55', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'66', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (62, N'test111001', N'test111001content', CAST(N'2016-11-09 23:36:09.007' AS DateTime), CAST(N'2018-02-16 23:36:09.007' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'2', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'3', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (63, N'aa', N'cc', CAST(N'2016-11-10 00:08:34.157' AS DateTime), CAST(N'2018-02-17 00:08:34.157' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'dd', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'ee', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (64, N'1111', N'5555', CAST(N'2016-11-10 13:20:04.397' AS DateTime), CAST(N'2018-02-17 13:20:04.397' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'2', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'5', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (65, N'1', N'3', CAST(N'2016-11-11 11:22:42.877' AS DateTime), CAST(N'2018-02-18 11:22:42.877' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'3', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'5', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (66, N'a', N'b', CAST(N'2016-11-11 18:56:02.193' AS DateTime), CAST(N'2018-02-18 18:56:02.193' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (67, N'2', N'3', CAST(N'2016-11-11 19:13:56.187' AS DateTime), CAST(N'2018-02-18 19:13:56.187' AS DateTime), NULL, NULL, N'E:\temp\ExerciseCompany\Magazine\MagazineVer45-28\MagazineVer1\pictures\a@b.c\110.gif', NULL, NULL, NULL, NULL, NULL, 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (68, N'2', N'3', CAST(N'2016-11-11 19:14:08.260' AS DateTime), CAST(N'2018-02-18 19:14:08.260' AS DateTime), NULL, NULL, N'E:\temp\ExerciseCompany\Magazine\MagazineVer45-28\MagazineVer1\pictures\a@b.c', NULL, NULL, NULL, NULL, N'2', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'33', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (69, N'vv', N'vvv', CAST(N'2016-11-11 19:17:29.383' AS DateTime), CAST(N'2018-02-18 19:17:29.383' AS DateTime), NULL, NULL, N'E:\temp\ExerciseCompany\Magazine\MagazineVer45-28\MagazineVer1\pictures\a@b.c\toe.png', NULL, NULL, NULL, NULL, NULL, 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (70, N'vv', N'vvv', CAST(N'2016-11-11 19:17:38.017' AS DateTime), CAST(N'2018-02-18 19:17:38.017' AS DateTime), NULL, NULL, N'E:\temp\ExerciseCompany\Magazine\MagazineVer45-28\MagazineVer1\pictures\a@b.c', NULL, NULL, NULL, NULL, N'v', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'vvv', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (71, N'2', N'5', CAST(N'2016-11-12 16:57:50.237' AS DateTime), CAST(N'2018-02-19 16:57:50.237' AS DateTime), NULL, NULL, N'E:\temp\ExerciseCompany\Magazine\MagazineVer45-28\MagazineVer1\pictures\a@b.c\toe.png', N'E:\temp\ExerciseCompany\Magazine\MagazineVer45-28\MagazineVer1\pictures\a@b.c\toe.png', NULL, NULL, NULL, N'8', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'0', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (72, N'2', N'4', CAST(N'2016-11-12 16:59:22.710' AS DateTime), CAST(N'2018-02-19 16:59:22.710' AS DateTime), NULL, NULL, N'E:\temp\ExerciseCompany\Magazine\MagazineVer45-28\MagazineVer1\pictures\a@b.c\house.jpg', N'E:\temp\ExerciseCompany\Magazine\MagazineVer45-28\MagazineVer1\pictures\a@b.c\house.jpg', NULL, NULL, NULL, N'6', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'8', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (73, N'2', N'4', CAST(N'2016-11-12 16:59:27.237' AS DateTime), CAST(N'2018-02-19 16:59:27.237' AS DateTime), NULL, NULL, N'E:\temp\ExerciseCompany\Magazine\MagazineVer45-28\MagazineVer1\pictures\a@b.c', NULL, NULL, NULL, NULL, N'6', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'8', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (74, N'111401', N'111402', CAST(N'2016-11-14 10:38:06.740' AS DateTime), CAST(N'2018-02-21 10:38:06.740' AS DateTime), NULL, NULL, N'E:\Culture1\pictures\a@b.c\110.gif', NULL, NULL, NULL, NULL, N'111403', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'111404', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (75, N'111411', N'111412', CAST(N'2016-11-14 11:25:00.237' AS DateTime), CAST(N'2018-02-21 11:25:00.237' AS DateTime), NULL, NULL, N'E:\Culture1\pictures\a@b.c\toe.png', NULL, NULL, NULL, NULL, N'111413', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'111414', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (76, N'111421', N'111422', CAST(N'2016-11-14 11:40:34.100' AS DateTime), CAST(N'2018-02-21 11:40:34.100' AS DateTime), NULL, NULL, N'E:\temp\ExerciseCompany\Magazine\MagazineVer45-31\MagazineVer1\pictures\a@b.c\finger.png', NULL, NULL, NULL, NULL, N'111423', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'111424', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (77, N'111471', N'111472', CAST(N'2016-11-14 12:33:12.223' AS DateTime), CAST(N'2018-02-21 12:33:12.223' AS DateTime), NULL, NULL, N'01.png', NULL, NULL, NULL, NULL, N'111473', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'111474', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (78, N'111481', N'111482', CAST(N'2016-11-14 12:38:37.670' AS DateTime), CAST(N'2018-02-21 12:38:37.670' AS DateTime), NULL, NULL, N'01.png', NULL, NULL, NULL, NULL, N'111483', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'111484', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (79, N'111491', N'111492', CAST(N'2016-11-14 12:44:40.243' AS DateTime), CAST(N'2018-02-21 12:44:40.243' AS DateTime), NULL, NULL, N'01.png', NULL, NULL, NULL, NULL, N'111493', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'111494', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (80, N'1114101', N'1114102', CAST(N'2016-11-14 12:57:54.227' AS DateTime), CAST(N'2018-02-21 12:57:54.227' AS DateTime), NULL, NULL, N'01.png', NULL, NULL, NULL, NULL, N'1114103', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'1114104', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (81, N'1114111', N'1114112', CAST(N'2016-11-14 13:06:36.167' AS DateTime), CAST(N'2018-02-21 13:06:36.167' AS DateTime), NULL, NULL, N'01.png', NULL, NULL, NULL, NULL, N'1114113', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'1114114', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (82, N'1114121', N'1114122', CAST(N'2016-11-14 13:24:02.597' AS DateTime), CAST(N'2018-02-21 13:24:02.597' AS DateTime), NULL, NULL, N'01.png', NULL, NULL, NULL, NULL, N'1114123', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'1114124', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (83, N'1114131', N'1114132', CAST(N'2016-11-14 13:31:31.957' AS DateTime), CAST(N'2018-02-21 13:31:31.957' AS DateTime), NULL, NULL, N'01.png', NULL, NULL, NULL, NULL, N'1114133', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'1114134', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (84, N'1114141', N'1114142', CAST(N'2016-11-14 13:40:23.323' AS DateTime), CAST(N'2018-02-21 13:40:23.323' AS DateTime), NULL, NULL, N'care1.png', NULL, NULL, NULL, NULL, N'1114143', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'1114145', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (85, N'1114151', N'1114152', CAST(N'2016-11-14 13:52:10.163' AS DateTime), CAST(N'2018-02-21 13:52:10.163' AS DateTime), NULL, NULL, N'greenhouse1.jpg', N'greenhouse5.jpg', NULL, NULL, NULL, N'1114153', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'1114155', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (87, N'666111421', N'666111422', CAST(N'2016-11-14 14:14:27.127' AS DateTime), CAST(N'2018-02-21 14:14:27.127' AS DateTime), NULL, NULL, N'greenhouse2.jpg', NULL, NULL, NULL, NULL, N'666111423', 28, N'bba52790-b244-423b-b002-caa5e337138d', 1, 100, 7, 100, N'666111424', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (88, N'6666111431', N'6666111432', CAST(N'2016-11-14 16:41:47.630' AS DateTime), CAST(N'2018-02-21 16:41:47.630' AS DateTime), NULL, NULL, N'a.jpg', N'b.jpg', N'c.jpg', N'd.jpg', N'e.jpg', N'6666111433', 28, N'bba52790-b244-423b-b002-caa5e337138d', 1, 100, 7, 100, N'6666111434', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (89, N'a1', N'a2', CAST(N'2016-11-17 16:21:00.857' AS DateTime), CAST(N'2018-02-24 16:21:00.857' AS DateTime), NULL, NULL, N'c.jpg', NULL, NULL, NULL, NULL, N'a3', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'a4', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (90, N'b1', N'b2', CAST(N'2016-11-17 16:24:42.943' AS DateTime), CAST(N'2018-02-24 16:24:42.943' AS DateTime), NULL, NULL, N'c.jpg', NULL, NULL, NULL, NULL, N'b3', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'b4', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (91, N'b1', N'b2', CAST(N'2016-11-17 16:25:42.590' AS DateTime), CAST(N'2018-02-24 16:25:42.590' AS DateTime), NULL, NULL, N'c.jpg', NULL, NULL, NULL, NULL, N'b3', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'b4', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (92, N'e1', N'e2', CAST(N'2016-11-17 17:30:56.837' AS DateTime), CAST(N'2018-02-24 17:30:56.837' AS DateTime), NULL, NULL, N'13012737_1091531210867903_7099599795583154946_n.jpg', NULL, NULL, NULL, NULL, NULL, 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 0, 100, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (93, N'f1', N'f2', CAST(N'2016-11-17 17:35:19.387' AS DateTime), CAST(N'2018-02-24 17:35:19.387' AS DateTime), NULL, NULL, N'13012737_1091531210867903_7099599795583154946_n.jpg', NULL, NULL, NULL, NULL, N'f3', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 14, 100, N'f4', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (94, N'aa1', N'aa2', CAST(N'2016-11-18 09:03:36.947' AS DateTime), CAST(N'2018-02-25 09:03:36.947' AS DateTime), NULL, NULL, N'Screenshot_2015-09-21-20-33-22.jpg', NULL, NULL, NULL, NULL, N'aa3', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'aa4', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (95, N'bb1', N'bb2', CAST(N'2016-11-18 09:06:25.257' AS DateTime), CAST(N'2018-02-25 09:06:25.257' AS DateTime), NULL, NULL, N'1479430610824.jpg', NULL, NULL, NULL, NULL, N'bb3', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'bb4', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (96, N'bbb1', N'bbb2', CAST(N'2016-11-18 11:12:21.203' AS DateTime), CAST(N'2018-02-25 11:12:21.203' AS DateTime), NULL, NULL, N'pin.jpg', NULL, NULL, NULL, NULL, N'bbb3', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 13, 100, N'bbb4', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (97, N'5551', N'5552', CAST(N'2016-11-18 19:04:22.200' AS DateTime), CAST(N'2018-02-25 19:04:22.200' AS DateTime), NULL, NULL, N'c.jpg', NULL, NULL, NULL, NULL, N'5553', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 15, 100, N'5554', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (98, N'661', N'662', CAST(N'2016-11-23 18:38:02.893' AS DateTime), CAST(N'2018-02-28 18:38:02.893' AS DateTime), NULL, NULL, N'pin.jpg', NULL, NULL, NULL, NULL, N'663', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 0, 100, N'664', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (99, N'771', N'772', CAST(N'2016-11-24 09:52:29.150' AS DateTime), CAST(N'2018-03-01 09:52:29.150' AS DateTime), NULL, NULL, N'android.jpg', NULL, NULL, NULL, NULL, N'773', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 13, 100, N'774', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (100, N'881', N'882', CAST(N'2016-11-24 10:55:45.853' AS DateTime), CAST(N'2018-03-01 10:55:45.853' AS DateTime), NULL, NULL, N'pin.jpg', NULL, NULL, NULL, NULL, N'883', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 13, 100, N'884', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (101, N'991', N'992', CAST(N'2016-11-24 10:59:02.587' AS DateTime), CAST(N'2018-03-01 10:59:02.587' AS DateTime), NULL, NULL, N'c.jpg', NULL, NULL, NULL, NULL, N'993', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 60, 100, N'994', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (102, N'2231', N'2232', CAST(N'2016-11-24 12:27:39.183' AS DateTime), CAST(N'2018-03-01 12:27:39.183' AS DateTime), NULL, NULL, N'c.jpg', NULL, NULL, NULL, NULL, N'2233', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 60, 100, N'2234', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (103, N'2231', N'2232', CAST(N'2016-11-24 12:27:41.113' AS DateTime), CAST(N'2018-03-01 12:27:41.113' AS DateTime), NULL, NULL, N'c.jpg', NULL, NULL, NULL, NULL, N'2233', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 60, 100, N'2234', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (104, N'001', N'002', CAST(N'2016-11-25 10:14:17.427' AS DateTime), CAST(N'2018-03-02 10:14:17.427' AS DateTime), NULL, NULL, N'android.jpg', NULL, NULL, NULL, NULL, N'003', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 60, 100, N'004', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (105, N'002', N'003', CAST(N'2016-11-25 11:04:24.500' AS DateTime), CAST(N'2018-03-02 11:04:24.500' AS DateTime), NULL, NULL, N'greenhouse2.jpg', NULL, NULL, NULL, NULL, N'004', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 60, 100, N'005', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (106, N'551', N'552', CAST(N'2016-11-26 13:51:54.967' AS DateTime), CAST(N'2018-03-03 13:51:54.967' AS DateTime), NULL, NULL, N'h20161124636155615023408373.jpg', NULL, NULL, NULL, NULL, N'553', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 60, 100, N'554', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (107, N'661', N'662', CAST(N'2016-11-26 13:54:49.253' AS DateTime), CAST(N'2018-03-03 13:54:49.253' AS DateTime), NULL, NULL, N'photo3.jpg', NULL, NULL, NULL, NULL, N'663', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'664', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (108, N'9991', N'9992', CAST(N'2016-11-26 14:00:09.223' AS DateTime), CAST(N'2018-03-03 14:00:09.223' AS DateTime), NULL, NULL, N'c.jpg', NULL, NULL, NULL, NULL, N'9993', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 60, 100, N'9994', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (109, N'uu1', N'uu2', CAST(N'2016-11-26 14:15:14.653' AS DateTime), CAST(N'2018-03-03 14:15:14.653' AS DateTime), NULL, NULL, N'1480140853597.jpg', NULL, NULL, NULL, NULL, N'uu3', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 60, 100, N'uu4', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (110, N'88991', N'88992', CAST(N'2016-11-28 10:01:16.477' AS DateTime), CAST(N'2018-03-05 10:01:16.477' AS DateTime), NULL, NULL, N'13012737_1091531210867903_7099599795583154946_n.jpg', NULL, NULL, NULL, NULL, N'88993', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'88994', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (111, N'88991', N'88992', CAST(N'2016-11-28 10:08:40.710' AS DateTime), CAST(N'2018-03-05 10:08:40.710' AS DateTime), NULL, NULL, N'13012737_1091531210867903_7099599795583154946_n.jpg', NULL, NULL, NULL, NULL, N'88993', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'88994', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (112, N'dd1', N'dd2', CAST(N'2016-11-28 15:01:25.807' AS DateTime), CAST(N'2018-03-05 15:01:25.807' AS DateTime), NULL, NULL, N'13012737_1091531210867903_7099599795583154946_n.jpg', NULL, NULL, NULL, NULL, N'dd3', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'dd4', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (113, N'691', N'692', CAST(N'2016-11-28 15:15:06.470' AS DateTime), CAST(N'2018-03-05 15:15:06.470' AS DateTime), NULL, NULL, N'13012737_1091531210867903_7099599795583154946_n.jpg', NULL, NULL, NULL, NULL, N'693', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 60, 100, N'694', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (114, N'6661', N'6662', CAST(N'2016-11-28 15:28:20.247' AS DateTime), CAST(N'2018-03-05 15:28:20.247' AS DateTime), NULL, NULL, N'13012737_1091531210867903_7099599795583154946_n.jpg', NULL, NULL, NULL, NULL, N'6663', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 60, 100, N'6664', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (115, N'5661', N'5662', CAST(N'2016-11-28 17:38:59.603' AS DateTime), CAST(N'2018-03-05 17:38:59.603' AS DateTime), NULL, NULL, N'13012737_1091531210867903_7099599795583154946_n.jpg', NULL, NULL, NULL, NULL, N'5663', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'5664', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (116, N'5551', N'5552', CAST(N'2016-11-28 17:41:51.760' AS DateTime), CAST(N'2018-03-05 17:41:51.760' AS DateTime), NULL, NULL, N'13012737_1091531210867903_7099599795583154946_n.jpg', NULL, NULL, NULL, NULL, N'5553', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'5554', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (117, N'5551', N'5552', CAST(N'2016-11-28 17:42:16.297' AS DateTime), CAST(N'2018-03-05 17:42:16.297' AS DateTime), NULL, NULL, N'13012737_1091531210867903_7099599795583154946_n.jpg', NULL, NULL, NULL, NULL, N'5553', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'5554', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (118, N'1191', N'1192', CAST(N'2016-11-28 17:55:46.903' AS DateTime), CAST(N'2018-03-05 17:55:46.903' AS DateTime), NULL, NULL, N'13012737_1091531210867903_7099599795583154946_n.jpg', NULL, NULL, NULL, NULL, N'1193', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'1194', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (119, N'1191', N'1192', CAST(N'2016-11-28 17:56:09.603' AS DateTime), CAST(N'2018-03-05 17:56:09.603' AS DateTime), NULL, NULL, N'c.jpg', NULL, NULL, NULL, NULL, N'1193', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'1194', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (120, N'5551', N'5552', CAST(N'2016-11-29 12:40:18.780' AS DateTime), CAST(N'2018-03-06 12:40:18.780' AS DateTime), NULL, NULL, N'13012737_1091531210867903_7099599795583154946_n.jpg', NULL, NULL, NULL, NULL, N'5553', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'5554', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (121, N'8881', N'8882', CAST(N'2016-11-30 07:01:35.937' AS DateTime), CAST(N'2018-03-07 07:01:35.937' AS DateTime), NULL, NULL, N'13012737_1091531210867903_7099599795583154946_n.jpg', NULL, NULL, NULL, NULL, N'8883', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'8884', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (122, N'bb1', N'bb2', CAST(N'2016-11-30 13:02:45.133' AS DateTime), CAST(N'2018-03-07 13:02:45.133' AS DateTime), N'新北市', NULL, N'13012737_1091531210867903_7099599795583154946_n.jpg', NULL, NULL, NULL, NULL, N'bb3', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'bb4', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (123, N'591', N'592', CAST(N'2016-11-30 13:15:10.083' AS DateTime), CAST(N'2018-03-07 13:15:10.083' AS DateTime), N'新北市', NULL, N'13012737_1091531210867903_7099599795583154946_n.jpg', NULL, NULL, NULL, NULL, N'593', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'594', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (124, N'7771', N'7772', CAST(N'2016-11-30 22:26:17.473' AS DateTime), CAST(N'2018-03-07 22:26:17.473' AS DateTime), N'宜蘭縣', NULL, N'13012737_1091531210867903_7099599795583154946_n.jpg', NULL, NULL, NULL, NULL, N'7773', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'7774', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (128, N'25481', N'25482', CAST(N'2016-12-07 17:22:30.083' AS DateTime), CAST(N'2018-03-14 17:22:30.083' AS DateTime), N'臺中市', NULL, N'13012737_1091531210867903_7099599795583154946_n.jpg', NULL, NULL, NULL, NULL, N'25483', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'25484', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (129, N'1991', N'1992', CAST(N'2016-12-07 17:33:34.903' AS DateTime), CAST(N'2018-03-14 17:33:34.903' AS DateTime), N'宜蘭縣', NULL, N'13012737_1091531210867903_7099599795583154946_n.jpg', NULL, NULL, NULL, NULL, N'1993', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'1994', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (130, N'20161', N'20162', CAST(N'2016-12-07 17:44:29.540' AS DateTime), CAST(N'2018-03-14 17:44:29.540' AS DateTime), N'新竹縣', NULL, N'13012737_1091531210867903_7099599795583154946_n.jpg', NULL, NULL, NULL, NULL, N'20163', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'20164', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (131, N'2221', N'2222', CAST(N'2016-12-08 00:10:05.287' AS DateTime), CAST(N'2018-03-15 00:10:05.287' AS DateTime), N'宜蘭縣', NULL, N'13012737_1091531210867903_7099599795583154946_n.jpg', NULL, NULL, NULL, NULL, N'2223', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'2224', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (132, N'1831', N'1832', CAST(N'2016-12-08 00:20:08.290' AS DateTime), CAST(N'2018-03-15 00:20:08.290' AS DateTime), N'宜蘭縣', NULL, N'13012737_1091531210867903_7099599795583154946_n.jpg', NULL, NULL, NULL, NULL, N'1833', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'1834', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (133, N'2001', N'2002', CAST(N'2016-12-08 00:29:18.403' AS DateTime), CAST(N'2018-03-15 00:29:18.403' AS DateTime), N'宜蘭縣', NULL, N'13012737_1091531210867903_7099599795583154946_n.jpg', NULL, NULL, NULL, NULL, N'2003', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'2004', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (134, N'19951', N'19952', CAST(N'2016-12-08 00:39:04.563' AS DateTime), CAST(N'2018-03-15 00:39:04.563' AS DateTime), N'宜蘭縣', NULL, N'13012737_1091531210867903_7099599795583154946_n.jpg', NULL, NULL, NULL, NULL, N'19953', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'19954', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (135, N'231', N'232', CAST(N'2016-12-08 13:14:22.863' AS DateTime), CAST(N'2018-03-15 13:14:22.863' AS DateTime), N'宜蘭縣', N'員山', N'13012737_1091531210867903_7099599795583154946_n.jpg', NULL, NULL, NULL, NULL, N'233', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'234', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (136, N'5551', N'5552', CAST(N'2016-12-08 13:30:13.283' AS DateTime), CAST(N'2018-03-15 13:30:13.283' AS DateTime), N'宜蘭縣', N'員山', N'13012737_1091531210867903_7099599795583154946_n.jpg', NULL, NULL, NULL, NULL, N'5553', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'5554', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (137, N'7771', N'7772', CAST(N'2016-12-08 13:39:53.463' AS DateTime), CAST(N'2018-03-15 13:39:53.463' AS DateTime), N'宜蘭縣', N'員山', N'13012737_1091531210867903_7099599795583154946_n.jpg', NULL, NULL, NULL, NULL, N'7773', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'7774', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (138, N'1111', N'1112', CAST(N'2016-12-08 15:46:21.593' AS DateTime), CAST(N'2018-03-15 15:46:21.593' AS DateTime), N'宜蘭縣', N'員山', N'13012737_1091531210867903_7099599795583154946_n.jpg', NULL, NULL, NULL, NULL, N'1113', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'1114', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (139, N'5661', N'5662', CAST(N'2016-12-08 16:10:55.487' AS DateTime), CAST(N'2018-03-15 16:10:55.487' AS DateTime), N'宜蘭縣', N'員山', N'13012737_1091531210867903_7099599795583154946_n.jpg', NULL, NULL, NULL, NULL, N'5663', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'5664', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (140, N'11111', N'11112', CAST(N'2016-12-13 13:59:19.087' AS DateTime), CAST(N'2018-03-20 13:59:19.087' AS DateTime), N'宜蘭縣', N'員山', N'13012737_1091531210867903_7099599795583154946_n.jpg', NULL, NULL, NULL, NULL, N'11113', 28, N'ac997e01-c355-4042-9254-163a2ffda1cc', 1, 100, 7, 100, N'11114', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (141, N'可愛狗狗出售', N'來就送可愛狗衣一件', CAST(N'2016-12-14 09:24:30.557' AS DateTime), CAST(N'2018-03-21 09:24:30.557' AS DateTime), N'桃園市', N'八德區', N'a.png', NULL, NULL, NULL, NULL, N'http://www.popper.com.tw', 28, N'c65d50a1-02f2-466d-86dc-5242fac6ac26', 1, 100, 7, 100, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (142, N'gold一條', N'出售(99.99%純金)', CAST(N'2016-12-15 16:26:44.323' AS DateTime), CAST(N'2018-03-22 16:26:44.323' AS DateTime), N'宜蘭縣', N'員山', N'商店問與答.png', NULL, NULL, NULL, NULL, N'http://www.popfamily.com.tw', 28, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'http://line.me/ti/p/PwnnbA6xJG', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (143, N'南福街咖啡店新開幕', N'12月底起買一送一至農歷新年', CAST(N'2016-12-16 10:05:29.777' AS DateTime), CAST(N'2018-03-23 10:05:29.777' AS DateTime), N'宜蘭縣', N'員山', N'eat.png', NULL, NULL, NULL, NULL, N'www.google.com.tw', 28, N'ffe3af90-70c7-43b8-a700-d8ef6028f886', 1, 100, 7, 100, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (144, N'222', N'2222', CAST(N'2016-12-16 11:18:21.537' AS DateTime), CAST(N'2018-03-23 11:18:21.537' AS DateTime), N'宜蘭縣', N'員山', N'eat.png', NULL, NULL, NULL, NULL, N'22222', 28, N'ffe3af90-70c7-43b8-a700-d8ef6028f886', 1, 100, 7, 100, N'222222', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (145, N'111', N'112', CAST(N'2016-12-16 12:43:48.560' AS DateTime), CAST(N'2018-03-23 12:43:48.560' AS DateTime), N'桃園市', N'八德區', N'gounfon.png', NULL, NULL, NULL, NULL, N'113', 28, N'ffe3af90-70c7-43b8-a700-d8ef6028f886', 1, 100, 7, 100, N'114', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (146, N'2221', N'2222', CAST(N'2016-12-16 13:59:00.267' AS DateTime), CAST(N'2018-03-23 13:59:00.267' AS DateTime), N'宜蘭縣', N'員山', N'eat.png', NULL, NULL, NULL, NULL, N'2223', 9, N'ffe3af90-70c7-43b8-a700-d8ef6028f886', 1, 100, 7, 100, N'2224', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (147, N'3331', N'3332', CAST(N'2016-12-16 14:57:20.320' AS DateTime), CAST(N'2018-03-23 14:57:20.320' AS DateTime), N'宜蘭縣', N'員山', N'eat.png', NULL, NULL, NULL, NULL, N'3333', 9, N'ffe3af90-70c7-43b8-a700-d8ef6028f886', 1, 100, 7, 100, N'3334', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (148, N'4441', N'4442', CAST(N'2016-12-16 15:19:53.773' AS DateTime), CAST(N'2018-03-23 15:19:53.773' AS DateTime), N'宜蘭縣', N'員山', N'eat.png', NULL, NULL, NULL, NULL, N'4443', 9, N'ffe3af90-70c7-43b8-a700-d8ef6028f886', 1, 100, 7, 100, N'4444', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (149, N'5551', N'5552', CAST(N'2016-12-16 15:30:51.677' AS DateTime), CAST(N'2018-03-23 15:30:51.677' AS DateTime), N'宜蘭縣', N'員山', N'eat.png', NULL, NULL, NULL, NULL, N'5553', 9, N'ffe3af90-70c7-43b8-a700-d8ef6028f886', 1, 100, 7, 100, N'5554', 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (150, N'5551', N'5552', CAST(N'2016-12-16 15:36:50.130' AS DateTime), CAST(N'2018-03-23 15:36:50.130' AS DateTime), N'宜蘭縣', N'員山', N'eat.png', NULL, NULL, NULL, NULL, N'5553', 9, N'ffe3af90-70c7-43b8-a700-d8ef6028f886', 1, 100, 7, 100, N'5554', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (151, N'88881', N'88882', CAST(N'2016-12-16 18:34:35.440' AS DateTime), CAST(N'2018-03-23 18:34:35.440' AS DateTime), N'宜蘭縣', N'員山', N'eat.png', NULL, NULL, NULL, NULL, N'88883', 9, N'ffe3af90-70c7-43b8-a700-d8ef6028f886', 1, 100, 7, 100, N'88884', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (152, N'11', N'22', CAST(N'2016-12-17 10:37:40.443' AS DateTime), CAST(N'2018-03-24 10:37:40.443' AS DateTime), N'桃園市', N'中壢區', N'P_20161216_220306.jpg', NULL, NULL, NULL, NULL, N'33', 9, N'ffe3af90-70c7-43b8-a700-d8ef6028f886', 1, 100, 7, 100, N'44', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (153, N'冬至吃湯圓', N'免費湯圓請至大廳領取', CAST(N'2016-12-19 17:12:57.173' AS DateTime), CAST(N'2018-03-26 17:12:57.173' AS DateTime), N'桃園市', N'蘆竹區', N'ddd.png', NULL, NULL, NULL, NULL, N'http://www.yahoo.com.tw', 1, N'ffe3af90-70c7-43b8-a700-d8ef6028f886', 1, 100, 7, 100, N'http://line.me/ti/p/PwnnbA6xJG', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (154, N'到府家教', N'各類專業科目皆有優良師資可供輔導', CAST(N'2016-12-19 17:48:13.480' AS DateTime), CAST(N'2018-03-26 17:48:13.480' AS DateTime), N'桃園市', N'蘆竹區', N'100.png', NULL, NULL, NULL, NULL, N'http://www.pchome.com.tw', 16, N'ffe3af90-70c7-43b8-a700-d8ef6028f886', 1, 100, 7, 100, N'http://line.me/ti/p/PwnnbA6xJG', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (155, N'11123', N'Uuuuuu', CAST(N'2016-12-22 18:32:24.877' AS DateTime), CAST(N'2018-03-29 18:32:24.877' AS DateTime), N'桃園市', N'中壢區', N'3496887i.jpeg', NULL, NULL, NULL, NULL, NULL, 9, N'ffe3af90-70c7-43b8-a700-d8ef6028f886', 1, 100, 7, 100, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (156, N'Qqqqq', N'Yuyyy', CAST(N'2016-12-22 18:33:28.200' AS DateTime), CAST(N'2018-03-29 18:33:28.200' AS DateTime), N'新北市', N'萬里區', N'IMG_57958256543351.jpeg', NULL, NULL, NULL, NULL, NULL, 9, N'ffe3af90-70c7-43b8-a700-d8ef6028f886', 1, 100, 7, 100, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (157, N'2', N'3', CAST(N'2016-12-27 10:10:23.243' AS DateTime), CAST(N'2017-04-03 10:10:23.243' AS DateTime), N'桃園市', N'蘆竹區', N'002.jpg', NULL, NULL, NULL, NULL, N'4', 1, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'5', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (158, N'We', N'Are', CAST(N'2016-12-27 10:23:59.777' AS DateTime), CAST(N'2017-04-03 10:23:59.777' AS DateTime), N'桃園市', N'八德區', N'm_8.jpg', NULL, NULL, NULL, NULL, N'http://www.popper.com.tw', 1, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'The world', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (159, N'10301', N'10302', CAST(N'2016-12-27 10:31:42.657' AS DateTime), CAST(N'2017-04-03 10:31:42.657' AS DateTime), N'桃園市', N'蘆竹區', N'gounfon.png', NULL, NULL, NULL, NULL, N'http://www.popper.com.tw', 32, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'10303', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (160, N'10421', N'10422', CAST(N'2016-12-27 10:43:09.633' AS DateTime), CAST(N'2017-04-03 10:43:09.633' AS DateTime), N'桃園市', N'蘆竹區', N'gounfon.png', NULL, NULL, NULL, NULL, N'http://www.pchome.com.tw', 32, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'10423', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (161, N'1046ev', N'1046ev2', CAST(N'2016-12-27 10:48:24.577' AS DateTime), CAST(N'2017-04-03 10:48:24.577' AS DateTime), N'桃園市', N'中壢區', N'c20101125_maritan_01_o_.png', NULL, NULL, NULL, NULL, N'10463', 32, N'ffe3af90-70c7-43b8-a700-d8ef6028f886', 1, 100, 7, 100, N'10464', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (162, N'1051j1', N'1051j2', CAST(N'2016-12-27 10:54:26.210' AS DateTime), CAST(N'2017-04-03 10:54:26.210' AS DateTime), N'桃園市', N'中壢區', N'Screenshot_20160617-124439.png', NULL, NULL, NULL, NULL, N'1051j3', 32, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'1051j4', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (163, N'12191', N'12192', CAST(N'2016-12-27 12:20:48.463' AS DateTime), CAST(N'2017-04-03 12:20:48.463' AS DateTime), N'桃園市', N'蘆竹區', N'2.jpg', NULL, NULL, NULL, NULL, N'http://www.popper.com.tw', 32, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'www', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (164, N'捷乘歡迎', N'2017桃園跨年晚會', CAST(N'2016-12-27 12:55:19.690' AS DateTime), CAST(N'2017-04-03 12:55:19.690' AS DateTime), N'桃園市', N'桃園區', N'a.png', NULL, NULL, NULL, NULL, N'http://www.nye2017.tycg.gov.tw/', 9, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'http://line.me/ti/p/PwnnbA6xJG', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (165, N'Ggyy', N'Bbbbbbbbbb', CAST(N'2016-12-27 14:25:20.477' AS DateTime), CAST(N'2017-04-03 14:25:20.477' AS DateTime), N'桃園市', N'中壢區', N'image.jpeg', NULL, NULL, NULL, NULL, NULL, 1, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (166, N'14371', N'14372', CAST(N'2016-12-27 14:38:01.977' AS DateTime), CAST(N'2017-04-03 14:38:01.977' AS DateTime), N'桃園市', N'蘆竹區', N'100.png', NULL, NULL, NULL, NULL, N'http://www.pchome.com.tw', 16, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'5554', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (1157, N'011014551', N'011014552', CAST(N'2017-01-10 14:58:52.807' AS DateTime), CAST(N'2017-04-17 14:58:52.807' AS DateTime), N'桃園市', N'蘆竹區', N'android.jpg', NULL, NULL, NULL, NULL, N'http://www.louisacoffee.com.tw', 11, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (1159, N'1723', N'17231', CAST(N'2017-01-10 17:24:12.733' AS DateTime), CAST(N'2017-04-17 17:24:12.733' AS DateTime), N'桃園市', N'蘆竹區', N'aa.jpg', NULL, NULL, NULL, NULL, N'17233', 11, N'09e15f3e-412b-4707-912b-4d5fdd8aaa6a', 1, 100, 7, 100, N'17234', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (1160, N'121', N'122', CAST(N'2017-01-10 18:19:34.590' AS DateTime), CAST(N'2017-04-17 18:19:34.590' AS DateTime), N'桃園市', N'蘆竹區', N'aa.jpg', NULL, NULL, NULL, NULL, N'121', 11, N'09e15f3e-412b-4707-912b-4d5fdd8aaa6a', 1, 100, 7, 100, N'121', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (1161, N'1212', N'12313', CAST(N'2017-01-10 18:26:07.647' AS DateTime), CAST(N'2017-04-17 18:26:07.647' AS DateTime), N'桃園市', N'蘆竹區', N'aa.jpg', NULL, NULL, NULL, NULL, N'1234', 11, N'09e15f3e-412b-4707-912b-4d5fdd8aaa6a', 1, 100, 7, 100, N'1234', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (1162, N'12345', N'12345', CAST(N'2017-01-11 15:05:12.857' AS DateTime), CAST(N'2017-04-18 15:05:12.857' AS DateTime), N'桃園市', N'蘆竹區', N'aa.jpg', NULL, NULL, NULL, NULL, N'12345', 11, N'09e15f3e-412b-4707-912b-4d5fdd8aaa6a', 1, 100, 7, 100, N'12345', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (1163, N'1658', N'16582', CAST(N'2017-01-13 17:04:15.767' AS DateTime), CAST(N'2017-04-20 17:04:15.767' AS DateTime), N'桃園市', N'蘆竹區', N'android.jpg', NULL, NULL, NULL, NULL, N'http://www.yahoo.com.tw', 11, N'09e15f3e-412b-4707-912b-4d5fdd8aaa6a', 1, 100, 7, 100, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (1164, N'1234555', N'1234556', CAST(N'2017-01-14 16:33:34.980' AS DateTime), CAST(N'2017-04-21 16:33:34.980' AS DateTime), N'桃園市', N'蘆竹區', N'android.jpg', NULL, NULL, NULL, NULL, N'1234', 11, N'09e15f3e-412b-4707-912b-4d5fdd8aaa6a', 1, 100, 7, 100, N'1234', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (1165, N'12345', N'12345', CAST(N'2017-01-16 17:28:09.073' AS DateTime), CAST(N'2017-04-23 17:28:09.073' AS DateTime), N'桃園市', N'蘆竹區', N'android.jpg', NULL, NULL, NULL, NULL, N'12345', 11, N'09e15f3e-412b-4707-912b-4d5fdd8aaa6a', 1, 100, 7, 100, N'12345', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (1166, N'12345', N'12345', CAST(N'2017-01-16 18:06:57.710' AS DateTime), CAST(N'2017-04-23 18:06:57.710' AS DateTime), N'桃園市', N'蘆竹區', N'android.jpg', NULL, NULL, NULL, NULL, N'13245', 11, N'09e15f3e-412b-4707-912b-4d5fdd8aaa6a', 1, 100, 7, 100, N'12345', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (1167, N'12345', N'123435', CAST(N'2017-01-17 23:08:50.440' AS DateTime), CAST(N'2017-04-24 23:08:50.440' AS DateTime), N'桃園市', N'蘆竹區', N'android.jpg', NULL, NULL, NULL, NULL, N'1234', 11, N'09e15f3e-412b-4707-912b-4d5fdd8aaa6a', 1, 100, 7, 100, N'1234', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (1168, N'12345', N'12345', CAST(N'2017-01-17 23:15:48.837' AS DateTime), CAST(N'2017-04-24 23:15:48.837' AS DateTime), N'桃園市', N'蘆竹區', N'android.jpg', NULL, NULL, NULL, NULL, N'12345', 11, N'09e15f3e-412b-4707-912b-4d5fdd8aaa6a', 1, 100, 7, 100, N'12345', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (1169, N'ㄓ12345', N'12345', CAST(N'2017-01-17 23:25:20.860' AS DateTime), CAST(N'2017-04-24 23:25:20.860' AS DateTime), N'桃園市', N'蘆竹區', N'android.jpg', NULL, NULL, NULL, NULL, N'13265', 9, N'09e15f3e-412b-4707-912b-4d5fdd8aaa6a', 1, 100, 7, 100, N'1235', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (1170, N'okk', N'okkkk', CAST(N'2017-01-18 00:11:04.657' AS DateTime), CAST(N'2017-04-25 00:11:04.657' AS DateTime), N'桃園市', N'蘆竹區', N'android.jpg', NULL, NULL, NULL, NULL, N'okkkk', 11, N'09e15f3e-412b-4707-912b-4d5fdd8aaa6a', 1, 100, 7, 100, N'okkkkk', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (1171, N'18091', N'18092', CAST(N'2017-01-18 18:11:24.033' AS DateTime), CAST(N'2017-04-25 18:11:24.033' AS DateTime), N'桃園市', N'蘆竹區', N'android.jpg', NULL, NULL, NULL, NULL, N'12345', 17, N'09e15f3e-412b-4707-912b-4d5fdd8aaa6a', 1, 100, 7, 100, N'12345', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (1172, N'13361', N'13362', CAST(N'2017-02-03 13:38:13.060' AS DateTime), CAST(N'2017-05-10 13:38:13.060' AS DateTime), N'桃園市', N'蘆竹區', N'ab.png', NULL, NULL, NULL, NULL, N'http://www.popper.com.tw', 1, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (1173, N'17331', N'17332', CAST(N'2017-02-03 17:34:29.377' AS DateTime), CAST(N'2017-05-10 17:34:29.377' AS DateTime), N'桃園市', N'蘆竹區', N'c.jpg', NULL, NULL, NULL, NULL, N'17333', 17, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'17334', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (1174, N'a', N'b', CAST(N'2017-02-07 08:44:55.713' AS DateTime), CAST(N'2017-05-14 08:44:55.713' AS DateTime), N'桃園市', N'蘆竹區', N'c.jpg', NULL, NULL, NULL, NULL, N'c', 1, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'd', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (1175, N'租屋代管', N'民國106年草案試辦', CAST(N'2017-02-09 08:51:22.240' AS DateTime), CAST(N'2017-05-16 08:51:22.240' AS DateTime), N'桃園市', N'中壢區', N'ab.png', NULL, NULL, NULL, NULL, N'a', 3, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'b', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (1176, N'09271', N'09272', CAST(N'2017-02-09 09:30:34.380' AS DateTime), CAST(N'2017-05-16 09:30:34.380' AS DateTime), N'桃園市', N'蘆竹區', N'flowerRose.png', NULL, NULL, NULL, NULL, N'09273', 24, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'09274', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (1177, N'09361', N'09362', CAST(N'2017-02-09 09:37:29.533' AS DateTime), CAST(N'2017-05-16 09:37:29.533' AS DateTime), N'桃園市', N'中壢區', N'images-1.jpeg', NULL, NULL, NULL, NULL, N'http://www.popper.com.tw', 23, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'A', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (1178, N'09581', N'09582', CAST(N'2017-02-09 09:59:57.073' AS DateTime), CAST(N'2017-05-16 09:59:57.073' AS DateTime), N'桃園市', N'中壢區', N'P_20161207_183322.jpg', NULL, NULL, NULL, NULL, N'http://www.popper.com.tw', 11, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'E', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (1179, N'14061', N'14062', CAST(N'2017-02-09 14:07:37.757' AS DateTime), CAST(N'2017-05-16 14:07:37.757' AS DateTime), N'桃園市', N'中壢區', N'images-2.jpeg', NULL, NULL, NULL, NULL, N'1', 23, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'2', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (1180, N'14131', N'14132', CAST(N'2017-02-23 14:14:19.663' AS DateTime), CAST(N'2017-06-02 14:14:19.663' AS DateTime), N'桃園市', N'中壢區', N'ab.png', NULL, NULL, NULL, NULL, N'14133', 16, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'14134', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (1181, N'吳老師', N'監督', CAST(N'2017-02-23 14:27:52.333' AS DateTime), CAST(N'2017-06-02 14:27:52.333' AS DateTime), N'桃園市', N'中壢區', N'snap2825.jpg', NULL, NULL, NULL, NULL, N'http://www.popper.com.tw', 16, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'14272', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (1182, N'20170311', N'文章20170311', CAST(N'2017-03-11 09:31:31.993' AS DateTime), CAST(N'2017-06-18 09:31:31.993' AS DateTime), N'桃園市', N'蘆竹區', N'1.jpg', NULL, NULL, NULL, NULL, N'http://www.popper.com.tw:93', 9, N'1cdcf753-733c-4e12-9d2b-7f8ef5022dc3', 1, 100, 7, 100, N'https://zh-tw.facebook.com/%E5%90%89%E6%A9%99%E5%9C%8B%E9%9A%9B%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8-707133676023874/', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (1184, N'201703111025', N'1025驗收', CAST(N'2017-03-11 10:27:30.583' AS DateTime), CAST(N'2017-06-18 10:27:30.583' AS DateTime), N'桃園市', N'蘆竹區', N'^0BA41C8E99095049BD6EF1C9627E37D1EBFE7A1B561492D5D1^pimgpsh_fullsize_distr.jpg', NULL, NULL, NULL, NULL, N'http://www.popper.com.tw', 20, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'qq', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (1185, N'201703111040', N'1040文章', CAST(N'2017-03-11 10:45:43.853' AS DateTime), CAST(N'2017-06-18 10:45:43.853' AS DateTime), N'桃園市', N'蘆竹區', N'1.jpg', NULL, NULL, NULL, NULL, N'http://www.popper.com.tw', 9, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'www', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (1186, N'租屋訊息', N'可日租', CAST(N'2017-03-31 14:11:09.173' AS DateTime), CAST(N'2017-07-07 14:11:09.173' AS DateTime), N'桃園市', N'蘆竹區', N'2017010501.png', NULL, NULL, NULL, NULL, N'www.google.com.tw', 3, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, N'http://line.me/ti/p/PwnnbA6xJG', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (1187, N'二手車買賣', N'10年二手車,車況佳', CAST(N'2017-04-17 16:37:48.540' AS DateTime), CAST(N'2017-07-24 16:37:48.540' AS DateTime), N'桃園市', N'八德區', N'2.jpg', NULL, NULL, NULL, NULL, N'https://www.toyota.com.tw/sh/', 30, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (2187, N'4個', N'4個喔', CAST(N'2017-05-20 14:50:58.957' AS DateTime), CAST(N'2017-08-27 14:50:58.957' AS DateTime), N'桃園市', N'八德區', N'1.jpg', N'2.jpg', N'3.png', N'4.png', NULL, N'1', 16, N'1cdcf753-733c-4e12-9d2b-7f8ef5022dc3', 1, 100, 7, 100, N'2', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (2188, N'慶祝端午節,肉粽買一送一', N'買一粒北部粽,送一粒南部粽', CAST(N'2017-05-20 16:24:36.107' AS DateTime), CAST(N'2017-08-27 16:24:36.107' AS DateTime), N'桃園市', N'八德區', N'zone.png', NULL, NULL, NULL, NULL, N'http://www.popper.com.tw', 21, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (2189, N'a', N'b', CAST(N'2017-05-28 15:20:27.903' AS DateTime), CAST(N'2017-09-04 15:20:27.903' AS DateTime), N'桃園市', N'八德區', N'2.jpg', N'3.png', N'4.png', NULL, NULL, N'abcde', 4, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Infos] ([i_id], [i_name], [i_content], [i_initial_day], [i_expired_day], [i_location1], [i_location2], [i_pic1], [i_pic2], [i_pic3], [i_pic4], [i_pic5], [i_URL], [ig_id], [u_id], [i_unconfirm], [ip_discount], [ip_days], [bill], [i_LINE], [i_open], [or_number], [i_create_datetime], [i_probation], [i_formal_period]) VALUES (2191, N'TestPIC', N'TESTPIC', CAST(N'2017-06-02 11:49:33.810' AS DateTime), CAST(N'2017-09-09 11:49:33.810' AS DateTime), N'桃園市', N'八德區', N'http://119.14.169.10:83/images/Mandy1/android.jpg', N'http://lorempixel.com/600/400/food/1', N'http://lorempixel.com/600/400/food/2', N'http://lorempixel.com/600/400/food/3', N'http://lorempixel.com/600/400/food/4', N'http://www.popper.com.tw', 16, N'0be60609-08d8-4211-ad64-dd2ae169eedc', 1, 100, 7, 100, NULL, 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Infos] OFF
SET IDENTITY_INSERT [dbo].[InvoiceType] ON 

INSERT [dbo].[InvoiceType] ([inv_id], [inv_type], [inv_description]) VALUES (1, N'2', N'二聯式')
INSERT [dbo].[InvoiceType] ([inv_id], [inv_type], [inv_description]) VALUES (2, N'3', N'三聯式')
SET IDENTITY_INSERT [dbo].[InvoiceType] OFF
INSERT [dbo].[P_InfoPrice] ([ip_id], [ip_name], [ip_discount], [ip_days]) VALUES (1, N'一週', 100, 7)
INSERT [dbo].[P_InfoPrice] ([ip_id], [ip_name], [ip_discount], [ip_days]) VALUES (13, N'兩個月', 90, 60)
INSERT [dbo].[P_InfoPrice] ([ip_id], [ip_name], [ip_discount], [ip_days]) VALUES (14, N'兩週', 100, 14)
INSERT [dbo].[P_InfoPrice] ([ip_id], [ip_name], [ip_discount], [ip_days]) VALUES (15, N'三週', 100, 21)
INSERT [dbo].[sales] ([s_id], [s_day], [i_day], [i_expired_day], [bill], [ip_discount], [i_name], [i_content], [ip_days], [u_name], [u_mail], [u_phone], [u_id], [belongto], [ifout], [invoice_code]) VALUES (52, CAST(N'2015-08-03 00:00:00.000' AS DateTime), CAST(N'2015-08-03 00:00:00.000' AS DateTime), CAST(N'2015-08-11 00:00:00.000' AS DateTime), 100, 100, N'晴光紅豆餅', N'晴光紅豆餅', 7, N'集賢社區', N'amy2100tw@gmail.com', N'983362513', 24, 24, 1, N'KJ786345')
INSERT [dbo].[sales] ([s_id], [s_day], [i_day], [i_expired_day], [bill], [ip_discount], [i_name], [i_content], [ip_days], [u_name], [u_mail], [u_phone], [u_id], [belongto], [ifout], [invoice_code]) VALUES (53, CAST(N'2015-08-03 00:00:00.000' AS DateTime), CAST(N'2015-08-03 00:00:00.000' AS DateTime), CAST(N'2015-08-11 00:00:00.000' AS DateTime), 100, 100, N'原味屋', N'平價日式料理', 7, N'集賢社區', N'amy2100tw@gmail.com', N'983362513', 24, 24, 1, N'KJ123456')
INSERT [dbo].[sales] ([s_id], [s_day], [i_day], [i_expired_day], [bill], [ip_discount], [i_name], [i_content], [ip_days], [u_name], [u_mail], [u_phone], [u_id], [belongto], [ifout], [invoice_code]) VALUES (54, CAST(N'2015-08-03 00:00:00.000' AS DateTime), CAST(N'2015-08-03 00:00:00.000' AS DateTime), CAST(N'2015-08-11 00:00:00.000' AS DateTime), 100, 100, N'紗汀娜好食', N'早午餐', 7, N'集賢社區', N'amy2100tw@gmail.com', N'983362513', 24, 24, 1, N'GGGGGG')
INSERT [dbo].[sales] ([s_id], [s_day], [i_day], [i_expired_day], [bill], [ip_discount], [i_name], [i_content], [ip_days], [u_name], [u_mail], [u_phone], [u_id], [belongto], [ifout], [invoice_code]) VALUES (55, CAST(N'2015-08-03 00:00:00.000' AS DateTime), CAST(N'2015-08-03 00:00:00.000' AS DateTime), CAST(N'2015-08-11 00:00:00.000' AS DateTime), 100, 100, N'土城冰宮', N'四小時只要220 !', 7, N'集賢社區', N'amy2100tw@gmail.com', N'983362513', 24, 24, 0, N'')
INSERT [dbo].[sales] ([s_id], [s_day], [i_day], [i_expired_day], [bill], [ip_discount], [i_name], [i_content], [ip_days], [u_name], [u_mail], [u_phone], [u_id], [belongto], [ifout], [invoice_code]) VALUES (56, CAST(N'2015-08-03 00:00:00.000' AS DateTime), CAST(N'2015-08-03 00:00:00.000' AS DateTime), CAST(N'2015-08-11 00:00:00.000' AS DateTime), 100, 100, N'陳家莊魯肉飯', N'魯肉飯', 7, N'集賢社區', N'amy2100tw@gmail.com', N'983362513', 24, 24, 0, NULL)
INSERT [dbo].[sales] ([s_id], [s_day], [i_day], [i_expired_day], [bill], [ip_discount], [i_name], [i_content], [ip_days], [u_name], [u_mail], [u_phone], [u_id], [belongto], [ifout], [invoice_code]) VALUES (57, CAST(N'2015-08-03 00:00:00.000' AS DateTime), CAST(N'2015-08-03 00:00:00.000' AS DateTime), CAST(N'2015-08-11 00:00:00.000' AS DateTime), 100, 100, N'土城咖啡家', N'早午餐', 7, N'集賢社區', N'amy2100tw@gmail.com', N'983362513', 24, 24, 0, NULL)
INSERT [dbo].[sales] ([s_id], [s_day], [i_day], [i_expired_day], [bill], [ip_discount], [i_name], [i_content], [ip_days], [u_name], [u_mail], [u_phone], [u_id], [belongto], [ifout], [invoice_code]) VALUES (58, CAST(N'2015-08-03 00:00:00.000' AS DateTime), CAST(N'2015-08-03 00:00:00.000' AS DateTime), CAST(N'2015-08-11 00:00:00.000' AS DateTime), 200, 100, N'房間分租', N'雅房一間 限單身男女性 生活無不良習慣 獨立浴廁 空調家具齊全', 7, N'星池社區', N'jackuang8899@gmail.com', N'03-3122909', 25, 34, 0, NULL)
INSERT [dbo].[sales] ([s_id], [s_day], [i_day], [i_expired_day], [bill], [ip_discount], [i_name], [i_content], [ip_days], [u_name], [u_mail], [u_phone], [u_id], [belongto], [ifout], [invoice_code]) VALUES (59, CAST(N'2015-08-03 00:00:00.000' AS DateTime), CAST(N'2015-08-03 00:00:00.000' AS DateTime), CAST(N'2015-08-18 00:00:00.000' AS DateTime), 200, 100, N'AMY 房屋廣告', N'廣告測試', 14, N'集賢社區', N'amy2100tw@gmail.com', N'983362513', 24, 24, 0, NULL)
INSERT [dbo].[sales] ([s_id], [s_day], [i_day], [i_expired_day], [bill], [ip_discount], [i_name], [i_content], [ip_days], [u_name], [u_mail], [u_phone], [u_id], [belongto], [ifout], [invoice_code]) VALUES (60, CAST(N'2015-08-04 00:00:00.000' AS DateTime), CAST(N'2015-08-04 00:00:00.000' AS DateTime), CAST(N'2015-08-12 00:00:00.000' AS DateTime), 200, 100, N'test', N'test', 7, N'test0804', N'test0804@test.com.tw', N'02test', 52, 24, 0, NULL)
INSERT [dbo].[sales] ([s_id], [s_day], [i_day], [i_expired_day], [bill], [ip_discount], [i_name], [i_content], [ip_days], [u_name], [u_mail], [u_phone], [u_id], [belongto], [ifout], [invoice_code]) VALUES (61, CAST(N'2015-08-04 00:00:00.000' AS DateTime), CAST(N'2015-08-04 00:00:00.000' AS DateTime), CAST(N'2015-10-04 00:00:00.000' AS DateTime), 200, 85, N'test', N'test', 60, N'星池社區', N'jackuang8899@gmail.com', N'03-3122909', 25, 34, 0, NULL)
INSERT [dbo].[sales] ([s_id], [s_day], [i_day], [i_expired_day], [bill], [ip_discount], [i_name], [i_content], [ip_days], [u_name], [u_mail], [u_phone], [u_id], [belongto], [ifout], [invoice_code]) VALUES (62, CAST(N'2015-08-04 00:00:00.000' AS DateTime), CAST(N'2015-08-04 00:00:00.000' AS DateTime), CAST(N'2015-08-12 00:00:00.000' AS DateTime), 100, 100, N'二手包', N'二手包拍賣', 7, N'星池社區', N'jackuang8899@gmail.com', N'03-3122909', 25, 34, 0, NULL)
INSERT [dbo].[sales] ([s_id], [s_day], [i_day], [i_expired_day], [bill], [ip_discount], [i_name], [i_content], [ip_days], [u_name], [u_mail], [u_phone], [u_id], [belongto], [ifout], [invoice_code]) VALUES (64, CAST(N'2015-08-10 00:00:00.000' AS DateTime), CAST(N'2015-08-04 00:00:00.000' AS DateTime), CAST(N'2015-08-12 00:00:00.000' AS DateTime), 200, 100, N'test', N'testest', 7, N'汪經宗', N'jackuang8899@gmail.com', N'03-3122909', 25, 34, 0, NULL)
INSERT [dbo].[sales] ([s_id], [s_day], [i_day], [i_expired_day], [bill], [ip_discount], [i_name], [i_content], [ip_days], [u_name], [u_mail], [u_phone], [u_id], [belongto], [ifout], [invoice_code]) VALUES (65, CAST(N'2015-08-12 00:00:00.000' AS DateTime), CAST(N'2015-08-11 00:00:00.000' AS DateTime), CAST(N'2015-08-19 00:00:00.000' AS DateTime), 100, 100, N'紗汀娜好食', N'早午餐', 7, N'集賢社區', N'amy2100tw@gmail.com', N'983362513', 24, 24, 0, NULL)
INSERT [dbo].[sales] ([s_id], [s_day], [i_day], [i_expired_day], [bill], [ip_discount], [i_name], [i_content], [ip_days], [u_name], [u_mail], [u_phone], [u_id], [belongto], [ifout], [invoice_code]) VALUES (66, CAST(N'2015-08-17 00:00:00.000' AS DateTime), CAST(N'2015-08-17 00:00:00.000' AS DateTime), CAST(N'2015-08-25 00:00:00.000' AS DateTime), 100, 100, N'土城冰宮', N'四小時只要220 !', 7, N'集賢社區', N'amy2100tw@gmail.com', N'983362513', 24, 24, 0, NULL)
INSERT [dbo].[sales] ([s_id], [s_day], [i_day], [i_expired_day], [bill], [ip_discount], [i_name], [i_content], [ip_days], [u_name], [u_mail], [u_phone], [u_id], [belongto], [ifout], [invoice_code]) VALUES (67, CAST(N'2015-08-17 00:00:00.000' AS DateTime), CAST(N'2015-08-17 00:00:00.000' AS DateTime), CAST(N'2015-08-25 00:00:00.000' AS DateTime), 100, 100, N'土城咖啡家', N'早午餐', 7, N'集賢社區', N'amy2100tw@gmail.com', N'983362513', 24, 24, 0, NULL)
INSERT [dbo].[sales] ([s_id], [s_day], [i_day], [i_expired_day], [bill], [ip_discount], [i_name], [i_content], [ip_days], [u_name], [u_mail], [u_phone], [u_id], [belongto], [ifout], [invoice_code]) VALUES (68, CAST(N'2015-08-17 00:00:00.000' AS DateTime), CAST(N'2015-08-09 00:00:00.000' AS DateTime), CAST(N'2015-08-17 00:00:00.000' AS DateTime), 200, 100, N'JackTesting', N'JackTesting 8/9', 7, N'測試帳號', N'test@gmail.com', N'278734456', 3, 34, 0, NULL)
INSERT [dbo].[sales] ([s_id], [s_day], [i_day], [i_expired_day], [bill], [ip_discount], [i_name], [i_content], [ip_days], [u_name], [u_mail], [u_phone], [u_id], [belongto], [ifout], [invoice_code]) VALUES (69, CAST(N'2015-08-18 00:00:00.000' AS DateTime), CAST(N'2015-08-18 00:00:00.000' AS DateTime), CAST(N'2015-09-02 00:00:00.000' AS DateTime), 200, 100, N'AMY 房屋廣告', N'廣告測試', 14, N'集賢社區', N'amy2100tw@gmail.com', N'983362513', 24, 24, 0, NULL)
INSERT [dbo].[sales] ([s_id], [s_day], [i_day], [i_expired_day], [bill], [ip_discount], [i_name], [i_content], [ip_days], [u_name], [u_mail], [u_phone], [u_id], [belongto], [ifout], [invoice_code]) VALUES (70, CAST(N'2015-08-19 00:00:00.000' AS DateTime), CAST(N'2015-08-19 00:00:00.000' AS DateTime), CAST(N'2015-08-27 00:00:00.000' AS DateTime), 100, 100, N'紗汀娜好食', N'早午餐', 7, N'集賢社區', N'amy2100tw@gmail.com', N'983362513', 24, 24, 0, NULL)
INSERT [dbo].[sales] ([s_id], [s_day], [i_day], [i_expired_day], [bill], [ip_discount], [i_name], [i_content], [ip_days], [u_name], [u_mail], [u_phone], [u_id], [belongto], [ifout], [invoice_code]) VALUES (71, CAST(N'2015-08-19 00:00:00.000' AS DateTime), CAST(N'2015-08-19 00:00:00.000' AS DateTime), CAST(N'2015-08-27 00:00:00.000' AS DateTime), 100, 100, N'紗汀娜好食', N'紗汀娜好食', 7, N'集賢社區', N'amy2100tw@gmail.com', N'983362513', 24, 24, 0, NULL)
INSERT [dbo].[sales] ([s_id], [s_day], [i_day], [i_expired_day], [bill], [ip_discount], [i_name], [i_content], [ip_days], [u_name], [u_mail], [u_phone], [u_id], [belongto], [ifout], [invoice_code]) VALUES (72, CAST(N'2015-08-19 00:00:00.000' AS DateTime), CAST(N'2015-08-19 00:00:00.000' AS DateTime), CAST(N'2015-08-27 00:00:00.000' AS DateTime), 200, 100, N'test', N'test', 7, N'集賢社區', N'amy2100tw@gmail.com', N'983362513', 24, 24, 0, NULL)
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (1, N'臺北市', N'中正區', N'100')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (2, N'臺北市', N'大同區', N'103')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (3, N'臺北市', N'中山區', N'104')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (4, N'臺北市', N'松山區', N'105')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (5, N'臺北市', N'大安區', N'106')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (6, N'臺北市', N'萬華區', N'108')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (7, N'臺北市', N'信義區', N'110')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (8, N'臺北市', N'士林區', N'111')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (9, N'臺北市', N'北投區', N'112')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (10, N'臺北市', N'內湖區', N'114')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (11, N'臺北市', N'南港區', N'115')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (12, N'臺北市', N'文山區', N'116')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (13, N'基隆市', N'仁愛區', N'200')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (14, N'基隆市', N'信義區', N'201')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (15, N'基隆市', N'中正區', N'202')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (16, N'基隆市', N'中山區', N'203')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (17, N'基隆市', N'安樂區', N'204')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (18, N'基隆市', N'暖暖區', N'205')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (19, N'基隆市', N'七堵區', N'206')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (20, N'新北市', N'萬里區', N'207')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (21, N'新北市', N'金山區', N'208')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (22, N'新北市', N'板橋區', N'220')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (23, N'新北市', N'汐止區', N'221')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (24, N'新北市', N'深坑區', N'222')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (25, N'新北市', N'石碇區', N'223')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (26, N'新北市', N'瑞芳區', N'224')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (27, N'新北市', N'平溪區', N'226')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (28, N'新北市', N'雙溪區', N'227')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (29, N'新北市', N'貢寮區', N'228')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (30, N'新北市', N'新店區', N'231')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (31, N'新北市', N'坪林區', N'232')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (32, N'新北市', N'烏來區', N'233')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (33, N'新北市', N'永和區', N'234')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (34, N'新北市', N'中和區', N'235')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (35, N'新北市', N'土城區', N'236')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (36, N'新北市', N'三峽區', N'237')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (37, N'新北市', N'樹林區', N'238')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (38, N'新北市', N'鶯歌區', N'239')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (39, N'新北市', N'三重區', N'241')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (40, N'新北市', N'新莊區', N'242')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (41, N'新北市', N'泰山區', N'243')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (42, N'新北市', N'林口區', N'244')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (43, N'新北市', N'蘆洲區', N'247')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (44, N'新北市', N'五股區', N'248')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (45, N'新北市', N'八里區', N'249')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (46, N'新北市', N'淡水區', N'251')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (47, N'新北市', N'三芝區', N'252')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (48, N'新北市', N'石門區', N'253')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (49, N'宜蘭縣', N'宜蘭', N'260')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (50, N'宜蘭縣', N'頭城', N'261')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (51, N'宜蘭縣', N'礁溪', N'262')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (52, N'宜蘭縣', N'壯圍', N'263')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (53, N'宜蘭縣', N'員山', N'264')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (54, N'宜蘭縣', N'羅東', N'265')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (55, N'宜蘭縣', N'三星', N'266')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (56, N'宜蘭縣', N'大同', N'267')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (57, N'宜蘭縣', N'五結', N'268')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (58, N'宜蘭縣', N'冬山', N'269')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (59, N'宜蘭縣', N'蘇澳', N'270')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (60, N'宜蘭縣', N'南澳', N'272')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (61, N'宜蘭縣', N'釣魚臺列嶼', N'290')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (62, N'新竹市', N'新竹市', N'300')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (63, N'新竹縣', N'竹北', N'302')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (64, N'新竹縣', N'湖口', N'303')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (65, N'新竹縣', N'新豐', N'304')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (66, N'新竹縣', N'新埔', N'305')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (67, N'新竹縣', N'關西', N'306')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (68, N'新竹縣', N'芎林', N'307')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (69, N'新竹縣', N'寶山', N'308')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (70, N'新竹縣', N'竹東', N'310')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (71, N'新竹縣', N'五峰', N'311')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (72, N'新竹縣', N'橫山', N'312')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (73, N'新竹縣', N'尖石', N'313')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (74, N'新竹縣', N'北埔', N'314')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (75, N'新竹縣', N'峨眉', N'315')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (76, N'桃園市', N'中壢區', N'320')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (77, N'桃園市', N'平鎮區', N'324')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (78, N'桃園市', N'龍潭區', N'325')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (79, N'桃園市', N'楊梅區', N'326')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (80, N'桃園市', N'新屋區', N'327')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (81, N'桃園市', N'觀音區', N'328')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (82, N'桃園市', N'桃園區', N'330')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (83, N'桃園市', N'龜山區', N'333')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (84, N'桃園市', N'八德區', N'334')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (85, N'桃園市', N'大溪區', N'335')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (86, N'桃園市', N'復興區', N'336')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (87, N'桃園市', N'大園區', N'337')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (88, N'桃園市', N'蘆竹區', N'338')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (89, N'苗栗縣', N'竹南', N'350')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (90, N'苗栗縣', N'頭份', N'351')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (91, N'苗栗縣', N'三灣', N'352')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (92, N'苗栗縣', N'南庄', N'353')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (93, N'苗栗縣', N'獅潭', N'354')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (94, N'苗栗縣', N'後龍', N'356')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (95, N'苗栗縣', N'通霄', N'357')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (96, N'苗栗縣', N'苑裡', N'358')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (97, N'苗栗縣', N'苗栗', N'360')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (98, N'苗栗縣', N'造橋', N'361')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (99, N'苗栗縣', N'頭屋', N'362')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (100, N'苗栗縣', N'公館', N'363')
GO
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (101, N'苗栗縣', N'大湖', N'364')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (102, N'苗栗縣', N'泰安', N'365')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (103, N'苗栗縣', N'銅鑼', N'366')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (104, N'苗栗縣', N'三義', N'367')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (105, N'苗栗縣', N'西湖', N'368')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (106, N'苗栗縣', N'卓蘭', N'369')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (107, N'臺中市', N'中區', N'400')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (108, N'臺中市', N'東區', N'401')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (109, N'臺中市', N'南區', N'402')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (110, N'臺中市', N'西區', N'403')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (111, N'臺中市', N'北區', N'404')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (112, N'臺中市', N'北屯區', N'406')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (113, N'臺中市', N'西屯區', N'407')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (114, N'臺中市', N'南屯區', N'408')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (115, N'臺中市', N'太平區', N'411')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (116, N'臺中市', N'大里區', N'412')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (117, N'臺中市', N'霧峰區', N'413')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (118, N'臺中市', N'烏日區', N'414')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (119, N'臺中市', N'豐原區', N'420')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (120, N'臺中市', N'后里區', N'421')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (121, N'臺中市', N'石岡區', N'422')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (122, N'臺中市', N'東勢區', N'423')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (123, N'臺中市', N'和平區', N'424')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (124, N'臺中市', N'新社區', N'426')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (125, N'臺中市', N'潭子區', N'427')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (126, N'臺中市', N'大雅區', N'428')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (127, N'臺中市', N'神岡區', N'429')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (128, N'臺中市', N'大肚區', N'432')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (129, N'臺中市', N'沙鹿區', N'433')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (130, N'臺中市', N'龍井區', N'434')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (131, N'臺中市', N'梧棲區', N'435')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (132, N'臺中市', N'清水區', N'436')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (133, N'臺中市', N'大甲區', N'437')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (134, N'臺中市', N'外埔區', N'438')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (135, N'臺中市', N'大安區', N'439')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (136, N'彰化縣', N'彰化', N'500')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (137, N'彰化縣', N'芬園', N'502')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (138, N'彰化縣', N'花壇', N'503')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (139, N'彰化縣', N'秀水', N'504')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (140, N'彰化縣', N'鹿港', N'505')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (141, N'彰化縣', N'福興', N'506')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (142, N'彰化縣', N'線西', N'507')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (143, N'彰化縣', N'和美', N'508')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (144, N'彰化縣', N'伸港', N'509')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (145, N'彰化縣', N'員林', N'510')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (146, N'彰化縣', N'社頭', N'511')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (147, N'彰化縣', N'永靖', N'512')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (148, N'彰化縣', N'埔心', N'513')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (149, N'彰化縣', N'溪湖', N'514')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (150, N'彰化縣', N'大村', N'515')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (151, N'彰化縣', N'埔鹽', N'516')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (152, N'彰化縣', N'田中', N'520')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (153, N'彰化縣', N'北斗', N'521')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (154, N'彰化縣', N'田尾', N'522')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (155, N'彰化縣', N'埤頭', N'523')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (156, N'彰化縣', N'溪州', N'524')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (157, N'彰化縣', N'竹塘', N'525')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (158, N'彰化縣', N'二林', N'526')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (159, N'彰化縣', N'大城', N'527')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (160, N'彰化縣', N'芳苑', N'528')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (161, N'彰化縣', N'二水', N'530')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (162, N'南投縣', N'南投', N'540')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (163, N'南投縣', N'中寮', N'541')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (164, N'南投縣', N'草屯', N'542')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (165, N'南投縣', N'國姓', N'544')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (166, N'南投縣', N'埔里', N'545')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (167, N'南投縣', N'仁愛', N'546')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (168, N'南投縣', N'名間', N'551')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (169, N'南投縣', N'集集', N'552')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (170, N'南投縣', N'水里', N'553')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (171, N'南投縣', N'魚池', N'555')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (172, N'南投縣', N'信義', N'556')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (173, N'南投縣', N'竹山', N'557')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (174, N'南投縣', N'鹿谷', N'558')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (175, N'嘉義市', N'嘉義市', N'600')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (176, N'嘉義縣', N'番路', N'602')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (177, N'嘉義縣', N'梅山', N'603')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (178, N'嘉義縣', N'竹崎', N'604')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (179, N'嘉義縣', N'阿里山', N'605')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (180, N'嘉義縣', N'中埔', N'606')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (181, N'嘉義縣', N'大埔', N'607')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (182, N'嘉義縣', N'水上', N'608')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (183, N'嘉義縣', N'鹿草', N'611')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (184, N'嘉義縣', N'太保', N'612')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (185, N'嘉義縣', N'朴子', N'613')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (186, N'嘉義縣', N'東石', N'614')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (187, N'嘉義縣', N'六腳', N'615')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (188, N'嘉義縣', N'新港', N'616')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (189, N'嘉義縣', N'民雄', N'621')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (190, N'嘉義縣', N'大林', N'622')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (191, N'嘉義縣', N'溪口', N'623')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (192, N'嘉義縣', N'義竹', N'624')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (193, N'嘉義縣', N'布袋', N'625')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (194, N'雲林縣', N'斗南', N'630')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (195, N'雲林縣', N'大埤', N'631')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (196, N'雲林縣', N'虎尾', N'632')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (197, N'雲林縣', N'土庫', N'633')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (198, N'雲林縣', N'褒忠', N'634')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (199, N'雲林縣', N'東勢', N'635')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (200, N'雲林縣', N'臺西', N'636')
GO
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (201, N'雲林縣', N'崙背', N'637')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (202, N'雲林縣', N'麥寮', N'638')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (203, N'雲林縣', N'斗六', N'640')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (204, N'雲林縣', N'林內', N'643')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (205, N'雲林縣', N'古坑', N'646')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (206, N'雲林縣', N'莿桐', N'647')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (207, N'雲林縣', N'西螺', N'648')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (208, N'雲林縣', N'二崙', N'649')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (209, N'雲林縣', N'北港', N'651')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (210, N'雲林縣', N'水林', N'652')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (211, N'雲林縣', N'口湖', N'653')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (212, N'雲林縣', N'四湖', N'654')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (213, N'雲林縣', N'元長', N'655')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (214, N'臺南市', N'中西區', N'700')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (215, N'臺南市', N'東區', N'701')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (216, N'臺南市', N'南區', N'702')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (217, N'臺南市', N'北區', N'704')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (218, N'臺南市', N'安平區', N'708')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (219, N'臺南市', N'安南區', N'709')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (220, N'臺南市', N'永康區', N'710')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (221, N'臺南市', N'歸仁區', N'711')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (222, N'臺南市', N'新化區', N'712')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (223, N'臺南市', N'左鎮區', N'713')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (224, N'臺南市', N'玉井區', N'714')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (225, N'臺南市', N'楠西區', N'715')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (226, N'臺南市', N'南化區', N'716')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (227, N'臺南市', N'仁德區', N'717')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (228, N'臺南市', N'關廟區', N'718')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (229, N'臺南市', N'龍崎區', N'719')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (230, N'臺南市', N'官田區', N'720')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (231, N'臺南市', N'麻豆區', N'721')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (232, N'臺南市', N'佳里區', N'722')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (233, N'臺南市', N'西港區', N'723')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (234, N'臺南市', N'七股區', N'724')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (235, N'臺南市', N'將軍區', N'725')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (236, N'臺南市', N'學甲區', N'726')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (237, N'臺南市', N'北門區', N'727')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (238, N'臺南市', N'新營區', N'730')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (239, N'臺南市', N'後壁區', N'731')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (240, N'臺南市', N'白河區', N'732')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (241, N'臺南市', N'東山區', N'733')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (242, N'臺南市', N'六甲區', N'734')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (243, N'臺南市', N'下營區', N'735')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (244, N'臺南市', N'柳營區', N'736')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (245, N'臺南市', N'鹽水區', N'737')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (246, N'臺南市', N'善化區', N'741')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (247, N'臺南市', N'大內區', N'742')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (248, N'臺南市', N'山上區', N'743')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (249, N'臺南市', N'新市區', N'744')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (250, N'臺南市', N'安定區', N'745')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (251, N'高雄市', N'新興區', N'800')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (252, N'高雄市', N'前金區', N'801')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (253, N'高雄市', N'苓雅區', N'802')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (254, N'高雄市', N'鹽埕區', N'803')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (255, N'高雄市', N'鼓山區', N'804')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (256, N'高雄市', N'旗津區', N'805')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (257, N'高雄市', N'前鎮區', N'806')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (258, N'高雄市', N'三民區', N'807')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (259, N'高雄市', N'楠梓區', N'811')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (260, N'高雄市', N'小港區', N'812')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (261, N'高雄市', N'左營區', N'813')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (262, N'高雄市', N'仁武區', N'814')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (263, N'高雄市', N'大社區', N'815')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (264, N'高雄市', N'岡山區', N'820')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (265, N'高雄市', N'路竹區', N'821')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (266, N'高雄市', N'阿蓮區', N'822')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (267, N'高雄市', N'田寮區', N'823')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (268, N'高雄市', N'燕巢區', N'824')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (269, N'高雄市', N'橋頭區', N'825')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (270, N'高雄市', N'梓官區', N'826')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (271, N'高雄市', N'彌陀區', N'827')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (272, N'高雄市', N'永安區', N'828')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (273, N'高雄市', N'湖內區', N'829')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (274, N'高雄市', N'鳳山區', N'830')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (275, N'高雄市', N'大寮區', N'831')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (276, N'高雄市', N'林園區', N'832')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (277, N'高雄市', N'鳥松區', N'833')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (278, N'高雄市', N'大樹區', N'840')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (279, N'高雄市', N'旗山區', N'842')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (280, N'高雄市', N'美濃區', N'843')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (281, N'高雄市', N'六龜區', N'844')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (282, N'高雄市', N'內門區', N'845')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (283, N'高雄市', N'杉林區', N'846')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (284, N'高雄市', N'甲仙區', N'847')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (285, N'高雄市', N'桃源區', N'848')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (286, N'高雄市', N'那瑪夏區', N'849')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (287, N'高雄市', N'茂林區', N'851')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (288, N'高雄市', N'茄萣區', N'852')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (289, N'南海諸島', N'東 沙', N'817')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (290, N'南海諸島', N'南 沙', N'819')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (291, N'澎湖縣', N'馬公', N'880')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (292, N'澎湖縣', N'西嶼', N'881')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (293, N'澎湖縣', N'望安', N'882')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (294, N'澎湖縣', N'七美', N'883')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (295, N'澎湖縣', N'白沙', N'884')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (296, N'澎湖縣', N'湖西', N'885')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (297, N'屏東縣', N'屏東', N'900')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (298, N'屏東縣', N'三地門', N'901')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (299, N'屏東縣', N'霧臺', N'902')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (300, N'屏東縣', N'瑪家', N'903')
GO
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (301, N'屏東縣', N'九如', N'904')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (302, N'屏東縣', N'里港', N'905')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (303, N'屏東縣', N'高樹', N'906')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (304, N'屏東縣', N'鹽  埔', N'907')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (305, N'屏東縣', N'長治', N'908')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (306, N'屏東縣', N'麟洛', N'909')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (307, N'屏東縣', N'竹田', N'911')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (308, N'屏東縣', N'內埔', N'912')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (309, N'屏東縣', N'萬丹', N'913')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (310, N'屏東縣', N'潮州', N'920')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (311, N'屏東縣', N'泰武', N'921')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (312, N'屏東縣', N'來義', N'922')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (313, N'屏東縣', N'萬巒', N'923')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (314, N'屏東縣', N'崁頂', N'924')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (315, N'屏東縣', N'新埤', N'925')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (316, N'屏東縣', N'南州', N'926')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (317, N'屏東縣', N'林邊', N'927')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (318, N'屏東縣', N'東港', N'928')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (319, N'屏東縣', N'琉球', N'929')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (320, N'屏東縣', N'佳冬', N'931')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (321, N'屏東縣', N'新園', N'932')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (322, N'屏東縣', N'枋寮', N'940')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (323, N'屏東縣', N'枋山', N'941')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (324, N'屏東縣', N'春日', N'942')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (325, N'屏東縣', N'獅子', N'943')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (326, N'屏東縣', N'車城', N'944')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (327, N'屏東縣', N'牡丹', N'945')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (328, N'屏東縣', N'恆春', N'946')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (329, N'屏東縣', N'滿州', N'947')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (330, N'臺東縣', N'臺東', N'950')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (331, N'臺東縣', N'綠島', N'951')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (332, N'臺東縣', N'蘭嶼', N'952')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (333, N'臺東縣', N'延平', N'953')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (334, N'臺東縣', N'卑南', N'954')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (335, N'臺東縣', N'鹿野', N'955')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (336, N'臺東縣', N'關山', N'956')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (337, N'臺東縣', N'海端', N'957')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (338, N'臺東縣', N'池上', N'958')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (339, N'臺東縣', N'東河', N'959')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (340, N'臺東縣', N'成功', N'961')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (341, N'臺東縣', N'長濱', N'962')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (342, N'臺東縣', N'太麻里', N'963')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (343, N'臺東縣', N'金峰', N'964')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (344, N'臺東縣', N'大武', N'965')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (345, N'臺東縣', N'達仁', N'966')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (346, N'花蓮縣', N'花蓮', N'970')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (347, N'花蓮縣', N'新城', N'971')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (348, N'花蓮縣', N'秀林', N'972')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (349, N'花蓮縣', N'吉安', N'973')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (350, N'花蓮縣', N'壽豐', N'974')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (351, N'花蓮縣', N'鳳林', N'975')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (352, N'花蓮縣', N'光復', N'976')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (353, N'花蓮縣', N'豐濱', N'977')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (354, N'花蓮縣', N'瑞穗', N'978')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (355, N'花蓮縣', N'萬榮', N'979')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (356, N'花蓮縣', N'玉里', N'981')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (357, N'花蓮縣', N'卓溪', N'982')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (358, N'花蓮縣', N'富里', N'983')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (359, N'金門縣', N'金沙', N'890')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (360, N'金門縣', N'金湖', N'891')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (361, N'金門縣', N'金寧', N'892')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (362, N'金門縣', N'金城', N'893')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (363, N'金門縣', N'烈嶼', N'894')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (364, N'金門縣', N'烏坵', N'896')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (365, N'連江縣', N'南竿', N'209')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (366, N'連江縣', N'北竿', N'210')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (367, N'連江縣', N'莒光', N'211')
INSERT [dbo].[town] ([c_id], [c_county], [c_town], [c_zipcode]) VALUES (368, N'連江縣', N'東引', N'212')
INSERT [dbo].[User2] ([Id], [u_name], [BirthDate], [Gender], [HireDate], [CurrentFlag], [rowguid], [ModifiedDate], [receipt], [p_fee], [p_lastFeeDate], [PhoneNumber1], [PhoneNumber2], [u_memo], [RoleId], [u_active], [belongto], [CommCircleName], [u_location1], [u_location2], [u_location3], [AddressID], [AddressTypedId], [PostalCode], [SpatialLocation], [applyupgrade], [rejectreason], [u_occupation1], [u_occupation2], [u_occupation3]) VALUES (N'087c7200-da62-42f7-afbd-ef9b6386ab94', N's@t.u', CAST(N'1911-01-01' AS Date), N'0', CAST(N'1911-01-01' AS Date), 1, N'cfc68ad0-4add-470d-a2a3-0d71dd5a6f61', CAST(N'1911-01-01' AS Date), NULL, 0, CAST(N'1911-01-01' AS Date), N'000', N'000', NULL, N'nnn', 1, N'nnn', NULL, NULL, NULL, NULL, NULL, NULL, N'nnn            ', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[User2] ([Id], [u_name], [BirthDate], [Gender], [HireDate], [CurrentFlag], [rowguid], [ModifiedDate], [receipt], [p_fee], [p_lastFeeDate], [PhoneNumber1], [PhoneNumber2], [u_memo], [RoleId], [u_active], [belongto], [CommCircleName], [u_location1], [u_location2], [u_location3], [AddressID], [AddressTypedId], [PostalCode], [SpatialLocation], [applyupgrade], [rejectreason], [u_occupation1], [u_occupation2], [u_occupation3]) VALUES (N'09e15f3e-412b-4707-912b-4d5fdd8aaa6a', N'mandy@popper.com.tw', CAST(N'2016-07-08' AS Date), N'1', CAST(N'2037-05-05' AS Date), 1, N'12345678-1234-1234-1234-123456789017', CAST(N'2016-05-08' AS Date), N'2', 100, CAST(N'2016-02-07' AS Date), N'03-3208729', N'2', NULL, N'2', 1, N'09e15f3e-412b-4707-912b-4d5fdd8aaa6a', N'          ', N'桃園市', N'八德區', N'介壽路', 400, 6, N'300            ', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[User2] ([Id], [u_name], [BirthDate], [Gender], [HireDate], [CurrentFlag], [rowguid], [ModifiedDate], [receipt], [p_fee], [p_lastFeeDate], [PhoneNumber1], [PhoneNumber2], [u_memo], [RoleId], [u_active], [belongto], [CommCircleName], [u_location1], [u_location2], [u_location3], [AddressID], [AddressTypedId], [PostalCode], [SpatialLocation], [applyupgrade], [rejectreason], [u_occupation1], [u_occupation2], [u_occupation3]) VALUES (N'0b783ed3-f888-45e1-bb2f-6bc675cf972c', N't@u.v', CAST(N'1911-01-01' AS Date), N'0', CAST(N'1911-01-01' AS Date), 1, N'ee299101-a8dc-4a94-a711-bd6567201ad8', CAST(N'1911-01-01' AS Date), NULL, 0, CAST(N'1911-01-01' AS Date), N'000', N'000', NULL, N'nnn', 1, N'nnn', NULL, NULL, NULL, NULL, NULL, NULL, N'nnn            ', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[User2] ([Id], [u_name], [BirthDate], [Gender], [HireDate], [CurrentFlag], [rowguid], [ModifiedDate], [receipt], [p_fee], [p_lastFeeDate], [PhoneNumber1], [PhoneNumber2], [u_memo], [RoleId], [u_active], [belongto], [CommCircleName], [u_location1], [u_location2], [u_location3], [AddressID], [AddressTypedId], [PostalCode], [SpatialLocation], [applyupgrade], [rejectreason], [u_occupation1], [u_occupation2], [u_occupation3]) VALUES (N'0be60609-08d8-4211-ad64-dd2ae169eedc', N'小陳', CAST(N'2016-07-07' AS Date), N'1', CAST(N'2036-05-02' AS Date), 1, N'12345678-1234-1234-1234-123456789013', CAST(N'2016-05-04' AS Date), N'2', 100, CAST(N'2016-02-05' AS Date), N'03-2389102', N'2', N'm', N'2', 1, N'22', N'國泰賦都      ', N'桃園市', N'三民區', N'南華街', 22, 6, N'330            ', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[User2] ([Id], [u_name], [BirthDate], [Gender], [HireDate], [CurrentFlag], [rowguid], [ModifiedDate], [receipt], [p_fee], [p_lastFeeDate], [PhoneNumber1], [PhoneNumber2], [u_memo], [RoleId], [u_active], [belongto], [CommCircleName], [u_location1], [u_location2], [u_location3], [AddressID], [AddressTypedId], [PostalCode], [SpatialLocation], [applyupgrade], [rejectreason], [u_occupation1], [u_occupation2], [u_occupation3]) VALUES (N'1cdcf753-733c-4e12-9d2b-7f8ef5022dc3', N'q@r.s', CAST(N'1911-01-01' AS Date), N'0', CAST(N'1911-01-01' AS Date), 1, N'823a64d1-9ada-423d-ac2e-6dbe3117f162', CAST(N'1911-01-01' AS Date), NULL, 0, CAST(N'1911-01-01' AS Date), N'000', N'000', NULL, N'nnn', 1, N'nnn', NULL, NULL, NULL, NULL, NULL, NULL, N'nnn            ', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[User2] ([Id], [u_name], [BirthDate], [Gender], [HireDate], [CurrentFlag], [rowguid], [ModifiedDate], [receipt], [p_fee], [p_lastFeeDate], [PhoneNumber1], [PhoneNumber2], [u_memo], [RoleId], [u_active], [belongto], [CommCircleName], [u_location1], [u_location2], [u_location3], [AddressID], [AddressTypedId], [PostalCode], [SpatialLocation], [applyupgrade], [rejectreason], [u_occupation1], [u_occupation2], [u_occupation3]) VALUES (N'2c15c790-9887-4e61-aef5-93e8309b7604', N'shaoyu.kao@gmail.com', CAST(N'1911-01-01' AS Date), N'0', CAST(N'1911-01-01' AS Date), 1, N'794baae1-3304-412c-adf1-1c6201ec776a', CAST(N'1911-01-01' AS Date), NULL, 0, CAST(N'1911-01-01' AS Date), N'000', N'000', NULL, N'nnn', 1, N'nnn', NULL, NULL, NULL, NULL, NULL, NULL, N'nnn            ', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[User2] ([Id], [u_name], [BirthDate], [Gender], [HireDate], [CurrentFlag], [rowguid], [ModifiedDate], [receipt], [p_fee], [p_lastFeeDate], [PhoneNumber1], [PhoneNumber2], [u_memo], [RoleId], [u_active], [belongto], [CommCircleName], [u_location1], [u_location2], [u_location3], [AddressID], [AddressTypedId], [PostalCode], [SpatialLocation], [applyupgrade], [rejectreason], [u_occupation1], [u_occupation2], [u_occupation3]) VALUES (N'355ed1f1-d490-4a47-ade3-ca94fdf5c6db', N'j@k.l', CAST(N'2016-07-08' AS Date), N'1', CAST(N'2037-05-04' AS Date), 1, N'12345678-1234-1234-1234-123456789015', CAST(N'2016-05-06' AS Date), N'2', 100, CAST(N'2016-03-03' AS Date), N'03-2340122', N'2', NULL, N'2', 1, N'355ed1f1-d490-4a47-ade3-ca94fdf5c6db', N'          ', N'桃園市', N'蘆竹區', N'南福街', 200, 6, N'300            ', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[User2] ([Id], [u_name], [BirthDate], [Gender], [HireDate], [CurrentFlag], [rowguid], [ModifiedDate], [receipt], [p_fee], [p_lastFeeDate], [PhoneNumber1], [PhoneNumber2], [u_memo], [RoleId], [u_active], [belongto], [CommCircleName], [u_location1], [u_location2], [u_location3], [AddressID], [AddressTypedId], [PostalCode], [SpatialLocation], [applyupgrade], [rejectreason], [u_occupation1], [u_occupation2], [u_occupation3]) VALUES (N'43fa2c21-0e3a-4f41-9173-f006eafd7baa', N'aabbcc@b.c', CAST(N'1911-01-01' AS Date), N'0', CAST(N'1911-01-01' AS Date), 1, N'67f2d3f1-018d-4fb1-82a9-afc087152467', CAST(N'1911-01-01' AS Date), NULL, 0, CAST(N'1911-01-01' AS Date), N'000', N'000', NULL, N'nnn', 1, N'nnn', NULL, NULL, NULL, NULL, NULL, NULL, N'nnn            ', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[User2] ([Id], [u_name], [BirthDate], [Gender], [HireDate], [CurrentFlag], [rowguid], [ModifiedDate], [receipt], [p_fee], [p_lastFeeDate], [PhoneNumber1], [PhoneNumber2], [u_memo], [RoleId], [u_active], [belongto], [CommCircleName], [u_location1], [u_location2], [u_location3], [AddressID], [AddressTypedId], [PostalCode], [SpatialLocation], [applyupgrade], [rejectreason], [u_occupation1], [u_occupation2], [u_occupation3]) VALUES (N'50763565-cf17-48e2-b915-cb086b3a188a', N'小王', CAST(N'2016-06-07' AS Date), N'1', CAST(N'2036-05-07' AS Date), 1, N'12345678-1234-1234-1234-123456789012', CAST(N'2016-07-06' AS Date), N'2', 100, CAST(N'2016-02-07' AS Date), N'03-3928109', N'2', N'm', N'2', 1, N'22', N'金色大道      ', N'桃園市', N'中壢區', N'仁愛路', 23, 6, N'330            ', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[User2] ([Id], [u_name], [BirthDate], [Gender], [HireDate], [CurrentFlag], [rowguid], [ModifiedDate], [receipt], [p_fee], [p_lastFeeDate], [PhoneNumber1], [PhoneNumber2], [u_memo], [RoleId], [u_active], [belongto], [CommCircleName], [u_location1], [u_location2], [u_location3], [AddressID], [AddressTypedId], [PostalCode], [SpatialLocation], [applyupgrade], [rejectreason], [u_occupation1], [u_occupation2], [u_occupation3]) VALUES (N'6b0363e0-88e5-473f-b8ac-aa0bb978756d', N'evelyn@popper.com.tw', CAST(N'2016-07-08' AS Date), N'1', CAST(N'2037-05-03' AS Date), 1, N'12345678-1234-1234-1234-123456789016', CAST(N'2016-05-07' AS Date), N'2', 100, CAST(N'2016-03-05' AS Date), N'03-9818290', N'2', NULL, N'2', 1, N'6b0363e0-88e5-473f-b8ac-aa0bb978756d', N'          ', N'桃園市', N'桃園市', N'中正路', 300, 6, N'300            ', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[User2] ([Id], [u_name], [BirthDate], [Gender], [HireDate], [CurrentFlag], [rowguid], [ModifiedDate], [receipt], [p_fee], [p_lastFeeDate], [PhoneNumber1], [PhoneNumber2], [u_memo], [RoleId], [u_active], [belongto], [CommCircleName], [u_location1], [u_location2], [u_location3], [AddressID], [AddressTypedId], [PostalCode], [SpatialLocation], [applyupgrade], [rejectreason], [u_occupation1], [u_occupation2], [u_occupation3]) VALUES (N'70ba378e-99e7-4047-8e4a-26b000d2a820', N'aaaaa@b.c', CAST(N'1911-01-01' AS Date), N'0', CAST(N'1911-01-01' AS Date), 1, N'5e6eaed4-d75a-46e9-a25d-5d548bed37f9', CAST(N'1911-01-01' AS Date), NULL, 0, CAST(N'1911-01-01' AS Date), N'000', N'000', NULL, N'nnn', 1, N'nnn', NULL, NULL, NULL, NULL, NULL, NULL, N'nnn            ', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[User2] ([Id], [u_name], [BirthDate], [Gender], [HireDate], [CurrentFlag], [rowguid], [ModifiedDate], [receipt], [p_fee], [p_lastFeeDate], [PhoneNumber1], [PhoneNumber2], [u_memo], [RoleId], [u_active], [belongto], [CommCircleName], [u_location1], [u_location2], [u_location3], [AddressID], [AddressTypedId], [PostalCode], [SpatialLocation], [applyupgrade], [rejectreason], [u_occupation1], [u_occupation2], [u_occupation3]) VALUES (N'ac997e01-c355-4042-9254-163a2ffda1cc', N'hhh@c.g', CAST(N'1911-01-01' AS Date), N'0', CAST(N'1911-01-01' AS Date), 1, N'a9764b6a-b1cf-4593-91aa-f1e866a29493', CAST(N'1911-01-01' AS Date), NULL, 0, CAST(N'1911-01-01' AS Date), N'000', N'000', NULL, N'nnn', 1, N'nnn', NULL, NULL, NULL, NULL, NULL, NULL, N'nnn            ', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[User2] ([Id], [u_name], [BirthDate], [Gender], [HireDate], [CurrentFlag], [rowguid], [ModifiedDate], [receipt], [p_fee], [p_lastFeeDate], [PhoneNumber1], [PhoneNumber2], [u_memo], [RoleId], [u_active], [belongto], [CommCircleName], [u_location1], [u_location2], [u_location3], [AddressID], [AddressTypedId], [PostalCode], [SpatialLocation], [applyupgrade], [rejectreason], [u_occupation1], [u_occupation2], [u_occupation3]) VALUES (N'bba52790-b244-423b-b002-caa5e337138d', N'666@b.c', CAST(N'2016-11-14' AS Date), N'1', CAST(N'2037-05-02' AS Date), 1, N'12345678-1234-1234-1234-123456789018', CAST(N'2016-08-08' AS Date), N'2', 100, CAST(N'2016-03-06' AS Date), N'03-9283021', N'2', NULL, N'2', 1, N'22', NULL, N'桃園市', N'桃園市', N'中央路', 300, 6, N'330            ', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[User2] ([Id], [u_name], [BirthDate], [Gender], [HireDate], [CurrentFlag], [rowguid], [ModifiedDate], [receipt], [p_fee], [p_lastFeeDate], [PhoneNumber1], [PhoneNumber2], [u_memo], [RoleId], [u_active], [belongto], [CommCircleName], [u_location1], [u_location2], [u_location3], [AddressID], [AddressTypedId], [PostalCode], [SpatialLocation], [applyupgrade], [rejectreason], [u_occupation1], [u_occupation2], [u_occupation3]) VALUES (N'bd57fa3e-f0aa-4af1-b1ee-5606a99b7fe9', N'bbbbb@b.c', CAST(N'1911-01-01' AS Date), N'0', CAST(N'1911-01-01' AS Date), 1, N'322a9079-9b98-4be3-9caf-a2d1c0c721f2', CAST(N'1911-01-01' AS Date), NULL, 0, CAST(N'1911-01-01' AS Date), N'000', N'000', NULL, N'nnn', 1, N'nnn', NULL, NULL, NULL, NULL, NULL, NULL, N'nnn            ', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[User2] ([Id], [u_name], [BirthDate], [Gender], [HireDate], [CurrentFlag], [rowguid], [ModifiedDate], [receipt], [p_fee], [p_lastFeeDate], [PhoneNumber1], [PhoneNumber2], [u_memo], [RoleId], [u_active], [belongto], [CommCircleName], [u_location1], [u_location2], [u_location3], [AddressID], [AddressTypedId], [PostalCode], [SpatialLocation], [applyupgrade], [rejectreason], [u_occupation1], [u_occupation2], [u_occupation3]) VALUES (N'c65d50a1-02f2-466d-86dc-5242fac6ac26', N'999@b.c', CAST(N'1911-01-01' AS Date), N'0', CAST(N'1911-01-01' AS Date), 1, N'8be507a1-e52e-440b-b4b1-8e41ce7396ab', CAST(N'1911-01-01' AS Date), NULL, 0, CAST(N'1911-01-01' AS Date), N'000', N'000', NULL, N'nnn', 1, N'nnn', NULL, NULL, NULL, NULL, NULL, NULL, N'nnn            ', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[User2] ([Id], [u_name], [BirthDate], [Gender], [HireDate], [CurrentFlag], [rowguid], [ModifiedDate], [receipt], [p_fee], [p_lastFeeDate], [PhoneNumber1], [PhoneNumber2], [u_memo], [RoleId], [u_active], [belongto], [CommCircleName], [u_location1], [u_location2], [u_location3], [AddressID], [AddressTypedId], [PostalCode], [SpatialLocation], [applyupgrade], [rejectreason], [u_occupation1], [u_occupation2], [u_occupation3]) VALUES (N'c6cd4220-921b-47c1-892f-19a53650980e', N'jjj@b.c', CAST(N'1911-01-01' AS Date), N'0', CAST(N'1911-01-01' AS Date), 1, N'e8956491-6f67-4df4-9340-c568c3f2e486', CAST(N'1911-01-01' AS Date), NULL, 0, CAST(N'1911-01-01' AS Date), N'000', N'000', NULL, N'nnn', 1, N'nnn', NULL, NULL, NULL, NULL, NULL, NULL, N'nnn            ', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[User2] ([Id], [u_name], [BirthDate], [Gender], [HireDate], [CurrentFlag], [rowguid], [ModifiedDate], [receipt], [p_fee], [p_lastFeeDate], [PhoneNumber1], [PhoneNumber2], [u_memo], [RoleId], [u_active], [belongto], [CommCircleName], [u_location1], [u_location2], [u_location3], [AddressID], [AddressTypedId], [PostalCode], [SpatialLocation], [applyupgrade], [rejectreason], [u_occupation1], [u_occupation2], [u_occupation3]) VALUES (N'e1a4ded4-cfb8-4096-b5c1-6b7ce133b9ba', N'q3387176x@gmail.com', CAST(N'1911-01-01' AS Date), N'0', CAST(N'1911-01-01' AS Date), 1, N'39be5e6e-38e9-4896-8016-651436e29550', CAST(N'1911-01-01' AS Date), NULL, 0, CAST(N'1911-01-01' AS Date), N'000', N'000', NULL, N'nnn', 1, N'nnn', NULL, NULL, NULL, NULL, NULL, NULL, N'nnn            ', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[User2] ([Id], [u_name], [BirthDate], [Gender], [HireDate], [CurrentFlag], [rowguid], [ModifiedDate], [receipt], [p_fee], [p_lastFeeDate], [PhoneNumber1], [PhoneNumber2], [u_memo], [RoleId], [u_active], [belongto], [CommCircleName], [u_location1], [u_location2], [u_location3], [AddressID], [AddressTypedId], [PostalCode], [SpatialLocation], [applyupgrade], [rejectreason], [u_occupation1], [u_occupation2], [u_occupation3]) VALUES (N'f3cd6b7a-c359-41f6-8682-16e1fd32bcc7', N'n@o.p', CAST(N'1911-01-01' AS Date), N'0', CAST(N'1911-01-01' AS Date), 1, N'bfcf6aa2-eb25-4b6c-b12d-3008d6c6e2b2', CAST(N'1911-01-01' AS Date), NULL, 0, CAST(N'1911-01-01' AS Date), N'000', N'000', NULL, N'nnn', 1, N'nnn', NULL, NULL, NULL, NULL, NULL, NULL, N'nnn            ', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[User2] ([Id], [u_name], [BirthDate], [Gender], [HireDate], [CurrentFlag], [rowguid], [ModifiedDate], [receipt], [p_fee], [p_lastFeeDate], [PhoneNumber1], [PhoneNumber2], [u_memo], [RoleId], [u_active], [belongto], [CommCircleName], [u_location1], [u_location2], [u_location3], [AddressID], [AddressTypedId], [PostalCode], [SpatialLocation], [applyupgrade], [rejectreason], [u_occupation1], [u_occupation2], [u_occupation3]) VALUES (N'ffe3af90-70c7-43b8-a700-d8ef6028f886', N'ggg@b.c', CAST(N'1911-01-01' AS Date), N'0', CAST(N'1911-01-01' AS Date), 1, N'485fd860-148c-4cf1-a8e5-abdfb235b3d9', CAST(N'1911-01-01' AS Date), NULL, 0, CAST(N'1911-01-01' AS Date), N'000', N'000', NULL, N'nnn', 1, N'nnn', NULL, NULL, NULL, NULL, NULL, NULL, N'nnn            ', NULL, 0, NULL, NULL, NULL, NULL)
ALTER TABLE [dbo].[OrderRecord] ADD  DEFAULT ((0)) FOR [or_invoice_public]
GO
ALTER TABLE [dbo].[OrderRecord] ADD  DEFAULT ((0)) FOR [bill]
GO
ALTER TABLE [dbo].[OrderRecord] ADD  DEFAULT ((0)) FOR [or_payment_status]
GO
ALTER TABLE [dbo].[OrderRecord] ADD  DEFAULT ((0)) FOR [or_payment_confirmed]
GO
ALTER TABLE [dbo].[OrderRecord] ADD  DEFAULT ((0)) FOR [or_remitMoney]
GO
ALTER TABLE [dbo].[BeaconDevice]  WITH CHECK ADD FOREIGN KEY([bpt_id])
REFERENCES [dbo].[BroadcastPointType] ([bpt_id])
GO
ALTER TABLE [dbo].[DeviceInfo]  WITH CHECK ADD  CONSTRAINT [FK_DeviceInfo_BeaconDevice] FOREIGN KEY([d_id])
REFERENCES [dbo].[BeaconDevice] ([d_id])
GO
ALTER TABLE [dbo].[DeviceInfo] CHECK CONSTRAINT [FK_DeviceInfo_BeaconDevice]
GO
ALTER TABLE [dbo].[DeviceInfo]  WITH CHECK ADD  CONSTRAINT [FK_DeviceInfo_Info] FOREIGN KEY([i_id])
REFERENCES [dbo].[Infos] ([i_id])
GO
ALTER TABLE [dbo].[DeviceInfo] CHECK CONSTRAINT [FK_DeviceInfo_Info]
GO
ALTER TABLE [dbo].[DeviceUsers]  WITH CHECK ADD  CONSTRAINT [FK_DeviceUsers_BeaconDevice] FOREIGN KEY([d_id])
REFERENCES [dbo].[BeaconDevice] ([d_id])
GO
ALTER TABLE [dbo].[DeviceUsers] CHECK CONSTRAINT [FK_DeviceUsers_BeaconDevice]
GO
ALTER TABLE [dbo].[DeviceUsers]  WITH CHECK ADD  CONSTRAINT [FK_DeviceUsers_User2] FOREIGN KEY([u_id])
REFERENCES [dbo].[User2] ([Id])
GO
ALTER TABLE [dbo].[DeviceUsers] CHECK CONSTRAINT [FK_DeviceUsers_User2]
GO
ALTER TABLE [dbo].[Infos]  WITH CHECK ADD  CONSTRAINT [FK_Info_InfoGroup] FOREIGN KEY([ig_id])
REFERENCES [dbo].[InfoGroupp] ([ig_id])
GO
ALTER TABLE [dbo].[Infos] CHECK CONSTRAINT [FK_Info_InfoGroup]
GO
ALTER TABLE [dbo].[Infos]  WITH CHECK ADD  CONSTRAINT [FK_Infos_User2] FOREIGN KEY([u_id])
REFERENCES [dbo].[User2] ([Id])
GO
ALTER TABLE [dbo].[Infos] CHECK CONSTRAINT [FK_Infos_User2]
GO
ALTER TABLE [dbo].[OrderRecord]  WITH CHECK ADD FOREIGN KEY([u_id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[User2]  WITH CHECK ADD  CONSTRAINT [FK_User2_AspNetUsers] FOREIGN KEY([Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[User2] CHECK CONSTRAINT [FK_User2_AspNetUsers]
GO
/****** Object:  StoredProcedure [dbo].[usp_PushAdvertisingStatistics]    Script Date: 2017/9/19 下午 02:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_PushAdvertisingStatistics]
	@GetAllData bit,
	@CountyCity varchar(10),
	@TownshipCity varchar(10),
	@BdfBroadcastPoint varchar(200),
	@DName varchar(20),
	@NowDatetime datetime
AS
	IF(1 = @GetAllData)
		BEGIN
			SELECT 
				row_number() OVER(ORDER BY bpt_broadcastPoint) AS rowNumber, COUNT([d_name]) AS quantity, [bpt_broadcastPoint], [bdf_name], [d_name], [d_location3], [d_location4], [bdf_price]
			FROM [POP].[dbo].[uv_ConditionalSearchPushAdvertisin]
			WHERE [i_open] = 1 AND [i_expired_day] >= @NowDatetime
			GROUP BY [bpt_broadcastPoint], [bdf_name], [d_name], [d_location3], [d_location4], [bdf_price]
		END
	ELSE
		BEGIN
			IF(@BdfBroadcastPoint = 'all')
				BEGIN
					IF (@DName IS NULL OR @DName = N'')
						SELECT 
							row_number() OVER(ORDER BY bpt_broadcastPoint) AS rowNumber, COUNT([d_name]) AS quantity, [bpt_broadcastPoint], [bdf_name], [d_name], [d_location3], [d_location4], [bdf_price]
							FROM [POP].[dbo].[uv_ConditionalSearchPushAdvertisin]
							WHERE [d_location1] = @CountyCity AND [d_location2] = @TownshipCity AND [i_open] = 1 AND [i_expired_day] >= @NowDatetime
							GROUP BY [bpt_broadcastPoint], [bdf_name], [d_name], [d_location3], [d_location4], [bdf_price]
					ELSE
						SELECT 
							row_number() OVER(ORDER BY bpt_broadcastPoint) AS rowNumber, COUNT([d_name]) AS quantity, [bpt_broadcastPoint], [bdf_name], [d_name], [d_location3], [d_location4], [bdf_price]
							FROM [POP].[dbo].[uv_ConditionalSearchPushAdvertisin]
							WHERE [d_location1] = @CountyCity AND [d_location2] = @TownshipCity AND [d_name] like '%' + @DName + '%' AND [i_open] = 1 AND [i_expired_day] >= @NowDatetime
							GROUP BY [bpt_broadcastPoint], [bdf_name], [d_name], [d_location3], [d_location4], [bdf_price]
				END
			ELSE
				BEGIN
					IF (@DName IS NULL OR @DName = N'')
						SELECT 
							row_number() OVER(ORDER BY bpt_broadcastPoint) AS rowNumber, COUNT([d_name]) AS quantity, [bpt_broadcastPoint], [bdf_name], [d_name], [d_location3], [d_location4], [bdf_price]
						  FROM [POP].[dbo].[uv_ConditionalSearchPushAdvertisin]
						  WHERE [d_location1] = @CountyCity AND [d_location2] = @TownshipCity AND [bpt_broadcastPoint] = @BdfBroadcastPoint AND [i_open] = 1 AND [i_expired_day] >= @NowDatetime
						  GROUP BY [bpt_broadcastPoint], [bdf_name], [d_name], [d_location3], [d_location4], [bdf_price]

					ELSE
						SELECT 
							row_number() OVER(ORDER BY bpt_broadcastPoint) AS rowNumber, COUNT([d_name]) AS quantity, [bpt_broadcastPoint], [bdf_name], [d_name], [d_location3], [d_location4], [bdf_price]
						  FROM [POP].[dbo].[uv_ConditionalSearchPushAdvertisin]
						  WHERE [d_location1] = @CountyCity AND [d_location2] = @TownshipCity AND [bpt_broadcastPoint] = @BdfBroadcastPoint AND [d_name] like '%' + @DName + '%' AND [i_open] = 1 AND [i_expired_day] >= @NowDatetime
						  GROUP BY [bpt_broadcastPoint], [bdf_name], [d_name], [d_location3], [d_location4], [bdf_price]
				END
		END

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'社團資料表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Club'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'社群資料表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Community'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[44] 4[21] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "town"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BeaconDevice"
            Begin Extent = 
               Top = 6
               Left = 241
               Bottom = 284
               Right = 406
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DeviceInfo"
            Begin Extent = 
               Top = 6
               Left = 444
               Bottom = 102
               Right = 609
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Infos"
            Begin Extent = 
               Top = 0
               Left = 705
               Bottom = 420
               Right = 871
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AAA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AAA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AAA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[53] 4[8] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AspNetUsers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 289
               Right = 270
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Infos"
            Begin Extent = 
               Top = 6
               Left = 308
               Bottom = 418
               Right = 474
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AspNetUsers_Infos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AspNetUsers_Infos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[34] 4[20] 2[16] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "town"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 110
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BeaconDevice"
            Begin Extent = 
               Top = 12
               Left = 282
               Bottom = 142
               Right = 447
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DeviceInfo"
            Begin Extent = 
               Top = 7
               Left = 553
               Bottom = 103
               Right = 718
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Infos"
            Begin Extent = 
               Top = 114
               Left = 31
               Bottom = 282
               Right = 192
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "InfoGroupp"
            Begin Extent = 
               Top = 6
               Left = 756
               Bottom = 136
               Right = 921
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 38
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_BeaconDevice_LF_DeviceInfo_LF_Info_LF_InfoGroup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_BeaconDevice_LF_DeviceInfo_LF_Info_LF_InfoGroup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_BeaconDevice_LF_DeviceInfo_LF_Info_LF_InfoGroup'
GO
USE [master]
GO
ALTER DATABASE [POP] SET  READ_WRITE 
GO
