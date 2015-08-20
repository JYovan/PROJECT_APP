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
			WHERE  name = 'web_spU_ActualizarCliente' AND
			TYPE = 'P')
	DROP PROCEDURE web_spU_ActualizarCliente
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Miercoles 07 de Enero de 2015
-- Description:	Actualizar un registro de Clientes por su ID
-- =============================================
CREATE PROCEDURE web_spU_ActualizarCliente
	-- Add the parameters for the stored procedure here
	@ID						CHAR(8),
	@Nombre					VARCHAR(50),
	@APaterno				VARCHAR(50),
	@AMaterno				VARCHAR(50),
	@Correo					VARCHAR(100),
	@Telefono				VARCHAR(15),
	@TelefonoMovil			VARCHAR(19),
	@Calle					VARCHAR(100),
	@NoExterior				VARCHAR(10),
	@NoInterior				VARCHAR(10), 
	@CodigoPostal			CHAR(10),
	@EntreCalles			VARCHAR(100), 
	@Estatus				VARCHAR(20),
	@RutaLogo				VARCHAR(500),
	@Elaboro				VARCHAR(100),
	@Reviso					VARCHAR(100),
	@Autorizo				VARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    UPDATE
		Clientes
	SET
		Nombre = @Nombre,
		APaterno = @APaterno,
		AMaterno = @AMaterno, 
		Correo = @Correo,
		Telefono = @Telefono,
		TelefonoMovil = @TelefonoMovil,
		Calle = @Calle,
		NoExterior = @NoExterior,
		NoInterior = @NoInterior, 
		CodigoPostal = @CodigoPostal,
		EntreCalles = @EntreCalles, 
		Estatus = @Estatus,
		RutaLogo = @RutaLogo,
		Elaboro = @Elaboro,
		Reviso = @Reviso,
		Autorizo = @Autorizo
	WHERE
		ID = @ID
END
GO