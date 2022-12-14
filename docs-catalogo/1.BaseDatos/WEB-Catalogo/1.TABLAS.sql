USE [db_catalogo_servicios]
GO
--
--*********************************************************************
--TABLA Familia de servicios
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--DROP TABLE IF EXISTS [dbo].[familia]
CREATE TABLE [dbo].[familia](
	[FAMILIA_ID] [INT] IDENTITY(1,1) NOT NULL,
	[DESCRIPCION] [varchar](50) NOT NULL,
	[ESTADO] [CHAR](1) NOT NULL,
	USUARIO_CREACION VARCHAR (50) NOT NULL,
	FECHA_CREACION DATETIME NOT NULL,
	USUARIO_ACTUALIZACION  VARCHAR (50) NULL,
	FECHA_ACTUALIZACION DATETIME NULL,
	CONSTRAINT [PK_FAMILIA] PRIMARY KEY CLUSTERED
(
	[FAMILIA_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[familia] ADD  CONSTRAINT [DF_FAMILIA_ESTADO]  DEFAULT ((1)) FOR [ESTADO]
GO
--*********************************************************************
--TABLA Formatos
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--DROP TABLE IF EXISTS [dbo].[formato]
CREATE TABLE [dbo].[formato](
	[FORMATO_ID] [INT] IDENTITY(1,1) NOT NULL,
	[CODIGO] [varchar](50) NOT NULL,
	[DESCRIPCION] [varchar](50) NOT NULL,
	[VERSION] [INT] NOT NULL,
	[ESTADO] [CHAR](1) NOT NULL,
	USUARIO_CREACION VARCHAR (50) NOT NULL,
	FECHA_CREACION DATETIME NOT NULL,
	USUARIO_ACTUALIZACION  VARCHAR (50) NULL,
	FECHA_ACTUALIZACION DATETIME NULL,
	CONSTRAINT [PK_FORMATO] PRIMARY KEY CLUSTERED
(
	[FORMATO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[formato] ADD  CONSTRAINT [DF_FORMATO_ESTADO]  DEFAULT ((1)) FOR [ESTADO]
GO
ALTER TABLE [dbo].[formato] ADD  CONSTRAINT [DF_FORMATO_VERSION]  DEFAULT ((1)) FOR [VERSION]
GO
--*********************************************************************
--TABLA Campos
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
--DROP TABLE IF EXISTS [campo]
CREATE TABLE [dbo].[campo](
	[CAMPO_ID] [INT] IDENTITY(1,1) NOT NULL,
	[DESCRIPCION] [varchar](50) NOT NULL,
    [ESTADO] [CHAR](1) NOT NULL,
	USUARIO_CREACION VARCHAR (50) NOT NULL,
	FECHA_CREACION DATETIME NOT NULL,
	USUARIO_ACTUALIZACION  VARCHAR (50) NULL,
	FECHA_ACTUALIZACION DATETIME NULL,
 CONSTRAINT [PK_CAMPO] PRIMARY KEY CLUSTERED 
(
	[CAMPO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[campo] ADD  CONSTRAINT [DF_CAMPO_ESTADO]  DEFAULT ((1)) FOR [ESTADO]
GO

SET ANSI_PADDING OFF
GO

--***********************************************************************
--TABLA Servicios
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
--DROP TABLE IF EXISTS [servicio]
CREATE TABLE [dbo].[servicio](
	[SERVICIO_ID] [INT] IDENTITY(1,1) NOT NULL,
	[DESCRIPCION] [varchar](100) NOT NULL,
	FAMILIA_ID [INT],
	FORMATO_ID [INT],
	[ESTADO] [CHAR](1) NOT NULL,
	USUARIO_CREACION VARCHAR (50) NOT NULL,
	FECHA_CREACION DATETIME NOT NULL,
	USUARIO_ACTUALIZACION  VARCHAR (50) NULL,
	FECHA_ACTUALIZACION DATETIME NULL,
 CONSTRAINT [PK_SERVICIO] PRIMARY KEY CLUSTERED 
(
	[SERVICIO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[servicio] ADD  CONSTRAINT [DF_SERVICIO_ESTADO]  DEFAULT ((1)) FOR [ESTADO]
GO

ALTER TABLE [dbo].[servicio] ADD  CONSTRAINT [FK_SERVICIO_FORMATO]  FOREIGN KEY (FORMATO_ID) REFERENCES [dbo].[formato]([FORMATO_ID])
GO

ALTER TABLE [dbo].[servicio] ADD  CONSTRAINT [FK_SERVICIO_FAMILIA]  FOREIGN KEY (FAMILIA_ID) REFERENCES [dbo].[familia]([FAMILIA_ID])
GO

SET ANSI_PADDING OFF
GO
--***********************************************************************
--TABLA Campos por Servicio
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
--DROP TABLE IF EXISTS [campo_servicio]
CREATE TABLE [dbo].[campo_servicio](
	[CAMPO_SERVICIO_ID] [INT] IDENTITY(1,1) NOT NULL,
	[SERVICIO_ID] [INT],
	[CAMPO_ID] [INT],
	[ESTADO] [CHAR](1) NOT NULL,
	USUARIO_CREACION VARCHAR (50) NOT NULL,
	FECHA_CREACION DATETIME NOT NULL,
	USUARIO_ACTUALIZACION  VARCHAR (50) NULL,
	FECHA_ACTUALIZACION DATETIME NULL,
 CONSTRAINT [PK_CAMPO_SERVICIO] PRIMARY KEY CLUSTERED 
(
	[CAMPO_SERVICIO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[campo_servicio] ADD  CONSTRAINT [DF_CSERVICIO_ESTADO]  DEFAULT ((1)) FOR [ESTADO]
GO

ALTER TABLE [dbo].[campo_servicio] ADD  CONSTRAINT [FK_CAMPO]  FOREIGN KEY (CAMPO_ID) REFERENCES [dbo].[campo]([CAMPO_ID])
GO

ALTER TABLE [dbo].[campo_servicio] ADD  CONSTRAINT [FK_SERVICIO]  FOREIGN KEY (SERVICIO_ID) REFERENCES [dbo].[servicio]([SERVICIO_ID])
GO

SET ANSI_PADDING OFF
GO
--***********************************************************************
--TABLA Direcciones
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
----DROP TABLE IF EXISTS [direccion]
CREATE TABLE [dbo].[direccion](
	[ENUM_ID] [int] IDENTITY(1,1) NOT NULL,
	[ENUM_PARENTCHLD1] [int] NOT NULL,
	[ENUM_PARENTCHLD2] [int] NOT NULL,
	[ENUM_DESC] [varchar] (200) NOT NULL,
	[ESTADO] [char](1) NOT NULL,
	USUARIO_CREACION VARCHAR (50) NOT NULL,
	FECHA_CREACION DATETIME NOT NULL,
	USUARIO_ACTUALIZACION  VARCHAR (50) NULL,
	FECHA_ACTUALIZACION DATETIME NULL,
 CONSTRAINT [PK_DIRECCION] PRIMARY KEY CLUSTERED 
(
	[ENUM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[direccion] ADD  CONSTRAINT [DF_DIRECCION_ESTADO]  DEFAULT ((1)) FOR [ESTADO]
GO

SET ANSI_PADDING OFF
GO
--***********************************************************************
--TABLA Sedes
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
----DROP TABLE IF EXISTS [sede]
CREATE TABLE [dbo].[sede](
	[SEDE_ID] [int] IDENTITY(1,1) NOT NULL,
	[DESCRIPCION] [varchar] (200) NOT NULL,
	[UBICACION] [varchar] (200) NOT NULL,
	[ESTADO] [char](1) NOT NULL,
	USUARIO_CREACION VARCHAR (50) NOT NULL,
	FECHA_CREACION DATETIME NOT NULL,
	USUARIO_ACTUALIZACION  VARCHAR (50) NULL,
	FECHA_ACTUALIZACION DATETIME NULL,
 CONSTRAINT [PK_SEDE] PRIMARY KEY CLUSTERED 
(
	[SEDE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[sede] ADD  CONSTRAINT [DF_SEDE_ESTADO]  DEFAULT ((1)) FOR [ESTADO]
GO

SET ANSI_PADDING OFF
GO
--***********************************************************************
--TABLA Direcci�n Sede
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
----DROP TABLE IF EXISTS [sede]
CREATE TABLE [dbo].[direccion_sede](
	[DIR_SEDE_ID] [int] IDENTITY(1,1) NOT NULL,
	[DIRECCION_ID] [int] NOT NULL,
	[SEDE_ID] [int] NOT NULL,
	[ESTADO] [char](1) NOT NULL,
	USUARIO_CREACION VARCHAR (50) NOT NULL,
	FECHA_CREACION DATETIME NOT NULL,
	USUARIO_ACTUALIZACION  VARCHAR (50) NULL,
	FECHA_ACTUALIZACION DATETIME NULL,
 CONSTRAINT [PK_DIRECCION_SEDE] PRIMARY KEY CLUSTERED 
(
	[DIR_SEDE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[direccion_sede] ADD  CONSTRAINT [FK_DIR_SEDE_SEDE]  FOREIGN KEY (SEDE_ID) REFERENCES [dbo].[sede]([SEDE_ID])
GO

ALTER TABLE [dbo].[direccion_sede] ADD  CONSTRAINT [FK_DIR_SEDE_DIR]  FOREIGN KEY (DIRECCION_ID) REFERENCES [dbo].[direccion]([ENUM_ID])
GO

ALTER TABLE [dbo].[direccion_sede] ADD  CONSTRAINT [DF_DIR_SED_ESTADO]  DEFAULT ((1)) FOR [ESTADO]
GO

ALTER TABLE [dbo].[direccion_sede] ADD  CONSTRAINT [DF_SEDE_DIR_USUARIO_CREA]  DEFAULT ((USER_NAME())) FOR [USUARIO_CREACION]
GO

ALTER TABLE [dbo].[direccion_sede] ADD  CONSTRAINT [DF_SEDE_DIR_FECHA_CREA]  DEFAULT ((GETDATE())) FOR [FECHA_CREACION]
GO

SET ANSI_PADDING OFF
GO
--TABLA Estado Solicitud
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
----DROP TABLE IF EXISTS [estado_solicitud]
CREATE TABLE [dbo].[estado_solicitud](
	[ESTADO_SOLICITUD_ID] [INT] IDENTITY(1,1) NOT NULL,
	[DESCRIPCION] [varchar] (200) NOT NULL,
	[ESTADO] [char](1) NOT NULL,
	USUARIO_CREACION VARCHAR (50) NOT NULL,
	FECHA_CREACION DATETIME NOT NULL,
	USUARIO_ACTUALIZACION  VARCHAR (50) NULL,
	FECHA_ACTUALIZACION DATETIME NULL,
 CONSTRAINT [PK_ESTADO_SOLICITUD] PRIMARY KEY CLUSTERED 
(
	[ESTADO_SOLICITUD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[estado_solicitud] ADD  CONSTRAINT [DF_ESTADO_SOLICITUD]  DEFAULT ((1)) FOR [ESTADO]
GO

ALTER TABLE [dbo].[estado_solicitud] ADD  CONSTRAINT [DF_ESTADO_SOL_USUARIO_CREA]  DEFAULT ((USER_NAME())) FOR [USUARIO_CREACION]
GO

ALTER TABLE [dbo].[estado_solicitud] ADD  CONSTRAINT [DF_ESTADO_SOL_FECHA_CREA]  DEFAULT ((GETDATE())) FOR [FECHA_CREACION]
GO

SET ANSI_PADDING OFF
GO
--***********************************************************************
--TABLA ROL
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
--DROP TABLE IF EXISTS [rol]
CREATE TABLE [dbo].[rol](
	[ROL_ID] [INT] IDENTITY(1,1) NOT NULL,
	DESCRIPCION VARCHAR (250) NOT NULL,
    [ESTADO] [CHAR](1) NOT NULL,
	USUARIO_CREACION VARCHAR (50) NOT NULL,
	FECHA_CREACION DATETIME NOT NULL,
	USUARIO_ACTUALIZACION  VARCHAR (50) NULL,
	FECHA_ACTUALIZACION DATETIME NULL,
 CONSTRAINT [PK_ROL] PRIMARY KEY CLUSTERED 
(
	[ROL_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[rol] ADD  CONSTRAINT [DF_ROL_ESTADO]  DEFAULT ((1)) FOR [ESTADO]
GO

ALTER TABLE [dbo].[rol] ADD  CONSTRAINT [DF_ROL_USUARIO_CREA]  DEFAULT ((USER_NAME())) FOR [USUARIO_CREACION]
GO

ALTER TABLE [dbo].[rol] ADD  CONSTRAINT [DF_ROL_FECHA_CREA]  DEFAULT ((GETDATE())) FOR [FECHA_CREACION]
GO

SET ANSI_PADDING OFF
GO
--***********************************************************************
--TABLA USUARIO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
--DROP TABLE IF EXISTS [user_catalogo]
CREATE TABLE [dbo].[user_catalogo](
	[USER_CATALOGO_ID] [INT] IDENTITY(1,1) NOT NULL,
	[DIR_SEDE_ID] [INT] NOT NULL,
	JEFE_ID INT NOT NULL,
	NOMBRE VARCHAR (250) NOT NULL,
	APELLIDO VARCHAR (250) NOT NULL,
	CORREO_ELECTRONICO VARCHAR (250) NOT NULL UNIQUE,
	CONTRASENA VARCHAR (250) NOT NULL,
	ROL_ID INT NOT NULL,
	[DOCUMENTO_IDENTIDAD] VARCHAR(8) NOT NULL UNIQUE,
    [ESTADO] [CHAR](1) NOT NULL,
	USUARIO_CREACION VARCHAR (50) NOT NULL,
	FECHA_CREACION DATETIME NOT NULL,
	USUARIO_ACTUALIZACION  VARCHAR (50) NULL,
	FECHA_ACTUALIZACION DATETIME NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[USER_CATALOGO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


ALTER TABLE [dbo].[user_catalogo] ADD  CONSTRAINT [FK_USUARIO_ROL]  FOREIGN KEY (ROL_ID) REFERENCES [dbo].[rol]([ROL_ID])
GO

ALTER TABLE [dbo].[user_catalogo] ADD  CONSTRAINT [FK_USUARIO_DIR_SEDE]  FOREIGN KEY (DIR_SEDE_ID) REFERENCES [dbo].[direccion_sede]([DIR_SEDE_ID])
GO

ALTER TABLE [dbo].[user_catalogo] ADD  CONSTRAINT [DF_USUARIO_ESTADO]  DEFAULT ((1)) FOR [ESTADO]
GO

ALTER TABLE [dbo].[user_catalogo] ADD  CONSTRAINT [DF_USUARIO_USUARIO_CREA]  DEFAULT ((USER_NAME())) FOR [USUARIO_CREACION]
GO

ALTER TABLE [dbo].[user_catalogo] ADD  CONSTRAINT [DF_USUARIO_FECHA_CREA]  DEFAULT ((GETDATE())) FOR [FECHA_CREACION]
GO

SET ANSI_PADDING OFF
GO
--***********************************************************************
--TABLA Solicitudes
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
----DROP TABLE IF EXISTS [solicitud]
CREATE TABLE [dbo].[solicitud](
	[SOLICITUD_ID] [INT] IDENTITY(1,1) NOT NULL,
	[COD_TICKET_GLPI] INT NOT NULL,
	[SERVICIO_ID] [INT],
	[USER_CATALOGO_ID] [INT] NOT NULL,
	[NOMBRE_CONTACTO] VARCHAR(200) NOT NULL,
	[ANEXO_CONTACTO] VARCHAR(500) NULL,
	[CELULAR_CONTACTO] VARCHAR(9) NOT NULL,
	[DOC_REFERENCIA] VARCHAR(100) NULL,
	[PRODUCTO] VARCHAR(200) NULL,
	[MODALIDAD] CHAR(1) NULL,
	[CANTIDAD] [INT],
	[CI_DESCRIPCION] VARCHAR(200) NULL,
	[CI_MARCA] VARCHAR(200) NULL,
	[CI_MODELO] VARCHAR(200) NULL,
	[CI_NRO_SERIE] VARCHAR(200) NULL,
	[CI_COD_SBN] VARCHAR(200) NULL,
	[EN_USO] CHAR(1) NULL,
	[OPERATIVO] CHAR(1) NULL,
	[MOTIVO] VARCHAR(15) NULL,
	[JUSTIFICACION] VARCHAR(300) NOT NULL,
	[ADJUNTO] [VARCHAR](200) NULL,
	[ESTADO_CREACION] [CHAR](1) NOT NULL,
	[ESTADO_SOLICITUD] INT NOT NULL,
	USUARIO_CREACION [INT] NOT NULL,
	FECHA_CREACION DATETIME NOT NULL,
	USUARIO_ACTUALIZACION  VARCHAR (50) NULL,
	FECHA_ACTUALIZACION DATETIME NULL,
 CONSTRAINT [PK_SOLICITUD] PRIMARY KEY CLUSTERED 
(
	[SOLICITUD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[solicitud] ADD  CONSTRAINT [DF_SOLICITUD_ESTADO_CREA]  DEFAULT ((1)) FOR [ESTADO_CREACION]
GO

ALTER TABLE [dbo].[solicitud] ADD  CONSTRAINT [FK_SOLICITUD_SERVICIO]  FOREIGN KEY (SERVICIO_ID) REFERENCES [dbo].[servicio]([SERVICIO_ID])
GO

ALTER TABLE [dbo].[solicitud] ADD  CONSTRAINT [FK_SOLICITUD_USUARIO]  FOREIGN KEY (USER_CATALOGO_ID) REFERENCES [dbo].[user_catalogo]([USER_CATALOGO_ID])
GO

ALTER TABLE [dbo].[solicitud] ADD  CONSTRAINT [FK_SOLICITUD_USUARIO_CRE]  FOREIGN KEY (USUARIO_CREACION) REFERENCES [dbo].[user_catalogo]([USER_CATALOGO_ID])
GO

ALTER TABLE [dbo].[solicitud] ADD  CONSTRAINT [DF_SOLICITUD_FECHA_CRE]  DEFAULT ((GETDATE())) FOR [FECHA_CREACION]
GO

ALTER TABLE [dbo].[solicitud] ADD  CONSTRAINT [DF_SOLICITUD_ESTADO_SOL]  DEFAULT ((1)) FOR [ESTADO_SOLICITUD]
GO

ALTER TABLE [dbo].[solicitud] ADD  CONSTRAINT [FK_SOLICITUD_ESTADO_SOL]  FOREIGN KEY (ESTADO_SOLICITUD) REFERENCES [dbo].[estado_solicitud]([ESTADO_SOLICITUD_ID])
GO

SET ANSI_PADDING OFF
GO
