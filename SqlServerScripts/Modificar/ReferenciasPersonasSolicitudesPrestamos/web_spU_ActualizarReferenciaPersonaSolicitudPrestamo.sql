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
			WHERE  name = 'web_spU_ActualizarReferenciaPersonaSolicitudPrestamo' AND
			TYPE = 'P')
	DROP PROCEDURE web_spU_ActualizarReferenciaPersonaSolicitudPrestamo
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Lunes 04 de Mayo de 2015
-- Description:	Actualizar un registro de una Referencia de alguna Persona para una Solicitud de Préstamo
-- =============================================
CREATE PROCEDURE web_spU_ActualizarReferenciaPersonaSolicitudPrestamo
	-- Add the parameters for the stored procedure here
	@ID						INT,
	@SolicitudPrestamo		CHAR(8),
	@Nombre					VARCHAR(150),
	@Domicilio				VARCHAR(200),
	@Telefono				VARCHAR(20),
	@Actividad				VARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    UPDATE
		ReferenciasPersonasSolicitudesPrestamos
	SET
		SolicitudPrestamo = @SolicitudPrestamo,
		Nombre = @Nombre,
		Domicilio = @Domicilio,
		Telefono = @Telefono,
		Actividad = @Actividad
	WHERE
		ID = @ID

END
GO