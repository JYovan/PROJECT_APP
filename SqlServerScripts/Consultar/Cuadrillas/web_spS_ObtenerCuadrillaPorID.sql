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
-- Author:		Giovanni Flores
-- Create date: 15-04-2015
-- Description:	Obtiene las cuadrillas 
-- =============================================
IF EXISTS (	SELECT name 
			FROM sysobjects
			WHERE  name = 'web_spS_ObtenerCuadrillaPorID' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerCuadrillaPorID
GO
CREATE PROCEDURE web_spS_ObtenerCuadrillaPorID
	-- Add the parameters for the stored procedure here 
	@ID CHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT cu.ID, cu.Nombre, cu.Descripcion FROM Cuadrillas cu WHERE cu.ID = @ID;
END
GO
