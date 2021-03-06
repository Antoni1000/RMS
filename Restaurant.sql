USE [Restaurants]
GO
ALTER TABLE [dbo].[OrderDish] DROP CONSTRAINT [FK_OrderDish_Product]
GO
ALTER TABLE [dbo].[OrderDish] DROP CONSTRAINT [FK_OrderDish_Order]
GO
ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_Admin]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19/6/2022 10:36:25 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
DROP TABLE [dbo].[Product]
GO
/****** Object:  Table [dbo].[OrderDish]    Script Date: 19/6/2022 10:36:25 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderDish]') AND type in (N'U'))
DROP TABLE [dbo].[OrderDish]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 19/6/2022 10:36:25 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order]') AND type in (N'U'))
DROP TABLE [dbo].[Order]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 19/6/2022 10:36:25 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
DROP TABLE [dbo].[Customer]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 19/6/2022 10:36:25 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Admin]') AND type in (N'U'))
DROP TABLE [dbo].[Admin]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 19/6/2022 10:36:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[adminID] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[gender] [bit] NOT NULL,
	[phoneNumber] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[cmnd] [nvarchar](50) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[isAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[adminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 19/6/2022 10:36:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[userName] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[customerID] [int] NOT NULL,
	[customerName] [nvarchar](50) NOT NULL,
	[gender] [bit] NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[phoneNumber] [nvarchar](50) NOT NULL,
	[isAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_Customer_1] PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 19/6/2022 10:36:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[orderID] [numeric](18, 0) NOT NULL,
	[customerID] [int] NOT NULL,
	[orderDate] [datetime] NOT NULL,
	[isPaid] [bit] NOT NULL,
	[total] [real] NOT NULL,
	[adminID] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDish]    Script Date: 19/6/2022 10:36:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDish](
	[orderDishID] [numeric](18, 0) NOT NULL,
	[orderID] [numeric](18, 0) NOT NULL,
	[productID] [varchar](10) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [real] NOT NULL,
	[note] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrderDish_1] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19/6/2022 10:36:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productID] [varchar](10) NOT NULL,
	[productName] [nvarchar](50) NOT NULL,
	[unit] [varchar](50) NOT NULL,
	[image] [varchar](50) NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Admin] FOREIGN KEY([adminID])
REFERENCES [dbo].[Admin] ([adminID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Admin]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([customerID])
REFERENCES [dbo].[Customer] ([customerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[OrderDish]  WITH CHECK ADD  CONSTRAINT [FK_OrderDish_Order] FOREIGN KEY([orderID])
REFERENCES [dbo].[Order] ([orderID])
GO
ALTER TABLE [dbo].[OrderDish] CHECK CONSTRAINT [FK_OrderDish_Order]
GO
ALTER TABLE [dbo].[OrderDish]  WITH CHECK ADD  CONSTRAINT [FK_OrderDish_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[OrderDish] CHECK CONSTRAINT [FK_OrderDish_Product]
GO
