USE [db_catalogo_servicios]
GO
--**********************************************************************************************
--Pocedimiento Almacenado:
DROP PROCEDURE IF EXISTS [dbo].[USP_GET_DIRECCIONES]
GO
-- =============================================
-- Procedimiento: [USP_GET_DIRECCIONES]
-- Creación
-- Fecha				Autor				Descripción
-- 30/11/2022		Juan Carlos Tovar		Se obtiene las direcciones según su nivel
-- EXEC [dbo].[USP_GET_DIRECCIONES] 2,2
-- =============================================
CREATE PROCEDURE [dbo].[USP_GET_DIRECCIONES]
	@tipo int,
	@idPadre int
AS
BEGIN
IF (@tipo = 1)
BEGIN
select ENUM_ID, ENUM_PARENTCHLD1, ENUM_DESC 
from [dbo].[direccion] 
where ENUM_PARENTCHLD2= 1 order by ENUM_ID asc
END
IF (@tipo = 2)
BEGIN
select ENUM_ID, ENUM_PARENTCHLD1, ENUM_DESC 
from [dbo].[direccion] 
where ENUM_PARENTCHLD2 = 2 and ENUM_PARENTCHLD1 = @idPadre order by ENUM_ID asc
END
IF (@tipo = 3)
BEGIN
select ENUM_ID, ENUM_PARENTCHLD1, ENUM_DESC 
from [dbo].[direccion] 
where ENUM_PARENTCHLD2 = 3 and ENUM_PARENTCHLD1 = @idPadre order by ENUM_ID asc
END
END
GO
--**********************************************************************************************
--Pocedimiento Almacenado:
DROP PROCEDURE IF EXISTS [dbo].[USP_GET_SELECT_SOLICITUD]
GO
-- =============================================
-- Procedimiento: [USP_GET_SELECT_SOLICITUD]
-- Creación
-- Fecha				Autor				Descripción
-- 30/11/2022		Juan Carlos Tovar		Se obtiene el select de las solicitudes
-- EXEC [dbo].[USP_GET_SELECT_SOLICITUD] 2
-- =============================================
CREATE PROCEDURE [dbo].[USP_GET_SELECT_SOLICITUD]
	@servicio int
AS
BEGIN
DECLARE @Names VARCHAR(8000) 
DECLARE @Select_incidente NVARCHAR(4000) 
SELECT @Names = COALESCE(@Names + ', ', '') + C.DESCRIPCION 
FROM dbo.campo_servicio CS LEFT JOIN dbo.servicio S
ON CS.SERVICIO_ID = S.SERVICIO_ID LEFT JOIN dbo.campo C
ON CS.CAMPO_ID = C.CAMPO_ID
WHERE CS.SERVICIO_ID = @servicio

SET @Select_incidente = (SELECT 'SELECT COD_TICKET_GLPI, SERVICIO_ID, DIRECCION_ID, SEDE_ID, '+ @Names + ' FROM dbo.solicitud'AS 'CAMPOS')

EXECUTE sp_executesql @Select_incidente
END
GO
--**********************************************************************************************
--Pocedimiento Almacenado:
DROP PROCEDURE IF EXISTS [dbo].[USP_GET_INSERT_SOLICITUD]
GO
-- =============================================
-- Procedimiento: [USP_INSERT_SOLICITUD]
-- Creación
-- Fecha				Autor				Descripción
-- 30/11/2022		Juan Carlos Tovar		Se registra la solicitud
/*
DECLARE @insert NVARCHAR(4000)
EXEC [dbo].[USP_GET_INSERT_SOLICITUD] 2, @insert
*/

-- =============================================
CREATE PROCEDURE [dbo].[USP_GET_INSERT_SOLICITUD]
	@servicio int,
	@insert_incidente NVARCHAR(4000) OUTPUT
AS
BEGIN
DECLARE @Names VARCHAR(8000) 

SELECT @Names = COALESCE(@Names + ', ', '') + C.DESCRIPCION 
FROM dbo.campo_servicio CS LEFT JOIN dbo.servicio S
ON CS.SERVICIO_ID = S.SERVICIO_ID LEFT JOIN dbo.campo C
ON CS.CAMPO_ID = C.CAMPO_ID
WHERE CS.SERVICIO_ID = @servicio

SET @insert_incidente = (SELECT 'INSERT INTO db.solicitud(COD_TICKET_GLPI, SERVICIO_ID, DIRECCION_ID, SEDE_ID, '+ @Names + ') VALUES'AS 'insert_CAMPOS')
SELECT @insert_incidente
END
GO


