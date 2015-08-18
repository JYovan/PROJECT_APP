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
			WHERE  name = 'web_spU_ActualizarModulo' AND
			TYPE = 'P')
	DROP PROCEDURE web_spU_ActualizarModulo
GO
-- =============================================
-- Author:		Giovanni Flores
-- Create date: 01 Agosto 2015
-- Description:	Actualizar un registro de Modulo por su ID
-- =============================================
CREATE PROCEDURE web_spU_ActualizarModuloXUsuario
	-- Add the parameters for the stored procedure here
	@ID INT, @UsuarioID VARCHAR(50), @ModuloID VARCHAR(50), @Permiso BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here 
	UPDATE [dbo].[UsuarioXModulo]
	   SET [UsuarioID] =@UsuarioID
		  ,[ModuloID] =  @ModuloID
		  ,[Permiso] =  @Permiso
	 WHERE [ID] = @ID;
END
GO