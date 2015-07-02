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
			WHERE  name = 'web_spU_CambiarContrasena' AND
			TYPE = 'P')
	DROP PROCEDURE web_spU_CambiarContrasena
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Domingo 22 de Febrero de 2015
-- Description:	Cambiar la contraseña de un Usuario
-- =============================================
CREATE PROCEDURE web_spU_CambiarContrasena
	-- Add the parameters for the stored procedure here
	@ID			VARCHAR(50),
	@Contrasena	VARCHAR(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    UPDATE Usuarios SET
		Contrasena = @Contrasena,
		CambioContrasena = GETDATE()
	WHERE ID = @ID
END
GO