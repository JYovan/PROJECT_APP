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
	SELECT
		ID,
		Mov,
		MovID,
		Sucursal,
		FechaEmision,
		Observaciones,
		Estatus,
		Usuario,
		Origen,
		OrigenID,
		Reporte,
		Division,
		FechaOrigen,
		FechaMaximaAtencion,
		DiasAtencion,
		Reporto,
		TrabajoRequerido,
		TrabajoRealizado,
		CodigoFalla,
		FechaLlegada,
		HoraLlegada,
		FechaFinActividad,
		HoraFinActividad,
		Cuadrilla,
		ImporteTotal,
		HoraOrigen,
		RutaImagen,
		Atendido,
		Cliente
	FROM
		OrdenesEstimaciones
	WHERE 
	 Mov in('Mesa de reporte','Estimacion');
END
GO