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
			WHERE  name = 'web_spI_InsertarBienInmuebleSolicitudPrestamo' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarBienInmuebleSolicitudPrestamo
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Viernes 01 de Mayo de 2015
-- Description:	Insertar un registro de un Bien Inmueble para una Solicitud de Préstamo
-- =============================================
CREATE PROCEDURE web_spI_InsertarBienInmuebleSolicitudPrestamo
	-- Add the parameters for the stored procedure here
	@ID						INT OUTPUT,
	@SolicitudPrestamo		CHAR(8),
	@Tipo					VARCHAR(50),
	@NoSerie				VARCHAR(50),
	@Valor					INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    INSERT INTO
		BienesInmueblesSolicitudesPrestamos
		(
			SolicitudPrestamo,
			Tipo,
			NoSerie,
			Valor
		)
	VALUES
		(
			@SolicitudPrestamo,
			@Tipo,
			@NoSerie,
			@Valor
		)
		
	SELECT @ID = SCOPE_IDENTITY()
END
GO