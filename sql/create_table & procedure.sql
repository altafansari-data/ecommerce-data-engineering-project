/****** Object:  Table [dbo].[adf_metadata]    Script Date: 16-05-2026 14:36:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adf_metadata](
	[table_name] [varchar](100) NULL,
	[sink_folder] [varchar](200) NULL,
	[load_type] [varchar](50) NULL
) ON [PRIMARY]
GO



/****** Object:  Table [dbo].[adf_watermark]    Script Date: 16-05-2026 14:36:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adf_watermark](
	[table_name] [varchar](100) NULL,
	[last_load_date] [datetime] NULL
) ON [PRIMARY]
GO




/****** Object:  Table [dbo].[customer]    Script Date: 16-05-2026 14:36:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[customer_id] [varchar](50) NOT NULL,
	[customer_unique_id] [varchar](50) NULL,
	[customer_zip_code_prefix] [int] NULL,
	[customer_city] [varchar](100) NULL,
	[customer_state] [char](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** Object:  Table [dbo].[order_items]    Script Date: 16-05-2026 14:36:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_items](
	[order_id] [varchar](50) NOT NULL,
	[order_item_id] [int] NOT NULL,
	[product_id] [varchar](50) NOT NULL,
	[seller_id] [varchar](50) NOT NULL,
	[shipping_limit_date] [datetime] NULL,
	[price] [decimal](10, 2) NULL,
	[freight_value] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[order_item_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** Object:  Table [dbo].[orders]    Script Date: 16-05-2026 14:36:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [varchar](50) NOT NULL,
	[customer_id] [varchar](50) NOT NULL,
	[order_status] [varchar](20) NULL,
	[order_purchase_timestamp] [datetime] NULL,
	[order_approved_at] [datetime] NULL,
	[order_delivered_carrier_date] [datetime] NULL,
	[order_delivered_customer_date] [datetime] NULL,
	[order_estimated_delivery_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[products]    Script Date: 16-05-2026 14:36:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[product_id] [varchar](50) NOT NULL,
	[product_category_name] [varchar](100) NULL,
	[product_name_lenght] [smallint] NULL,
	[product_description_lenght] [smallint] NULL,
	[product_photos_qty] [tinyint] NULL,
	[product_weight_g] [int] NULL,
	[product_length_cm] [decimal](10, 2) NULL,
	[product_height_cm] [decimal](10, 2) NULL,
	[product_width_cm] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  StoredProcedure [dbo].[usp_update_watermark]    Script Date: 16-05-2026 14:36:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_update_watermark]
AS
BEGIN

UPDATE adf_watermark
SET last_load_date =
(
    SELECT MAX(order_purchase_timestamp)
    FROM orders
)
WHERE table_name='orders'

END
GO
