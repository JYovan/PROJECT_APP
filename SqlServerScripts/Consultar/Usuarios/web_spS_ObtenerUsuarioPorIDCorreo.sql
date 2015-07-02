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
			WHERE  name = 'web_spS_ObtenerUsuarioPorIDCorreo' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerUsuarioPorIDCorreo
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Domingo 22 de Febrero de 2015
-- Description:	Obtener un registro de Usuario por su ID o por su Correo
-- =============================================
CREATE PROCEDURE web_spS_ObtenerUsuarioPorIDCorreo
	-- Add the parameters for the stored procedure here
	@IDCorreo		VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		ID,
		Correo,
		Nombre,
		APaterno,
		AMaterno,
		Estatus,
		Bloqueado,
		EnLinea,
		FechaAlta,
		FechaBloqueo,
		UltimoAcceso,
		CambioContrasena,
		Empresa
	FROM
		Usuarios
	WHERE
		ID = @IDCorreo OR
		Correo = @IDCorreo
END
GO