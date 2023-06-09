USE [shoplinkien]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/8/2023 9:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 5/8/2023 9:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Salt] [nchar](6) NULL,
	[Active] [bit] NULL CONSTRAINT [DF_Accounts_Active]  DEFAULT ((0)),
	[FullName] [nvarchar](150) NULL,
	[RoleID] [int] NULL,
	[LastLogin] [datetime] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AttributePrices]    Script Date: 5/8/2023 9:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttributePrices](
	[AttributesPriceID] [int] IDENTITY(1,1) NOT NULL,
	[AttributeID] [int] NULL,
	[ProductID] [int] NULL,
	[Price] [int] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_AttributePrices] PRIMARY KEY CLUSTERED 
(
	[AttributesPriceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Attributes]    Script Date: 5/8/2023 9:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attributes](
	[AttributeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Attributes] PRIMARY KEY CLUSTERED 
(
	[AttributeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5/8/2023 9:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CatID] [int] IDENTITY(1,1) NOT NULL,
	[CatName] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[ParentID] [int] NULL,
	[Levels] [int] NULL,
	[Ordering] [int] NULL,
	[Published] [bit] NULL,
	[Thumb] [nvarchar](250) NULL,
	[Title] [nvarchar](250) NULL,
	[Alias] [nvarchar](250) NULL,
	[MetaDesc] [nvarchar](250) NULL,
	[Metakey] [nvarchar](250) NULL,
	[Cover] [nvarchar](255) NULL,
	[SchemaMarkup] [nvarchar](max) NULL,
	[PdGroupID] [int] NULL,
	[Creator] [nvarchar](150) NULL,
	[UpdateBy] [nvarchar](150) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 5/8/2023 9:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](255) NULL,
	[Birthday] [datetime] NULL,
	[Avatar] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Email] [nchar](150) NULL,
	[Phone] [varchar](12) NULL,
	[LocationID] [int] NULL,
	[District] [int] NULL,
	[Ward] [int] NULL,
	[CreateDate] [datetime] NULL,
	[Password] [nvarchar](50) NULL,
	[Salt] [nchar](8) NULL,
	[LastLogin] [datetime] NULL,
	[Active] [bit] NULL,
	[AccountID] [int] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiTins]    Script Date: 5/8/2023 9:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiTins](
	[LoaitinID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_LoaiTin] PRIMARY KEY CLUSTERED 
(
	[LoaitinID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Locations]    Script Date: 5/8/2023 9:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Type] [nvarchar](20) NULL,
	[Slug] [nvarchar](100) NULL,
	[NameWithType] [nvarchar](255) NULL,
	[PathWithType] [nvarchar](255) NULL,
	[ParentCode] [int] NULL,
	[Levels] [int] NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 5/8/2023 9:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[OrderNumber] [int] NULL,
	[Quantity] [int] NULL,
	[Discount] [int] NULL,
	[Price] [int] NULL,
	[ShipDate] [datetime] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/8/2023 9:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[ShipDate] [datetime] NULL,
	[TransactStatusID] [int] NULL,
	[Deleted] [bit] NULL,
	[Paid] [bit] NULL,
	[PaymentDate] [datetime] NULL,
	[PaymentID] [int] NULL,
	[Note] [nvarchar](max) NULL,
	[Total] [int] NULL,
	[PaymentStatusID] [bit] NULL,
	[ShipperID] [int] NULL,
	[Address] [nvarchar](150) NULL,
	[LocationId] [int] NULL,
	[District] [int] NULL,
	[Ward] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pages]    Script Date: 5/8/2023 9:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[PageID] [int] IDENTITY(1,1) NOT NULL,
	[PageName] [nvarchar](250) NULL,
	[Contents] [nvarchar](max) NULL,
	[Thumb] [nvarchar](250) NULL,
	[Published] [bit] NULL,
	[Title] [nvarchar](250) NULL,
	[MetaDesc] [nvarchar](250) NULL,
	[MetaKey] [nvarchar](250) NULL,
	[Alias] [nvarchar](250) NULL,
	[CreatedAt] [datetime] NULL,
	[Ordering] [int] NULL,
	[Creator] [nvarchar](150) NULL,
 CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED 
