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
			WHERE  name = 'web_spS_ObtenerCapacidadPagoPorSolicitudPrestamo' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerCapacidadPagoPorSolicitudPrestamo
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Miércoles 22 de Abril de 2015
-- Description:	Obtener todos los registros de Capacidad de pago de una solicitud de préstamo
-- =============================================
CREATE PROCEDURE web_spS_ObtenerCapacidadPagoPorSolicitudPrestamo
	-- Add the parameters for the stored procedure here
	@SolicitudPrestamo	CHAR(8)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		ID,
		SolicitudPrestamo,
		Renglon,
		Tipo,
		Concepto,
		Importe
	FROM
		CapacidadesPagos
	WHERE
		SolicitudPrestamo = @SolicitudPrestamo
END
GO