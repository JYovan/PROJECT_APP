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
			WHERE  name = 'web_spU_ActualizarCapacidadPago' AND
			TYPE = 'P')
	DROP PROCEDURE web_spU_ActualizarCapacidadPago
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Miércoles 22 de Abril de 2015
-- Description:	Actualizar un registro de Capacidad de Pago
-- =============================================
CREATE PROCEDURE web_spU_ActualizarCapacidadPago
	-- Add the parameters for the stored procedure here
	@ID							INT,
	@SolicitudPrestamo			CHAR(8),
	@Renglon					INT,
	@Tipo						VARCHAR(20),
	@Concepto					VARCHAR(30),
	@Importe					SMALLMONEY
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    UPDATE
		CapacidadesPagos
	SET
		SolicitudPrestamo = @SolicitudPrestamo,
		Renglon = @Renglon,
		Tipo = @Tipo,
		Concepto = @Concepto,
		Importe = @Importe
	WHERE
		ID = @ID
END
GO