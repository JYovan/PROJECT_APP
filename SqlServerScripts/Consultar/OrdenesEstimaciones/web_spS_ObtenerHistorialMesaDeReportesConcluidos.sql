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
			WHERE  name = 'web_spS_ObtenerHistorialMesaDeReportesConcluidos' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerHistorialMesaDeReportesConcluidos
GO
-- =============================================
-- Author:		Giovanni Flores
-- Create date: Jueves 23 de Abril de 2015
-- Description:	Obtener todos los registros de Mesa de Reportes Concluidos
-- =============================================
CREATE PROCEDURE web_spS_ObtenerHistorialMesaDeReportesConcluidos
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        dbo.OrdenesEstimaciones.ID, dbo.OrdenesEstimaciones.Mov, dbo.OrdenesEstimaciones.MovID, dbo.OrdenesEstimaciones.FechaEmision, 
                         dbo.OrdenesEstimaciones.Observaciones, dbo.OrdenesEstimaciones.Estatus, dbo.OrdenesEstimaciones.Usuario, dbo.OrdenesEstimaciones.Origen, 
                         dbo.OrdenesEstimaciones.OrigenID, dbo.OrdenesEstimaciones.Reporte, dbo.OrdenesEstimaciones.Division, dbo.OrdenesEstimaciones.FechaOrigen, 
                         dbo.OrdenesEstimaciones.FechaMaximaAtencion, dbo.OrdenesEstimaciones.DiasAtencion, dbo.OrdenesEstimaciones.Reporto, 
                         dbo.OrdenesEstimaciones.TrabajoRequerido, dbo.OrdenesEstimaciones.TrabajoRealizado, dbo.OrdenesEstimaciones.CodigoFalla, 
                         dbo.OrdenesEstimaciones.FechaLlegada, dbo.OrdenesEstimaciones.HoraLlegada, dbo.OrdenesEstimaciones.FechaFinActividad, 
                         dbo.OrdenesEstimaciones.HoraFinActividad, dbo.OrdenesEstimaciones.ImporteTotal, dbo.OrdenesEstimaciones.HoraOrigen, dbo.OrdenesEstimaciones.RutaImagen, 
                         dbo.OrdenesEstimaciones.Atendido, dbo.OrdenesEstimaciones.MovEnLinea, dbo.OrdenesEstimaciones.NoOrden, dbo.OrdenesEstimaciones.ReferenciaOrden, 
                         dbo.OrdenesEstimaciones.Facturado, dbo.OrdenesEstimaciones.Clasificacion, dbo.OrdenesEstimaciones.Revisado, 
                         dbo.OrdenesEstimaciones.FacturaMantenimiento, dbo.Clientes.ID AS IdCliente, dbo.Clientes.Nombre AS Cliente,  dbo.Sucursales.ID AS IdSucursal,  dbo.Sucursales.Nombre AS Sucursal, dbo.Sucursales.CR,
						 dbo.Cuadrillas.Nombre AS Cuadrilla
		 FROM            dbo.OrdenesEstimaciones INNER JOIN
                         dbo.Clientes ON dbo.OrdenesEstimaciones.Cliente = dbo.Clientes.ID INNER JOIN
                         dbo.Sucursales ON dbo.OrdenesEstimaciones.Sucursal = dbo.Sucursales.ID LEFT OUTER JOIN
                         dbo.Cuadrillas ON dbo.OrdenesEstimaciones.Cuadrilla = dbo.Cuadrillas.ID
	WHERE        (dbo.OrdenesEstimaciones.Mov = 'Mesa de Reporte') AND (dbo.OrdenesEstimaciones.Estatus = 'CONCLUIDO') AND (dbo.OrdenesEstimaciones.MovEnLinea = 1) AND
                          (dbo.OrdenesEstimaciones.Facturado = 1) AND (dbo.OrdenesEstimaciones.Revisado = 1)
						  ORDER BY dbo.OrdenesEstimaciones.Reporte ASC
END
GO