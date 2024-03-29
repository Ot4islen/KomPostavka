CREATE DATABASE [ObecpechPC]
USE [ObecpechPC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Avtoriz](
	[Login] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Id_Sotr] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Obespechenie]    Script Date: 12.10.2019 22:02:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Obespechenie](
	[Id_Obespech] [int] NOT NULL,
	[Data_Obecpech] [datetime] NULL,
	[Id_Work] [int] NULL,
	[Id_Sotr] [int] NULL,
	[Id_Zayav] [int] NULL,
 CONSTRAINT [PK_Obespechenie] PRIMARY KEY CLUSTERED 
(
	[Id_Obespech] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Postavshik]    Script Date: 12.10.2019 22:02:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Postavshik](
	[Id_Postav] [int] NOT NULL,
	[Name_Postav] [varchar](50) NULL,
	[Adress_Postav] [varchar](100) NULL,
	[Contact_Postav] [int] NULL,
 CONSTRAINT [PK_Postavshik] PRIMARY KEY CLUSTERED 
(
	[Id_Postav] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[School]    Script Date: 12.10.2019 22:02:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[School](
	[Id_School] [int] NOT NULL,
	[Name_School] [varchar](100) NULL,
	[Adress_School] [varchar](100) NULL,
	[Contact_School] [varchar](500) NULL,
 CONSTRAINT [PK_School] PRIMARY KEY CLUSTERED 
(
	[Id_School] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sotr]    Script Date: 12.10.2019 22:02:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sotr](
	[Id_Sotr] [int] NOT NULL,
	[FIO_Sotr] [varchar](100) NULL,
	[Position_Sotr] [varchar](100) NULL,
	[Id_Work] [int] NULL,
 CONSTRAINT [PK_Sotr] PRIMARY KEY CLUSTERED 
(
	[Id_Sotr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Work]    Script Date: 12.10.2019 22:02:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Work](
	[Id_Work] [int] NOT NULL,
	[Type_Work] [varchar](50) NULL,
 CONSTRAINT [PK_Work] PRIMARY KEY CLUSTERED 
(
	[Id_Work] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Zayavka]    Script Date: 12.10.2019 22:02:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zayavka](
	[Id_Zayav] [int] NOT NULL,
	[Opis_Zayav] [nchar](100) NULL,
	[Data_Zayav] [datetime] NULL,
	[Summa_Zayav] [int] NULL,
	[Id_Postav] [int] NULL,
	[Id_School] [int] NULL,
 CONSTRAINT [PK_Zayavka] PRIMARY KEY CLUSTERED 
(
	[Id_Zayav] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Avtoriz]  WITH CHECK ADD  CONSTRAINT [FK_Avtoriz_Sotr] FOREIGN KEY([Id_Sotr])
REFERENCES [dbo].[Sotr] ([Id_Sotr])
GO
ALTER TABLE [dbo].[Avtoriz] CHECK CONSTRAINT [FK_Avtoriz_Sotr]
GO
ALTER TABLE [dbo].[Obespechenie]  WITH CHECK ADD  CONSTRAINT [FK_Obespechenie_Sotr] FOREIGN KEY([Id_Sotr])
REFERENCES [dbo].[Sotr] ([Id_Sotr])
GO
ALTER TABLE [dbo].[Obespechenie] CHECK CONSTRAINT [FK_Obespechenie_Sotr]
GO
ALTER TABLE [dbo].[Obespechenie]  WITH CHECK ADD  CONSTRAINT [FK_Obespechenie_Work] FOREIGN KEY([Id_Work])
REFERENCES [dbo].[Work] ([Id_Work])
GO
ALTER TABLE [dbo].[Obespechenie] CHECK CONSTRAINT [FK_Obespechenie_Work]
GO
ALTER TABLE [dbo].[Obespechenie]  WITH CHECK ADD  CONSTRAINT [FK_Obespechenie_Zayavka] FOREIGN KEY([Id_Zayav])
REFERENCES [dbo].[Zayavka] ([Id_Zayav])
GO
ALTER TABLE [dbo].[Obespechenie] CHECK CONSTRAINT [FK_Obespechenie_Zayavka]
GO
ALTER TABLE [dbo].[Sotr]  WITH CHECK ADD  CONSTRAINT [FK_Sotr_Work] FOREIGN KEY([Id_Work])
REFERENCES [dbo].[Work] ([Id_Work])
GO
ALTER TABLE [dbo].[Sotr] CHECK CONSTRAINT [FK_Sotr_Work]
GO
ALTER TABLE [dbo].[Zayavka]  WITH CHECK ADD  CONSTRAINT [FK_Zayavka_Postavshik] FOREIGN KEY([Id_Postav])
REFERENCES [dbo].[Postavshik] ([Id_Postav])
GO
ALTER TABLE [dbo].[Zayavka] CHECK CONSTRAINT [FK_Zayavka_Postavshik]
GO
ALTER TABLE [dbo].[Zayavka]  WITH CHECK ADD  CONSTRAINT [FK_Zayavka_School] FOREIGN KEY([Id_School])
REFERENCES [dbo].[School] ([Id_School])
GO
ALTER TABLE [dbo].[Zayavka] CHECK CONSTRAINT [FK_Zayavka_School]
GO
USE [master]
GO
ALTER DATABASE [ObecpechPC] SET  READ_WRITE 
GO
