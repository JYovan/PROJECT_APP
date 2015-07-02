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
-- Description:	Obtiene las SubEspecialidades por IDFAMILIA
-- =============================================
IF EXISTS (	SELECT name 
			FROM sysobjects
			WHERE  name = 'web_spS_ObtenerSubEspecialidadesPorFamilia' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerSubEspecialidadesPorFamilia
GO
CREATE PROCEDURE web_spS_ObtenerSubEspecialidadesPorFamilia
	-- Add the parameters for the stored procedure here 
	@IDFAMILIA CHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  dbo.SubEspecialidades.ID, dbo.SubEspecialidades.Nombre
	FROM	dbo.Familias AS F INNER JOIN dbo.SubEspecialidades ON F.ID = dbo.SubEspecialidades.Familia
	WHERE   (dbo.SubEspecialidades.Familia =  @IDFAMILIA);
END
GO
