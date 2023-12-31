USE [master]
GO
/****** Object:  Database [BMOS_v5]    Script Date: 8/3/2023 10:56:29 PM ******/
CREATE DATABASE [BMOS_v5]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BMOS_v5', FILENAME = N'E:\MCS_SQL\MSSQL16.MSSQLSERVER\MSSQL\DATA\BMOS_v5.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BMOS_v5_log', FILENAME = N'E:\MCS_SQL\MSSQL16.MSSQLSERVER\MSSQL\DATA\BMOS_v5_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BMOS_v5].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BMOS_v5] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BMOS_v5] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BMOS_v5] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BMOS_v5] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BMOS_v5] SET ARITHABORT OFF 
GO
ALTER DATABASE [BMOS_v5] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BMOS_v5] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BMOS_v5] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BMOS_v5] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BMOS_v5] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BMOS_v5] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BMOS_v5] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BMOS_v5] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BMOS_v5] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BMOS_v5] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BMOS_v5] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BMOS_v5] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BMOS_v5] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BMOS_v5] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BMOS_v5] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BMOS_v5] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BMOS_v5] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BMOS_v5] SET RECOVERY FULL 
GO
ALTER DATABASE [BMOS_v5] SET  MULTI_USER 
GO
ALTER DATABASE [BMOS_v5] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BMOS_v5] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BMOS_v5] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BMOS_v5] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BMOS_v5] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BMOS_v5] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BMOS_v5', N'ON'
GO
ALTER DATABASE [BMOS_v5] SET QUERY_STORE = ON
GO
ALTER DATABASE [BMOS_v5] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BMOS_v5]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 8/3/2023 10:56:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cart_id] [int] IDENTITY(1,1) NOT NULL,
	[meal_package_id] [int] NULL,
	[user_id] [int] NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[product_id] [int] NULL,
 CONSTRAINT [PK__Cart__2EF52A27BD4D8DAD] PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Bird]    Script Date: 8/3/2023 10:56:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Bird](
	[bird_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[bird_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Blog]    Script Date: 8/3/2023 10:56:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Blog](
	[blog_id] [int] IDENTITY(1,1) NOT NULL,
	[thumbnail] [nvarchar](max) NULL,
	[title] [nvarchar](100) NULL,
	[date_update] [date] NULL,
	[content] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[status] [bit] NULL,
	[hashtag] [nvarchar](100) NULL,
	[bird_id] [int] NULL,
 CONSTRAINT [PK__tbl_Blog__2975AA2840840A0A] PRIMARY KEY CLUSTERED 
(
	[blog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Category]    Script Date: 8/3/2023 10:56:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[status] [bit] NULL,
	[img] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Feedback]    Script Date: 8/3/2023 10:56:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Feedback](
	[feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[note] [nvarchar](max) NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_MealPackage]    Script Date: 8/3/2023 10:56:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_MealPackage](
	[meal_package_id] [int] IDENTITY(1,1) NOT NULL,
	[title_mealpackage] [nvarchar](350) NULL,
	[quantity] [int] NULL,
	[price] [int] NULL,
	[discount_price] [int] NULL,
	[thumbnail] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[recipe] [nvarchar](max) NULL,
	[create_at] [date] NULL,
	[update_at] [date] NULL,
	[status] [bit] NULL,
	[bird_id] [int] NULL,
	[lifecycle_id] [int] NULL,
	[img] [nvarchar](max) NULL,
 CONSTRAINT [PK__tbl_Meal__D4B0B2EE41384D97] PRIMARY KEY CLUSTERED 
(
	[meal_package_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Order]    Script Date: 8/3/2023 10:56:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[order_code] [nvarchar](10) NULL,
	[order_date] [date] NULL,
	[note] [nvarchar](max) NULL,
	[totalMoney] [int] NULL,
	[status] [bit] NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_OrderDetail]    Script Date: 8/3/2023 10:56:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_OrderDetail](
	[orderDetail_id] [int] IDENTITY(1,1) NOT NULL,
	[price] [int] NULL,
	[quantity] [int] NULL,
	[meal_package_id] [int] NULL,
	[oder_id] [int] NULL,
	[product_id] [int] NULL,
 CONSTRAINT [PK__tbl_Orde__3179532402CABDCC] PRIMARY KEY CLUSTERED 
(
	[orderDetail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Product]    Script Date: 8/3/2023 10:56:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](350) NULL,
	[quantity] [int] NULL,
	[price] [int] NULL,
	[discount_price] [int] NULL,
	[weight] [float] NULL,
	[thumbnail] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[create_at] [date] NULL,
	[update_at] [date] NULL,
	[status] [bit] NULL,
	[category_id] [int] NULL,
	[feedback_id] [int] NULL,
	[bird_id] [int] NULL,
 CONSTRAINT [PK__tbl_Prod__47027DF54E987F64] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_pro-meal]    Script Date: 8/3/2023 10:56:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_pro-meal](
	[product_id] [int] NULL,
	[meal_package_id] [int] NULL,
	[quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Role]    Script Date: 8/3/2023 10:56:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 8/3/2023 10:56:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[fullname] [nvarchar](20) NULL,
	[email] [nvarchar](100) NULL,
	[phone_number] [nvarchar](20) NULL,
	[address] [nvarchar](200) NULL,
	[status] [bit] NULL,
	[role_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (2, NULL, NULL, 1, 100000, 2)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (3, NULL, 3, 1, 80000, 3)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (4, 2, 3, 1, 100000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (5, NULL, 3, 1, 100000, 2)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (6, 2, 3, 1, 100000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (7, NULL, 3, 1, 100000, 2)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (8, 1, 3, 1, 100000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (9, NULL, 3, 1, 100000, 1)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (10, 1, 3, 1, 100000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (11, 1, 3, 1, 100000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (12, 1, 3, 1, 100000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (13, NULL, 3, 1, 100000, 1)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (14, NULL, 3, 1, 100000, 1)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (15, 1, 3, 1, 100000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (16, NULL, 3, 1, 100000, 1)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (17, 1, 3, 1, 100000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (18, NULL, 3, 2, 50000, 8)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (19, NULL, 3, 1, 80000, 3)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (20, NULL, 3, 1, 100000, 2)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (21, NULL, 3, 1, 100000, 2)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (22, NULL, 3, 1, 80000, 3)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (23, NULL, 3, 1, 80000, 3)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (24, NULL, 3, 1, 80000, 3)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (25, 2, 3, 1, 100000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (26, NULL, 3, 1, 80000, 3)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (27, 3, 3, 1, 120000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (28, NULL, 3, 1, 100000, 2)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (29, NULL, 3, 1, 100000, 2)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (30, NULL, 3, 1, 100000, 2)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (31, NULL, 3, 1, 100000, 1)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (32, NULL, 3, 1, 100000, 1)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (33, 1, 3, 1, 100000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (34, NULL, 3, 1, 50000, 7)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (35, 3, 3, 1, 120000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (36, NULL, 3, 1, 80000, 4)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (37, NULL, 3, 1, 129000, 10)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (38, 1, 3, 1, 100000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (39, NULL, 3, 1, 100000, 2)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (40, 1, 3, 1, 100000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (41, NULL, 3, 1, 50000, 7)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (42, NULL, 3, 1, 80000, 4)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (43, NULL, 3, 1, 50000, 7)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (44, 1, 3, 1, 100000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (45, NULL, 3, 1, 50000, 8)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (46, NULL, 3, 1, 50000, 8)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (47, 3, 3, 1, 120000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (48, NULL, 3, 1, 150000, 9)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (49, 1, 3, 1, 100000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (50, NULL, 3, 1, 80000, 3)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (51, 1, 3, 1, 100000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (52, 1, 3, 1, 100000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (53, 2, 3, 1, 100000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (54, 1, 3, 1, 100000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (55, 1, 3, 1, 100000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (56, NULL, 3, 1, 100000, 2)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (57, NULL, 3, 1, 100000, 2)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (58, NULL, 3, 1, 80000, 3)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (59, 3, 3, 1, 120000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (60, NULL, 3, 1, 80000, 3)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (61, 3, 3, 1, 120000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (62, NULL, 3, 1, 100000, 2)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (63, NULL, 3, 1, 80000, 3)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (64, 3, 3, 1, 120000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (65, NULL, 3, 1, 100000, 2)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (66, 4, 3, 1, 150000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (67, NULL, 3, 1, 100000, 1)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (68, 3, 3, 1, 120000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (69, NULL, 3, 1, 80000, 3)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (70, 4, 3, 1, 150000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (71, NULL, 3, 1, 100000, 2)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (72, 2, 3, 1, 100000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (73, NULL, 3, 1, 80000, 4)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (74, 1, 3, 1, 100000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (75, NULL, 11, 1, 100000, 2)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (76, 2, 11, 1, 100000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (77, NULL, 11, 1, 50000, 7)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (78, 2, 11, 1, 100000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (79, 2, 11, 2, 100000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (80, 1, 11, 2, 100000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (81, NULL, 11, 1, 150000, 9)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (82, 2, 11, 1, 100000, NULL)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (83, NULL, 11, 1, 50000, 7)
INSERT [dbo].[Cart] ([cart_id], [meal_package_id], [user_id], [quantity], [price], [product_id]) VALUES (84, NULL, 11, 3, 50000, 8)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Bird] ON 

INSERT [dbo].[tbl_Bird] ([bird_id], [name]) VALUES (1, N'Sparrow')
INSERT [dbo].[tbl_Bird] ([bird_id], [name]) VALUES (2, N'Eagle')
INSERT [dbo].[tbl_Bird] ([bird_id], [name]) VALUES (3, N'Hwamei')
INSERT [dbo].[tbl_Bird] ([bird_id], [name]) VALUES (4, N'Falcon')
INSERT [dbo].[tbl_Bird] ([bird_id], [name]) VALUES (5, N'Owl')
SET IDENTITY_INSERT [dbo].[tbl_Bird] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Blog] ON 

INSERT [dbo].[tbl_Blog] ([blog_id], [thumbnail], [title], [date_update], [content], [description], [status], [hashtag], [bird_id]) VALUES (1, N'1_1.png', N'Sparrow care guide', NULL, N'The Eurasian Tree Sparrow, commonly known as...', N'The Eurasian Tree Sparrow, commonly known as the house sparrow or simply the sparrow, is a small passerine bird species that belongs to the sparrow family, Passeridae.

The sparrow is a small bird, typically measuring around 14 to 16 centimeters in length. It has a plump body with a short, stout beak. The male and female sparrows have similar appearances, with brown feathers on their backs and wings, and lighter underparts. The male sparrow features a distinctive black patch on its throat and chest, known as a bib. The bib is absent in females and young sparrows.

Sparrows are highly adaptable and are found in various habitats, including urban areas, farmlands, woodlands, and grasslands. They are native to Europe and Asia but have been introduced to many other parts of the world, including North America, where they have established thriving populations.

These social birds are known for their lively and energetic behavior. They form large flocks and often gather in communal roosts during the non-breeding season. Sparrows have a diverse diet that primarily consists of seeds, grains, and small insects. They forage on the ground or in low vegetation, using their beaks to crack open seeds or catch insects in flight.

Sparrows are monogamous birds and typically form long-term pair bonds. They build nests in cavities, such as tree holes, building crevices, or birdhouses. The nests are constructed using grass, twigs, and other plant materials, and lined with softer materials like feathers or moss. Female sparrows lay multiple eggs, which are incubated by both parents. The hatchlings are fed by regurgitation until they are old enough to fledge.

Sparrows are known for their melodious songs, which consist of chirps, trills, and chattering sounds. Their vocalizations are used for communication within the flock, courtship displays, and territory defense.

Due to their adaptability and close association with human habitats, sparrows are often considered familiar and charismatic birds. They are appreciated for their role in controlling insect populations and adding a touch of liveliness to urban environments.

Please note that the specific characteristics and behaviors of sparrows can vary slightly depending on the region and species being referred to.', 1, N'Sparrow', 1)
INSERT [dbo].[tbl_Blog] ([blog_id], [thumbnail], [title], [date_update], [content], [description], [status], [hashtag], [bird_id]) VALUES (2, N'2_1.png', N'Hwamei care guide', NULL, N'The Hwamei, also known as the Chinese Hwamei...', N'The Hwamei, also known as the Chinese Hwamei or Melodious Laughingthrush, is a small bird species known for its beautiful song and vibrant appearance. Here''s a description of the Hwamei bird in English:

The Hwamei is a medium-sized bird, typically measuring around 20 centimeters in length. It has a stout body with a relatively short tail and a slightly curved beak. The plumage of the Hwamei is striking, with a combination of black, brown, and golden-yellow feathers. It has a distinctive pattern on its head, with a black mask around the eyes and a bright yellow crown.

Hwamei birds are native to East Asia, including China, Vietnam, and Malaysia. They are highly sought after for their melodious and complex songs, which consist of a wide range of whistles, trills, and varied notes. Their songs are often compared to the sound of laughter, hence their nickname, "Laughingthrush." Male Hwamei birds are particularly known for their impressive vocal performances during the breeding season.

These birds are primarily found in forests, woodlands, and shrublands, but they have also adapted to urban areas with suitable vegetation. Hwamei birds are known for their secretive nature, preferring to stay hidden within dense foliage. They are excellent climbers and have strong legs and feet, enabling them to navigate through trees and shrubs with ease.

Hwamei birds primarily feed on insects, spiders, and other small invertebrates, which they forage for among leaves and branches. They also consume a variety of fruits and seeds, supplementing their diet with plant matter.

During the breeding season, male Hwamei birds engage in elaborate courtship displays to attract females. They sing from elevated perches and may engage in fluttering flights to showcase their colorful plumage. The female builds a cup-shaped nest using twigs, grass, and other plant materials, often placed in dense vegetation or bushes. She lays a clutch of eggs, and both parents take turns incubating them.

The Hwamei bird is valued for its melodious song and is highly regarded in some cultures for its symbolic and aesthetic qualities. However, due to trapping for the pet trade and habitat loss, Hwamei populations have declined in some regions. Conservation efforts are underway to protect this charismatic bird species.

Please note that the Hwamei bird is also known by different names in various regions and languages.', 1, N'Hwamei', 3)
INSERT [dbo].[tbl_Blog] ([blog_id], [thumbnail], [title], [date_update], [content], [description], [status], [hashtag], [bird_id]) VALUES (3, N'3_1.png', N'Eagle care guide', NULL, N'The Bald Eagle, also known simply as....', N'The Bald Eagle, also known simply as the eagle or Haliaeetus leucocephalus, is a majestic bird of prey known for its iconic appearance and powerful flying ability. Here''s a description of the Bald Eagle in English:

The Bald Eagle is a large bird, typically measuring between 70 and 100 centimeters in length, with a wingspan ranging from 1.8 to 2.3 meters. It has a distinctive appearance with a white head and tail contrasting against a dark brown body. Adult Bald Eagles have a hooked yellow beak and sharp, taloned feet perfectly adapted for hunting.

Bald Eagles are primarily found in North America, with a significant population in Alaska and Canada. They prefer habitats near bodies of water such as rivers, lakes, and coastlines, as they primarily feed on fish. These eagles are known for their impressive diving and fishing skills, swooping down from the sky to snatch fish from the water''s surface.

Apart from fish, Bald Eagles also consume a variety of other prey, including waterfowl, small mammals, and carrion. They are opportunistic hunters and scavengers, and their diet may vary depending on food availability in their habitat.

Bald Eagles are known for their incredible strength and agility in flight. They can reach speeds of up to 55 kilometers per hour (34 miles per hour) during level flight and even faster when diving. Their broad wings and powerful muscles allow them to soar effortlessly, riding thermal updrafts and using their keen eyesight to spot prey from great distances.

These eagles are also known for their impressive nesting behavior. They build large nests called "aeries" typically situated in tall trees near water bodies. The nests are constructed with sticks and lined with softer materials such as grass, moss, or feathers. Bald Eagles mate for life, and pairs will often return to the same nest year after year, adding to and maintaining it over time.

The Bald Eagle holds significant symbolism and is a revered national symbol in the United States, representing strength, freedom, and resilience. Conservation efforts have helped restore Bald Eagle populations, which were once threatened due to habitat loss and the use of pesticides.

It''s important to note that the Bald Eagle is protected under various laws and regulations to ensure its continued survival and conservation. Disturbing or harming these birds or their nests is strictly prohibited.

Please note that the Bald Eagle is specific to North America, and other eagle species found in different regions may have different characteristics and behaviors.', 1, N'Eagle', 2)
INSERT [dbo].[tbl_Blog] ([blog_id], [thumbnail], [title], [date_update], [content], [description], [status], [hashtag], [bird_id]) VALUES (4, N'4_1.png', N'Fascinating Facts About Owls: Masters of the Night Sky', NULL, N'Owls are mysterious creatures....', N'Owls are mysterious creatures that have captivated humans for centuries. With their silent flight and striking appearance, they have become symbols of wisdom, magic, and myth. In this blog post, we will explore the enchanting world of owls and uncover some fascinating facts about these magnificent birds.

Silent Flight:
One of the most remarkable features of owls is their ability to fly silently. Unlike other birds, owls have specialized feathers that minimize turbulence and reduce noise. This stealthy adaptation allows them to approach their prey undetected, making them highly efficient hunters of the night.

Exceptional Vision:
Owls have exceptional vision that enables them to navigate through the darkness. Their large eyes are adapted to gather as much light as possible, and they have a higher number of rod cells in their retinas, which enhances their ability to see in low-light conditions. Additionally, their forward-facing eyes provide excellent binocular vision, allowing them to accurately judge distances.

Wide Variety of Species:
There are over 200 species of owls found across the globe, inhabiting diverse environments ranging from forests and deserts to tundras and grasslands. Each species has its own unique characteristics, such as size, coloration, and habitat preference. Some well-known owl species include the Barn Owl, Snowy Owl, Great Horned Owl, and the Elf Owl, which holds the title for being the smallest owl species.

Nocturnal Hunters:
Owls are primarily nocturnal hunters, meaning they are most active during the night. Their hunting prowess is aided by several adaptations. For example, their facial disc acts as a sound collector, directing sounds towards their ears and enabling them to pinpoint the location of prey even in complete darkness. They have sharp talons for capturing and holding onto their prey, and their beaks are designed to tear rather than chew.

Adaptations for Silent Hunting:
Apart from their silent flight, owls possess specialized feathers on the edges of their wings that break up air turbulence, further minimizing noise. Moreover, they have soft plumage that muffles sound when flying, allowing them to surprise their prey without giving away their presence.

Symbolism and Cultural Significance:
Owls have long been associated with symbolism and cultural significance. In many ancient civilizations, they were revered as guardians of knowledge, wisdom, and prophecy. They often appeared in mythology and folklore, representing both good fortune and ill omens depending on the culture. Even today, they continue to capture our imagination and feature prominently in literature, art, and popular culture.

Owls are extraordinary creatures that embody mystery and beauty. Their remarkable adaptations, such as silent flight and exceptional vision, make them formidable hunters of the night. Whether revered as symbols of wisdom or admired for their unique characteristics, owls will forever hold a special place in our hearts and imaginations.', 1, N'Owl', 5)
INSERT [dbo].[tbl_Blog] ([blog_id], [thumbnail], [title], [date_update], [content], [description], [status], [hashtag], [bird_id]) VALUES (5, N'WB Blog.jpg', N'How to Setup Your Space For Backyard Birds', NULL, N'Attract Backyard Birds Easily With These Tips....', N'Attract Backyard Birds Easily With These Tips
Watching and feeding wild birds, or birding, is America’s second most popular outdoor pastime (after gardening). Attracting backyard birds is easy, and it can make you more aware of and appreciate your environment. 

A fun part of birding is learning what wild birds are visiting your backyard. Identifying wild birds is a great way to get the whole family involved, especially the kids. Most of the wild birds coming to backyard feeders are songbirds, or perching birds, which have similar characteristics. By studying their size, body shape, colors, markings, beak shape, feet, and wing shape in flight, you can identify your friendly visitors.

Here are some tips to get started:
Keep Food Fresh
Store fresh seed in a sturdy plastic or galvanized metal waterproof container with a tight fitting lid. Keep containers in a cool, dry location, such as a garage or shed. If you''re looking for a blend to try, Kaytee Nut & Fruit Blend or Kaytee Songbird Blend are a great start!

Change Seed Often
Seed that is clumped together, or smells musty has gone bad. Dispose of it so that birds and animals cannot get to it and replace with your favorite blend! 

Water, Water, Water!
Providing water, especially moving water, attracts more birds to your yard. Remember that birds like shallow water (such as a bird bath), so avoid water deeper than 2-3 inches.

Open Location
Birds are most comfortable when they have a clear view of potential predators and a place to escape. Put feeders on open ground near shrubs or trees.

Prevent Freezing
Heated birdbaths or heating elements for standard birdbaths help keep water from freezing. Some birders pour warm water in birdbaths to help melt the ice. However, never add salt to birdbath water to keep it ice-free.

Birding is most fun when you can attract as many birds as possible. That means the right environment, the right food, and the right feeders.', 1, N'Style', 5)
SET IDENTITY_INSERT [dbo].[tbl_Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Category] ON 

INSERT [dbo].[tbl_Category] ([category_id], [name], [status], [img]) VALUES (1, N'Insects', 1, N'img/food/mealworm.jpg')
INSERT [dbo].[tbl_Category] ([category_id], [name], [status], [img]) VALUES (2, N'Bran', 1, N'img/food/wheatbran.jpg')
INSERT [dbo].[tbl_Category] ([category_id], [name], [status], [img]) VALUES (3, N'Seeds', 1, N'img/food/nut.jpg')
INSERT [dbo].[tbl_Category] ([category_id], [name], [status], [img]) VALUES (4, N'Medicine', 1, N'img/food/growth.jpg')
SET IDENTITY_INSERT [dbo].[tbl_Category] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_MealPackage] ON 

INSERT [dbo].[tbl_MealPackage] ([meal_package_id], [title_mealpackage], [quantity], [price], [discount_price], [thumbnail], [description], [recipe], [create_at], [update_at], [status], [bird_id], [lifecycle_id], [img]) VALUES (1, N'Parrot''s Meals', 7, 100000, 45000, N'img/product/details/5-8.jpg', N'A food package for birds, such as for pet birds or wild bird feed, is specifically designed to provide convenient storage and transportation of bird food while ensuring its freshness and quality. These packages are typically tailored to meet the unique needs of avian nutrition and come in various forms depending on the type of bird food being packaged.

Bird food packages often consist of a sturdy outer container, such as a bag or a plastic container, which provides protection against moisture, pests, and physical damage. The material used for the package is typically food-grade and safe for birds. The package may also feature resealable closures, such as zippers or clips, to maintain the freshness of the food and prevent spoilage.

Inside the package, the bird food is often sealed in individual pouches or compartments. This helps to keep the food separate and prevent cross-contamination, ensuring that each serving of food remains hygienic and free from contaminants. In the case of dry bird food, the package may also incorporate moisture-absorbing packets or desiccants to maintain the dryness of the food and extend its shelf life.

The packaging of bird food may also include informative labels with essential details such as the type of bird the food is intended for, nutritional information, feeding guidelines, and any special instructions. This information is crucial for bird owners to understand the specific dietary requirements of their birds and to ensure they are providing appropriate nutrition.', N'Here is a recipe for making natural food for birds using seeds, dried fruits, and vitamins:

Ingredients:
1/2 cup of seeds (e.g., peas, corn, flaxseeds, sunflower seeds)
1/4 cup of seed mix (e.g., grass seeds, rapeseeds, tomato seeds)
1/4 cup of dried fruits (e.g., raisins, dried figs, dried bananas)
1/4 cup of fat seed mix (e.g., flaxseed oil seeds, sunflower oil seeds)
1/4 cup of vitamin mix (available from pet stores or consult a veterinarian)
Purified water

Instructions:
1. Grind the seeds and seed mix in a blender or food processor until finely ground.
2. Mix the ground seed mixture with the dried fruits and fat seed mix.
3. Gradually add purified water and stir until you achieve a sticky paste.
4. Continue stirring until all the ingredients are evenly blended, and the mixture becomes a cohesive mass.
5. Use your hands or a utensil to shape the mixture into small balls or form them into small disks.
6. Place the bird food on an empty tray and let it air dry for a period of time (usually 12 to 24 hours) until the food solidifies.
7. Once it has hardened, the bird food is ready to be served. You can place it in a feeding dish or hang it inside the birdcage.

Note: Ensure that the seeds and fruits you use are safe for birds and do not contain any additives or added sugars. If you are unsure about the safety of an ingredient, consult a veterinarian. This is a basic recipe, but you can adjust the proportions and ingredients to suit the specific type of bird you are feeding.', NULL, NULL, 1, 1, NULL, N'img/product/details/5-8.jpg')
INSERT [dbo].[tbl_MealPackage] ([meal_package_id], [title_mealpackage], [quantity], [price], [discount_price], [thumbnail], [description], [recipe], [create_at], [update_at], [status], [bird_id], [lifecycle_id], [img]) VALUES (2, N'Wild Bird', 7, 100000, 25000, N'img/product/details/5-9.jpg', N'A meal package for birds typically consists of a combination of nutritious food items that are carefully selected to meet the dietary needs of the specific bird species. These packages are designed to provide a well-balanced diet and ensure the bird receives essential nutrients, vitamins, and minerals for optimal health. Here''s a description of a typical meal package for birds:

1. Seed Mix: A blend of high-quality seeds, such as sunflower seeds, millet, safflower seeds, and various grains, provides a primary source of energy and essential fatty acids for birds.

2. Pellets or Extruded Food: These are formulated food pellets or extruded shapes that offer a balanced nutritional profile. They often contain a mix of seeds, grains, fruits, vegetables, and added vitamins and minerals. Pellets help ensure birds receive a complete diet, especially when specific nutrients may be lacking in seeds alone.

3. Fresh Fruits and Vegetables: A variety of fresh fruits and vegetables can be included in the meal package, such as apples, oranges, grapes, carrots, leafy greens, and bell peppers. These provide essential vitamins, minerals, and antioxidants while adding diversity to the bird''s diet.

4. Sprouted Seeds or Legumes: Sprouted seeds or legumes, such as sprouted mung beans or lentils, can be included to offer additional nutrients and provide a natural source of live enzymes. Sprouting enhances nutrient availability and makes digestion easier for birds.

5. Treats and Supplements: Occasionally, meal packages may include treats like dried mealworms, nuts, or special bird-friendly treats. Additionally, specific supplements like calcium blocks or mineral blocks may be added to support the bird''s overall health.

It''s important to note that the composition of a meal package can vary based on the species, age, and dietary requirements of the bird. Consulting avian experts or veterinarians can provide valuable guidance in creating a meal package that best suits a specific bird''s needs. Additionally, fresh water should always be provided separately for birds to stay hydrated and ensure their well-being.', N'Ingredients:
1/4 cup wheat sprouts
1/4 cup oat bran
1/4 cup finely chopped vegetables (carrots, broccoli, parsley, etc.)
1/4 cup quinoa or brown rice, cooked
1 tablespoon honey
1 tablespoon unsalted nut butter (such as almond or cashew butter)
1 tablespoon fresh herbs, finely chopped (cilantro, parsley, or dill)
Water (if needed to adjust the consistency of the mixture)

Instructions:
1. In a mixing bowl, combine wheat sprouts, oat bran, finely chopped vegetables, cooked quinoa or brown rice, honey, nut butter, and fresh herbs.
2. Gradually add water to the mixture and stir until you achieve a dough-like consistency. The mixture should be sticky but not overly wet or sticky.
3. Take a small portion of the mixture and shape it into small balls or form them into small disks.
4. Place the bird food on a baking tray lined with parchment paper.
5. Refrigerate the bird food for at least 30 minutes to allow it to firm up.
6. Once cooled and hardened, the bird food is ready to be served. You can offer it to your pet bird as a treat or as part of their daily diet.
7. Note: Remember to consult with a veterinarian or avian expert to ensure the ingredients and proportions are suitable for your specific bird species.

This recipe provides a nutritious and flavorful meal for pet birds, combining wheat sprouts and oat bran with vegetables, grains, and other natural ingredients.', NULL, NULL, 1, 2, NULL, N'img/product/details/5-9.jpg')
INSERT [dbo].[tbl_MealPackage] ([meal_package_id], [title_mealpackage], [quantity], [price], [discount_price], [thumbnail], [description], [recipe], [create_at], [update_at], [status], [bird_id], [lifecycle_id], [img]) VALUES (3, N'Birds & Bees', 12, 120000, 12000, N'img/product/details/5-10.jpg', N'Seed Mix: Many birds enjoy a variety of seeds in their diet. Look for a high-quality seed mix that includes a combination of sunflower seeds, millet, cracked corn, and other small seeds. Different birds have different preferences, so consider the types of birds you want to attract when choosing a seed mix.

Suet: Suet is a high-energy food that is particularly attractive to woodpeckers, nuthatches, and other insect-eating birds. You can find commercially available suet cakes or blocks made with a blend of rendered fat, grains, fruits, and insects. These can be hung in a suet feeder or placed in a wire mesh cage.

Mealworms: Mealworms are a popular choice for feeding insect-eating birds like bluebirds and robins. You can purchase dried mealworms or even live ones, which are usually available at pet stores or online. Offer them in a shallow dish or a specialized mealworm feeder.

Nectar: If you want to attract hummingbirds, you can prepare a homemade nectar solution by mixing four parts water with one part white granulated sugar. Avoid using honey, as it can promote bacterial growth. Fill a hummingbird feeder with the nectar and clean it regularly to prevent mold or contamination.

Fruits and Berries: Some birds enjoy fresh fruits and berries. Cut up pieces of apples, oranges, grapes, or melons and place them in a shallow dish or on a platform feeder. You can also try planting fruit-bearing trees or shrubs in your yard to provide a natural food source.', N'Simple recipe for a homemade bird meal package using ingredients like seeds, suet, and mealworms:

Ingredients:

2 cups birdseed mix (sunflower seeds, millet, cracked corn, etc.)
1 cup rendered suet or vegetable shortening
1/2 cup dried mealworms
Optional: 1/4 cup chopped nuts, dried fruits, or berries
Instructions:

In a large mixing bowl, combine the birdseed mix, dried mealworms, and any optional ingredients like chopped nuts, dried fruits, or berries. Mix well to distribute the ingredients evenly.

Melt the rendered suet or vegetable shortening in a saucepan over low heat until it becomes a liquid. Remove from heat and let it cool for a few minutes.

Pour the melted suet or shortening into the birdseed mixture. Stir well to ensure all the seeds are coated with the suet mixture.

Line a baking dish or mold with parchment paper or plastic wrap. Transfer the birdseed mixture into the dish, pressing it down firmly to create a compact shape.

Refrigerate the bird meal package for at least 1 hour or until the suet has solidified.

Once the meal package has hardened, remove it from the mold and cut it into desired shapes, such as squares or rectangles.

Place the bird meal packages in suet feeders or wrap them in mesh bags and hang them in your yard or from tree branches.

Monitor the feeding area regularly and replace the meal packages as needed to ensure the birds always have access to fresh food.

This homemade bird meal package provides a mix of seeds, suet, and mealworms, offering a balanced and nutritious meal for a variety of bird species. Feel free to adjust the recipe based on the preferences of the birds in your area.', NULL, NULL, 1, 3, NULL, N'img/product/details/5-10.jpg')
INSERT [dbo].[tbl_MealPackage] ([meal_package_id], [title_mealpackage], [quantity], [price], [discount_price], [thumbnail], [description], [recipe], [create_at], [update_at], [status], [bird_id], [lifecycle_id], [img]) VALUES (4, N'Baby Bird', 19, 150000, 17500, N'img/product/details/2-8.jpg', N'Indulge your majestic falcon with this specially curated meal package designed to meet its unique dietary needs. Crafted with care, this meal package combines a variety of nutrient-rich ingredients to provide a balanced and wholesome diet for your feathered friend.

The centerpiece of this meal package is a whole quail, a delectable protein source that satisfies the falcon''s carnivorous cravings. The quail is carefully selected for quality and is thawed to perfection, ensuring optimal palatability and ease of consumption.

To enhance the nutritional value and offer a natural feeding experience, we''ve included a small mouse or rat, a staple in the falcon''s diet in the wild. These pre-frozen rodents provide essential nutrients and offer a stimulating element to the falcon''s feeding routine.

In addition to the quail and small rodent, we''ve incorporated a chicken heart and chicken liver. These organ meats are nutrient powerhouses, packed with vitamins, minerals, and essential amino acids, further contributing to your falcon''s overall well-being.

To ensure comprehensive nutrition, we''ve added a tablespoon of high-quality falcon pellet or raptor food. These specialized pellets are formulated specifically for birds of prey, providing a balanced blend of nutrients necessary for their optimal health.

To complete this meal package, a teaspoon of falcon vitamin and mineral supplement is included. This supplement is expertly formulated to meet the unique requirements of falcons, enriching their diet with essential vitamins and minerals that support their vitality and longevity.

Serve this thoughtfully prepared meal package to your falcon, offering a diverse range of textures and flavors that mimic its natural feeding behaviors. Whether placed on a feeding platform or presented on a specialized falcon feeding glove or perch, this meal package is sure to satisfy your falcon''s dietary needs, while providing a gratifying and nourishing feeding experience.

Please note that the specific dietary requirements of falcons may vary based on species and individual needs. Consult with a veterinarian specializing in birds of prey or a falconry expert to ensure you are providing the appropriate diet and meal packages tailored to your falcon''s requirements.', N'A recipe for a falcon meal package:

Ingredients:

1 whole quail (thawed if frozen)
1 small mouse or rat (previously frozen)
1 chicken heart
1 chicken liver
1 tablespoon of high-quality falcon pellet or raptor food (available at specialized pet stores or online)
1 teaspoon of falcon vitamin and mineral supplement (recommended by a veterinarian)
Instructions:

Thaw the quail if it was frozen and ensure it is at room temperature before feeding. Remove any packaging materials.

Place the quail, mouse or rat, chicken heart, and chicken liver in a bowl or container.

Add the falcon pellet or raptor food to the mixture. This helps provide additional nutrients and balance to the diet.

Sprinkle the falcon vitamin and mineral supplement over the mixture. This ensures that the falcon receives all the necessary vitamins and minerals.

Gently mix the ingredients together until they are well combined.

Serve the meal package to the falcon, either by placing it on a feeding platform or offering it on a specialized falcon feeding glove or perch.

It''s important to note that falcons have specific dietary requirements, and their diet may vary depending on the species. It is recommended to consult with a veterinarian who specializes in birds of prey or a falconry expert to ensure you are providing the appropriate diet and meal packages for your falcon. They can guide you on the specific needs of your falcon and help create a well-balanced meal plan tailored to its requirements.', NULL, NULL, 1, 4, NULL, N'img/product/details/2-8.jpg')
INSERT [dbo].[tbl_MealPackage] ([meal_package_id], [title_mealpackage], [quantity], [price], [discount_price], [thumbnail], [description], [recipe], [create_at], [update_at], [status], [bird_id], [lifecycle_id], [img]) VALUES (5, N'Owl''s Meal', 15, 120000, 12500, N'img/product/details/owl.jpg', N'Delight your wise and majestic owl with this specially crafted meal package, meticulously designed to cater to its unique dietary requirements. Carefully selected and thoughtfully composed, this meal package offers a diverse assortment of nutritious ingredients to nourish your feathered companion.

At the heart of this meal package, you''ll find a selection of small rodents, such as mice or rats, which are a staple in an owl''s natural diet. These pre-frozen rodents provide a protein-rich feast that satisfies your owl''s carnivorous instincts and nutritional needs.

To augment the nutritional value of the meal, we''ve included a combination of organ meats. A portion of chicken heart and liver, rich in essential vitamins, minerals, and amino acids, ensures a well-rounded and balanced diet for your discerning owl.

Complementing the protein sources, we''ve incorporated a blend of high-quality owl pellets or raptor food. These specialized pellets are specifically formulated to meet the dietary requirements of owls, offering a complete and nutritionally balanced meal option. The pellets contain a blend of essential nutrients, vitamins, and minerals that promote optimal health and vitality.

To further enhance the nutritional profile, we''ve included a sprinkling of vitamin and mineral supplement designed for owls. This carefully formulated supplement provides additional micronutrients, ensuring your owl''s dietary needs are fully met and supporting its overall well-being.

Serve this thoughtfully assembled meal package to your owl, either by placing it on a feeding platform or presenting it on a specialized owl feeding glove or perch. Watch as your owl eagerly engages in its natural hunting behavior, relishing the variety of flavors and textures within this captivating meal package.

Please note that different owl species may have specific dietary requirements. It is advisable to consult with a veterinarian specializing in avian care or an owl expert to ensure you are providing the appropriate diet and meal packages tailored to your owl''s specific needs.

Indulge your wise companion with this tailor-made owl meal package, offering a nutritious and captivating feeding experience that aligns with its natural instincts and promotes optimal health and vitality.', N'Recipe for an owl meal package using the described ingredients:

Ingredients:

2 small pre-frozen mice or rats
1 chicken heart
1 chicken liver
1/4 cup high-quality owl pellets or raptor food
1 teaspoon owl vitamin and mineral supplement (recommended by a veterinarian)
Instructions:

Thaw the mice or rats if they are frozen, ensuring they reach room temperature before feeding. Remove any packaging materials.

Place the mice or rats, chicken heart, and chicken liver in a bowl or container.

Add the owl pellets or raptor food to the mixture, ensuring they are evenly distributed. These pellets provide essential nutrients and balance to the owl''s diet.

Sprinkle the owl vitamin and mineral supplement over the mixture. This supplement is specially formulated to meet the specific nutritional needs of owls, ensuring they receive all the necessary vitamins and minerals for their well-being.

Gently mix the ingredients together until they are well combined, ensuring that the organs and pellets are evenly distributed throughout the mixture.

Serve the meal package to your owl, placing it on a feeding platform or presenting it on a specialized owl feeding glove or perch.

It''s important to note that different owl species may have specific dietary requirements, and the proportions of ingredients may vary. It is recommended to consult with a veterinarian specializing in avian care or an owl expert to ensure you are providing the appropriate diet and meal packages tailored to your owl''s specific needs.

Remember to monitor your owl''s diet closely and ensure they receive a balanced and varied diet over time. Regularly clean the feeding area and replace the meal package as needed to maintain freshness and hygiene for your owl''s health.', NULL, NULL, 1, 5, NULL, N'img/product/details/owl.jpg')
INSERT [dbo].[tbl_MealPackage] ([meal_package_id], [title_mealpackage], [quantity], [price], [discount_price], [thumbnail], [description], [recipe], [create_at], [update_at], [status], [bird_id], [lifecycle_id], [img]) VALUES (7, N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_MealPackage] ([meal_package_id], [title_mealpackage], [quantity], [price], [discount_price], [thumbnail], [description], [recipe], [create_at], [update_at], [status], [bird_id], [lifecycle_id], [img]) VALUES (12, N'po', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_MealPackage] ([meal_package_id], [title_mealpackage], [quantity], [price], [discount_price], [thumbnail], [description], [recipe], [create_at], [update_at], [status], [bird_id], [lifecycle_id], [img]) VALUES (14, N'cu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_MealPackage] ([meal_package_id], [title_mealpackage], [quantity], [price], [discount_price], [thumbnail], [description], [recipe], [create_at], [update_at], [status], [bird_id], [lifecycle_id], [img]) VALUES (16, N'uinh', 0, 0, 0, N'', N'', N'', CAST(N'1900-01-01' AS Date), CAST(N'1900-01-01' AS Date), 0, 1, 0, N'')
INSERT [dbo].[tbl_MealPackage] ([meal_package_id], [title_mealpackage], [quantity], [price], [discount_price], [thumbnail], [description], [recipe], [create_at], [update_at], [status], [bird_id], [lifecycle_id], [img]) VALUES (21, N'nice', 0, 0, 0, N'', N'', N'', NULL, NULL, 0, NULL, 0, N'')
INSERT [dbo].[tbl_MealPackage] ([meal_package_id], [title_mealpackage], [quantity], [price], [discount_price], [thumbnail], [description], [recipe], [create_at], [update_at], [status], [bird_id], [lifecycle_id], [img]) VALUES (23, N'à lôi', NULL, NULL, NULL, N'ok', N'<p>31</p>', N'<p>ga</p>', NULL, NULL, NULL, 1, NULL, N'31')
SET IDENTITY_INSERT [dbo].[tbl_MealPackage] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Product] ON 

INSERT [dbo].[tbl_Product] ([product_id], [title], [quantity], [price], [discount_price], [weight], [thumbnail], [description], [create_at], [update_at], [status], [category_id], [feedback_id], [bird_id]) VALUES (1, N'Mix Seeds', 22, 100000, 10000, 1, N'img/food/product1.jpg', N'<p><strong>Our mix starts</strong> with a generous helping of sunflower seeds, prized for their rich oil content and high protein levels. These delectable seeds act as a magnet for a wide range of birds, including finches, sparrows, and cardinals, captivating them with their irresistible taste.To add diversity and cater to the unique preferences of different bird species, we''ve incorporated a medley of other small seeds. These might include millet, providing a valuable source of carbohydrates, and cracked corn, adding a satisfying crunch to the mix. These seeds entice a broad spectrum of birds, including doves, jays, and buntings, with their varied textures and flavors.</p>', NULL, NULL, 1, 3, NULL, 1)
INSERT [dbo].[tbl_Product] ([product_id], [title], [quantity], [price], [discount_price], [weight], [thumbnail], [description], [create_at], [update_at], [status], [category_id], [feedback_id], [bird_id]) VALUES (2, N'Corn', 5, 100000, 20000, 1, N'img/food/corn1.png', N'Elevate your bird''s nutrition with our premium corn bird food products. Specially formulated to meet the dietary needs of birds, our corn-based offerings provide a balanced and wholesome meal for your feathered companions. Packed with essential carbohydrates, fiber, vitamins, and minerals, corn is a natural choice for bird food. Our products are carefully processed and prepared to maximize digestibility, ensuring that your birds can effortlessly derive the nutritional benefits. With its irresistible taste and aroma, our corn bird food products are designed to attract and nourish a wide variety of bird species. Give your birds the gift of optimal health and vitality with our high-quality corn bird food products.', NULL, NULL, 1, 3, NULL, 2)
INSERT [dbo].[tbl_Product] ([product_id], [title], [quantity], [price], [discount_price], [weight], [thumbnail], [description], [create_at], [update_at], [status], [category_id], [feedback_id], [bird_id]) VALUES (3, N'Cracked Corn', 18, 80000, 13000, 1, N'img/food/corn.png', N'Cracked corn is derived from mature corn kernels that have been cracked or coarsely ground. This process enhances its accessibility to birds, allowing them to easily consume and benefit from its valuable nutrients.

Our cracked corn seed products are carefully selected to ensure optimal quality and freshness. These seeds serve as an abundant source of carbohydrates, essential fats, and dietary fiber, providing birds with a valuable energy boost.

Offering cracked corn attracts a wide range of bird species, including ground-feeding birds such as doves, quails, sparrows, and towhees. It''s also appreciated by larger birds like turkeys, crows, and ducks, making it a versatile option to attract different avian visitors.

To enjoy our cracked corn seed products, you can scatter them on the ground or use feeders specifically designed for coarse grains. Providing cracked corn in designated feeding areas allows birds to exhibit their natural foraging behaviors, fostering a sense of enrichment and interaction with their environment.', NULL, NULL, 1, 3, NULL, 3)
INSERT [dbo].[tbl_Product] ([product_id], [title], [quantity], [price], [discount_price], [weight], [thumbnail], [description], [create_at], [update_at], [status], [category_id], [feedback_id], [bird_id]) VALUES (4, N'Growth Food', 19, 80000, 83000, 0.5, N'img/food/growth.jpg', N'Maximize the growth potential of your birds with our specialized growth products. Designed to support healthy development and optimize growth, our products are tailored to meet the unique nutritional needs of birds at various life stages. Packed with essential vitamins, minerals, and protein, our growth formulas provide the building blocks necessary for strong bones, vibrant feathers, and robust overall growth. With carefully selected ingredients, including high-quality grains, seeds, and supplements, our growth products offer a balanced and nutritious diet that fuels accelerated growth in young birds or promotes maintenance and strength in adult birds. Whether you''re raising chicks, nurturing fledglings, or maintaining the health of your avian companions, our growth products are the perfect solution to ensure they thrive and reach their full potential. Invest in their growth journey with our premium and effective bird growth products.', NULL, NULL, 1, 4, NULL, 4)
INSERT [dbo].[tbl_Product] ([product_id], [title], [quantity], [price], [discount_price], [weight], [thumbnail], [description], [create_at], [update_at], [status], [category_id], [feedback_id], [bird_id]) VALUES (7, N'Nuts', 17, 50000, 5000, 0.5, N'img/food/nut.jpg', N'Our collection includes a variety of unsalted and unsweetened nuts carefully chosen for their appeal to different birds. Rich in energy, these nuts provide the fuel birds need for their daily activities, including foraging, flying, and maintaining overall vitality.', NULL, NULL, NULL, 3, NULL, 1)
INSERT [dbo].[tbl_Product] ([product_id], [title], [quantity], [price], [discount_price], [weight], [thumbnail], [description], [create_at], [update_at], [status], [category_id], [feedback_id], [bird_id]) VALUES (8, N'Dry Fruits', 14, 50000, NULL, 0.5, N'img/food/fruits.jpg', N'Our assortment includes an array of dried fruits, each carefully dried to retain their natural flavors, textures, and nutritional benefits. These fruits are rich in essential vitamins, minerals, fiber, and antioxidants, providing a boost of energy and promoting overall avian health. Please note that while dry fruits can be a valuable addition to a bird''s diet, they should be offered in moderation as part of a balanced feeding regimen. It''s important to research the specific dietary requirements of the bird species in your area to ensure you provide suitable food choices that meet their nutritional needs.', NULL, NULL, NULL, 3, NULL, 2)
INSERT [dbo].[tbl_Product] ([product_id], [title], [quantity], [price], [discount_price], [weight], [thumbnail], [description], [create_at], [update_at], [status], [category_id], [feedback_id], [bird_id]) VALUES (9, N'MealWorms', 18, 150000, NULL, 0.5, N'img/food/mealworm.jpg', N'Mealworms are the larval stage of darkling beetles, and they are a natural part of many birds'' diets. These little creatures are an excellent source of high-quality protein, essential amino acids, vitamins, and minerals, making them a valuable addition to your bird''s feeding routine.

Our mealworm products are available in two main forms: dried mealworms and live mealworms.

Dried Mealworms:
Our dried mealworms are carefully dehydrated to lock in their nutritional value while providing a convenient and long-lasting feeding option. These shelf-stable morsels are ideal for attracting insect-eating birds such as bluebirds, robins, and wrens. They can be easily sprinkled in bird feeders, added to seed mixes, or placed in specialized mealworm feeders.', NULL, NULL, NULL, 1, NULL, 3)
INSERT [dbo].[tbl_Product] ([product_id], [title], [quantity], [price], [discount_price], [weight], [thumbnail], [description], [create_at], [update_at], [status], [category_id], [feedback_id], [bird_id]) VALUES (10, N'Dried MealWorms', 20, 129000, NULL, 0.5, N'img/food/driedworm.jpg', N'Mealworms are the larvae of darkling beetles and have long been recognized as a natural and valuable food source for birds. Our mealworm products offer a convenient way to provide this nourishing delicacy to your feathered friends.

Dried Mealworms:
Our dried mealworms undergo a careful dehydration process that preserves their nutritional content while ensuring long shelf life. These crispy and lightweight treats are easy to handle and can be served in bird feeders, scattered on the ground, or mixed into seed blends. They are particularly enticing to insect-eating birds such as bluebirds, warblers, and thrushes, attracting them with their rich protein content and irresistible taste.', NULL, NULL, NULL, 1, NULL, 4)
INSERT [dbo].[tbl_Product] ([product_id], [title], [quantity], [price], [discount_price], [weight], [thumbnail], [description], [create_at], [update_at], [status], [category_id], [feedback_id], [bird_id]) VALUES (11, N'Peanuts', 20, 70000, NULL, 0.5, N'img/food/peanuts.jpg', N'Peanuts are a beloved and highly sought-after food among many birds, known for their rich flavor and high nutritional value. Packed with beneficial fats, proteins, vitamins, and minerals, they provide essential nutrients to support the health and vitality of your feathered companions.

Our peanuts products are carefully selected and prepared to ensure optimal freshness and quality. We offer both in-shell peanuts and shelled peanuts to cater to different bird feeding preferences.

In-Shell Peanuts:
Our in-shell peanuts provide birds with an engaging feeding experience. As birds work to crack open the shells, they exercise their natural foraging and problem-solving skills. This interactive process adds stimulation and enrichment to their feeding routine. In-shell peanuts are particularly appealing to larger birds, such as jays, woodpeckers, and crows, who relish the challenge of extracting the delicious kernels.

Shelled Peanuts:
For a convenient and readily accessible option, our shelled peanuts are a perfect choice. These peanuts have been carefully removed from their shells, allowing birds to enjoy the nutrient-rich kernels with ease. Shelled peanuts are highly versatile and can be used in various feeding setups, including bird feeders, platform feeders, or scattered directly on the ground. They are enjoyed by a wide range of birds, including chickadees, finches, titmice, and nuthatches.

By offering our premium peanuts products, you invite a vibrant array of feathered visitors to your backyard. Watch in awe as birds flutter and chirp with delight, relishing the protein-packed goodness of these natural treats.', NULL, NULL, NULL, 3, NULL, 1)
INSERT [dbo].[tbl_Product] ([product_id], [title], [quantity], [price], [discount_price], [weight], [thumbnail], [description], [create_at], [update_at], [status], [category_id], [feedback_id], [bird_id]) VALUES (12, N'Nutrients Foods', 20, 109000, NULL, 1.2, N'img/food/hat.jpg', N'In the Wild, birds forage a complex range of nutrients from a variety of plants, fruits, nuts, and seeds to support optimal health. Foraging is an instinctive behavior your pet bird inherited from its ancestors. The animal nutrition experts at Kaytee developed Food from the Wild blend for the forager in your family. Inspired by the ancestral feeding habits of Macaws, Food from the Wild blend is crafted with hand-selected chili peppers, papaya, bananas, pistachios, and Brazil nuts to encourage the healthy foraging activity your Macaw needs. Extruded pieces offer species specific nutrition to support overall health. Food from the Wild food is formulated holistically to meet the unique nutritional needs of your Macaw. With more than 150 years of nutritional excellence, Kaytee is honored to be at the heart of your healthy, happy feeding routine. Made with Natural Ingredients
From the makers of Kaytee®, a Veterinarian Recommended Brand
No Artificial Preservatives
Supports Digestive Health
Ingredients Inspired by Natural Habitats
Foraging Ingredients for Variety and Enrichment
', NULL, NULL, NULL, 3, NULL, 2)
INSERT [dbo].[tbl_Product] ([product_id], [title], [quantity], [price], [discount_price], [weight], [thumbnail], [description], [create_at], [update_at], [status], [category_id], [feedback_id], [bird_id]) VALUES (13, N'Super Foods', 15, 149000, NULL, 0.5, N'img/food/hat1.jpg', N'SUPERFOODS adds a nutritious punch for a guilt-free experience. Treat sticks provide a fun way to add healthy and tasty enrichment to your pet’s diet. Premium blend of seeds, grains, vegetables & fruits
Nutritionally fortified foods with vitamins and natural antioxidants
Naturally preserved for ideal freshness', NULL, NULL, NULL, 3, NULL, 3)
INSERT [dbo].[tbl_Product] ([product_id], [title], [quantity], [price], [discount_price], [weight], [thumbnail], [description], [create_at], [update_at], [status], [category_id], [feedback_id], [bird_id]) VALUES (14, N'Nutritious Foods', 25, 159000, NULL, 0.8, N'img/food/nutrient.jpg', N'Balanced high-nutrient formula helps babies grow faster, wean earlier and develop stronger, brighter plumage
Kaytee® is a Veterinarian Recommended Brand
Contains probiotics to encourage a healthy population of intestinal microorganisms.
Digestive enzymes are included to ensure adequate digestion of carbohydrates and proteins. These enzymes offer a particular value to a newly hatched baby or in a bird experiencing digestive difficulties.
Exact Hand Feeding Formula has compatible tastes and ingredients with exact Conversion and exact Adult Daily Diets to help reduce digestive upsets during weaning
This product is formulated for use with: Baby Parrots (including Parakeets, Lovebirds, Cockatiels, Conures, Cockatoos, Macaws, Amazons, African Greys, and other Psittacines) & Baby Passerines.', NULL, NULL, NULL, 4, NULL, 4)
INSERT [dbo].[tbl_Product] ([product_id], [title], [quantity], [price], [discount_price], [weight], [thumbnail], [description], [create_at], [update_at], [status], [category_id], [feedback_id], [bird_id]) VALUES (15, N'Extra Natural', 30, 159000, NULL, 0.8, N'img/food/nutrient1.jpg', N'Combining the highest quality ingredients with essential nutrients in a special pasteurizing process produces this crunchy, seed-shaped nugget. Designed to support normal bird activity such as molting, growth, and breeding. Satisfying food contains DHA Omega-3 to support brain, heart, and visual functions and L-Carnitine for improved metabolism. Omega 3''s to support Brain and Heart Health
Kaytee® is a Veterinarian Recommended Brand
Enhances Skin & Feather health for vibrant, healthy plumage
Prebiotics and probiotics to support digestive health
100% consumable extruded nutrition with no shells or seed hulls
No artificial colors, flavors or preservatives ', NULL, NULL, NULL, 4, NULL, 5)
INSERT [dbo].[tbl_Product] ([product_id], [title], [quantity], [price], [discount_price], [weight], [thumbnail], [description], [create_at], [update_at], [status], [category_id], [feedback_id], [bird_id]) VALUES (16, N'Biscuit', 35, 89000, NULL, 1, N'img/food/biscuit.jpg', N'Treats for birds are a nutritious treat that complements any diet and makes a great training aid.
Delicious treat for large hookbills such as: Parrots, Macaws & Cockatoos
Ideal for bonding and playtime.', NULL, NULL, NULL, 3, NULL, 1)
INSERT [dbo].[tbl_Product] ([product_id], [title], [quantity], [price], [discount_price], [weight], [thumbnail], [description], [create_at], [update_at], [status], [category_id], [feedback_id], [bird_id]) VALUES (17, N'Sunflower Hearts', 28, 59000, NULL, 0.35, N'img/food/sunfl.jpg', N'Sunflower Hearts & Chips Wild Bird Food is a superb choice for bird enthusiasts seeking to provide their feathered friends with nourishing sustenance that also entices them to frequent their backyard. This high-quality bird food is specifically designed to deliver the essential nutrition required for the well-being of wild birds. Packed with highly nutritious sunflower hearts and chips, it serves as an irresistible treat that will keep a wide variety of bird species flocking to your yard. The abundance of energy-rich ingredients in this bird food ensures that avian visitors receive the vital nutrients necessary for their growth, health, and vitality. By offering Sunflower Hearts & Chips Wild Bird Food, you not only support the overall well-being of these delightful creatures but also create an enchanting haven where you can delight in the captivating sights and sounds of a vibrant bird community right in your own backyard.', NULL, NULL, NULL, 3, NULL, 2)
INSERT [dbo].[tbl_Product] ([product_id], [title], [quantity], [price], [discount_price], [weight], [thumbnail], [description], [create_at], [update_at], [status], [category_id], [feedback_id], [bird_id]) VALUES (18, N'Natural Snacks', 30, 66000, NULL, 0.4, N'img/food/aturesnack.jpg', N'Wild Natural Snack is a premium medley crafted to bring variety to your pet bird''s diet with natural ingredients inspired by your bird’s native habitat. Made with a limited number of whole ingredients to make a tasty and healthy treat. Kaytee understands that sharing your life with a pet bird is not only enjoyable but very enriching. Kaytee shows our love by ensuring we provide your pet with the best nutrition for a long and healthy life. With over 150 years of nutritional experience, it''s no wonder why Kaytee is at the heart of every healthy feeding routine. Natural snack made with limited number of whole ingredients
No added sugars, fillers, or artificial preservatives
Includes dried banana, pineapple, bell pepper, chili pepper, marigold, and shelled pistachio
Blend designed for medium or large pet birds', NULL, NULL, NULL, 3, NULL, 3)
INSERT [dbo].[tbl_Product] ([product_id], [title], [quantity], [price], [discount_price], [weight], [thumbnail], [description], [create_at], [update_at], [status], [category_id], [feedback_id], [bird_id]) VALUES (19, N'Wheat Bran', 30, 349000, NULL, 20, N'img/food/heygates-wheat-bran.jpg', N'Wheat Bran is a very palatable feed perfect for fussy eaters or for hiding medication within and provides a fibrous, bulking agent, perfect for providing a bit of extra roughage.

Wheat Bran is low in calcium, sugar and starch but generous in phosphorus and magnesium whilst proving extra calories to help maintain condition.

Due to being a wheat by-product, Wheat Bran also contains natural sources of B vitamins and vitamin E whilst providing a range of antioxidants to help support bowel health.', NULL, NULL, NULL, 2, NULL, 5)
SET IDENTITY_INSERT [dbo].[tbl_Product] OFF
GO
INSERT [dbo].[tbl_pro-meal] ([product_id], [meal_package_id], [quantity]) VALUES (NULL, 1, NULL)
INSERT [dbo].[tbl_pro-meal] ([product_id], [meal_package_id], [quantity]) VALUES (NULL, 4, NULL)
INSERT [dbo].[tbl_pro-meal] ([product_id], [meal_package_id], [quantity]) VALUES (1, 1, NULL)
INSERT [dbo].[tbl_pro-meal] ([product_id], [meal_package_id], [quantity]) VALUES (4, NULL, NULL)
INSERT [dbo].[tbl_pro-meal] ([product_id], [meal_package_id], [quantity]) VALUES (1, NULL, NULL)
INSERT [dbo].[tbl_pro-meal] ([product_id], [meal_package_id], [quantity]) VALUES (2, 1, NULL)
INSERT [dbo].[tbl_pro-meal] ([product_id], [meal_package_id], [quantity]) VALUES (3, 2, NULL)
INSERT [dbo].[tbl_pro-meal] ([product_id], [meal_package_id], [quantity]) VALUES (9, 2, NULL)
INSERT [dbo].[tbl_pro-meal] ([product_id], [meal_package_id], [quantity]) VALUES (1, 4, NULL)
INSERT [dbo].[tbl_pro-meal] ([product_id], [meal_package_id], [quantity]) VALUES (1, 3, NULL)
INSERT [dbo].[tbl_pro-meal] ([product_id], [meal_package_id], [quantity]) VALUES (14, 2, NULL)
INSERT [dbo].[tbl_pro-meal] ([product_id], [meal_package_id], [quantity]) VALUES (7, 4, NULL)
GO
SET IDENTITY_INSERT [dbo].[tbl_Role] ON 

INSERT [dbo].[tbl_Role] ([role_id], [name]) VALUES (1, N'admin')
INSERT [dbo].[tbl_Role] ([role_id], [name]) VALUES (2, N'staff')
INSERT [dbo].[tbl_Role] ([role_id], [name]) VALUES (3, N'customer')
SET IDENTITY_INSERT [dbo].[tbl_Role] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_User] ON 

INSERT [dbo].[tbl_User] ([user_id], [username], [password], [fullname], [email], [phone_number], [address], [status], [role_id]) VALUES (1, N'admin', N'1', N'BMOS admin', N'bmos@gmail.com', N'012345679', N'29/45D, Boston', 1, 1)
INSERT [dbo].[tbl_User] ([user_id], [username], [password], [fullname], [email], [phone_number], [address], [status], [role_id]) VALUES (3, N'customer', N'123123', N'BMOS customer', N'cus1@gmail.com', N'741852963', N'8/A5D, British', 1, 3)
INSERT [dbo].[tbl_User] ([user_id], [username], [password], [fullname], [email], [phone_number], [address], [status], [role_id]) VALUES (5, N'thangpham', N'123123', N'Quoc Thang', N'quocthang@gmail.com', N'098712375', N'Thanh Pho Ho Chi Minh', 1, 3)
INSERT [dbo].[tbl_User] ([user_id], [username], [password], [fullname], [email], [phone_number], [address], [status], [role_id]) VALUES (6, N'tuankiet', N'123123', N'Tuan Kiet', N'tuankiet@gmail.com', N'093251275', N'TP Ho Chi Minh', 1, 3)
INSERT [dbo].[tbl_User] ([user_id], [username], [password], [fullname], [email], [phone_number], [address], [status], [role_id]) VALUES (7, N'hoanggiang', N'123123', N'Hoang Giang', N'hoanggiang@gmail.com', N'098789257', N'TP Ho Chi Minh', 1, 3)
INSERT [dbo].[tbl_User] ([user_id], [username], [password], [fullname], [email], [phone_number], [address], [status], [role_id]) VALUES (8, N'tientran', N'123123', N'Tien Tran', N'tientran@gmail.com', N'037182658', N'TP Ho Chi Minh', 1, 3)
INSERT [dbo].[tbl_User] ([user_id], [username], [password], [fullname], [email], [phone_number], [address], [status], [role_id]) VALUES (10, N'quangvinh', N'123123', N'Quang Vinh', N'quangvinh@gmail.com', N'098127816', N'TP Ho Chi Minh', 1, 3)
INSERT [dbo].[tbl_User] ([user_id], [username], [password], [fullname], [email], [phone_number], [address], [status], [role_id]) VALUES (11, N'cus', N'1', NULL, NULL, NULL, NULL, 1, 3)
INSERT [dbo].[tbl_User] ([user_id], [username], [password], [fullname], [email], [phone_number], [address], [status], [role_id]) VALUES (12, N'staff', N'1', NULL, NULL, NULL, NULL, 1, 2)
SET IDENTITY_INSERT [dbo].[tbl_User] OFF
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_tbl_MealPackage] FOREIGN KEY([meal_package_id])
REFERENCES [dbo].[tbl_MealPackage] ([meal_package_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_tbl_MealPackage]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_tbl_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tbl_Product] ([product_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_tbl_Product]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_tbl_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[tbl_User] ([user_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_tbl_User]
GO
ALTER TABLE [dbo].[tbl_Blog]  WITH CHECK ADD  CONSTRAINT [FK__tbl_Blog__bird_i__5629CD9C] FOREIGN KEY([bird_id])
REFERENCES [dbo].[tbl_Bird] ([bird_id])
GO
ALTER TABLE [dbo].[tbl_Blog] CHECK CONSTRAINT [FK__tbl_Blog__bird_i__5629CD9C]
GO
ALTER TABLE [dbo].[tbl_Feedback]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[tbl_User] ([user_id])
GO
ALTER TABLE [dbo].[tbl_MealPackage]  WITH CHECK ADD  CONSTRAINT [FK__tbl_MealP__bird___48CFD27E] FOREIGN KEY([bird_id])
REFERENCES [dbo].[tbl_Bird] ([bird_id])
GO
ALTER TABLE [dbo].[tbl_MealPackage] CHECK CONSTRAINT [FK__tbl_MealP__bird___48CFD27E]
GO
ALTER TABLE [dbo].[tbl_Order]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[tbl_User] ([user_id])
GO
ALTER TABLE [dbo].[tbl_OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__tbl_Order__oder___5441852A] FOREIGN KEY([oder_id])
REFERENCES [dbo].[tbl_Order] ([order_id])
GO
ALTER TABLE [dbo].[tbl_OrderDetail] CHECK CONSTRAINT [FK__tbl_Order__oder___5441852A]
GO
ALTER TABLE [dbo].[tbl_OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_OrderDetail_tbl_MealPackage] FOREIGN KEY([meal_package_id])
REFERENCES [dbo].[tbl_MealPackage] ([meal_package_id])
GO
ALTER TABLE [dbo].[tbl_OrderDetail] CHECK CONSTRAINT [FK_tbl_OrderDetail_tbl_MealPackage]
GO
ALTER TABLE [dbo].[tbl_OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_OrderDetail_tbl_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tbl_Product] ([product_id])
GO
ALTER TABLE [dbo].[tbl_OrderDetail] CHECK CONSTRAINT [FK_tbl_OrderDetail_tbl_Product]
GO
ALTER TABLE [dbo].[tbl_Product]  WITH CHECK ADD  CONSTRAINT [FK__tbl_Produ__categ__5629CD9C] FOREIGN KEY([category_id])
REFERENCES [dbo].[tbl_Category] ([category_id])
GO
ALTER TABLE [dbo].[tbl_Product] CHECK CONSTRAINT [FK__tbl_Produ__categ__5629CD9C]
GO
ALTER TABLE [dbo].[tbl_Product]  WITH CHECK ADD  CONSTRAINT [FK__tbl_Produ__feedb__571DF1D5] FOREIGN KEY([feedback_id])
REFERENCES [dbo].[tbl_Feedback] ([feedback_id])
GO
ALTER TABLE [dbo].[tbl_Product] CHECK CONSTRAINT [FK__tbl_Produ__feedb__571DF1D5]
GO
ALTER TABLE [dbo].[tbl_pro-meal]  WITH CHECK ADD  CONSTRAINT [FK_tbl_pro-meal_tbl_MealPackage] FOREIGN KEY([meal_package_id])
REFERENCES [dbo].[tbl_MealPackage] ([meal_package_id])
GO
ALTER TABLE [dbo].[tbl_pro-meal] CHECK CONSTRAINT [FK_tbl_pro-meal_tbl_MealPackage]
GO
ALTER TABLE [dbo].[tbl_pro-meal]  WITH CHECK ADD  CONSTRAINT [FK_tbl_pro-meal_tbl_Product1] FOREIGN KEY([product_id])
REFERENCES [dbo].[tbl_Product] ([product_id])
GO
ALTER TABLE [dbo].[tbl_pro-meal] CHECK CONSTRAINT [FK_tbl_pro-meal_tbl_Product1]
GO
ALTER TABLE [dbo].[tbl_User]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[tbl_Role] ([role_id])
GO
USE [master]
GO
ALTER DATABASE [BMOS_v5] SET  READ_WRITE 
GO
