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
			WHERE  name = 'web_spI_InsertarCapacidadPago' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarCapacidadPago
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Miércoles 22 de Abril de 2015
-- Description:	Insertar un registro de Capacidad de Pago
-- =============================================
CREATE PROCEDURE web_spI_InsertarCapacidadPago
	-- Add the parameters for the stored procedure here
	@ID							INT OUTPUT,
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
    INSERT INTO
		CapacidadesPagos
		(
			SolicitudPrestamo,
			Renglon,
			Tipo,
			Concepto,
			Importe
		)
	VALUES
		(
			@SolicitudPrestamo,
			@Renglon,
			@Tipo,
			@Concepto,
			@Importe
		)
		
	SELECT @ID = SCOPE_IDENTITY()
END
GO