(
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payments]    Script Date: 5/8/2023 9:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PdGroups]    Script Date: 5/8/2023 9:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PdGroups](
	[PdGroupID] [int] IDENTITY(1,1) NOT NULL,
	[NamePdGroup] [nvarchar](100) NULL,
 CONSTRAINT [PK_PdGroups] PRIMARY KEY CLUSTERED 
(
	[PdGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/8/2023 9:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](255) NULL,
	[ShortDesc] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[CatID] [int] NULL,
	[Price] [int] NULL,
	[Discount] [int] NULL,
	[Image] [nvarchar](255) NULL,
	[Video] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[BestSellers] [bit] NULL,
	[HomeFlag] [bit] NULL,
	[Active] [bit] NULL,
	[Tags] [nvarchar](max) NULL,
	[Title] [nvarchar](255) NULL,
	[Alias] [nvarchar](255) NULL,
	[MetaDesc] [nvarchar](255) NULL,
	[MetaKey] [nvarchar](255) NULL,
	[UnitslnStock] [int] NULL,
	[Creator] [nvarchar](150) NULL,
	[UpdateBy] [nvarchar](150) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/8/2023 9:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[Descriptiton] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shippers]    Script Date: 5/8/2023 9:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shippers](
	[ShipperID] [int] IDENTITY(1,1) NOT NULL,
	[ShipperCompName] [nvarchar](150) NULL,
 CONSTRAINT [PK_Shippers] PRIMARY KEY CLUSTERED 
(
	[ShipperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTinTucs]    Script Date: 5/8/2023 9:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTinTucs](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Scontents] [nvarchar](255) NULL,
	[Contents] [nvarchar](max) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Published] [bit] NULL,
	[Alias] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[Author] [nvarchar](255) NULL,
	[AccountID] [int] NULL,
	[Tags] [nvarchar](max) NULL,
	[CatID] [int] NULL,
	[isHot] [bit] NULL,
	[isNewfeed] [bit] NULL,
	[MetaKey] [nvarchar](255) NULL,
	[MetaDesc] [nvarchar](255) NULL,
	[Views] [int] NULL,
	[LoaitinID] [int] NULL,
 CONSTRAINT [PK_tblTinTucs] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransactStatus]    Script Date: 5/8/2023 9:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactStatus](
	[TransactStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_TransactStatus] PRIMARY KEY CLUSTERED 
(
	[TransactStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (1, N'may tinh', N'may tinh', N'may tinh nhật bản', N'1     ', 0, N'2000', NULL, NULL, CAST(N'2023-02-17 00:00:00.000' AS DateTime))
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (2, N'Pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (3, N'pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (4, N'pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (5, N'pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (6, N'pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (7, N'pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (8, N'pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (9, N'pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (10, N'pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (11, N'pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (12, N'pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (13, N'pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (14, N'pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (15, N'pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (16, N'pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (17, N'pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (18, N'pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (19, N'pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (20, N'pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (21, N'pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (22, N'pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (23, N'pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (24, N'pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (25, N'pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (26, N'pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (27, N'pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (28, N'pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (29, N'Pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (30, N'pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (31, N'Pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (32, N'pc', N'pc', N'pc', N'1     ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (33, N'Ram', N'ram', N'ram', N'2     ', 0, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CatID], [CatName], [Description], [ParentID], [Levels], [Ordering], [Published], [Thumb], [Title], [Alias], [MetaDesc], [Metakey], [Cover], [SchemaMarkup], [PdGroupID], [Creator], [UpdateBy]) VALUES (1, N'may tinh', N'may tinh', NULL, NULL, 1, 1, N'may-tinh.png', N'faf', NULL, N'dad', N'dad', NULL, N'dad', NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Description], [ParentID], [Levels], [Ordering], [Published], [Thumb], [Title], [Alias], [MetaDesc], [Metakey], [Cover], [SchemaMarkup], [PdGroupID], [Creator], [UpdateBy]) VALUES (2, N'ram', N'ram', NULL, NULL, 1, 1, N'ram.png', N'ram', NULL, N'ram', N'ram', NULL, N'ram', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [FullName], [Birthday], [Avatar], [Address], [Email], [Phone], [LocationID], [District], [Ward], [CreateDate], [Password], [Salt], [LastLogin], [Active], [AccountID]) VALUES (3, N'nguyen luan', NULL, NULL, N'100 thanh thai', N'nguyenluan@gmail.com                                                                                                                                  ', N'0967285018', 1, 1, 1, CAST(N'2023-04-29 17:19:30.577' AS DateTime), N'9852110af08fcce206f937861639e91f', N'$&q[f   ', NULL, 1, 3)
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Birthday], [Avatar], [Address], [Email], [Phone], [LocationID], [District], [Ward], [CreateDate], [Password], [Salt], [LastLogin], [Active], [AccountID]) VALUES (4, N'nguyen luan', NULL, NULL, N'100 thanh thai', N'a@gmail.com                                                                                                                                           ', N'1234656565', 1, 1, 1, CAST(N'2023-04-29 21:47:13.153' AS DateTime), N'ab41367028661bde9b8095d1a9a6822e', N'47b7t   ', NULL, 1, NULL)
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Birthday], [Avatar], [Address], [Email], [Phone], [LocationID], [District], [Ward], [CreateDate], [Password], [Salt], [LastLogin], [Active], [AccountID]) VALUES (5, N'nguyen van v', NULL, NULL, N'fadfad', N'b@gmail.com                                                                                                                                           ', N'0123456789', NULL, NULL, NULL, CAST(N'2023-05-08 21:10:14.810' AS DateTime), N'0d837ee4cd3eb919083c7ebe09593bb2', N'w8(9e   ', NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([LocationID], [Name], [Type], [Slug], [NameWithType], [PathWithType], [ParentCode], [Levels]) VALUES (1, N'Đong Nai', N'Đong Nai', N'Đong Nai', N'Đong Nai', N'Đong Nai', 24234, 1)
SET IDENTITY_INSERT [dbo].[Locations] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (69, N'may tinh', N'may tinh', N'may tinh nhật bản', 1, 2000, 2000, N'may tinh nhat', N'khong', CAST(N'2023-02-17 00:00:00.000' AS DateTime), CAST(N'2023-02-17 00:00:00.000' AS DateTime), 1, 1, 1, N'1', N'may tinh', N'1', N'may tinh', N'1', 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (70, N'Pc', N'pc', N'pc', 1, 30000, NULL, N'pc.png', NULL, NULL, CAST(N'2023-04-26 23:34:08.727' AS DateTime), 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (71, N'pc', N'pc', N'pc', 1, 30000, NULL, N'pc.jpg', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (72, N'pc', N'pc', N'pc', 1, 30000, NULL, N'pc.jpg', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (73, N'pc', N'pc', N'pc', 1, 30000, NULL, N'pc.jpg', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (74, N'pc', N'pc', N'pc', 1, 30000, NULL, N'pc.jpg', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (75, N'pc', N'pc', N'pc', 1, 30000, NULL, N'pc.jpg', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (76, N'pc', N'pc', N'pc', 1, 30000, NULL, N'pc.jpg', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (77, N'pc', N'pc', N'pc', 1, 30000, NULL, N'pc.jpg', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (78, N'pc', N'pc', N'pc', 1, 30000, NULL, N'pc.jpg', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (79, N'pc', N'pc', N'pc', 1, 30000, NULL, N'pc.jpg', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (80, N'pc', N'pc', N'pc', 1, 30000, NULL, N'pc.jpg', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (81, N'pc', N'pc', N'pc', 1, 30000, NULL, N'pc.jpg', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (82, N'pc', N'pc', N'pc', 1, 30000, NULL, N'pc.jpg', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (83, N'pc', N'pc', N'pc', 1, 30000, NULL, N'pc.jpg', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (84, N'pc', N'pc', N'pc', 1, 30000, NULL, N'pc.jpg', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (85, N'pc', N'pc', N'pc', 1, 30000, NULL, N'pc.jpg', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (86, N'pc', N'pc', N'pc', 1, 30000, NULL, N'pc.jpg', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (87, N'pc', N'pc', N'pc', 1, 30000, NULL, N'pc.jpg', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (88, N'pc', N'pc', N'pc', 1, 30000, NULL, N'pc.jpg', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (89, N'pc', N'pc', N'pc', 1, 30000, NULL, N'pc.jpg', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (90, N'pc', N'pc', N'pc', 1, 30000, NULL, N'pc.jpg', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (91, N'pc', N'pc', N'pc', 1, 30000, NULL, N'pc.jpg', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (92, N'pc', N'pc', N'pc', 1, 30000, NULL, N'pc.jpg', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (93, N'pc', N'pc', N'pc', 1, 30000, NULL, N'pc.jpg', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (94, N'pc', N'pc', N'pc', 1, 30000, NULL, N'pc.jpg', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (95, N'pc', N'pc', N'pc', 1, 30000, NULL, N'pc.jpg', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (96, N'pc', N'pc', N'pc', 1, 30000, NULL, N'pc.jpg', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (97, N'Pc', N'pc', N'pc', 1, 30000, NULL, N'pc.png', NULL, NULL, CAST(N'2023-04-26 22:58:09.690' AS DateTime), 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (98, N'pc', N'pc', N'pc', 1, 30000, NULL, N'pc.jpg', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (99, N'Pc', N'pc', N'pc', 1, 30000, NULL, N'pc.png', NULL, NULL, CAST(N'2023-04-26 23:34:31.743' AS DateTime), 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (100, N'pc', N'pc', N'pc', 1, 30000, NULL, N'pc.jpg', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, N'pc', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Image], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock], [Creator], [UpdateBy]) VALUES (101, N'Ram', N'ram', N'ram', 2, 30000, NULL, N'ram.png', NULL, NULL, CAST(N'2023-04-26 23:34:24.427' AS DateTime), 1, 1, 1, NULL, NULL, N'ram', NULL, NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[tblTinTucs] ON 

INSERT [dbo].[tblTinTucs] ([PostID], [Title], [Scontents], [Contents], [Thumb], [Published], [Alias], [CreatedDate], [Author], [AccountID], [Tags], [CatID], [isHot], [isNewfeed], [MetaKey], [MetaDesc], [Views], [LoaitinID]) VALUES (1, N'Ram máy tính giảm giá sập sàn', N'5', N'Hôm nay là chương trình khuyến mãi đặc biệt dành cho các bạn nào muốn có một cây ram xịn xò mà giảm giá cực sốc', N'2', 1, N'ram', CAST(N'2023-03-02 22:01:00.000' AS DateTime), N'Luancodedao', 1, N'ram', 1, 1, 1, N'ram', N'ram', 100000, NULL)
INSERT [dbo].[tblTinTucs] ([PostID], [Title], [Scontents], [Contents], [Thumb], [Published], [Alias], [CreatedDate], [Author], [AccountID], [Tags], [CatID], [isHot], [isNewfeed], [MetaKey], [MetaDesc], [Views], [LoaitinID]) VALUES (2, N'Bức xúc vì du khách đến KDL Biển Đông tắm biển phải mua vé vào cổng', NULL, N'<h2 class="detail-sapo" data-role="sapo" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; border-top: 1px solid rgb(235, 235, 235); font-weight: 700; font-size: 17px; line-height: 26px; color: rgb(41, 41, 41); padding: 24px 0px; font-family: Merriweather;">Người dân và du khách bức xúc vì khi vào cổng số 2 khu du lịch Biển Đông (P.Thắng Tam, TP.Vũng Tàu, Bà Rịa - Vũng Tàu) để xuống tắm biển đều bị nhân viên ở đây thu tiền với giá 110.000 đồng/người.</h2><div id="zone-k911czvz" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; color: rgb(51, 51, 51); font-family: Merriweather; font-size: 14px;"><div id="share-k911czwh" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px;"><div id="placement-kalw78co" revenue="cpm" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px;"><div id="banner-k911czvz-kalw78d7" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; min-height: 0px; min-width: 0px;"><div id="slot-1-k911czvz-kalw78d7" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px;"><div id="ssppagebid_6302" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px;"></div></div></div></div></div></div><div class="detail-cmain" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; margin-bottom: 24px;"><div class="detail-content afcbc-body" data-role="content" itemprop="articleBody" data-io-article-url="https://thanhnien.vn/buc-xuc-vi-du-khach-den-kdl-bien-dong-tam-bien-phai-mua-ve-vao-cong-185230425174952686.htm" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; max-width: 100%; line-height: 26px !important;"><div data-check-position="body_start" style="color: rgb(41, 41, 41); font-family: Inter; font-size: 17px; -webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; height: 0px;"></div><p style="color: rgb(41, 41, 41); font-family: Inter; font-size: 17px; -webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; margin: 0.5em 0px 24px;">Trao đổi với PV&nbsp;<i style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box;">Thanh Niên</i>&nbsp;ngày 25.4, trung tá Nguyễn Ngọc Phương, Giám đốc Trung tâm điều dưỡng và phục hồi chức năng Phương Đông (Bộ Công an) bức xúc vì hàng ngày khi cán bộ, chiến sĩ cũng như&nbsp;<a class="link-inline-content" href="https://thanhnien.vn/phuc-bat-chuyen-gia-cay-cop-chuyen-rinh-mo-trom-cap-du-khach-tam-bien-da-nang-1851520590.htm" title="du khách đi tắm biển" data-rel="follow" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; color: rgb(0, 152, 209); outline: 0px;">du khách đi tắm biển</a>&nbsp;qua cổng số 2 khu du lịch (KDL) Biển Đông thì lực lượng bảo vệ, nhân viên của KDL không cho vào, buộc phải mua vé.</p><p style="color: rgb(41, 41, 41); font-family: Inter; font-size: 17px; -webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; margin: 0.5em 0px 24px;">"Họ bắt cán bộ, chiến sĩ phải đưa 110.000 đồng/người thì mới cho vào, dù chúng tôi chỉ đi vào để tắm biển chứ không sử dụng dịch vụ dù, ghế bố, tắm nước ngọt của KDL. Khi cán bộ, chiến sĩ không đồng ý đóng tiền thì họ không cho vào, buộc đi đường khác để&nbsp;<a class="link-inline-content" href="https://thanhnien.vn/binh-thuan-song-to-lam-mot-ngu-dan-tren-tau-ca-roi-xuong-bien-mat-tich-185230313141157031.htm" title="xuống biển tắm" data-rel="follow" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; color: rgb(0, 152, 209); outline: 0px;">xuống biển tắm</a>", trung tá Phương bức xúc.</p><p style="color: rgb(41, 41, 41); font-family: Inter; font-size: 17px; -webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; margin: 0.5em 0px 24px;">Tương tự, nhiều chủ khách sạn ở Bãi Sau (TP.Vũng Tàu) cũng bày tỏ bức xúc vì khách của họ không được xuống biển nếu phải đi qua cổng số 2 mà không mua vé vào cổng.</p><p style="color: rgb(41, 41, 41); font-family: Inter; font-size: 17px; -webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; margin: 0.5em 0px 24px;">Ngày 25.4, PV&nbsp;<i style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box;">Thanh Niên</i>&nbsp;vào cổng số 2 KDL Biển Đông để xuống biển thì bị 1 phụ nữ chặn xe lại, yêu cầu đóng tiền mới được vào cổng. Mặc dù chúng tôi trình bày chỉ xuống tắm biển, không sử dụng dịch vụ ghế bố, tắm nước ngọt của KDL nhưng người phụ nữ này vẫn không cho vào, yêu cầu đi xuống biển bằng lối khác.</p><p style="color: rgb(41, 41, 41); font-family: Inter; font-size: 17px; -webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; margin: 0.5em 0px 24px;">Trao đổi với PV&nbsp;<i style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box;">Thanh Niên</i>, 1 lãnh đạo KDL Biển Đông lý giải việc thu tiền của khách vào cổng số 2 để xuống biển tắm nhằm phục vụ dù, ghế và cho&nbsp;<a class="link-inline-content" href="https://thanhnien.vn/nguoi-dan-ung-ho-vung-tau-cam-dung-xa-bong-dau-goi-o-tru-tam-nuoc-ngot-1851489797.htm" title="khách tắm nước ngọt" data-rel="follow" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; color: rgb(0, 152, 209); outline: 0px;">khách tắm nước ngọt</a>. Nếu khách không đóng tiền thì xuống biển bằng lối khác.</p><p style="color: rgb(41, 41, 41); font-family: Inter; font-size: 17px; -webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; margin: 0.5em 0px 24px;">Trong khi đó, ông Trần Quốc Toản Chủ tịch UBND P.Thắng Tam cho biết phường đã nhận phản ánh của doanh nghiệp, người dân về việc cổng số 2 của KDL Biển Đông thu tiền của khách khi xuống tắm biển.</p><p style="color: rgb(41, 41, 41); font-family: Inter; font-size: 17px; -webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; margin: 0.5em 0px 24px;">"UBND phường đã làm việc và đề nghị KDL không được thu tiền của khách khi họ xuống biển tắm mà không sử dụng các dịch vụ tại đây. Tuy nhiên, KDL cho rằng số tiền họ thu là phục vụ dù, ghế, cho khách tắm nước ngọt. Khách không đồng ý thì phải xuống biển bằng lối khác. UBND phường đã có văn bản đề nghị KDL Biển Đông tạo điều kiện cho người dân, du khách xuống tắm biển&nbsp;<a class="link-inline-content" href="https://thanhnien.vn/xa-tram-khong-thu-phi-neu-xay-ra-un-tac-trong-3-ngay-dip-gio-to-1851446736.htm" title="không thu phí " data-rel="follow" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; color: rgb(0, 152, 209); outline: 0px;">không thu phí&nbsp;</a>nếu không sử dụng dịch vụ tại đây", ông Toản nói.</p><p style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; margin: 0.5em 0px 24px; color: rgb(41, 41, 41); font-family: Inter; font-size: 17px;">Trong khi đó, ông Trần Quốc Toản Chủ tịch UBND P.Thắng Tam cho biết phường đã nhận phản ánh của doanh nghiệp, người dân về việc cổng số 2 của KDL Biển Đông thu tiền của khách khi xuống tắm biển.</p><p style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; margin: 0.5em 0px 24px; color: rgb(41, 41, 41); font-family: Inter; font-size: 17px;">"UBND phường đã làm việc và đề nghị KDL không được thu tiền của khách khi họ xuống biển tắm mà không sử dụng các dịch vụ tại đây. Tuy nhiên, KDL cho rằng số tiền họ thu là phục vụ dù, ghế, cho khách tắm nước ngọt. Khách không đồng ý thì phải xuống biển bằng lối khác. UBND phường đã có văn bản đề nghị KDL Biển Đông tạo điều kiện cho người dân, du khách xuống tắm biển&nbsp;<a class="link-inline-content" href="https://thanhnien.vn/xa-tram-khong-thu-phi-neu-xay-ra-un-tac-trong-3-ngay-dip-gio-to-1851446736.htm" title="không thu phí " data-rel="follow" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; color: rgb(0, 152, 209); outline: 0px;">không thu phí&nbsp;</a>nếu không sử dụng dịch vụ tại đây", ông Toản nói.</p><p style="color: rgb(41, 41, 41); font-family: Inter; font-size: 17px; -webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; margin: 0.5em 0px 24px;"><div class="dable_placeholder" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; margin: 0px auto; padding: 10px 0px; width: 640px;"></div></p><div id="zone-l2srqb41" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; color: rgb(41, 41, 41); font-family: Inter; font-size: 17px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><div id="share-l2srqbkq" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px;"><div id="placement-kspipz1y" revenue="cpd" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px;"><div id="banner-l2srqb41-kspiq11b" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; min-height: 0px; min-width: 0px;"><div id="slot-1-l2srqb41-kspiq11b" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px;"></div></div></div></div></div><p style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; margin: 0.5em 0px 24px;"><br></p><p style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; margin: 0.5em 0px 24px;"><br></p></div></div>', N'buc-xuc-vi-du-khach-den-kdl-bien-dong-tam-bien-phai-mua-ve-vao-cong.jpg', 1, N'buc-xuc-vi-du-khach-den-kdl-bien-dong-tam-bien-phai-mua-ve-vao-cong', CAST(N'2023-04-25 22:17:25.560' AS DateTime), NULL, NULL, NULL, NULL, 1, 1, N'Bức xúc vì du khách đến KDL Biển Đông tắm biển phải mua vé vào cổng', N'Bức xúc vì du khách đến KDL Biển Đông tắm biển phải mua vé vào cổng', NULL, NULL)
INSERT [dbo].[tblTinTucs] ([PostID], [Title], [Scontents], [Contents], [Thumb], [Published], [Alias], [CreatedDate], [Author], [AccountID], [Tags], [CatID], [isHot], [isNewfeed], [MetaKey], [MetaDesc], [Views], [LoaitinID]) VALUES (3, N'Ram máy tính giảm giá sập sàn', NULL, NULL, NULL, 1, N'ram', CAST(N'2023-04-25 22:17:25.560' AS DateTime), NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblTinTucs] ([PostID], [Title], [Scontents], [Contents], [Thumb], [Published], [Alias], [CreatedDate], [Author], [AccountID], [Tags], [CatID], [isHot], [isNewfeed], [MetaKey], [MetaDesc], [Views], [LoaitinID]) VALUES (4, N'Ram máy tính giảm giá sập sàn', NULL, NULL, NULL, 1, N'ram', CAST(N'2023-04-25 22:17:25.560' AS DateTime), NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblTinTucs] ([PostID], [Title], [Scontents], [Contents], [Thumb], [Published], [Alias], [CreatedDate], [Author], [AccountID], [Tags], [CatID], [isHot], [isNewfeed], [MetaKey], [MetaDesc], [Views], [LoaitinID]) VALUES (5, N'Ram máy tính giảm giá sập sàn', NULL, NULL, NULL, 1, N'ram', CAST(N'2023-04-25 22:17:25.560' AS DateTime), NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblTinTucs] ([PostID], [Title], [Scontents], [Contents], [Thumb], [Published], [Alias], [CreatedDate], [Author], [AccountID], [Tags], [CatID], [isHot], [isNewfeed], [MetaKey], [MetaDesc], [Views], [LoaitinID]) VALUES (6, N'Ram máy tính giảm giá sập sàn', NULL, NULL, NULL, 1, N'ram', CAST(N'2023-04-25 22:17:25.560' AS DateTime), NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblTinTucs] ([PostID], [Title], [Scontents], [Contents], [Thumb], [Published], [Alias], [CreatedDate], [Author], [AccountID], [Tags], [CatID], [isHot], [isNewfeed], [MetaKey], [MetaDesc], [Views], [LoaitinID]) VALUES (7, N'Ram máy tính giảm giá sập sàn', NULL, NULL, NULL, 1, N'ram', CAST(N'2023-04-25 22:17:25.560' AS DateTime), NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblTinTucs] ([PostID], [Title], [Scontents], [Contents], [Thumb], [Published], [Alias], [CreatedDate], [Author], [AccountID], [Tags], [CatID], [isHot], [isNewfeed], [MetaKey], [MetaDesc], [Views], [LoaitinID]) VALUES (8, N'Ram máy tính giảm giá sập sàn', NULL, NULL, NULL, 1, N'ram', CAST(N'2023-04-25 22:17:25.560' AS DateTime), NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblTinTucs] ([PostID], [Title], [Scontents], [Contents], [Thumb], [Published], [Alias], [CreatedDate], [Author], [AccountID], [Tags], [CatID], [isHot], [isNewfeed], [MetaKey], [MetaDesc], [Views], [LoaitinID]) VALUES (9, N'Ram máy tính giảm giá sập sàn', NULL, NULL, NULL, 1, N'ram', CAST(N'2023-04-25 22:17:25.560' AS DateTime), NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblTinTucs] ([PostID], [Title], [Scontents], [Contents], [Thumb], [Published], [Alias], [CreatedDate], [Author], [AccountID], [Tags], [CatID], [isHot], [isNewfeed], [MetaKey], [MetaDesc], [Views], [LoaitinID]) VALUES (10, N'Ram máy tính giảm giá sập sàn', NULL, NULL, NULL, 1, N'ram', CAST(N'2023-04-25 22:17:25.560' AS DateTime), NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblTinTucs] ([PostID], [Title], [Scontents], [Contents], [Thumb], [Published], [Alias], [CreatedDate], [Author], [AccountID], [Tags], [CatID], [isHot], [isNewfeed], [MetaKey], [MetaDesc], [Views], [LoaitinID]) VALUES (11, N'Ram máy tính giảm giá sập sàn', NULL, NULL, NULL, 1, N'ram', CAST(N'2023-04-25 22:17:25.560' AS DateTime), NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblTinTucs] ([PostID], [Title], [Scontents], [Contents], [Thumb], [Published], [Alias], [CreatedDate], [Author], [AccountID], [Tags], [CatID], [isHot], [isNewfeed], [MetaKey], [MetaDesc], [Views], [LoaitinID]) VALUES (12, N'Ram máy tính giảm giá sập sàn', NULL, NULL, NULL, 1, N'ram', CAST(N'2023-04-25 22:17:25.560' AS DateTime), NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblTinTucs] ([PostID], [Title], [Scontents], [Contents], [Thumb], [Published], [Alias], [CreatedDate], [Author], [AccountID], [Tags], [CatID], [isHot], [isNewfeed], [MetaKey], [MetaDesc], [Views], [LoaitinID]) VALUES (13, N'Ram máy tính giảm giá sập sàn', NULL, NULL, NULL, 1, N'ram', CAST(N'2023-04-25 22:17:25.560' AS DateTime), NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblTinTucs] ([PostID], [Title], [Scontents], [Contents], [Thumb], [Published], [Alias], [CreatedDate], [Author], [AccountID], [Tags], [CatID], [isHot], [isNewfeed], [MetaKey], [MetaDesc], [Views], [LoaitinID]) VALUES (14, N'Ram máy tính giảm giá sập sàn', NULL, NULL, NULL, 1, N'ram', CAST(N'2023-04-25 22:17:25.560' AS DateTime), NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblTinTucs] ([PostID], [Title], [Scontents], [Contents], [Thumb], [Published], [Alias], [CreatedDate], [Author], [AccountID], [Tags], [CatID], [isHot], [isNewfeed], [MetaKey], [MetaDesc], [Views], [LoaitinID]) VALUES (15, N'Ram máy tính giảm giá sập sàn', NULL, NULL, NULL, 1, N'ram', CAST(N'2023-04-25 22:17:25.560' AS DateTime), NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblTinTucs] ([PostID], [Title], [Scontents], [Contents], [Thumb], [Published], [Alias], [CreatedDate], [Author], [AccountID], [Tags], [CatID], [isHot], [isNewfeed], [MetaKey], [MetaDesc], [Views], [LoaitinID]) VALUES (16, N'Ram máy tính giảm giá sập sàn', NULL, NULL, NULL, 1, N'ram', CAST(N'2023-04-25 22:17:25.560' AS DateTime), NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblTinTucs] ([PostID], [Title], [Scontents], [Contents], [Thumb], [Published], [Alias], [CreatedDate], [Author], [AccountID], [Tags], [CatID], [isHot], [isNewfeed], [MetaKey], [MetaDesc], [Views], [LoaitinID]) VALUES (17, N'Ram máy tính giảm giá sập sàn', NULL, NULL, NULL, 1, N'ram', CAST(N'2023-04-25 22:17:25.560' AS DateTime), NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblTinTucs] ([PostID], [Title], [Scontents], [Contents], [Thumb], [Published], [Alias], [CreatedDate], [Author], [AccountID], [Tags], [CatID], [isHot], [isNewfeed], [MetaKey], [MetaDesc], [Views], [LoaitinID]) VALUES (18, N'Ram máy tính giảm giá sập sàn', NULL, NULL, NULL, 1, N'ram', CAST(N'2023-04-25 22:17:25.560' AS DateTime), NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblTinTucs] ([PostID], [Title], [Scontents], [Contents], [Thumb], [Published], [Alias], [CreatedDate], [Author], [AccountID], [Tags], [CatID], [isHot], [isNewfeed], [MetaKey], [MetaDesc], [Views], [LoaitinID]) VALUES (19, N'Ram máy tính giảm giá sập sàn', NULL, NULL, NULL, 1, N'ram', CAST(N'2023-04-25 22:17:25.560' AS DateTime), NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblTinTucs] ([PostID], [Title], [Scontents], [Contents], [Thumb], [Published], [Alias], [CreatedDate], [Author], [AccountID], [Tags], [CatID], [isHot], [isNewfeed], [MetaKey], [MetaDesc], [Views], [LoaitinID]) VALUES (20, N'Ram máy tính giảm giá sập sàn', NULL, NULL, NULL, 1, N'ram', CAST(N'2023-04-25 22:17:25.560' AS DateTime), NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblTinTucs] ([PostID], [Title], [Scontents], [Contents], [Thumb], [Published], [Alias], [CreatedDate], [Author], [AccountID], [Tags], [CatID], [isHot], [isNewfeed], [MetaKey], [MetaDesc], [Views], [LoaitinID]) VALUES (21, N'Ram máy tính giảm giá sập sàn', NULL, NULL, NULL, 1, N'ram', CAST(N'2023-04-25 22:17:25.560' AS DateTime), NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblTinTucs] OFF
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Roles]
GO
ALTER TABLE [dbo].[AttributePrices]  WITH CHECK ADD  CONSTRAINT [FK_AttributePrices_Attributes] FOREIGN KEY([AttributeID])
REFERENCES [dbo].[Attributes] ([AttributeID])
GO
ALTER TABLE [dbo].[AttributePrices] CHECK CONSTRAINT [FK_AttributePrices_Attributes]
GO
ALTER TABLE [dbo].[AttributePrices]  WITH CHECK ADD  CONSTRAINT [FK_AttributePrices_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[AttributePrices] CHECK CONSTRAINT [FK_AttributePrices_Products]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_PdGroups] FOREIGN KEY([PdGroupID])
REFERENCES [dbo].[PdGroups] ([PdGroupID])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_PdGroups]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Accounts] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Accounts]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Locations1] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([LocationID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Locations1]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Payments] FOREIGN KEY([PaymentID])
REFERENCES [dbo].[Payments] ([PaymentID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Payments]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Shippers] FOREIGN KEY([ShipperID])
REFERENCES [dbo].[Shippers] ([ShipperID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Shippers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_TransactStatus] FOREIGN KEY([TransactStatusID])
REFERENCES [dbo].[TransactStatus] ([TransactStatusID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_TransactStatus]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CatID])
REFERENCES [dbo].[Categories] ([CatID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[tblTinTucs]  WITH CHECK ADD  CONSTRAINT [FK_tblTinTucs_LoaiTins] FOREIGN KEY([LoaitinID])
REFERENCES [dbo].[LoaiTins] ([LoaitinID])
GO
ALTER TABLE [dbo].[tblTinTucs] CHECK CONSTRAINT [FK_tblTinTucs_LoaiTins]
GO
