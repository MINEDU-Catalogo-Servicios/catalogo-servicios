--DB: db_catalogo_servicios
USE [db_catalogo_servicios]
GO
--¨*****************************************
--View: vw_catalogo_campo
--Contiene el reporte detallado de las columnas por servicios ofrecidos
--DROP VIEW IF EXISTS vw_ticket_reporte
GO
CREATE VIEW vw_catalogo_campo AS 
SELECT CS.SERVICIO_ID, S.DESCRIPCION SERVICIO, C.DESCRIPCION campo 
FROM dbo.campo_servicio CS LEFT JOIN dbo.servicio S
ON CS.SERVICIO_ID = S.SERVICIO_ID LEFT JOIN dbo.campo C
ON CS.CAMPO_ID = C.CAMPO_ID
GO

--¨*****************************************
--View: vw_catalogo_servicios
--Contiene el reporte de los servicios ofrecidos por la entidad
--DROP VIEW IF EXISTS vw_catalogo_servicios
GO
CREATE VIEW vw_catalogo_servicios AS
SELECT FA.DESCRIPCION FAMILIA, S.SERVICIO_ID, S.DESCRIPCION SERVICIO, F.DESCRIPCION FORMATO FROM dbo.servicio S
LEFT JOIN dbo.familia FA ON S.FAMILIA_ID = FA.FAMILIA_ID
LEFT JOIN dbo.formato F ON S.FORMATO_ID = F.FORMATO_ID
GO
--¨*****************************************
--View: vw_direccion_nivel
--Contiene el total de dependencias en los tres niveles de dependencia de direcciones/oficinas del MINEDU
--DROP VIEW IF EXISTS vw_direccion_nivel
GO
CREATE VIEW vw_direccion_nivel AS
SELECT CASE WHEN ENUM_PARENTCHLD2 = 1 THEN 'PRIMER NIVEL'
		    WHEN ENUM_PARENTCHLD2 = 2 THEN 'SEGUNDO NIVEL'
			ELSE 'TERCER NIVEL' END NIVEL, COUNT(1) TOTAL FROM dbo.direccion
GROUP BY ENUM_PARENTCHLD2
GO
