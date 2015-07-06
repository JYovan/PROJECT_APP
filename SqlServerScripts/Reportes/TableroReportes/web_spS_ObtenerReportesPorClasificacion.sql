-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Giovanni Flores
-- Create date: 2015-03-29
-- Description:	Obtiene los datos generales
-- =============================================
-- =============================================
-- Create procedure basic template
-- =============================================
IF EXISTS (	SELECT name 
			FROM sysobjects
			WHERE  name = 'web_spS_ObtenerReportesPorClasificacion' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerReportesPorClasificacion
GO

CREATE PROCEDURE web_spS_ObtenerReportesPorClasificacion
	-- Add the parameters for the stored procedure here
		@CLASIFICACION VARCHAR(25)
AS
BEGIN

IF (@CLASIFICACION = 'Todos')
BEGIN
SET @CLASIFICACION = ''
END
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
		SELECT 
		--DATOS DEL REPORTE
		OE.Reporte,
		--Datos de la sucursal
		S.Nombre Sucursal,
		S.CR,
		OE.Division,
		--DATOS DEL REPORTE 2
		OE.FechaOrigen,
		OE.TrabajoRequerido,
		OE.TrabajoRealizado,
		OE.FechaLlegada,
		OE.HoraLlegada,
		OE.FechaFinActividad,
		OE.HoraFinActividad,
		OE.Clasificacion,
		OE.ImporteTotal,OE.MovEnLinea, OE.Observaciones
		FROM OrdenesEstimaciones OE
		-- Nos trameos los datos de la sucursal
		LEFT JOIN Sucursales S
		ON S.ID = OE.Sucursal 
		WHERE 
		OE.Mov in('Mesa de reporte')  
		AND OE.MovEnLinea = 1
	 AND OE.Estatus IN('CONCLUIDO') 
	 AND oe.Revisado=1
	 AND OE.Facturado=0
	AND OE.CLASIFICACION LIKE '%'+@CLASIFICACION+'%'
	ORDER BY OE.Reporte  ASC
END
GO
