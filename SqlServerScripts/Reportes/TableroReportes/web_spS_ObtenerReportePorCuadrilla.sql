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
			WHERE  name = 'web_spS_ObtenerReportePorCuadrilla' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerReportePorCuadrilla
GO

CREATE PROCEDURE web_spS_ObtenerReportePorCuadrilla
	-- Add the parameters for the stored procedure here
		@CUADRILLA CHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT 
		--DATOS DEL REPORTE
		OE.Reporte,
		--Datos de la sucursal
		S.CR,
		S.Nombre Sucursal,
		--DATOS DEL REPORTE 2
		OE.FechaOrigen,
		OE.HoraOrigen,
		OE.Reporto,
		OE.TrabajoRequerido,
		OE.FechaMaximaAtencion,
		OE.Estatus,
		S.DireccionZona,
		OE.Atendido,
		--DATOS DEL REPORTE 3
		C.Descripcion
		
		FROM OrdenesEstimaciones OE
		--Detalle del movimiento
		LEFT JOIN Cuadrillas C
		ON OE.Cuadrilla = C.ID
		-- Nos trameos los datos de la sucursal
		LEFT JOIN Sucursales S
		ON S.ID = OE.Sucursal
		
		WHERE OE.Cuadrilla = @CUADRILLA
		AND OE.Mov in('Mesa de reporte') AND MovEnLinea = 1
		;
END
GO
