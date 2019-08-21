USE [master]
GO
/****** Object:  Database [E-Com]    Script Date: 7/24/2019 4:21:07 PM ******/
CREATE DATABASE [E-Com]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'E-Com', FILENAME = N'C:\Users\apurva.shepal\E-Com.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'E-Com_log', FILENAME = N'C:\Users\apurva.shepal\E-Com_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [E-Com] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [E-Com].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [E-Com] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [E-Com] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [E-Com] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [E-Com] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [E-Com] SET ARITHABORT OFF 
GO
ALTER DATABASE [E-Com] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [E-Com] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [E-Com] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [E-Com] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [E-Com] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [E-Com] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [E-Com] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [E-Com] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [E-Com] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [E-Com] SET  DISABLE_BROKER 
GO
ALTER DATABASE [E-Com] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [E-Com] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [E-Com] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [E-Com] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [E-Com] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [E-Com] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [E-Com] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [E-Com] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [E-Com] SET  MULTI_USER 
GO
ALTER DATABASE [E-Com] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [E-Com] SET DB_CHAINING OFF 
GO
ALTER DATABASE [E-Com] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [E-Com] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [E-Com]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/24/2019 4:21:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[AccountNo] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[phone] [int] NULL,
	[email] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DeliveryDetails]    Script Date: 7/24/2019 4:21:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DeliveryDetails](
	[DeliveryId] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[DeliveryAddress] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[pin] [int] NULL,
	[AccountNo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DeliveryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 7/24/2019 4:21:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Discount](
	[DiscountId] [int] NOT NULL,
	[DicountName] [varchar](20) NULL,
	[DiscountPercentage] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 7/24/2019 4:21:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inventory](
	[ItemId] [int] NOT NULL,
	[ItemName] [varchar](50) NULL,
	[quantity] [int] NULL,
	[Price] [float] NULL,
	[DiscountId] [int] NULL,
	[ProductId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 7/24/2019 4:21:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceId] [int] NOT NULL,
	[InvoiceDate] [date] NULL,
	[ShipmentId] [int] NULL,
	[OrderId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderTable]    Script Date: 7/24/2019 4:21:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderTable](
	[OrderId] [int] NOT NULL,
	[Amount] [int] NULL,
	[CartNum] [int] NULL,
	[OrderStatus] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 7/24/2019 4:21:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[CartNum] [int] NOT NULL,
	[CartStatus] [varchar](20) NULL,
	[ItemID] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CartNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [AccSearch]    Script Date: 7/24/2019 4:21:07 PM ******/
CREATE NONCLUSTERED INDEX [AccSearch] ON [dbo].[Account]
(
	[AccountNo] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Search]    Script Date: 7/24/2019 4:21:07 PM ******/
CREATE NONCLUSTERED INDEX [Search] ON [dbo].[OrderTable]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DeliveryDetails]  WITH CHECK ADD FOREIGN KEY([AccountNo])
REFERENCES [dbo].[Account] ([AccountNo])
GO
ALTER TABLE [dbo].[DeliveryDetails]  WITH CHECK ADD FOREIGN KEY([AccountNo])
REFERENCES [dbo].[Account] ([AccountNo])
GO
ALTER TABLE [dbo].[DeliveryDetails]  WITH CHECK ADD FOREIGN KEY([AccountNo])
REFERENCES [dbo].[Account] ([AccountNo])
GO
ALTER TABLE [dbo].[DeliveryDetails]  WITH CHECK ADD FOREIGN KEY([AccountNo])
REFERENCES [dbo].[Account] ([AccountNo])
GO
ALTER TABLE [dbo].[OrderTable]  WITH CHECK ADD FOREIGN KEY([CartNum])
REFERENCES [dbo].[ShoppingCart] ([CartNum])
GO
ALTER TABLE [dbo].[OrderTable]  WITH CHECK ADD FOREIGN KEY([CartNum])
REFERENCES [dbo].[ShoppingCart] ([CartNum])
GO
ALTER TABLE [dbo].[OrderTable]  WITH CHECK ADD FOREIGN KEY([CartNum])
REFERENCES [dbo].[ShoppingCart] ([CartNum])
GO
/****** Object:  StoredProcedure [dbo].[udstpInserData]    Script Date: 7/24/2019 4:21:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[udstpInserData]
	-- Add the parameters for the stored procedure here
	@AccountNo int,
	@Name  varchar(50),
	@Email varchar(100),
	@phoneNo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO	Account VALUES (@AccountNo,@Name,@PhoneNo,@Email);
END



GO
USE [master]
GO
ALTER DATABASE [E-Com] SET  READ_WRITE 
GO
