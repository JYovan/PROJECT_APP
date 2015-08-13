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
			WHERE  name = 'web_spS_ObtenerOrdenesEstimaciones' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerOrdenesEstimaciones
GO
-- =============================================
-- Author:		Giovanni Flores
-- Create date: Lunes 10 de Agosto de 2014
-- Description:	Obtener todos los registros de OE
-- =============================================
CREATE PROCEDURE web_spS_ObtenerOrdenesEstimaciones
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        TOP (100) PERCENT OE.ID, OE.Mov, OE.MovID, dbo.Sucursales.Nombre AS Sucursal, OE.FechaEmision, OE.Observaciones, OE.Estatus, OE.Usuario, OE.Origen, 
                         OE.OrigenID, OE.Reporte, OE.Division, OE.FechaOrigen, OE.FechaMaximaAtencion, OE.DiasAtencion, OE.Reporto, OE.TrabajoRequerido, OE.TrabajoRealizado, 
                         OE.CodigoFalla, OE.FechaLlegada, OE.HoraLlegada, OE.FechaFinActividad, OE.HoraFinActividad, cua.Nombre AS Cuadrilla, OE.ImporteTotal, OE.HoraOrigen, 
                         OE.RutaImagen, OE.Atendido, OE.NoOrden, OE.ReferenciaOrden, OE.Facturado, OE.Clasificacion, cli.Nombre AS Cliente, dbo.Sucursales.DireccionZona AS Zona, 
                         dbo.Sucursales.CR
FROM            dbo.OrdenesEstimaciones AS OE INNER JOIN
                         dbo.Clientes AS cli ON OE.Cliente = cli.ID AND OE.Mov IN ('Mesa de reporte', 'Estimacion') AND OE.MovEnLinea = 1 AND OE.Estatus IN ('CONCLUIDO', 'PENDIENTE', 
                         'BORRADOR') AND OE.Facturado <> 1 OR
                         OE.Mov IN ('Mesa de reporte', 'Estimacion') AND OE.MovEnLinea = 0 AND OE.Estatus IN ('BORRADOR') AND OE.Facturado <> 1 INNER JOIN
                         dbo.Cuadrillas AS cua ON OE.Cuadrilla = cua.ID INNER JOIN
                         dbo.Sucursales ON OE.Sucursal = dbo.Sucursales.ID
ORDER BY OE.Reporte DESC

END
GO