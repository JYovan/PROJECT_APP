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
-- Create procedure basic template
-- =============================================
IF EXISTS (	SELECT name 
			FROM sysobjects
			WHERE  name = 'web_spS_ObtenerHistorialDeOrdenesEstimaciones' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerHistorialDeOrdenesEstimaciones
GO
-- =============================================
-- Author:		Giovanni Flores
-- Create date: Martes 19 de Mayo de 2015
-- Description:	Obtener todos los registros de Ordenes y Estimaciones
-- =============================================
CREATE PROCEDURE web_spS_ObtenerHistorialDeOrdenesEstimaciones
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        OE.ID, OE.Mov, OE.MovID, OE.FechaEmision, OE.Observaciones, OE.Estatus, OE.Usuario, OE.Origen, OE.OrigenID, OE.Reporte, OE.Division, OE.FechaOrigen, 
                         OE.FechaMaximaAtencion, OE.DiasAtencion, OE.Reporto, OE.TrabajoRequerido, OE.TrabajoRealizado, OE.CodigoFalla, OE.FechaLlegada, OE.HoraLlegada, 
                         OE.FechaFinActividad, OE.HoraFinActividad, OE.ImporteTotal, OE.HoraOrigen, OE.RutaImagen, OE.Atendido, dbo.Sucursales.Nombre AS Sucursal, 
                         dbo.Cuadrillas.Nombre AS Cuadrilla, dbo.Clientes.Nombre AS Cliente
FROM            dbo.OrdenesEstimaciones AS OE INNER JOIN
                         dbo.Sucursales ON OE.Sucursal = dbo.Sucursales.ID LEFT OUTER JOIN
                         dbo.Cuadrillas ON OE.Cuadrilla = dbo.Cuadrillas.ID INNER JOIN
                         dbo.Clientes ON OE.Cliente = dbo.Clientes.ID
WHERE        (OE.Mov IN ('Mesa de reporte', 'Estimacion'))
END
GO