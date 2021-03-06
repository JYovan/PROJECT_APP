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
			WHERE  name = 'web_spS_ObtenerModulosXUsuario' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerModulosXUsuario
GO
-- =============================================
-- Author:		Giovanni Flores
-- Create date: Viernes 20 de Febrero de 2014
-- Description:	Obtener los registros de modulos
-- =============================================
CREATE PROCEDURE web_spS_ObtenerModulosXUsuario
	-- Add the parameters for the stored procedure here 
	@ID VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 
    -- Insert statements for procedure here
	SELECT        uxm.ID, u.ID AS UsuarioID, m.ID AS ModuloID, m.Nombre, uxm.Permiso
	FROM          dbo.Usuarios AS u INNER JOIN dbo.UsuarioXModulo AS uxm ON u.ID = uxm.UsuarioID INNER JOIN dbo.Modulos AS m ON uxm.ModuloID = m.ID
	WHERE        (u.ID =@ID );
END
GO